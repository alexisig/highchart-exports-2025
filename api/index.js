let express = require('express');
let app = express();

app.get('/', (req, res) => res.send({"status": "ok"}));

console.log('Service start listen in 7000')

app.listen(7000);