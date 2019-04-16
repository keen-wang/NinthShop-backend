"use strict";
//引入系统模块
const express = require("express");
const router = express.Router();
//引入项目模块
const shoptypeDao = require("../dao/daoShoptype");

router.get("/",function(req,res){
    shoptypeDao.queryShopType(function(results){
        //将数据写出去
        res.send({
            code: 0,
            data: results,
            msg: ''
        });
    })
})
// 将路由对象导出
module.exports = router