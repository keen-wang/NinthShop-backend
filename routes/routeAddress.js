"use strict"
//引入模块
const express = require('express'),
    addressinfodao = require('../dao/addressinfodao')
// 获取路由对象
const router = express.Router()

//获取用户地址信息
router.get('',function (req,res) {
    if (!req.session.userid&&req.session.userid!==0) {
      res.send({code: 1, data: {}, msg: '请先登录账号'})
      return 
    }
    addressinfodao.querAddressByUserid(req.session.userid,function(results) {
        if (!results){
            res.send({code: 1, data: {}, msg: '暂无保存地址信息'});
        }else{
            // 保存查询到的数据
            // for (var i=0;i<results.length;i++){
            //     addresslist[addresslist.length]=results[i];
            // }
            let addressList = [...results]
            res.send({code: 0, data: {addressList}, msg: ''});
        }
    });
})
//修改地址信息
router.post('/update',function (req,res) {
    if (!req.session.userid&&req.session.userid!==0) {
      res.send({code: 6, data: {}, msg: '请先登录账号'})
      return 
    }
    const updateinfo = req.body.addressinfo
    const id = req.body.id
    addressinfodao.updateAddressById(id,updateinfo,function(results,err) {
      if (err&&results.affectedRows!==1){
        res.send({code:1, msg:'保存失败'});
      }else{
        // 保存查询到的数据
        res.send({code: 0, msg:'success',data:{affectedRows: results.affectedRows}});
      }
    });
})
//插入地址信息
router.post('/create',function (req,res) {
    if (!req.session.userid&&req.session.userid!==0) {
      res.send({code: 6, data: {}, msg: '请先登录账号'})
      return 
    }
    const userid = req.session.userid
    const addressinfo = {}
    Object.assign(addressinfo, req.body)
    addressinfo.userid = userid
    addressinfodao.insertAddress(addressinfo,function(results,err) {
        if (err&&results.affectedRows!==1){
            res.send({code:1, msg:'保存失败'});
        }else{
            // 保存查询到的数据
            res.send({code: 0, msg:'success',data:{affectedRows: results.affectedRows}});
        }
    });
});
//删除地址数据
router.get('/delete',function (req,res) {
  if (!req.session.userid&&req.session.userid!==0) {
    res.send({code: 6, data: {}, msg: '请先登录账号'})
    return 
  }
  addressinfodao.deleteAddress(req.session.userid,function(results, err) {
    if (err&&results.affectedRow!==1){
        res.send({code:1, msg:'删除失败'});
    }else{
        // 保存查询到的数据
        res.send({code: 0, msg:'success',data:{affectedRows: results.affectedRows}});
    }
  });
});
// 将路由对象导出
module.exports = router;