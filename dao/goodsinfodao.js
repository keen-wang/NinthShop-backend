'use strict'

const connection = require("./connection");

let conn = connection.conn;

function getMenuByShopid (id,callback){
	conn.query("select * from goodsinfo where shopid = ?",[id],function (err,results,fields) {
        callback(results);
    });
}

module.exports = {getMenuByShopid};