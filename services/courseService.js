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

Factory.updateCourse = function(course_key, course_name, course_desc) {
    let sql = `
        UPDATE [dbo].[Course]
        SET CourseName = N'${course_name}',
            Description = N'${course_desc}'
        WHERE CourseKey = '${course_key}'
    `;
    return db.raw(sql);
}

Factory.getCourseById = function(course_id) {
    let sql = `SELECT * FROM [dbo].[Course] WHERE CourseId = '${course_id}'`;
    return db.raw(sql);
}

Factory.getCourseByKey = function(course_key) {
    let sql = `SELECT * FROM [dbo].[Course] WHERE CourseKey = '${course_key}'`;    
    return db.raw(sql);
}

Factory.getCourseListPaging = async function (pageSize, pageIndex) {
    try
    {
        let page_size = parseInt(pageSize);
        let page_index = parseInt(pageIndex);
        let page_offset = page_size * page_index;

        // get hits total
        let sqlTotal = `SELECT COUNT(*) AS Total FROM [dbo].[Course] WHERE Deleted <> 1`;
        let resTotal = await db.raw(sqlTotal);
        let total_rows = resTotal[0].Total;

        // get Course list
        var sqlQuery = `
            SELECT  *
            FROM [dbo].[Course]
            WHERE Deleted <> 1
            ORDER BY CourseId ASC
            OFFSET (${page_offset}) ROWS
            FETCH NEXT ${page_size} ROWS ONLY
        `;
                
        let CourseList = await db.raw(sqlQuery);
        
        let result = {
            hits_total: parseInt(total_rows),
            page_total: parseInt(Math.ceil(total_rows / page_size)),
            page_size: parseInt(page_size),
            page_index: parseInt(page_index) + 1,
            page_data: CourseList
        }        
        return result;
    }
    catch(err){
        throw err;
    }
}

Factory.getCourseFiles = function(courseId) {
    let sql = `SELECT * FROM [dbo].[CourseFile] WHERE CourseId = ${courseId} ORDER BY Updated DESC`;
    return db.raw(sql);
}

module.exports = Factory;