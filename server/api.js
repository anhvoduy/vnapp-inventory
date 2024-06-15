const router = require('express').Router();
const info = require('../package.json');

router.get('/status', function (req, res, next) {
  const message = `${process.env.APP_TITLE || 'app_title'} is running`;
  
  res.json({
    status: true,
    message: message,
    version: info.version,
  });
  next();
});

module.exports = router;