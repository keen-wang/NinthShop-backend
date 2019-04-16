"use strict"
//引入模块
const express = require('express'),
    orderinfodao = require("../dao/orderinfodao"),//引入dao文件
    ordergoodsdao = require("../dao/ordergoodsdao");
// 获取路由对象
const router = express.Router();

router.post('/get',function (req,res) {
    //保存订单信息列表
    orderinfodao.queryOrderByUserid(req.query.userid,function (results) {
        let orderlist=[];
        for (let i = 0; i < results.length; i++) {
            //获取订单商品信息
            ordergoodsdao.queryGoodsByOrderid(results[i].id, function (goodsresults) {
                let ordergoodslist = [];
               console.log(i);
                if (!goodsresults.length) {
                    console.log(results[i].id + "号订单没有商品！");
                } else {
                    for (let j = 0; j < goodsresults.length; j++) {
                        ordergoodslist[ordergoodslist.length] = goodsresults[j];
                    }
                    //组织完整订单信息
                    let orderdata = {
                        id:results[i].id,
                        shopname: results[i].name,
                        imgsrc:results[i].imgsrc,
                        date: results[i].date,
                        status: results[i].status,
                        shopid:results[i].shopid,
                        goodslist: ordergoodslist
                    }
                    //添加到订单列表
                    orderlist[orderlist.length] = orderdata;
                    //输出数组
                    if(i==results.length-1){
                        //发送到客户端
                        res.json(orderlist);
                    }
                }
            });

        }

    });
});

router.post('/insert',function (req,res) {
    orderinfodao.insertOrder(req.query.userid,req.query.shopid,req.query.date,function (results) {
        if (results.affectedRows==1){
            // 保存查询到的数据
            res.json({result:'success',desc:"1",orderid:results.insertId});
        }else{
            res.json({result:'fault',desc:"0"});
        }
    });
});

router.post('/update',function (req,res) {
    orderinfodao.updateOrderStatusById(req.query.id,req.query.status,function (results) {
        if (results.affectedRows==1){
            // 保存查询到的数据
            res.json({result:'success',desc:"1",orderid:results.insertId});
        }else{
            res.json({result:'fault',desc:"0"});
        }
    });
});
// 将路由对象导出
module.exports = router;