'use strict'

const connection = require("./connection");

let conn = connection.conn;

function getCategoryByShopid (id,callback){
	conn.query("select * from category where shopid = ?",[id],function (err,results,fields) {
        callback(results);
    });
}

module.exports = {getCategoryByShopid};