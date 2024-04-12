require('dotenv').config();
const express = require('express');
const bodyParser = require('body-parser');
const path = require('path');

// setup express
const app = express();
app.use(bodyParser.urlencoded({ extended: true, limit: '3mb', }));
app.use(bodyParser.json());

// setup app
app.set('port', process.env.PORT || 3000);
app.set('host', process.env.HOST || 'localhost');
app.set('secretKey', process.env.APP_SECRET_KEY || 'teamconnect@cubeet.ai');

// setup api as /v1
app.use('/v1/api', require('./server/api'));

// setup web site
const siteApp = path.join(__dirname, 'client/build');
app.use('/', express.static(siteApp, { index: 'index.html '}));
app.get(['/', '/*'], function (req, res) {
    res.sendFile(path.join(__dirname, 'client/build', 'index.html'));
});

const PORT = app.get('port');
const HOST = app.get('host');
app.listen(PORT, function () {
    console.log('Web & API is running on port: %s - host: %s by nodejs version: %s', PORT, HOST, process.version);
});
