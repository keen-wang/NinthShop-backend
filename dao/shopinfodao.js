/**
 * Created by Administrator on 2018/6/9 0009.
 */
"use strict";
//1.先导入connection数据库的连接
const connection = require("./connection");
//2.声明数据库的连接对象
let conn = connection.conn;

//查询所有的店铺
function queryshopinfo(callback){
    conn.query("select * from shopinfo",function(err,results,fields){
        callback(results);
    })
}
//按分类查询店铺
// console.log('sql语句', `select distinct shopinfo.id,name,grade,sales,startprice,duration,summary,imgsrc from shopinfo inner join shop__type on shopinfo.id=shop__type.shopid where shop__type.typeid=${typeid}`)
function  queryshopinfoByTypeid(typeid,callback){
    const SqlStr = "select distinct shopinfo.id,name,grade,sales,startprice,duration,summary,imgsrc from shopinfo inner join shop__type on shopinfo.id=shop__type.shopid where shop__type.typeid=?"
    conn.query( SqlStr,[typeid],function(err,results,fields){
        if(err) throw err
        callback(results);
    })
}
//按店铺ID查询店铺
function queryshopinfobyshopid(shopid,callback){
    conn.query("select * from shopinfo where id=?",[shopid],function(err,results,fields){
        callback(results);
    })
}

module.exports={queryshopinfo,queryshopinfoByTypeid,queryshopinfobyshopid};
