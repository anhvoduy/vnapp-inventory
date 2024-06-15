const secretKey = 'development365';
const db_ndemo = {
    client: 'mssql',
    connection: {
      host: process.env.SQL_SERVER || "SQL_SERVER",
      user: process.env.SQL_USER || "SQL_USER",
      password: process.env.SQL_PASSWORD || "SQL_PASSWORD",
      database: process.env.SQL_DATABASE || "ndemo",
      options: {
        encrypt: true,
        enableArithAbort: true
      },
    },
    pool: {
      min: 1,
      max: 10 
    }
};

module.exports = {    
    secretKey: secretKey,
    db_ndemo: db_ndemo
};