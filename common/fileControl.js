"use strict";

const fs = require("fs");
const pt = require("path");
//上传文件的路径
let url = pt.join(__dirname,"../upload");
//读取上传目录的文件
function renderFiles(req,res) {
    let json=_readFile(url);
    // 给ejs页面渲染数据
    res.render("index.ejs",json);
};
//通过目录读取文件
function renderFilesByFolder(req,res){
//    获取当前url的：flodername
    let folder=decodeURI(req.url) ;
    let json = _readFile(pt.join(url,folder));
    // 给ejs页面渲染数据
    res.render("index.ejs",json);
}

//搜索文件
function searchFile(req,res) {
    //创建两个数组保存文件和文件件数据
    let folders =[];
    let files = [];
    //获取参数
    console.log("body:"+req.body);
    let keyword = req.body.keyword;
    _searchFile(url,"/",keyword);
    let json={
        folders:[],
        files:array
    };
    console.log("搜索结果：");
    console.log(json);
    res.render("index.ejs",json);
}
let array=[];
//递归遍历文件夹
function  _searchFile(url,pathname,keyword){
    fs.readdir(url,function (error,file){
        if (error) throw error;
        //遍历目录中的文件
        file.forEach(function (file) {
            //判断每个文件的类型
            fs.stat(pt.join(url,file),function (err,stats) {
                if (error) throw error;
                if (stats.isFile()) {
                    if(file.indexOf(keyword)!=-1){
                        console.log("查找到"+pt.join(pathname,file));
                        array[array.length]=pt.join(pathname,file);
                    }
                    var str = '我是一字符串';

                }else{
                    _searchFile(pt.join(url,file),pt.join(pathname,file),keyword);
                }
            })
        });
    });
}

function _readFile(path){
    let allFiles = fs.readdirSync(path);
    //创建两个数组保存文件和文件件数据
    let folders =[];
    let files = [];
    allFiles.forEach(function (file) {
        var state = fs.statSync(pt.join(path,file));
        if (state.isFile()) {
            files[files.length]=file;
        }else{
            folders[folders.length]=file;
        }
    });
    return {folders,files};
}
module.exports={renderFiles,renderFilesByFolder,searchFile};