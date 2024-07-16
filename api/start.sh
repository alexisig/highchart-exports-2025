#!/bin/bash

# Start the first process
node index.js &
  
# Start the second process
highcharts-export-server --enableServer 1 --port 8080 --logLevel 4 &
  
# Wait for any process to exit
wait -n
  
# Exit with status of process that exited first
exit $?