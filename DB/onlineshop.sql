/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50542
Source Host           : localhost:3306
Source Database       : onlineshop

Target Server Type    : MYSQL
Target Server Version : 50542
File Encoding         : 65001

Date: 2015-04-24 08:55:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `num` smallint(5) unsigned NOT NULL DEFAULT '0',
  `price` double unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES ('1', 'shoe', '16', '123');
INSERT INTO `item` VALUES ('2', 'pans', '95', '321');
INSERT INTO `item` VALUES ('4', 'shoe', '98', '789');
INSERT INTO `item` VALUES ('5', 'shoe', '97', '911');
INSERT INTO `item` VALUES ('6', 'itemTest1', '999', '198.2');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` tinyint(4) unsigned NOT NULL,
  `shop_id` tinyint(4) unsigned NOT NULL,
  `item_id` tinyint(4) unsigned NOT NULL,
  `amount` int(100) unsigned NOT NULL,
  `name` varchar(255) DEFAULT '',
  `shop_name` varchar(255) NOT NULL DEFAULT '',
  `price` double(10,2) unsigned zerofill NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', '1', '1', '1', '1', 'shoes', 'Jeans', '0000000.00');
INSERT INTO `orders` VALUES ('3', '2', '3', '1', '4', 'shoes', 'Jeans', '0000000.00');
INSERT INTO `orders` VALUES ('5', '2', '1', '1', '9', 'shoes', 'Jeans', '0000000.00');
INSERT INTO `orders` VALUES ('6', '1', '1', '1', '9', 'shoes', 'Jeans', '0000000.00');
INSERT INTO `orders` VALUES ('7', '1', '1', '1', '1', 'shoe', '\0\0\0S\0\0\0p\0\0\0o\0\0\0r\0\0\0t\0\0\0s', '0000000.00');
INSERT INTO `orders` VALUES ('8', '1', '3', '1', '1', 'shoe', '\0\0\0C\0\0\0o\0\0\0m\0\0\0p\0\0\0u\0\0\0t\0\0\0e\0\0\0r', '0000000.00');
INSERT INTO `orders` VALUES ('9', '1', '1', '2', '1', 'pans', '\0\0\0S\0\0\0p\0\0\0o\0\0\0r\0\0\0t\0\0\0s', '0000000.00');
INSERT INTO `orders` VALUES ('10', '1', '1', '2', '1', 'pans', '\0\0\0S\0\0\0p\0\0\0o\0\0\0r\0\0\0t\0\0\0s', '0000000.00');
INSERT INTO `orders` VALUES ('11', '1', '3', '5', '1', 'shoe', '\0\0\0C\0\0\0o\0\0\0m\0\0\0p\0\0\0u\0\0\0t\0\0\0e\0\0\0r', '0000000.00');
INSERT INTO `orders` VALUES ('12', '1', '3', '5', '1', 'shoe', '\0\0\0C\0\0\0o\0\0\0m\0\0\0p\0\0\0u\0\0\0t\0\0\0e\0\0\0r', '0000000.00');
INSERT INTO `orders` VALUES ('13', '1', '1', '1', '1', 'shoe', '\0\0\0S\0\0\0p\0\0\0o\0\0\0r\0\0\0t\0\0\0s', '0000000.00');
INSERT INTO `orders` VALUES ('14', '1', '11', '2', '1', 'pans', '\0\0\0S\0\0\0m\0\0\0a\0\0\0r\0\0\0t\0\0\0 \0\0\0P\0\0\0h\0\0\0o\0\0\0n\0\0\0e', '0000321.00');

-- ----------------------------
-- Table structure for store
-- ----------------------------
DROP TABLE IF EXISTS `store`;
CREATE TABLE `store` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) CHARACTER SET utf32 NOT NULL,
  `itemList` varchar(60) CHARACTER SET utf32 DEFAULT NULL,
  `sellerId` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of store
-- ----------------------------
INSERT INTO `store` VALUES ('1', 'Sports', '1;2;3;4;5;', '0');
INSERT INTO `store` VALUES ('3', 'Computer', '1;2;3;4;5;', '0');
INSERT INTO `store` VALUES ('10', 'Jeans', '1;2;3;4;5;', '0');
INSERT INTO `store` VALUES ('11', 'Smart Phone', '1;2;3;4;5;', '0');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` tinyint(4) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `account` double(11,0) unsigned NOT NULL,
  `location` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'root', 'sun7261030', '998678', 'Nanjing');
INSERT INTO `users` VALUES ('6', 'first Seller', 'sdf', '23', 'New York');
INSERT INTO `users` VALUES ('7', 'first Seller', 'sdf', '23', 'New York');
INSERT INTO `users` VALUES ('8', 'first Seller', 'sdf', '23', 'New York');
INSERT INTO `users` VALUES ('9', 'first Seller', 'sdf', '23', 'New York');
INSERT INTO `users` VALUES ('10', 'tom', 'sun7261030', '0', 'NYC ');
INSERT INTO `users` VALUES ('11', 'Obma', 'sun7261030', '0', 'WA');
INSERT INTO `users` VALUES ('12', 'userTest1', 'sun7261030', '999', 'nanjing');
INSERT INTO `users` VALUES ('13', 'no_username', 'no_password', '0', null);
INSERT INTO `users` VALUES ('14', 'userTest2', 'sun7261030', '7201', 'Nanjing');
INSERT INTO `users` VALUES ('15', 'testjsp', 'sun7261030', '200', 'nj');
INSERT INTO `users` VALUES ('16', 'testjsp', 'sun7261030', '200', 'nj');
INSERT INTO `users` VALUES ('17', 'jsp_test', 'sun7261030', '200', 'NJ');
INSERT INTO `users` VALUES ('18', 'userregtest', 'no_password', '300', 'js');
INSERT INTO `users` VALUES ('19', 'regTest9', 'sun7261030', '3000', 'NanJing');
INSERT INTO `users` VALUES ('20', 'name', 'sun7261030', '20003', 'NANJING');
