/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : page_demo

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-01-17 18:00:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) DEFAULT NULL COMMENT '用户名',
  `phone` varchar(50) DEFAULT NULL COMMENT '电话号码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '李四', '15919161000', '2017-01-17 16:15:47');
INSERT INTO `user` VALUES ('2', '张三', '15919161001', '2017-01-17 16:15:19');
INSERT INTO `user` VALUES ('3', '王五', '15919161002', '2017-01-17 16:16:03');
INSERT INTO `user` VALUES ('4', '小分页', '15919161003', '2017-01-17 16:16:03');
INSERT INTO `user` VALUES ('5', '面面俱到', '15919161004', '2017-01-17 16:16:03');
INSERT INTO `user` VALUES ('6', '没名字', '15919161005', '2017-01-17 16:16:04');
INSERT INTO `user` VALUES ('7', '单身', '15919161006', '2017-01-17 16:16:04');
INSERT INTO `user` VALUES ('8', '幸福', '15919161007', '2017-01-17 16:16:04');
INSERT INTO `user` VALUES ('9', '取名字', '15919161008', '2017-01-17 16:16:04');
INSERT INTO `user` VALUES ('10', '无名氏', '15919161009', '2017-01-17 16:16:05');
INSERT INTO `user` VALUES ('11', '凑数据', '15919161010', '2017-01-17 16:16:05');
INSERT INTO `user` VALUES ('12', '够了吗', '15919161011', '2017-01-17 16:16:05');
INSERT INTO `user` VALUES ('13', '够了', '15919161012', '2017-01-17 16:16:05');
