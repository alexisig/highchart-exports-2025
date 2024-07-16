FROM node:14.10.1

ENV HIGHCHARTS_USE_STYLED="1"
ENV HIGHCHARTS_USE_MAPS="1"
ENV HIGHCHARTS_USE_GANTT="1"
ENV ACCEPT_HIGHCHARTS_LICENSE="1"

RUN npm install -g highcharts-export-server --unsafe-perm

RUN git clone https://github.com/mschoettle/node-export-server
RUN cd node-export-server && npm install && npm link

RUN node /usr/local/lib/node_modules/highcharts-export-server/build.js
RUN npm install

ADD fonts/* /usr/share/fonts/truetype/

COPY ./api /api

WORKDIR /api
RUN npm install && chmod +x ./start.sh

EXPOSE 8080
CMD ./start.sh
