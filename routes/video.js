const router = require('express').Router();
const videoService = require('../services/videoService');
const CONSTANST = require('../utils/constanst');

router.get('/connection', async function (req, res, next) {
    try 
    {
        await videoService.getTransaction();
        return res.json({
            code: true,
            message: 'SQL DB is Connected'
        });
    }
    catch (err) {
        console.log('-err-', err);
        next({ code: false, message: 'Can NOT connect to SQL DB'});
    }
});

router.get('/list', async function (req, res, next) {
    try 
    {
        let { pagesize, pageindex } = req.query;

        if(!pagesize || !pageindex) {
            throw { code: 'MISSING_REQUIRED_FIELD', message: 'missing required field: pagesize or pageindex' };
        };

        // pagesize should be beauty
        if(CONSTANST.ALLOW_PAGE_SIZE.indexOf(parseInt(pagesize)) < 0) {
            throw { code: 'INVALID_REQUIRED_FIELD', message: 'invalid required field: pagesize' };
		};

        let employees = await videoService.getVideoListPaging(pagesize, pageindex);
        return res.json({
            code: true,
            data: employees
        });
    }
    catch (err) {
        next({ 
            code: err.code ? err.code : false,
            message: err.message ? err.message : 'Can NOT query table Video'
        });
    }
});

router.get('/item', async function (req, res, next) {
    try 
    {
        let { video_key } = req.query;
        if(!video_key)
			throw { code: 'MISSING_REQUIRED_FIELD', message: 'missing required field: video_key' }            

        let videos = await videoService.getVideoByKey(video_key);
        let files = await videoService.getVideoFiles(video_key);

        let videoInfo = (Array.isArray(videos) && videos.length) ? videos[0] : {};
        videoInfo.Files = files;

        return res.json({
            code: true,
            data: videoInfo
        });
    }
    catch (err) {
        next({ 
            code: err.code ? err.code : false,
            message: err.message ? err.message : 'Can NOT query table Video'
        });
    }
});

router.post('/item', async function (req, res, next) {
    let tr;
    try 
    {
        let { video_id, video_name } = req.body;

        if(!video_id)
			throw { code: 'MISSING_REQUIRED_FIELD', message: 'missing required field: video_id' }

        tr = await videoService.getTransaction();

        await videoService.updateVideo(tr, video_id, video_name);

        let empInfo = await videoService.getVideoById(tr, video_id);

        tr.commit();
        return res.json({
            code: true,
            data: empInfo
        });
    }
    catch (err) {
        if(tr) tr.rollback();
        next({ code: false, message: 'Can NOT query table Video'});
    }
});


router.post('/create', async function (req, res, next) {
    let tr;
    try
    {
        let { video_name, video_desc } = req.body;
                
        if(!video_name)
            throw { code: 'MISSING_REQUIRED_FIELD', message: 'missing required field: video_name' }
            
        if(!video_desc)
			throw { code: 'MISSING_REQUIRED_FIELD', message: 'missing required field: video_desc' }
        
        tr = await videoService.getTransaction();
                
        await videoService.updateVideo(tr, emp_key, teamIds);

        let empInfo = await videoService.getVideoByKey(tr, emp_key);

        tr.commit();
        return res.json({
            code: true,
            data: empInfo
        });
    }
    catch (err) {
        if(tr) tr.rollback();
        next({ code: false, message: 'Can NOT query table Video'});
    }
});

router.get('/category', async function (req, res, next) {
    try
    {
        let categories = await videoService.getVideoCategory();
        return res.json({
            code: true,
            data: categories
        });
    }
    catch (err) {
        next({ code: false, message: 'Can NOT query table VideoCategory'});
    }
});

module.exports = router;