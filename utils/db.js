const config = require('../config');
const dbQueryBuilder = require('knex')(config.db_ndemo);

module.exports = dbQueryBuilder;