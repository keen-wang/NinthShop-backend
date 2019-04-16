"use strict";
//1.先导入connection数据库的连接
const connection = require("./connection");
//2.声明数据库的连接对象
let conn = connection.conn;


//查询所有的店铺种类
function queryShopType(callback){
    conn.query("select * from shoptype",function(err,results,fields){
        callback(results);
    })
}
// 将路由对象导出
module.exports={queryShopType};