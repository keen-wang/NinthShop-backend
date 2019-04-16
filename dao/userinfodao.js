"use strict"

const connection=require("./connection");

let {conn} = connection;
// 通过id查询用户
function queryUserById (userid,callback){
    conn.query("select * from userinfo where id = ?",[userid],function (err,results,fields) {
        if (err) throw err;
        callback(results);
    });
};
//通过用户名查询数据
function queryUserByName(name,callback){
    conn.query("select * from userinfo where name = ?",[name],function (err,results,fields) {
        if (err) throw err;
        callback(results);
    });
};
//插入一条用户信息
function insertUserinfo(name,pwd,tell,type,callback){
    conn.query("insert into userinfo (name,pwd,tell,type) values (?,?,?,?)",[name,pwd,tell,type],function (err,results,fields) {
        if (err) throw err;
        callback(results);
    })
}

module.exports={queryUserByName,insertUserinfo, queryUserById};