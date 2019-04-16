"use strict"

const connection=require("./connection");

let conn=connection.conn;

//通过订单id查询订单的商品内容
function queryGoodsByOrderid(orderid,callback){
    conn.query("select t2.name,t1.quantity,t2.price from ordergoods t1 inner join goodsinfo t2 on t1.goodsid=t2.id where orderid = ?",[orderid],function (err,results,fields) {
        callback(results);
    });
};
//插入订单商品信息
function insertOrderGoods(orderid,goodsid,quantity,callback){
    conn.query("insert into ordergoods (orderid,goodsid,quantity) values (?,?,?);",[orderid,goodsid,quantity],function (err,results,fields) {
        callback(results);
    });
}

module.exports={queryGoodsByOrderid,insertOrderGoods};