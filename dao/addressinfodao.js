"use strict"

const connection=require("./connection");

let conn=connection.conn;

//通过用户名查询数据
function querAddressByUserid(id,callback){
    conn.query("select * from addressinfo where userid = ?",[id],function (err,results,fields) {
        callback(results);
    });
};

//通过id更新地址数据
function updateAddressById(id,text,callback){
    conn.query("update addressinfo set address =? where id = ?",[text,id],function (err,results,fields) {
        callback(results);
    });
}

//插入一行数据
function insertAddress(id,text,callback){
    conn.query("INSERT INTO addressinfo (userid,address) VALUES (?,?);",[id,text],function (err,results,fields) {
        callback(results);
    });
}
//删除一行数据
function deleteAddress(id,callback){
    conn.query("DELETE FROM addressinfo WHERE id=?",[id],function (err,results,fields) {
        callback(results);
    });
}
module.exports={querAddressByUserid,updateAddressById,insertAddress,deleteAddress};