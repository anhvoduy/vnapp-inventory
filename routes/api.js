const router = require('express').Router();
const db = require('../utils/db');
//const recache = require('../recache');
const info = require('../package.json').version;
const merchantService = require('../services/merchantService');

router.get('/status', function (req, res, next) {
    console.log('- WEB_INFO:', process.env.WEB_INFO);
    res.json({
        status: true,
        message: 'GET() success',
        version: info,
        web_info: process.env.WEB_INFO
    });
    next();
});

router.post('/status', async function (req, res, next) {
    var msgPing = 'ping_redis';
    //var msgPong = await recache.testCache(msgPing);

    res.json({
        status: true,
        message: 'POST() success',
        body: req.body,
        version: info,
        msgPong: msgPong,
        web_info: process.env.WEB_INFO
    });
    next();
});

const getTransaction = function () {
    return new Promise(function(resolve, reject) {
        db.transaction(function(tr, err) {
            if(tr) resolve(tr);
            else reject(err);
        }).then(function(res) {
            resolve(res);
        }, function(err) {
            reject(err);
        });
    });
};

router.get('/connection', async function (req, res, next) {
    try 
    {
        await getTransaction();
        return res.json({
            code: true,
            message: 'SQL DB is Connected'
        });
    }
    catch (err) {
        console.log('Error:', err);
        next({ code: false, message: 'Can NOT connect to SQL DB'});
    }
});

router.get('/crawl_status', async function (req, res, next) {
    let data = await merchantService.getCrawlStatus();
    
    res.json({
        status: true,
        data: data
    });
    next();
});

module.exports = router;