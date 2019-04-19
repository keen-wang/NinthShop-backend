'use strict'

const express = require('express');

const categorydao = require('../dao/categorydao');

const router = express.Router();

router.get('/',function(req,res){
	if(req.query){
		categorydao.getCategoryByShopid(req.query.shopid,function(results){
			res.send({
				code: 0,
				data: results,
				msg: ''
			})
		});
	}
});
module.exports = router;

