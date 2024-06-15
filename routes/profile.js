const router = require('express').Router();

router.get('/my', async function (req, res, next) {
    try 
    {   
        return res.json({
            code: true,
            data: {
                profileId: 100,
                fullName: 'Vo Duy Anh'
                
            }
        });
    }
    catch (err) {
        next({ code: false, message: 'Can NOT query table Profile'});
    }
});

module.exports = router;