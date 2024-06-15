require('dotenv').config();
var express = require('express');
var cors = require('cors');
//var { createProxyMiddleware } = require('http-proxy-middleware');
var bodyParser = require('body-parser');
var path = require('path');
var config = require('./config');

// setup express
var app = express();
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

// setup allow cors
app.use(cors());

// setup proxy middleware
// app.use('/api', createProxyMiddleware({
//     target: process.env.DOMAIN, 
//     changeOrigin: true
// }));

// setup app
app.set('port', process.env.PORT || 3000);
app.set('host', process.env.HOST || 'localhost');
app.set('secretKey', config.secretKey);

// setup api route
app.use('/v1/api', require('./routes/api'));
app.use('/v1/api/course', require('./routes/course'));
app.use('/v1/api/employee', require('./routes/employee'));
app.use('/v1/api/profile', require('./routes/profile'));
app.use('/v1/api/video', require('./routes/video'));

/* error handling: this is middleware to handle error */
app.use(function (err, req, res, next) {
    let error = {
        code: err.code,
        message: err.message
    };
	res.status(500);
	res.json(error);
});

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