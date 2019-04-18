"use strict"
//引入模块
const express = require('express'),
    userinfodao=require('../dao/userinfodao')
// 获取路由对象
const router = express.Router()
const md5 = require('blueimp-md5')
const common = require('../common/position')

//获取登录用户信息
router.get('/',function (req,res) {
  // 取出userid
  const userid = req.session.userid
  userinfodao.queryUserById(userid,function(results) {
    // console.log('获取登录用户', req.session,req.cookie, results)
    if (!results.length){
        delete req.session.userid
        res.send({code: 6,msg:'获取不到用户信息'});
    }else{
      let result = results[0];
      res.json(
        {
          code: 0,
          data: {
            username: result.name,
            userid: userid,
            balance: result.balance,
            tell: result.tell
          },
          msg: ''
        }
      );
    }
  });
});
//登录校验
router.post('/check',function (req,res) {
    const {password, username} = req.body
    userinfodao.queryUserByName(username,function(results) {
        if (results.length==0){
            return res.send({code: 1, data: {}, msg: '用户名不存在'});
        }else{
            let result = results[0];
            if (result.pwd===md5(password)) {
                const userid = result.id
                req.session.userid = userid
                return  res.send({msg:'成功',code: 0,userid: userid});
            }else{
                return   res.send({msg: '用户名或密码错误',code: 1, data: {}});
            }
        }
    });
});
//登出账号
router.get('/logout',function (req,res) {
  // 清除浏览器保存的userid的cookie
  delete req.session.userid
  // 返回数据
  res.send({code: 0, data: {}})
});
//注册功能
router.post('/register',function (req,res) {
    const {username, password, type} = req.body
    userinfodao.queryUserByName(username,function(results) {
        if (results.length !== 0){
            return res.send({code: 1, msg:'用户名已被注册'});
        }else{
            // 密码加密
            userinfodao.insertUserinfo(username,md5(password),'null',type,results => {
                // 将id加密
                const userid = results.insertId
                req.session.userid = userid
                const data = {username, type, '_id': userid}
                return res.send({code: 0, data, msg:'注册成功'});
            })
        }
    });
});
//获取用户信息
router.post('/get',function (req,res) {
    userinfodao.queryUserByName(req.query.name,function(results) {
        if (!results.length){
            res.send({code: 1,msg:'获取不到用户信息'});
        }else{
            let result = results[0];
            res.json(
              {
                code: 0,
                data: {
                  result:'success',
                  desc:'1',
                  userid:result.id,
                  balance:result.balance,
                  tell:result.tell
                },
                msg: ''
              }
            );
        }
    });
});
//获取用户定位
router.get('/position',(req, res, next) => {
  console.log('获取定位信息', common)
  let result = common.getLocation(req, res);
  let data = common.getDetailPosition(result)
  res.send({
    code: 0,
    msg: "获取位置信息成功",
    data
  })
})
// 将路由对象导出
module.exports = router;