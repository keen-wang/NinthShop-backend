'use strict'

const express = require('express');

const goodsinfodao = require('../dao/goodsinfodao'),
ordergoodsdao = require('../dao/ordergoodsdao');


const router = express.Router();

router.post('/menu',function(req,res){
	if(req.query){
		goodsinfodao.getMenuByShopid(req.query.shopid,function(results){
	        if (!results.length){

			}else{
				res.json(results);
			}
		});
	}
});

router.post('/ordergoods',function (req,res) {
    ordergoodsdao.insertOrderGoods(req.query.orderid,req.query.goodsid,req.query.quantity,function(results){
		if (results.affectedRows==1){
			res.json({result:'success',desc:'1'});
		}else{
			res.json({result:'fault',desc:'0'});
		}
	});
});
module.exports = router;

