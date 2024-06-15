const router = require('express').Router();
const courseService = require('../services/courseService');
const CONSTANST = require('../utils/constanst');

router.get('/list', async function (req, res, next) {
    try 
    {
        let { pagesize, pageindex } = req.query;

        if(!pagesize || !pageindex)
            throw { code: 'MISSING_REQUIRED_FIELD', message: 'missing required field: pagesize or pageindex' };
        
        // pagesize should be beauty
        if(CONSTANST.ALLOW_PAGE_SIZE.indexOf(parseInt(pagesize)) < 0)
            throw { code: 'INVALID_REQUIRED_FIELD', message: 'invalid required field: pagesize' };

        let courses = await courseService.getCourseListPaging(pagesize, pageindex);
        
        return res.json({
            code: true,
            data: courses
        });
    }
    catch (err) {
        next({ code: false, message: 'Can NOT query table Course'});
    }
});

router.get('/item', async function (req, res, next) {
    try 
    {
        let { course_key } = req.query;

        if(!course_key)
			throw { code: 'MISSING_REQUIRED_FIELD', message: 'missing required field: course_key' }

        let courseInfo = await courseService.getCourseByKey(course_key);

        return res.json({
            code: true,
            data: courseInfo
        });
    }
    catch (err) {
        next({ code: false, message: 'Can NOT query table Course'});
    }
});

router.post('/item', async function (req, res, next) {
    try
    {
        let { course_key, course_name, course_desc } = req.body;
        
        if(!course_key)
			throw { code: 'MISSING_REQUIRED_FIELD', message: 'missing required field: course_key' }

        await courseService.updateCourse(course_key, course_name, course_desc);
        
        let courseInfo = await courseService.getCourseByKey(course_key);
        
        return res.json({
            code: true,
            data: courseInfo
        });
    }
    catch (err) {
        next({ code: false, message: 'Can NOT query table Course'});
    }
});

module.exports = router;