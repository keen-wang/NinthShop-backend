"use strict"
//引入模块
const express = require('express'),
    userinfodao = require("../dao/userinfodao"),
    orderinfodao = require("../dao/orderinfodao"),//引入dao文件
    ordergoodsdao = require("../dao/ordergoodsdao");
// 获取路由对象
const router = express.Router();

router.get('/',function (req,res) {
    // 登录校验
    if (!req.session.userid&&req.session.userid!==0) {
        res.send({code: 6, data: {}, msg: '请先登录账号'})
        return 
    }
    //保存订单信息列表
    orderinfodao.queryOrderByUserid(req.session.userid,function (results) {
        // console.log('订单列表', req.session.userid,results)
        let orderlist=[];
        for (let i = 0; i < results.length; i++) {
            //获取订单商品信息
            ordergoodsdao.queryGoodsByOrderid(results[i].id, goodsResults => {
                let ordergoodslist = []
                if (!goodsResults.length) {
                    console.log(results[i].id + "号订单没有商品！");
                } else {
                    // for (let j = 0; j < goodsResults.length; j++) {
                    //     ordergoodslist[ordergoodslist.length] = goodsResults[j];
                    // }
                    ordergoodslist = goodsResults
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
                    console.log(results[i].id + "号订单添加商品",orderdata);
                    orderlist.push(orderdata)
                    //输出数组
                    if(i === results.length-1){
                        //发送到客户端
                        res.send({
                            code: 0,
                            data: orderlist,
                            msg: ''
                        })
                    }
                }
            });

        }
    })
});

router.post('/insert',function (req,res) {
    // 登录校验
    if (!req.session.userid&&req.session.userid!==0) {
        res.send({code: 1, data: {}, msg: '请先登录账号'})
        return 
    }
    const {shopId,addressId,date,orderGoods} = req.body
    console.log('请求信息', req.body)
    const data = {
        userid: req.session.userid,
        shopid: shopId,
        addressid: addressId,
        date
    }
    orderinfodao.insertOrder(data,(results) => {
        console.log('插入订单',results)
        const orderId = results.insertId
        let isSuccess = true
        orderGoods.forEach(item=>{
            ordergoodsdao.insertOrderGoods(orderId,item.goodsId,item.quantity,function(results){
                if (results.affectedRows==1){
                }else{
                    isSuccess = false
                }
            })
        })
        const sumPrice = orderGoods.reduce((result,item)=>{
            return result + item.price * item.quantity
        },0)
        userinfodao.queryUserById(req.session.userid,function(results) {
            let result = results[0]
            let balance = result.balance - sumPrice
            userinfodao.updateBalance(req.session.userid,balance,updateResult=>{
                console.log('订单账号修改', updateResult)
                if (updateResult.affectedRows===1){
                }else{
                    isSuccess = false
                }
                if (isSuccess) {
                    res.send({
                        code: 0,
                        data: true,
                        msg: '提交成功'
                    })
                } else {
                    res.send({
                        code: 1,
                        msg: '订单提交失败，请稍后重试'
                    })
                }
            })
        })
    })
})

router.get('/update',function (req,res) {
    // 登录校验
    if (!req.session.userid&&req.session.userid!==0) {
        res.send({code: 1, data: {}, msg: '请先登录账号'})
        return 
    }
    orderinfodao.updateOrderStatusById(req.query.id,req.query.status,function (results) {
        console.log('更新结果', results, req.query)
        if (results.affectedRows==1){
            // 保存查询到的数据
            res.send({msg:'success',code:0,orderid:results.insertId});
        }else{
            res.send({msg:'服务器异常，确认收货失败。',code:1});
        }
    });
});
// 将路由对象导出
module.exports = router