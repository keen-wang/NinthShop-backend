"use strict"

 const mysql = require("mysql");
//获取mysql连接
const conn = mysql.createConnection({
    host:"127.0.0.1",
    user:"root",
    password:"root",
    database:"ninth_shop"
});
conn.connect(function(err) {
    if (err) {
      console.error('error connecting: ' + err.stack);
      return;
    }
    console.log('mysql connected as id ' + conn.threadId);
  });

module.exports = {conn};