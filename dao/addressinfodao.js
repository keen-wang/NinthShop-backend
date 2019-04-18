"use strict"

const connection=require("./connection");

let conn=connection.conn;

//通过用户名查询数据
function querAddressByUserid(id,callback){
    conn.query("select * from addressinfo where userid = ?",[id],function (err,results) {
        callback(results);
    });
}

//通过id更新地址数据
function updateAddressById(id,updateinfo,callback){
  const keys = Object.keys(updateinfo)
  const values = keys.map(item=>updateinfo[item])
  const sqlStr = keys.map((item,index)=>(item+'=?')).toString()
  values.push(id)
  // console.log(`update addressinfo set ${sqlStr} where id=?`, values)
  conn.query(`update addressinfo set ${sqlStr} where id=?`,values,function (err,results) {
    callback(results,err);
  });
}

//插入一行数据
function insertAddress(addressinfo,callback){
    const keys = Object.keys(addressinfo)
    const values = keys.map(item=>addressinfo[item])
    const quizs = keys.map(() =>'?').toString()
    // console.log('键值对', keys, values, quizs)
    conn.query(`INSERT INTO addressinfo (${keys.toString()}) VALUES (${quizs});`,values,function (err,results) {
        callback(results,err)
    });
}
//删除一行数据
function deleteAddress(id,callback){
    conn.query("DELETE FROM addressinfo WHERE id=?",[id],function (err,results) {
        callback(results,err);
    });
}
module.exports={querAddressByUserid,updateAddressById,insertAddress,deleteAddress};