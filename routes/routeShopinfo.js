/**
 * Created by Administrator on 2018/6/9 0009.
 */
"use strict";
//引入系统模块
const express = require("express");
const router = express.Router();
//引入项目模块
const shopinfoDao = require("../dao/shopinfodao");

router.get("/all",function(req,res){
    shopinfoDao.queryshopinfo(function(results){
        //将数据写出去
        res.send({
            code: 0,
            data: results,
            msg: ''
        })
    })
})
router.get("/shopid",function(req,res){
    shopinfoDao.queryshopinfobyshopid(req.query.shopid,function(results){
        const shopinfo = results[0] || {}
        res.send({code: 0, data: shopinfo,msg: ''});
    })
})
router.get("/type",function(req,res){
    const typeId = req.query.typeId
    shopinfoDao.queryshopinfoByTypeid(typeId,function(results){
        res.send({
            code: 0,
            data: results,
            msg: ''
        });
    })
})


module.exports = router;
