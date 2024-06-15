const db = require('../utils/db');

const Factory = function() {    
};

Factory.getTransaction = function() {    
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
}

Factory.updateEmployee = function(tr, emp_key, emp_name) {
    let sql = `
        UPDATE [dbo].[Employee]
        SET EmployeeName = N'${emp_name}'
        WHERE EmployeeKey = '${emp_key}'
    `;
    return db.raw(sql).transacting(tr);
}

Factory.assignEmployee = function(tr, emp_key, teamIds) {
    let sql = `
        UPDATE [dbo].[Employee]
        SET TeamIds = N'[${teamIds}]'
        WHERE EmployeeKey = '${emp_key}'
    `;
    return db.raw(sql).transacting(tr);
}

Factory.getEmployeeById = function(tr, emp_id) {
    let sql = `SELECT * FROM [dbo].[Employee] WHERE EmployeeId = '${emp_id}'`;
    return db.raw(sql).transacting(tr);;
}

Factory.getEmployeeByKey = function(tr, emp_key) {
    let sql = `SELECT * FROM [dbo].[Employee] WHERE EmployeeKey = '${emp_key}'`;    
    return db.raw(sql).transacting(tr);;
}

Factory.getTopEmployee = function() {
    let sql = `SELECT TOP 10 * FROM [dbo].[Employee] ORDER BY EmployeeId DESC`;    
    return db.raw(sql);
}

Factory.getEmployeeListPaging = async function (pageSize, pageIndex) {
    try
    {
        let page_size = parseInt(pageSize);
        let page_index = parseInt(pageIndex);
        let page_offset = page_size * page_index;

        // get hits total
        let sqlTotal = `SELECT COUNT(*) AS Total FROM [dbo].[Employee] WHERE Deleted <> 1`;
        let resTotal = await db.raw(sqlTotal);
        let total_rows = resTotal[0].Total;

        // get employee list
        var sqlQuery = `
            SELECT  *
            FROM [dbo].[Employee]
            WHERE Deleted <> 1
            ORDER BY EmployeeId ASC
            OFFSET (${page_offset}) ROWS
            FETCH NEXT ${page_size} ROWS ONLY
        `;
                
        let employeeList = await db.raw(sqlQuery);
        
        let result = {
            hits_total: parseInt(total_rows),
            page_total: parseInt(Math.ceil(total_rows / page_size)),
            page_size: parseInt(page_size),
            page_index: parseInt(page_index) + 1,
            page_data: employeeList
        }        
        return result;
    }
    catch(err){
        throw err;
    }
}

Factory.getEmployeeList = function() {
    let sql = `SELECT * FROM [dbo].[Employee] ORDER BY EmployeeId ASC`;
    return db.raw(sql);
}

Factory.getTeamList = function() {
    let sql = `SELECT * FROM [dbo].[Team] ORDER BY TeamId ASC`;
    return db.raw(sql);
}

Factory.getDepartmentList = function() {
    let sql = `SELECT * FROM [dbo].[Department] ORDER BY DepartmentId ASC`;
    return db.raw(sql);
}

Factory.getDirectorList = function() {
    let sql = `SELECT * FROM [dbo].[Director] ORDER BY DirectorId ASC`;
    return db.raw(sql);
}

module.exports = Factory;