"use strict"

const express = require("express");//引用express框架
const session = require('express-session');
const bodyParser=require("body-parser");//引用bodyPaser模块 解析post请求参数
//导入路由模块
const routeUser = require("./routes/routeUserinfo");
const routeOrder = require('./routes/routeOrderinfo');
const shopinfoRoute = require("./routes/shopinforoute.js");
const routeGoodsinfo = require("./routes/routeGoodsinfo.js");
const routeCategory = require("./routes/routeCategory.js");
const routeShopType = require("./routes/routeShopType.js");
const routeFile= require("./routes/routeFile.js");

const app = express();
app.use(bodyParser.urlencoded({extended:false}));
app.use(bodyParser.json());

//获取服务器静态资源
app.use(express.static("./webapp"));
// session持久化
app.use(session({
  secret: '12345',
  cookie: {
    path: '/',
    maxAge: 1000*60*60,
    httpOnly: true // 防止js查看修改cookie
  },
  resave: false,
  saveUninitialized: true
}))

// app.get("/",function (req,res) {
//     // req.location("/index.html");
// });

//路由处理
app.use("/shopinfo",shopinfoRoute);
app.use("/userinfo",routeUser);
app.use("/orderinfo",routeOrder);
app.use("/goods",routeGoodsinfo);
app.use("/category",routeCategory);
app.use("/shoptype",routeShopType);
// app.use("/upload",routeShopType);


//监听服务器端口
app.listen(9008,function (err) {
    if (err){
        console.log(err);
    }
    console.log("Server is started!");
})