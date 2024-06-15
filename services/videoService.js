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

Factory.createVideo = function(tr, video_name, video_desc) {
    let sql = `
        INSERT INTO [dbo].[Video] (VideoKey, VideoName, Description, VideoCategoryId, Author, Editor)
        VALUES (NEWID(), N${video_name}, N${video_desc}, '2', 'SYSTEM', 'SYSTEM')
    `;
    return db.raw(sql).transacting(tr);
}

Factory.updateVideo = function(tr, video_id, video_name) {
    let sql = `
        UPDATE [dbo].[Video]
        SET VideoName = N'${video_name}'
        WHERE VideoId = '${video_id}'
    `;
    return db.raw(sql).transacting(tr);
}

Factory.updateViewed = function(tr, video_id) {
    let sql = `
        UPDATE [dbo].[Video]
        SET Viewed = Viewed + 1
        WHERE VideoId = '${video_id}'
    `;
    return db.raw(sql).transacting(tr);
}

Factory.getVideoById = function(tr, video_id) {
    let sql = `SELECT * FROM [dbo].[Video] WHERE VideoId = '${video_id}'`;
    return db.raw(sql).transacting(tr);;
}


/* without transaction */
Factory.getVideoListPaging = async function (pageSize, pageIndex) {
    try
    {
        let page_size = parseInt(pageSize);
        let page_index = parseInt(pageIndex);
        let page_offset = page_size * page_index;

        // get hits total
        let sqlTotal = `SELECT COUNT(*) AS Total FROM [dbo].[Video] WHERE Deleted <> 1`;
        let resTotal = await db.raw(sqlTotal);
        let total_rows = resTotal[0].Total;

        // get Video list
        var sqlQuery = `
            SELECT  *
            FROM [dbo].[Video]
            WHERE Deleted <> 1
            ORDER BY VideoId ASC
            OFFSET (${page_offset}) ROWS
            FETCH NEXT ${page_size} ROWS ONLY
        `;
                
        let VideoList = await db.raw(sqlQuery);
        
        let result = {
            hits_total: parseInt(total_rows),
            page_total: parseInt(Math.ceil(total_rows / page_size)),
            page_size: parseInt(page_size),
            page_index: parseInt(page_index) + 1,
            page_data: VideoList
        }        
        return result;
    }
    catch(err){
        throw err;
    }
}

Factory.getVideoList = function() {
    let sql = `SELECT * FROM [dbo].[Video] ORDER BY VideoId ASC`;
    return db.raw(sql);
}

Factory.getVideoByKey = function(video_key) {
    let sql = `SELECT * FROM [dbo].[Video] WHERE VideoKey = '${video_key}'`;
    return db.raw(sql);
}

Factory.getVideoCategory = function() {
    let sql = `SELECT * FROM [dbo].[VideoCategory] ORDER BY VideoCategoryId ASC`;
    return db.raw(sql);
}

Factory.getVideoFiles = function(video_key) {
    let sql = `
        SELECT VF.* 
        FROM [dbo].[VideoFile] VF INNER JOIN [dbo].[Video] V ON VF.VideoId = V.VideoId
        WHERE V.VideoKey = '${video_key}'
        ORDER BY VF.VideoFileId ASC
    `;
    return db.raw(sql);
}

module.exports = Factory;