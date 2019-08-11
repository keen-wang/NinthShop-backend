/*
Navicat MySQL Data Transfer

Source Server         : WRF
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : ninth_shop

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2019-08-09 22:33:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `addressinfo`
-- ----------------------------
DROP TABLE IF EXISTS `addressinfo`;
CREATE TABLE `addressinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `name` varchar(11) NOT NULL,
  `tell` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  CONSTRAINT `userid` FOREIGN KEY (`userid`) REFERENCES `userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of addressinfo
-- ----------------------------
INSERT INTO `addressinfo` VALUES ('1', '4', '湖南省衡阳市南华大学红湘校', 'w', '12212222');
INSERT INTO `addressinfo` VALUES ('3', '1', '湖南省衡阳市华信教育公司', '', '');
INSERT INTO `addressinfo` VALUES ('4', '1', '湖南省衡阳市南华大学致远园', '', '');
INSERT INTO `addressinfo` VALUES ('16', '2', '南华大学', '', '');
INSERT INTO `addressinfo` VALUES ('17', '2', '哈哈哈还好还好', '', '');
INSERT INTO `addressinfo` VALUES ('18', '2', '哈哈哈还好还好', '', '');
INSERT INTO `addressinfo` VALUES ('24', '4', '安达市大所阿萨德阿萨德阿萨德阿萨德', '李雷1', '66666666666666');
INSERT INTO `addressinfo` VALUES ('25', '4', '11111', '111', '111');
INSERT INTO `addressinfo` VALUES ('26', '9', '湖南省衡阳市南华大学', '老铁', '15675466666');
INSERT INTO `addressinfo` VALUES ('27', '9', '广东省深圳市高铁站', '赵铁柱', '13452365235');
INSERT INTO `addressinfo` VALUES ('28', '10', '11', '11', '11');
INSERT INTO `addressinfo` VALUES ('29', '11', '湖南省衡阳市南华大学八教', '李雷', '15675465696');
INSERT INTO `addressinfo` VALUES ('30', '11', '1567546', '张三', '15675465696');
INSERT INTO `addressinfo` VALUES ('31', '12', '衡阳市南华大学', '王锐锋', '15675465696');

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL DEFAULT '0',
  `shopid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shopid` (`shopid`),
  CONSTRAINT `shopid` FOREIGN KEY (`shopid`) REFERENCES `shopinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '1', '新品上市');
INSERT INTO `category` VALUES ('2', '1', '优惠套餐');
INSERT INTO `category` VALUES ('4', '1', '经典主食');
INSERT INTO `category` VALUES ('5', '1', '精选小吃');
INSERT INTO `category` VALUES ('6', '1', '鸡翅套餐');
INSERT INTO `category` VALUES ('7', '1', '缤纷饮品');
INSERT INTO `category` VALUES ('8', '1', '美味甜食');
INSERT INTO `category` VALUES ('9', '1', '麦趣鸡盒');
INSERT INTO `category` VALUES ('11', '1', '开心乐园套餐');
INSERT INTO `category` VALUES ('12', '2', '人气套餐');

-- ----------------------------
-- Table structure for `goodsinfo`
-- ----------------------------
DROP TABLE IF EXISTS `goodsinfo`;
CREATE TABLE `goodsinfo` (
  `id` int(11) NOT NULL DEFAULT '0',
  `shopid` int(11) NOT NULL,
  `cateid` int(11) NOT NULL,
  `sales` int(11) DEFAULT NULL,
  `praiserate` int(11) DEFAULT '100',
  `name` varchar(20) NOT NULL,
  `price` float(11,2) DEFAULT '99.99',
  `summary` varchar(255) DEFAULT NULL,
  `imgsrc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cateid1` (`cateid`),
  KEY `shopid1` (`shopid`),
  CONSTRAINT `cateid1` FOREIGN KEY (`cateid`) REFERENCES `category` (`id`),
  CONSTRAINT `shopid1` FOREIGN KEY (`shopid`) REFERENCES `shopinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goodsinfo
-- ----------------------------
INSERT INTO `goodsinfo` VALUES ('0', '1', '1', '4', '60', '初夏乐套餐', '59.00', '大鸡块1份+麦辣鸡翅2对+大可乐', null);
INSERT INTO `goodsinfo` VALUES ('1', '1', '1', '3', '60', '法式针虾厚牛堡', '34.00', '法式珍虾牛堡一个', null);
INSERT INTO `goodsinfo` VALUES ('2', '1', '1', '1', '100', '法式苹果味奶茶', '15.00', '法式苹果味奶茶', null);
INSERT INTO `goodsinfo` VALUES ('3', '1', '1', '4', '100', '法式柠香鸡腿堡', '28.00', '法式柠香鸡腿堡1个', null);
INSERT INTO `goodsinfo` VALUES ('4', '1', '2', '14', '100', '薯条', '5.00', '一份薯条 原理土豆。', null);
INSERT INTO `goodsinfo` VALUES ('5', '1', '2', '5', '100', '麦辣鸡翅2块', '5.00', '麦辣鸡翅2块', null);
INSERT INTO `goodsinfo` VALUES ('6', '1', '4', '1', '100', '麦香鱼汉堡', '19.00', '原理：面板、鱼、芝士', null);
INSERT INTO `goodsinfo` VALUES ('7', '1', '4', '6', '70', '巨无霸汉堡', '23.00', '原料：面包、牛肉', null);
INSERT INTO `goodsinfo` VALUES ('8', '1', '4', '12', '100', '经典麦辣鸡腿汉堡', '20.00', '1个经典麦辣鸡腿汉堡 主要原料：面包、鸡肉、生菜、', null);
INSERT INTO `goodsinfo` VALUES ('9', '1', '5', '80', '90', '麦辣鸡翅2块（炸鸡翅）', '11.50', '2块麦辣鸡翅 主要原料：鸡肉，腌料，裹粉，油', null);
INSERT INTO `goodsinfo` VALUES ('10', '1', '5', '34', '80', '麦乐鸡5块（炸鸡块）\r\n', '11.50', '5块麦乐鸡主要原料：鸡肉，油', null);
INSERT INTO `goodsinfo` VALUES ('11', '1', '6', '29', '100', '麦辣鸡腿汉堡配麦辣鸡翅套餐', '33.00', ' ', null);
INSERT INTO `goodsinfo` VALUES ('12', '1', '6', '13', '70', '巨无霸汉堡配麦辣鸡翅套餐', '34.00', ' ', null);
INSERT INTO `goodsinfo` VALUES ('13', '1', '7', '12', '100', '大可乐', '11.50', ' ', null);
INSERT INTO `goodsinfo` VALUES ('14', '1', '7', '1', '100', '鲜煮咖啡（大）', '15.00', '鲜煮咖啡（大）', null);
INSERT INTO `goodsinfo` VALUES ('15', '1', '7', '5', '100', '大雪碧', '11.50', ' ', null);
INSERT INTO `goodsinfo` VALUES ('16', '1', '8', '10', '70', '派（香芋）', '7.50', '香芋派 主要原料：香芋派', null);
INSERT INTO `goodsinfo` VALUES ('17', '1', '8', '13', '100', '派（菠萝）', '7.50', '菠萝派 主要原料：菠萝派', null);
INSERT INTO `goodsinfo` VALUES ('18', '1', '9', '1', '100', '洗漱套装', '92.00', '牙刷、牙膏、毛巾', null);
INSERT INTO `goodsinfo` VALUES ('19', '1', '11', '5', '80', '汉堡开心乐园餐（小薯条）', '50.00', '汉堡开心乐园餐（小薯条）', null);
INSERT INTO `goodsinfo` VALUES ('20', '2', '12', '48', '99', '洗漱套装', '26.00', '牙刷、牙膏、毛巾', null);

-- ----------------------------
-- Table structure for `ordergoods`
-- ----------------------------
DROP TABLE IF EXISTS `ordergoods`;
CREATE TABLE `ordergoods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` int(11) NOT NULL,
  `goodsid` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orderid3` (`orderid`),
  KEY `goodsid3` (`goodsid`),
  CONSTRAINT `goodsid3` FOREIGN KEY (`goodsid`) REFERENCES `goodsinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ordergoods
-- ----------------------------
INSERT INTO `ordergoods` VALUES ('1', '2', '18', '1');
INSERT INTO `ordergoods` VALUES ('2', '2', '16', '1');
INSERT INTO `ordergoods` VALUES ('3', '1', '11', '2');
INSERT INTO `ordergoods` VALUES ('4', '3', '4', '2');
INSERT INTO `ordergoods` VALUES ('5', '4', '1', '3');
INSERT INTO `ordergoods` VALUES ('6', '4', '2', '3');
INSERT INTO `ordergoods` VALUES ('7', '5', '0', '1');
INSERT INTO `ordergoods` VALUES ('8', '5', '13', '1');
INSERT INTO `ordergoods` VALUES ('9', '5', '8', '1');
INSERT INTO `ordergoods` VALUES ('11', '9', '16', '8');
INSERT INTO `ordergoods` VALUES ('12', '6', '20', '1');
INSERT INTO `ordergoods` VALUES ('29', '64', '4', '1');
INSERT INTO `ordergoods` VALUES ('30', '65', '7', '1');
INSERT INTO `ordergoods` VALUES ('31', '65', '13', '1');
INSERT INTO `ordergoods` VALUES ('32', '66', '0', '1');
INSERT INTO `ordergoods` VALUES ('33', '66', '1', '4');
INSERT INTO `ordergoods` VALUES ('34', '66', '2', '3');
INSERT INTO `ordergoods` VALUES ('35', '66', '3', '3');
INSERT INTO `ordergoods` VALUES ('36', '67', '0', '3');
INSERT INTO `ordergoods` VALUES ('37', '68', '0', '1');
INSERT INTO `ordergoods` VALUES ('38', '68', '17', '1');
INSERT INTO `ordergoods` VALUES ('39', '69', '20', '4');
INSERT INTO `ordergoods` VALUES ('40', '70', '4', '6');
INSERT INTO `ordergoods` VALUES ('41', '70', '12', '1');
INSERT INTO `ordergoods` VALUES ('42', '70', '15', '1');
INSERT INTO `ordergoods` VALUES ('43', '71', '0', '1');
INSERT INTO `ordergoods` VALUES ('44', '71', '7', '1');
INSERT INTO `ordergoods` VALUES ('45', '72', '20', '1');
INSERT INTO `ordergoods` VALUES ('46', '73', '18', '1');
INSERT INTO `ordergoods` VALUES ('47', '73', '7', '1');
INSERT INTO `ordergoods` VALUES ('48', '73', '6', '5');
INSERT INTO `ordergoods` VALUES ('50', '79', '1', '1');
INSERT INTO `ordergoods` VALUES ('51', '79', '4', '2');
INSERT INTO `ordergoods` VALUES ('52', '80', '1', '1');
INSERT INTO `ordergoods` VALUES ('53', '80', '4', '2');
INSERT INTO `ordergoods` VALUES ('54', '80', '0', '1');
INSERT INTO `ordergoods` VALUES ('55', '81', '1', '1');
INSERT INTO `ordergoods` VALUES ('56', '81', '4', '2');
INSERT INTO `ordergoods` VALUES ('57', '81', '0', '1');
INSERT INTO `ordergoods` VALUES ('58', '82', '14', '1');
INSERT INTO `ordergoods` VALUES ('59', '82', '13', '2');
INSERT INTO `ordergoods` VALUES ('60', '82', '15', '3');
INSERT INTO `ordergoods` VALUES ('61', '83', '14', '1');
INSERT INTO `ordergoods` VALUES ('62', '83', '13', '2');
INSERT INTO `ordergoods` VALUES ('63', '83', '15', '3');
INSERT INTO `ordergoods` VALUES ('64', '84', '0', '3');
INSERT INTO `ordergoods` VALUES ('65', '85', '0', '1');
INSERT INTO `ordergoods` VALUES ('66', '86', '0', '1');
INSERT INTO `ordergoods` VALUES ('67', '86', '1', '1');
INSERT INTO `ordergoods` VALUES ('68', '87', '0', '3');
INSERT INTO `ordergoods` VALUES ('69', '88', '0', '1');
INSERT INTO `ordergoods` VALUES ('70', '88', '1', '1');
INSERT INTO `ordergoods` VALUES ('71', '89', '0', '1');
INSERT INTO `ordergoods` VALUES ('72', '89', '1', '1');
INSERT INTO `ordergoods` VALUES ('73', '89', '2', '4');
INSERT INTO `ordergoods` VALUES ('74', '89', '3', '4');
INSERT INTO `ordergoods` VALUES ('75', '90', '0', '1');
INSERT INTO `ordergoods` VALUES ('76', '90', '2', '1');
INSERT INTO `ordergoods` VALUES ('77', '91', '1', '2');
INSERT INTO `ordergoods` VALUES ('78', '91', '2', '2');
INSERT INTO `ordergoods` VALUES ('79', '92', '0', '1');
INSERT INTO `ordergoods` VALUES ('80', '93', '0', '1');
INSERT INTO `ordergoods` VALUES ('81', '94', '1', '4');
INSERT INTO `ordergoods` VALUES ('82', '95', '0', '1');
INSERT INTO `ordergoods` VALUES ('83', '95', '1', '1');
INSERT INTO `ordergoods` VALUES ('84', '96', '0', '3');
INSERT INTO `ordergoods` VALUES ('85', '97', '0', '3');
INSERT INTO `ordergoods` VALUES ('86', '98', '0', '3');
INSERT INTO `ordergoods` VALUES ('87', '99', '0', '3');
INSERT INTO `ordergoods` VALUES ('88', '100', '0', '2');
INSERT INTO `ordergoods` VALUES ('89', '100', '1', '3');
INSERT INTO `ordergoods` VALUES ('90', '101', '20', '4');
INSERT INTO `ordergoods` VALUES ('91', '102', '1', '1');
INSERT INTO `ordergoods` VALUES ('92', '102', '2', '1');
INSERT INTO `ordergoods` VALUES ('93', '102', '8', '1');
INSERT INTO `ordergoods` VALUES ('94', '103', '2', '2');
INSERT INTO `ordergoods` VALUES ('95', '103', '1', '1');
INSERT INTO `ordergoods` VALUES ('96', '104', '0', '2');
INSERT INTO `ordergoods` VALUES ('97', '104', '1', '2');
INSERT INTO `ordergoods` VALUES ('98', '104', '2', '1');

-- ----------------------------
-- Table structure for `orderinfo`
-- ----------------------------
DROP TABLE IF EXISTS `orderinfo`;
CREATE TABLE `orderinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `shopid` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `addressid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid2` (`userid`),
  KEY `shopid2` (`shopid`),
  CONSTRAINT `shopid2` FOREIGN KEY (`shopid`) REFERENCES `shopinfo` (`id`),
  CONSTRAINT `userid2` FOREIGN KEY (`userid`) REFERENCES `userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderinfo
-- ----------------------------
INSERT INTO `orderinfo` VALUES ('1', '1', '1', '2018-06-14 00:00:00', '2', '0');
INSERT INTO `orderinfo` VALUES ('2', '1', '1', '2018-05-26 00:00:00', '2', '0');
INSERT INTO `orderinfo` VALUES ('3', '1', '1', '2018-06-01 00:00:00', '2', '0');
INSERT INTO `orderinfo` VALUES ('4', '1', '1', '2018-06-03 00:00:00', '2', '0');
INSERT INTO `orderinfo` VALUES ('5', '1', '1', '2018-06-04 00:00:00', '2', '0');
INSERT INTO `orderinfo` VALUES ('6', '1', '2', '2018-06-04 00:00:00', '2', '0');
INSERT INTO `orderinfo` VALUES ('64', '1', '1', '2018-06-14 00:00:00', '1', '0');
INSERT INTO `orderinfo` VALUES ('65', '2', '1', '2018-06-14 00:00:00', '2', '0');
INSERT INTO `orderinfo` VALUES ('66', '1', '1', '2018-06-14 00:00:00', '1', '0');
INSERT INTO `orderinfo` VALUES ('67', '1', '1', '2018-06-14 00:00:00', '1', '0');
INSERT INTO `orderinfo` VALUES ('68', '2', '1', '2018-06-15 00:00:00', '2', '0');
INSERT INTO `orderinfo` VALUES ('69', '2', '2', '2018-06-15 00:00:00', '1', '0');
INSERT INTO `orderinfo` VALUES ('70', '2', '1', '2018-06-15 00:00:00', '1', '0');
INSERT INTO `orderinfo` VALUES ('71', '2', '1', '2018-06-15 00:00:00', '2', '0');
INSERT INTO `orderinfo` VALUES ('72', '2', '2', '2018-06-15 00:00:00', '2', '0');
INSERT INTO `orderinfo` VALUES ('81', '1', '1', '2019-05-02 22:58:42', '1', '1');
INSERT INTO `orderinfo` VALUES ('82', '1', '1', '2019-05-15 01:26:10', '1', '26');
INSERT INTO `orderinfo` VALUES ('83', '1', '1', '2019-05-15 01:26:10', '1', '26');
INSERT INTO `orderinfo` VALUES ('84', '1', '1', '2019-05-23 22:18:08', '1', '1');
INSERT INTO `orderinfo` VALUES ('85', '1', '1', '2019-05-23 22:30:06', '1', '28');
INSERT INTO `orderinfo` VALUES ('86', '4', '1', '2019-05-23 22:34:23', '1', '1');
INSERT INTO `orderinfo` VALUES ('87', '4', '1', '2019-05-23 22:38:00', '1', '1');
INSERT INTO `orderinfo` VALUES ('88', '9', '1', '2019-05-23 22:46:59', '1', '26');
INSERT INTO `orderinfo` VALUES ('89', '10', '1', '2019-05-24 22:58:22', '2', '28');
INSERT INTO `orderinfo` VALUES ('90', '10', '1', '2019-05-25 17:20:47', '2', '28');
INSERT INTO `orderinfo` VALUES ('91', '10', '1', '2019-05-25 17:27:19', '2', '28');
INSERT INTO `orderinfo` VALUES ('92', '10', '1', '2019-05-25 17:28:01', '2', '28');
INSERT INTO `orderinfo` VALUES ('93', '4', '1', '2019-05-25 17:30:00', '1', '1');
INSERT INTO `orderinfo` VALUES ('94', '10', '1', '2019-05-25 17:53:34', '2', '28');
INSERT INTO `orderinfo` VALUES ('95', '10', '1', '2019-05-25 18:03:45', '2', '28');
INSERT INTO `orderinfo` VALUES ('96', '10', '1', '2019-05-25 18:14:11', '1', '28');
INSERT INTO `orderinfo` VALUES ('97', '10', '1', '2019-05-25 18:15:02', '1', '28');
INSERT INTO `orderinfo` VALUES ('98', '10', '1', '2019-05-25 18:17:32', '1', '28');
INSERT INTO `orderinfo` VALUES ('99', '10', '1', '2019-05-25 18:19:02', '1', '28');
INSERT INTO `orderinfo` VALUES ('100', '11', '1', '2019-05-25 22:16:41', '1', '29');
INSERT INTO `orderinfo` VALUES ('101', '11', '2', '2019-05-25 22:17:45', '1', '29');
INSERT INTO `orderinfo` VALUES ('102', '11', '1', '2019-05-25 22:18:02', '2', '29');
INSERT INTO `orderinfo` VALUES ('103', '11', '1', '2019-05-25 22:19:26', '1', '29');
INSERT INTO `orderinfo` VALUES ('104', '12', '1', '2019-05-25 22:35:02', '2', '31');

-- ----------------------------
-- Table structure for `shopinfo`
-- ----------------------------
DROP TABLE IF EXISTS `shopinfo`;
CREATE TABLE `shopinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `grade` float(5,1) DEFAULT NULL,
  `sales` int(11) DEFAULT NULL,
  `startprice` float(11,2) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `typeid` int(11) DEFAULT NULL,
  `imgsrc` varchar(255) DEFAULT NULL,
  `delivery_price` float(11,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `typeid` (`typeid`),
  CONSTRAINT `typeid` FOREIGN KEY (`typeid`) REFERENCES `shoptype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopinfo
-- ----------------------------
INSERT INTO `shopinfo` VALUES ('1', '良品铺子', '5.0', '287', '50.00', '35', '欢迎光临，请错开高峰期下单。', '1', '//img.alicdn.com/bao/uploaded///img.taobaocdn.com/tps/TB1_10FrgZC2uNjSZFnXXaxZpXa', '0.00');
INSERT INTO `shopinfo` VALUES ('2', '华联超市', '4.1', '2060', '5.00', '38', '各位小主，本店方便快捷，口味丰富。', '2', 'https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=1045854216,3585867507&fm=58', '0.00');
INSERT INTO `shopinfo` VALUES ('3', '百佳超市', '4.4', '2298', '10.00', '38', '本店宗旨原料新鲜，卫生！', '1', 'http://head.ppsj.com.cn/1/1614.gif', '0.00');
INSERT INTO `shopinfo` VALUES ('4', '沃尔玛超市', '4.4', '1844', '10.00', '38', '欢迎光临，请错开高峰期下单。', '1', 'https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=4175506098,2337807662&fm=58&w=121&h=140&img.JPEG', '0.00');
INSERT INTO `shopinfo` VALUES ('5', '厦门冬粉鸭', '4.7', '3149', '10.00', '36', '同学们，好吃不贵，经济实惠', '1', 'https://fuss10.elemecdn.com/8/2e/2a0b89296fa5ae1e6a1918546db05jpeg.jpeg?imageMogr/format/webp/thumbnail/!130x130r/gravity/Center/crop/130x130/', '0.00');
INSERT INTO `shopinfo` VALUES ('6', '重庆酸辣粉', '5.0', '1741', '7.00', '37', '不送上楼，预订单不能准时到', '1', null, '0.00');
INSERT INTO `shopinfo` VALUES ('7', '杭州小笼包', '4.8', '4140', '8.00', '36', '本店营业时间7：45-21：00', '1', null, '0.00');
INSERT INTO `shopinfo` VALUES ('8', '张记香港茶点', '5.0', '170', '20.00', '26', '老香港茶点', '1', null, '0.00');
INSERT INTO `shopinfo` VALUES ('10', '鲜目录寿司', '4.9', '112', '100.00', '20', '欢迎光临，请错开高峰期下单。', '1', null, '0.00');
INSERT INTO `shopinfo` VALUES ('11', '港式卤肉饭', '4.8', '1868', '0.00', '35', '本店推荐你在饿了吧上点餐', '2', null, '0.00');
INSERT INTO `shopinfo` VALUES ('12', '北京皮烤鸭', '4.5', '2185', '8.00', '45', '欢迎光临，用餐高峰期提前下单，谢谢。', '2', null, '0.00');

-- ----------------------------
-- Table structure for `shoptype`
-- ----------------------------
DROP TABLE IF EXISTS `shoptype`;
CREATE TABLE `shoptype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `imgsrc` varchar(100) DEFAULT '' COMMENT '文件路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shoptype
-- ----------------------------
INSERT INTO `shoptype` VALUES ('1', '方便速食', 'http://img.alicdn.com/tps/i4/TB1jlPASjTpK1RjSZKPwu13UpXa.png_300x300Q90s50.jpg_.webp');
INSERT INTO `shoptype` VALUES ('2', '休闲零食', 'http://img.alicdn.com/tfs/TB1olkTVAPoK1RjSZKbXXX1IXXa-153-153.gif?getAvatar=1');
INSERT INTO `shoptype` VALUES ('3', '奶品水饮', 'http:////img.alicdn.com/tps/i4/TB1kRDxShTpK1RjSZFMwu2G_VXa.png_300x300Q90s50.jpg_.webp');
INSERT INTO `shoptype` VALUES ('4', '粮油米面', '//img.alicdn.com/tps/i4/TB1pBTpSgTqK1RjSZPhwu0fOFXa.png_300x300Q90s50.jpg_.webp');
INSERT INTO `shoptype` VALUES ('5', '厨房日用', '//img.alicdn.com/tps/i4/TB1tae9k_Zmx1VjSZFGwu1x2XXa.png_300x300Q90s50.jpg_.webp');
INSERT INTO `shoptype` VALUES ('6', '母婴用品', '//img.alicdn.com/tps/i4/TB1fv6CSXzqK1RjSZFCwu2bxVXa.png_300x300Q90s50.jpg_.webp');
INSERT INTO `shoptype` VALUES ('7', '个人护理', '//img.alicdn.com/tps/i4/TB1nIjsSmzqK1RjSZFLwu3n2XXa.png_300x300Q90s50.jpg_.webp');
INSERT INTO `shoptype` VALUES ('8', '家清家居', 'http://img.alicdn.com/tps/i4/TB14cv0ShjaK1RjSZKzwu0VwXXa.png_300x300Q90s50.jpg_.webp');
INSERT INTO `shoptype` VALUES ('9', '文具体育', '//img.alicdn.com/tps/i4/TB1bIfzSkvoK1RjSZFDwu0Y3pXa.png_300x300Q90s50.jpg_.webp');
INSERT INTO `shoptype` VALUES ('10', '家纺内衣', '//img.alicdn.com/tps/i4/TB1N3_DSkPoK1RjSZKbwu01IXXa.png_300x300Q90s50.jpg_.webp');
INSERT INTO `shoptype` VALUES ('11', '中外美酒', '//img.alicdn.com/tps/i4/TB1.PPwSbvpK1RjSZPiwu2mwXXa.png_300x300Q90s50.jpg_.webp');
INSERT INTO `shoptype` VALUES ('12', '美容护肤', '//img.alicdn.com/tps/i4/TB1V5LDSkPoK1RjSZKbwu01IXXa.png_300x300Q90s50.jpg_.webp');

-- ----------------------------
-- Table structure for `shop__type`
-- ----------------------------
DROP TABLE IF EXISTS `shop__type`;
CREATE TABLE `shop__type` (
  `id` int(11) NOT NULL,
  `shopid` int(11) NOT NULL,
  `typeid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop__type
-- ----------------------------
INSERT INTO `shop__type` VALUES ('1', '1', '1');
INSERT INTO `shop__type` VALUES ('2', '2', '2');
INSERT INTO `shop__type` VALUES ('3', '3', '1');
INSERT INTO `shop__type` VALUES ('4', '4', '1');
INSERT INTO `shop__type` VALUES ('5', '5', '1');
INSERT INTO `shop__type` VALUES ('6', '6', '1');
INSERT INTO `shop__type` VALUES ('7', '7', '1');
INSERT INTO `shop__type` VALUES ('8', '8', '1');
INSERT INTO `shop__type` VALUES ('10', '10', '1');
INSERT INTO `shop__type` VALUES ('11', '11', '2');
INSERT INTO `shop__type` VALUES ('12', '12', '2');

-- ----------------------------
-- Table structure for `userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `pwd` varchar(100) NOT NULL,
  `balance` float(10,2) NOT NULL DEFAULT '0.00',
  `tell` varchar(20) NOT NULL,
  `imgsrc` varchar(255) DEFAULT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'user' COMMENT '用户类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('1', 'admin', 'admin', '0.00', '17607477752', null, 'user');
INSERT INTO `userinfo` VALUES ('2', 'name', 'pwd', '0.00', '13825818442', null, 'user');
INSERT INTO `userinfo` VALUES ('4', '66', '3295c76acbf4caaed33c36b1b5fc2cb1', '0.00', '', null, 'user');
INSERT INTO `userinfo` VALUES ('5', '55', 'b53b3a3d6ab90ce0268229151c9bde11', '0.00', '', null, 'user');
INSERT INTO `userinfo` VALUES ('6', '77', '28dd2c7955ce926456240b2ff0100bde', '0.00', '', null, 'user');
INSERT INTO `userinfo` VALUES ('7', '88', '2a38a4a9316c49e5a833517c45d31070', '0.00', '', null, 'user');
INSERT INTO `userinfo` VALUES ('8', 'uername', '0985251f3d13076beec69aca778ea31f', '0.00', 'null', null, 'user');
INSERT INTO `userinfo` VALUES ('9', 'username', '0985251f3d13076beec69aca778ea31f', '0.00', 'null', null, 'user');
INSERT INTO `userinfo` VALUES ('10', 'aa', '4124bc0a9335c27f086f24ba207a4912', '-531.00', '15675465696', null, 'user');
INSERT INTO `userinfo` VALUES ('11', 'wangrf', '4297f44b13955235245b2497399d7a93', '-457.00', '15675465696', null, 'user');
INSERT INTO `userinfo` VALUES ('12', '20154350118', 'cd30db24d30391b75a81397330995606', '-201.00', '15675465696', null, 'user');

-- ----------------------------
-- View structure for `ordergoodsview`
-- ----------------------------
DROP VIEW IF EXISTS `ordergoodsview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ordergoodsview` AS select `orderinfo`.`id` AS `id`,`orderinfo`.`userid` AS `userid`,`ordergoods`.`goodsid` AS `goodsid`,`ordergoods`.`quantity` AS `quantity`,`goodsinfo`.`name` AS `goodsname`,`goodsinfo`.`price` AS `price`,`shopinfo`.`name` AS `shopname`,`orderinfo`.`date` AS `date`,`orderinfo`.`status` AS `status` from (((`ordergoods` join `orderinfo`) join `shopinfo`) join `goodsinfo`) where ((`ordergoods`.`orderid` = `orderinfo`.`id`) and (`orderinfo`.`shopid` = `shopinfo`.`id`) and (`ordergoods`.`goodsid` = `goodsinfo`.`id`)) ;
