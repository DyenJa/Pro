/*
Navicat MySQL Data Transfer

Source Server         : pro
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : team

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-07-17 16:46:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `qid` int(11) DEFAULT NULL,
  `branch` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `isDeleted` int(10) DEFAULT '0',
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('1', '1', '实训中心', '东软实训中心', '15940471397', '123.43949', '41.70588', '0');
INSERT INTO `address` VALUES ('2', '1', '艺术中心', '多才艺术中心', '15940471393', '123.40297', '41.73612', '0');
INSERT INTO `address` VALUES ('3', '1', '恒大名都', '恒大名都', '15940471397', '123.39534', '41.6866', '0');
INSERT INTO `address` VALUES ('4', '1', '邮政分部', '中国邮政', '23780040', '123.447979', '41.713532', '0');
INSERT INTO `address` VALUES ('5', '1', '东北育才', '沈阳东北育才学校', '1101696666', '123.441979', '41.715908', '0');

-- ----------------------------
-- Table structure for admine
-- ----------------------------
DROP TABLE IF EXISTS `admine`;
CREATE TABLE `admine` (
  `adname` varchar(255) NOT NULL,
  `adpassword` varchar(255) NOT NULL,
  `qid` int(11) DEFAULT NULL,
  `jurisdiction` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admine
-- ----------------------------
INSERT INTO `admine` VALUES ('adminadmin', 'admin', null, '超级管理员', '1');
INSERT INTO `admine` VALUES ('wang', '1997', '1', '管理员', '7');
INSERT INTO `admine` VALUES ('zxh', '2018', '1', '管理员', '8');
INSERT INTO `admine` VALUES ('zmx', '2018', '1', '管理员', '9');
INSERT INTO `admine` VALUES ('ty', '2018', '1', '管理员', '10');
INSERT INTO `admine` VALUES ('cy', '2018', '1', '管理员', '11');

-- ----------------------------
-- Table structure for enterprise
-- ----------------------------
DROP TABLE IF EXISTS `enterprise`;
CREATE TABLE `enterprise` (
  `qid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `videopath` varchar(255) DEFAULT NULL,
  `introduction` varchar(255) DEFAULT NULL,
  `jczs` text,
  PRIMARY KEY (`qid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of enterprise
-- ----------------------------
INSERT INTO `enterprise` VALUES ('1', '东软', 'duck.mp4', '沈阳东软睿道教育服务有限公司（简称东软睿道）由东软创办，基于东软的产业发展与人才培养实践，提供更加符合IT行业发展需求的人才培养体系和方法学，精准提升大学生和大学后的就业、创业技能，为新经济时代的转型发展提供高质量规模化的人才供给。', '<p><img src=\"/webapps/../upload/image/20180715/1531655296167043020.jpg\" title=\"1531655296167043020.jpg\" alt=\"1.jpg\"/><img src=\"/webapps/../upload/image/20180715/1531655306313078740.jpg\" title=\"1531655306313078740.jpg\" alt=\"2.jpg\"/><img src=\"/webapps/../upload/image/20180715/1531655313429027237.jpg\" title=\"1531655313429027237.jpg\" alt=\"3.jpg\"/></p>');

-- ----------------------------
-- Table structure for firstpageofteachers
-- ----------------------------
DROP TABLE IF EXISTS `firstpageofteachers`;
CREATE TABLE `firstpageofteachers` (
  `img` varchar(255) DEFAULT NULL,
  `qid` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of firstpageofteachers
-- ----------------------------
INSERT INTO `firstpageofteachers` VALUES ('firstpage.png', '1', '8');

-- ----------------------------
-- Table structure for freelisten
-- ----------------------------
DROP TABLE IF EXISTS `freelisten`;
CREATE TABLE `freelisten` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `imgurl` varchar(255) DEFAULT NULL,
  `fdesc` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `branchid` int(11) DEFAULT NULL,
  `pubtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of freelisten
-- ----------------------------
INSERT INTO `freelisten` VALUES ('4', 'C++试听一天', '15316574640673D3C5400FF2317BB44874CA333E47CC0beecb3182baec35ad24993073cb077d8.jpg', '<p>comming 哈哈哈！</p>', '进行中', '1', '2018-07-16 09:25:14');
INSERT INTO `freelisten` VALUES ('5', 'python科学计算，来来来啊！', '15316576973743D3C5400FF2317BB44874CA333E47CC080c32c7f093fe7cedf6aaba641362c84.jpg', '<p><img src=\"http://img.baidu.com/hi/jx2/j_0026.gif\"/>common ,baby!</p>', '进行中', '3', '2018-07-15 20:28:46');
INSERT INTO `freelisten` VALUES ('6', 'python网络数据采集之视频解析器', '15316578102483D3C5400FF2317BB44874CA333E47CC0dbf4aecbe7c2907d45cfc2557d47c6ab.jpg', '<p>听起来很厉害</p>', '进行中', '1', '2018-07-16 10:28:40');
INSERT INTO `freelisten` VALUES ('7', '人工智能，新时代！', '15316579137673D3C5400FF2317BB44874CA333E47CC02c20a75f66335349fa21114226fa1e32.jpg', '<p>智能未来！你值得拥有</p>', '进行中', '4', '2018-07-15 20:32:14');
INSERT INTO `freelisten` VALUES ('8', '智能尽在掌握', '15316579818283D3C5400FF2317BB44874CA333E47CC0bca0ae0f3da4d4fce58af4f6675f1109.jpg', '<p>听得懂吗？</p>', '进行中', '1', '2018-07-16 09:22:39');
INSERT INTO `freelisten` VALUES ('9', '智能地球', '15316581325983D3C5400FF2317BB44874CA333E47CC06db8c6f674bf46530304cdb6f883cc73.jpg', '<p>跟我一起改造这个世界！2</p>', '进行中', '1', '2018-07-15 21:58:43');
INSERT INTO `freelisten` VALUES ('11', 'C语言程序设计', '1531658218409FF2BEC0B86AE05957E1A17B9DFCE29D5444BCBEABFD23A44E0D380B5217DC79B.png', '<p>C语言入门教程</p>', '未开始', '4', '2018-07-15 20:37:43');
INSERT INTO `freelisten` VALUES ('12', '人工智能tensorflow', '1531658310269FF2BEC0B86AE05957E1A17B9DFCE29D53CFDD7FEDFF5C97F53DF56428C7602A0.jpg', '<p>人工智能时代必修课</p>', '已结束', '2', '2018-07-15 20:38:59');
INSERT INTO `freelisten` VALUES ('13', 'ajax跨域完全讲解', '15317046336885B13326BA91D08986956E57626C5EF605a7d64da0001032d06000338-240-135.jpg', '<p><img src=\"/webapps/../upload/image/20180716/1531704646072071376.png\" title=\"1531704646072071376.png\" alt=\"image.png\"/></p>', '进行中', '1', '2018-07-16 09:30:47');
INSERT INTO `freelisten` VALUES ('14', '微信授权登录', '15317047005145B13326BA91D08986956E57626C5EF60587c69610001b37b06000338-240-135.jpg', '<p>教你如何使用java实现微信授权登陆，最后介绍公众号和开发平台如何关联<br/></p>', '进行中', '1', '2018-07-16 09:32:35');
INSERT INTO `freelisten` VALUES ('15', '区块链技术核心概念与原理讲解', '15317048166255B13326BA91D08986956E57626C5EF605ae3e5b80001818c06000338-240-135.jpg', '<p><img src=\"/webapps/../upload/image/20180716/1531704824357040299.png\" title=\"1531704824357040299.png\" alt=\"image.png\"/></p>', '未开始', '2', '2018-07-16 09:34:14');

-- ----------------------------
-- Table structure for freelistenbook
-- ----------------------------
DROP TABLE IF EXISTS `freelistenbook`;
CREATE TABLE `freelistenbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fid` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `booktime` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `comment` varchar(3000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of freelistenbook
-- ----------------------------
INSERT INTO `freelistenbook` VALUES ('24', '12', 'chenyu', '13940207621', '2018-07-15 23:35:33', '已处理', '哈哈哈哈');
INSERT INTO `freelistenbook` VALUES ('25', '12', '王超', '158', '2018-07-15 23:39:17', '待处理', '哈哈哈');
INSERT INTO `freelistenbook` VALUES ('26', '12', '周欣昊', '13942453912', '2018-07-15 23:39:27', '已处理', '可以么');
INSERT INTO `freelistenbook` VALUES ('27', '11', '陈宇', '13940207621', '2018-07-16 00:09:07', '待处理', '马上来');
INSERT INTO `freelistenbook` VALUES ('28', '12', '田野', '1837922', '2018-07-16 00:49:57', '待处理', '我要预约');
INSERT INTO `freelistenbook` VALUES ('29', '9', '田野', '80993', '2018-07-16 00:53:55', '已处理', '我要预约！');
INSERT INTO `freelistenbook` VALUES ('30', '5', '陈宇', '13940207621', '2018-07-16 09:17:42', '已处理', '图太大了');
INSERT INTO `freelistenbook` VALUES ('31', '7', 'chenyu', '13940207621', '2018-07-16 09:24:14', '待处理', '人工');
INSERT INTO `freelistenbook` VALUES ('32', '4', '陈宇', '13940207621', '2018-07-16 09:24:56', '待处理', 'C++要好好学');
INSERT INTO `freelistenbook` VALUES ('33', '15', '周慕贤', '15840147983', '2018-07-16 09:50:20', '待处理', '周六下午有空');
INSERT INTO `freelistenbook` VALUES ('34', '15', '周欣昊', '13942453912', '2018-07-16 10:26:57', '待处理', '预约区块链课程');

-- ----------------------------
-- Table structure for lesson
-- ----------------------------
DROP TABLE IF EXISTS `lesson`;
CREATE TABLE `lesson` (
  `lid` int(11) NOT NULL AUTO_INCREMENT,
  `lname` varchar(255) DEFAULT NULL,
  `imgurl` varchar(255) DEFAULT NULL,
  `lprice` double DEFAULT NULL,
  `ldesc` text,
  `category` varchar(255) DEFAULT NULL,
  `qid` int(11) DEFAULT NULL,
  `pubtime` datetime DEFAULT NULL,
  PRIMARY KEY (`lid`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lesson
-- ----------------------------
INSERT INTO `lesson` VALUES ('11', '神经网络简介', '15316556713540A09CDAB1B81DE6A059AF865A5195A735a40c6370001d13c06000338-240-135.jpg', '99', '<p style=\"margin-bottom: 20px;\"><span style=\"color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\"></span></span>简介：通过逻辑回归模型的介绍，讲解激励函数，损失函数，梯度下降等概念，通过一个富有代表性的神经网络模型，结合机器学习基本概念讲解了神经网络的学习训练过程，深入直观的剖析了神经网络中反向传播等核心算法，帮助大家举一反三，深入理解。</p><p><span style=\"color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\"></span></p><h3 style=\"margin: 0px; padding: 0px; font-size: 16px; line-height: 24px;\">第1章 章节介绍</h3><p style=\"margin-top: 10px;\">课程适合人群，介绍产生背景，前置知识，具体安排等</p><ul class=\"video list-paddingleft-2\" style=\"list-style-type: none;\"><li><p><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;1-1 01课程背景</p></li><li><p><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;1-2 02什么是神经网络</p></li><li><p><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;1-3 03课程安排</p></li></ul><h3 style=\"margin: 15px 0px 0px; padding: 0px; font-size: 16px; line-height: 24px;\">第2章 神经网络基本概念与原理</h3><p style=\"margin-top: 10px;\">学习神经网络基本概念，在基本概念的基础上掌握神经网络基本原理</p><ul class=\"video list-paddingleft-2\" style=\"list-style-type: none;\"><li><p><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;2-1 04网络结构&nbsp;</p></li><li><p><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;2-2 05逻辑回归</p></li><li><p><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;2-3 06激励函数&nbsp;</p></li><li><p><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;2-4 07损失函数&nbsp;</p></li><li><p><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;2-5 08梯度下降</p></li><li><p><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;2-6 09网络向量化&nbsp;</p></li><li><p><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;2-7 10网络梯度下降&nbsp;</p></li><li><p><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;2-8 11训练过程</p></li></ul><h3 style=\"margin: 15px 0px 0px; padding: 0px; font-size: 16px; line-height: 24px;\">第3章 课程总结</h3><p style=\"margin-top: 10px;\">进行课程总结回顾</p><ul class=\"video list-paddingleft-2\" style=\"list-style-type: none;\"><li><p><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;3-1 12课程总结</p></li></ul><p><span style=\"color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\"><br/></span><br/></p>', 'Python', '1', '2018-07-15 21:41:29');
INSERT INTO `lesson` VALUES ('14', 'JAVA研发工程师制造', '15316588526000A09CDAB1B81DE6A059AF865A5195A73java.jpg', '3000', '<p style=\"margin-top: 15px;\"><span style=\"color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">简介：在本课程中，带领小伙伴们进一步探索 Java 的奥秘，希望通过本次课程的学习，能够帮助小伙伴们快速掌握关于Java中的异常处理、集合框架、字符串的操作和常用类的使用。不容错过的精彩，快来加入吧！！</span></p><p style=\"margin-top: 15px;\"><span style=\"color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\"><br/></span></p><p style=\"margin-top: 15px;\"><span style=\"color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\"></span></p><h3 style=\"margin: 15px 0px 0px; padding: 0px; font-size: 16px; line-height: 24px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; white-space: normal;\">第1章 异常与异常处理</h3><p style=\"margin-top: 15px;\">本章主要讲解，什么是异常、Java 中的异常体系结构、如何处理异常、如何自定义异常以及异常链的相关知识</p><h3 style=\"margin: 15px 0px 0px; padding: 0px; font-size: 16px; line-height: 24px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; white-space: normal;\">第2章 认识 Java 中的字符串</h3><p style=\"margin-top: 15px;\">本章节主要讲解 Java 中的字符串，字符串被广泛地用在 Java 程序设计中，很多操作都要使用字符串来完成，例如系统中存储的用户名、密码、电子邮箱等都要使用字符串来存储。学完这一章后能够掌握字符串的处理， String 类和 StringBuilder 类常用方法的应用等</p><h3 style=\"margin: 15px 0px 0px; padding: 0px; font-size: 16px; line-height: 24px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; white-space: normal;\">第3章 Java 中必须了解的常用类</h3><p style=\"margin-top: 15px;\">本章节主要讲解 Java 中常用的类，包括基本类型的包装类、Date 类、SimpleDateFormat 类、 Calendar 类、 Math 类。学完这一章后将对基本数据类型有更深入的理解，能够进行基本类型和包装类之间的转换，掌握常用类的使用等</p><p><br/></p>', 'JAVA', '1', '2018-07-15 21:48:40');
INSERT INTO `lesson` VALUES ('15', 'HBase存储原理剖析', '15316586163230A09CDAB1B81DE6A059AF865A5195A73hbase.jpg', '199', '<p style=\"text-align: left;\"><br/></p><h3 style=\"margin: 0px; padding: 0px; font-size: 16px; line-height: 24px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; white-space: normal;\">第1章 课程介绍</h3><p>简单介绍本课程会给大家介绍哪些内容，包含哪些核心知识点</p><p><br/></p><p style=\"text-align: left;\"><span style=\"color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\"></span></p><h3 style=\"margin: 0px; padding: 0px; font-size: 16px; line-height: 24px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; white-space: normal;\">第2章 HBase 的存储模式</h3><p>对比行式存储与列式存储的优缺点，介绍 HBase 的存储模式，以实例的形式展示 HBase 是怎样存储数据的</p><ul class=\"video list-paddingleft-2\" style=\"list-style-type: none;\"><li><p><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;2-1 存储模式-行式存储与列式存储介绍&nbsp;</p></li><li><p><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;2-2 存储模式-HBase的列族式存储&nbsp;</p></li><li><p><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;2-3 存储模式-HBase存储示例&nbsp;</p></li></ul><p><br/></p><h3 style=\"margin: 0px; padding: 0px; font-size: 16px; line-height: 24px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; white-space: normal;\">第3章 HBase 数据表解析</h3><p>以实际案例分析 HBase 数据表的存储情况，包括了对建表语句的详细分析、存储目录的解析以及 HBase 为数据表生成的元数据表解析</p><ul class=\"video list-paddingleft-2\" style=\"list-style-type: none;\"><li><p><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;3-1 HBase数据表解析-HBase建表语句解析&nbsp;</p></li><li><p><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;3-2 HBase数据表解析-HBase数据存储目录解析&nbsp;</p></li></ul><p><br/></p>', 'JAVA', '1', '2018-07-15 20:43:38');
INSERT INTO `lesson` VALUES ('16', '管理学2.0', '1531656172001FF2BEC0B86AE05957E1A17B9DFCE29D5TIM截图20180715193126.jpg', '333', '<p>这门课会教你怎么买菜</p>', 'Python', '1', '2018-07-15 20:03:31');
INSERT INTO `lesson` VALUES ('17', 'JAVA技能特训', '15316561964983D3C5400FF2317BB44874CA333E47CC083a10c964fb510a9e71ed47567901ad1.jpg', '5000', '<p><br/></p><p>简介：本课程是程序猿质变课程，理解面向对象的思想，掌握面向对象的基本原则以及 Java 面向对象编程基本实现原理，熟练使用封装、继承、多态面向对象三大特性，带你进一步探索 Java 世界的奥秘！</p><h3 style=\"margin: 0px; padding: 0px; font-size: 16px; line-height: 24px;\">第1章 类和对象</h3><p>本章内容主要讲解 Java 在面向对象编程中的基本语法，面向对象设计程序的思路</p><h3 style=\"margin: 0px; padding: 0px; font-size: 16px; line-height: 24px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; white-space: normal;\">第2章 封装</h3><p>封装的意思是说对象数据和操作该数据的指令都是对象自身的一部分，封装能够实现尽可能对外部世界隐藏数据</p><h3 style=\"margin: 0px; padding: 0px; font-size: 16px; line-height: 24px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; white-space: normal;\">第3章 继承</h3><p>继承是面向对象程序设计能够提高软件开发效率的重要原因之一</p><h3 style=\"margin: 0px; padding: 0px; font-size: 16px; line-height: 24px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; white-space: normal;\">第4章 多态</h3><p>多态性是允许你将父对象设置成为和一个或更多的他的子对象相等的技术，赋值之后，父对象就可以根据当前赋值给它的子对象的特性以不同的方式运作</p><h3 style=\"margin: 0px; padding: 0px; font-size: 16px; line-height: 24px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; white-space: normal;\">第5章 阶段练习</h3><p>通过人类继承关系的案例进一步学习Java中的面向对象</p><p><br/></p>', 'JAVA', '1', '2018-07-15 22:05:24');
INSERT INTO `lesson` VALUES ('18', 'C++专业红色特训计划', '15316563748743D3C5400FF2317BB44874CA333E47CC01663c93e5e0e627a364b48bb0987df22.jpg', '16000', '<p><span style=\"background-color: rgb(255, 255, 255); color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px;\">简介：本教程是C++的初级教程，是在C语言基础上的一个延伸，讲述了包括新增数据类型、命名空间等内容，最后通过一个通俗易懂的例子将所述知识点融会贯通，以达到知识灵活运用，最终得以升华的目的。</span></p><h3 style=\"margin: 15px 0px 0px; padding: 0px; font-size: 16px; line-height: 24px;\">第1章 C++简介</h3><ul class=\"video list-paddingleft-2\" style=\"list-style-type: none;\"></ul><h3 style=\"margin: 15px 0px 0px; padding: 0px; font-size: 16px; line-height: 24px;\">第2章 C++ IDE环境搭建<br/></h3><ul class=\"video list-paddingleft-2\" style=\"list-style-type: none;\"></ul><h3 style=\"margin: 15px 0px 0px; padding: 0px; font-size: 16px; line-height: 24px;\">第3章 C++之初体验<br/></h3><ul class=\"video list-paddingleft-2\" style=\"list-style-type: none;\"></ul><h3 style=\"margin: 15px 0px 0px; padding: 0px; font-size: 16px; line-height: 24px;\">第4章 C++语言新特性<br/></h3><ul class=\"video list-paddingleft-2\" style=\"list-style-type: none;\"></ul><h3 style=\"margin: 15px 0px 0px; padding: 0px; font-size: 16px; line-height: 24px;\">第5章 综合练习</h3><ul class=\"video list-paddingleft-2\" style=\"list-style-type: none;\"></ul><p><br/></p>', 'C++', '1', '2018-07-15 21:46:30');
INSERT INTO `lesson` VALUES ('21', 'JAVA新手特训', '15316566277083D3C5400FF2317BB44874CA333E47CC0a6fc19c83e26b9abf0c542a479ecf2f1.jpg', '9000', '<p><strong><img src=\"http://img.baidu.com/hi/jx2/j_0076.gif\"/></strong>新人专享用<br/></p><p><br/></p><p><span style=\"color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">简介：本教程为Java入门第一季，欢迎来到精彩的Java编程世界！Java语言已经成为当前软件开发行业中主流的开发语言。本教程将介绍Java环境搭建、工具使用、基础语法。带领大家一步一步的踏入Java达人殿堂！Let’s go!</span></p><p><br/></p><h3 style=\"margin: 15px 0px 0px; padding: 0px; font-size: 16px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; white-space: normal; line-height: normal;\">第1章 Java初体验</h3><p style=\"margin-top: 15px; line-height: normal;\">本章节主要讲解 Java 目前的应用、如何搭建 Java 开发环境、以及如何使用工具进行 Java 程序的开发，为以后的学习打下基础</p><h3 style=\"margin: 15px 0px 0px; padding: 0px; font-size: 16px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; white-space: normal; line-height: normal;\">第2章 变量和常量</h3><p style=\"margin-top: 15px; line-height: normal;\">本章节主要讲解如何在 Java 程序中应用变量和常量进行数据操作、数据类型分类及基本数据类型间的类型转换，帮助你对 Java 语言建立初步认识</p><h3 style=\"margin: 15px 0px 0px; padding: 0px; font-size: 16px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; white-space: normal; line-height: normal;\">第3章 常用的运算符</h3><p style=\"margin-top: 15px; line-height: normal;\">Java 提供了一套丰富的运算符来操纵变量。学完这一章节后您将会理解并能够灵活的使用各种运算符</p><h3 style=\"margin: 15px 0px 0px; padding: 0px; font-size: 16px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; white-space: normal; line-height: normal;\">第4章 流程控制语句</h3><p style=\"margin-top: 15px; line-height: normal;\">本章节主要讲解 Java 中的流程控制语句，包括选择结构、循环结构、跳转语句等。学完这一章后将对程序执行流程有更深的理解，会使用流程控制语句控制程序代码执行的过程</p><h3 style=\"margin: 15px 0px 0px; padding: 0px; font-size: 16px; color: rgb(28, 31, 33); font-family: &quot;PingFang SC&quot;, 微软雅黑, &quot;Microsoft YaHei&quot;, Helvetica, &quot;Helvetica Neue&quot;, Tahoma, Arial, sans-serif; white-space: normal; line-height: normal;\">第5章 阶段练习</h3><p style=\"margin-top: 15px; line-height: normal;\">本章节主要针对前面所学内容进行练习</p><p style=\"margin-top: 15px; line-height: normal;\">......</p>', 'JAVA', '1', '2018-07-15 21:49:15');
INSERT INTO `lesson` VALUES ('22', 'python文件处理专项特训', '15316567003643D3C5400FF2317BB44874CA333E47CC0d1794231be528976018aa0ff88c7824e.jpg', '7000', '<p><img src=\"http://img.baidu.com/hi/jx2/j_0022.gif\"/></p>', 'Python', '1', '2018-07-15 20:12:21');
INSERT INTO `lesson` VALUES ('23', 'Java设计模式之单例模式', '1531656736300A80B86889A6F12707C3CEBDB4B01B6B91.jpg', '1600', '<p>设计模式与单例模式</p><p><img src=\"/webapps/../upload/image/20180715/1531656778572008582.jpg\" title=\"1531656778572008582.jpg\" alt=\"1.jpg\"/></p><p>emmmm你值得拥有</p>', 'JAVA', '1', '2018-07-15 20:13:16');
INSERT INTO `lesson` VALUES ('24', 'python正则表达式专项训练', '15316567874193D3C5400FF2317BB44874CA333E47CC066a3e8c3ee84aa4f06da55f20e7deadf.jpg', '500', '<p>简介：学习一门语言，首先要把环境准备好，本课程主要讲解在不同系统（Window、Linux）中搭建Python开发环境，及Eclipse配置和 Python 文件类型，让您快速了解和应用Python开发环境及工具，为后续Python学习打好基础。</p><h3 style=\"margin: 0px; padding: 0px; font-size: 16px; line-height: 24px;\">第1章 Window Python安装</h3><p>本章主要讲解 Window 操作系统下，如何安装 Python 和使用。</p><ul class=\"video list-paddingleft-2\" style=\"list-style-type: none;\"><li><p><a href=\"https://www.imooc.com/video/7724\" class=\"J-media-item\" style=\"outline: 0px; text-decoration-line: none; color: rgb(28, 31, 33); display: block; overflow: hidden; word-break: break-all;\"><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;1-1 window下安装python (04:56)</a></p></li></ul><h3 style=\"margin: 0px; padding: 0px; font-size: 16px; line-height: 24px;\">第2章 Linux下Python使用</h3><p>本章主要讲解 linux 操作系统下，Python工具安装和运行。</p><ul class=\"video list-paddingleft-2\" style=\"list-style-type: none;\"><li><p><a href=\"https://www.imooc.com/video/7725\" class=\"J-media-item\" style=\"outline: 0px; text-decoration-line: none; color: rgb(28, 31, 33); display: block; overflow: hidden; word-break: break-all;\"><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;2-1 Liunx下Python使用 (03:36)</a></p></li></ul><h3 style=\"margin: 0px; padding: 0px; font-size: 16px; line-height: 24px;\">第3章 Python文件类型</h3><p>本章主要讲解 Python文件运行、文件类型和源码执行过程分析</p><ul class=\"video list-paddingleft-2\" style=\"list-style-type: none;\"><li><p><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;3-1 python文件类型 (02:46)</p></li></ul><h3 style=\"margin: 0px; padding: 0px; font-size: 16px; line-height: 24px;\">第4章 Eclipse Python配置</h3><p>本章主要讲解，在Eclipse开发工具下，如何配置Python开发环境。</p><ul class=\"video list-paddingleft-2\" style=\"list-style-type: none;\"><li><p><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;4-1 Eclipse Python配置 (03:48)</p></li></ul><p><br/></p>', 'Python', '1', '2018-07-15 22:04:49');
INSERT INTO `lesson` VALUES ('26', 'Java', '1531656810235A80B86889A6F12707C3CEBDB4B01B6B92.jpg', '5000', '<p>简介：反射是Java开发中一个非常重要的概念，掌握了反射的知识，才能更好的学习Java高级课程，因此必须要学习——你懂的！本门课程主要介绍Class类的使用，方法和成员变量的反射，以及通过反射了解集合泛型的本质等知识。</p><h3 style=\"margin: 0px; padding: 0px; font-size: 16px; line-height: 24px;\">第1章 Class类的使用</h3><p>本章介绍Class类的作用以及如何使用。</p><ul class=\"video list-paddingleft-2\" style=\"list-style-type: none;\"><li><p><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;1-1 Class类的使用&nbsp;</p></li></ul><h3 style=\"margin: 0px; padding: 0px; font-size: 16px; line-height: 24px;\">第2章 动态加载类</h3><p>本章主要介绍动态加载类的含义和使用。</p><ul class=\"video list-paddingleft-2\" style=\"list-style-type: none;\"><li><p><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;2-1 Java 动态加载类&nbsp;</p></li></ul><p><br/></p>', 'JAVA', '1', '2018-07-15 22:00:54');
INSERT INTO `lesson` VALUES ('27', 'python入门', '1531656849424FF2BEC0B86AE05957E1A17B9DFCE29D5c3992090-efd5-48f9-9fb6-ff9772f084f9.png', '31', '<p>简介：Python教程基础分《Python入门》和《Python进阶》两门课程，本视频教程是Python第一门课程，是Python开发的入门教程，将介绍Python语言的特点和适用范围，Python基本的数据类型，条件判断和循环，函数，以及Python特有的切片和列表生成式。希望本python教程能够让您快速入门并编写简单的Python程序。</p><h3 style=\"margin: 0px; padding: 0px; font-size: 16px; line-height: 24px;\">第1章 课程介绍</h3><p>介绍Python的诞生，Python有什么独特的特点，它适合用在哪些地方，不适合用在哪些地方，以及Python在现实世界中的应用。</p><ul class=\"video list-paddingleft-2\" style=\"list-style-type: none;\"><li><p><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;1-1 Python入门课程介绍 (04:16)</p></li></ul><h3 style=\"margin: 0px; padding: 0px; font-size: 16px; line-height: 24px;\">第2章 安装Python</h3><p>讲解如何从零开始下载、安装并设置Python开发环境，如何启动和关闭Python解释器，并编写第一个Python程序</p><ul class=\"video list-paddingleft-2\" style=\"list-style-type: none;\"><li><p><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;2-1 选择Python版本 (00:51)</p></li><li><p><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;2-2 Windows上安装Python (02:22)</p></li><li><p><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;2-3 第一个Python程序 (02:33)</p></li></ul><p><br/></p>', 'C++', '1', '2018-07-15 21:57:30');
INSERT INTO `lesson` VALUES ('28', 'HTML前端与数据交互', '15316568411723D3C5400FF2317BB44874CA333E47CC066c51a121f666fad2365815c4cc8f2b4.jpg', '6000', '<p><br/></p><p>简介：本课程从最基本的概念开始讲起，步步深入，带领大家学习HTML、CSS样式基础知识，了解各种常用标签的意义以及基本用法，后半部分教程主要讲解CSS样式代码添加，为后面的案例课程打下基础。</p><h3 style=\"margin: 0px; padding: 0px; font-size: 16px; line-height: 24px;\">第1章 Html介绍</h3><p>本章节主要讲解html和css样式的关系，以及html标签、html文件结构、head标签,最后讲解了在html中的注释代码的作用。</p><ul class=\"video list-paddingleft-2\" style=\"list-style-type: none;\"><li><p><span class=\"imv2-code_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;1-1 代码初体验，制作我的第一个网页</p></li><li><p><span class=\"imv2-code_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;1-2 Html和CSS的关系</p></li><li><p><span class=\"imv2-code_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;1-3 认识html标签</p></li><li><p><span class=\"imv2-code_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;1-4 标签的语法</p></li><li><p><span class=\"imv2-code_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;1-5 认识html文件基本结构</p></li><li><p><span class=\"imv2-code_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;1-6 认识head标签</p></li><li><p><span class=\"imv2-code_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;1-7 了解HTML的代码注释</p></li></ul><h3 style=\"margin: 0px; padding: 0px; font-size: 16px; line-height: 24px;\">第2章 认识标签(第一部分)</h3><p>学完这一章节将对标签的使用有了一些初步的认识，可以使用标签制作出一篇简单的文章网页。下一章节我们将进一步学习另外一部分html标签。</p><ul class=\"video list-paddingleft-2\" style=\"list-style-type: none;\"><li><p><span class=\"imv2-code_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;2-1 语义化，让你的网页更好的被搜索引擎理解</p></li><li><p><span class=\"imv2-code_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;2-2 &lt;body&gt;标签，网页上显示的内容放在这里</p></li><li><p><span class=\"imv2-code_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;2-3 开始学习&lt;p&gt;标签，添加段落</p></li><li><p><span class=\"imv2-code_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;2-4 了解&lt;hx&gt;标签，为你的网页添加标题</p></li><li><p><span class=\"imv2-code_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;2-5 加入强调语气，使用&lt;strong&gt;和&lt;em&gt;标签</p></li><li><p><span class=\"imv2-code_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;2-6 使用&lt;span&gt;标签为文字设置单独样式</p></li><li><p><span class=\"imv2-code_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;</p></li></ul><p><br/></p><p>。。。。</p>', 'JAVA', '1', '2018-07-15 22:02:13');
INSERT INTO `lesson` VALUES ('30', '大数据分析', '15316592045480A09CDAB1B81DE6A059AF865A5195A73timg (1).jpg', '12', '<p>简介：本次大数据专场带你了解基于 AWS 的大数据存储、实时计算与分析, 以及机器学习的相关技术，实现业务洞察，用数据驱动业务和技术创新，提高企业的竞争力，并实现数据的变现。</p><h3 style=\"margin: 20px 0px 0px; padding: 0px; font-size: 16px; line-height: 24px;\">第1章 基于AWS的移动应用大数据分析</h3><p style=\"margin-top: 10px;\">&nbsp; Camera360在移动应用的大数据分析和机器学习的应用,包括Camera360在大规模物理机房上云, 基于AWS的大规模数据ETL, 存储, 准实时计算与分析, 以及机器学习的相关经验.</p><ul class=\"video list-paddingleft-2\" style=\"list-style-type: none;\"><li><p><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;1-1 基于AWS的移动应用大数据分析&nbsp;</p></li></ul><h3 style=\"margin: 15px 0px 0px; padding: 0px; font-size: 16px; line-height: 24px;\">第2章 数据驱动企业商业价值增长</h3><p style=\"margin-top: 10px;\">&nbsp;&nbsp;数据分析的核心是为业务服务，如何去整合线上线下的业务数据和用户行为数据，去挖掘出它背后的商业价值？首先要找到数据源的共性，以用户为中心，将跨用户的数据打通。诸葛io将数据采集、数据清洗、数据加工、数据加载、建模分析及可视化的全过程一站式的交付。结合用户和事件的交叉分析，能够把企业全年的数据动态化起来，让业务更懂数据，让数据体现价值。</p><ul class=\"video list-paddingleft-2\" style=\"list-style-type: none;\"><li><p><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;2-1 数据驱动企业商业价值增长&nbsp;</p></li></ul><h3 style=\"margin: 15px 0px 0px; padding: 0px; font-size: 16px; line-height: 24px;\">第3章 基于AWS云服务构建超快速和低成本的基因大数据分析系统</h3><p style=\"margin-top: 10px;\">&nbsp;&nbsp;随着基因测序技术在临床和健康领域里的应用越来越广泛深入，世界迎来了基因的大数据时代。与其他大数据不同，基因大数据分析往往即是计算密集型又是IO密集型。人和未来（Genetalks）利用BT+IT的交叉背景优势，创造性的运用AWS云服务，结合独到的流程和算法优化，克服I/O墙，构建了超快速和低成本的基因大数据分析系统GT-WG；用创纪录的18分钟和$16实现了在单台高端服务器上要跑36小时的55x人全基因组（400G）数据分析，为业界展示了利用云资源做高性能基因大数据计算的巨大潜力。</p><ul class=\"video list-paddingleft-2\" style=\"list-style-type: none;\"><li><p><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;3-1 基于AWS云服务构建超快速和低成本的基因大数据分析系统</p></li></ul><p><br/></p>', 'HTML5', '1', '2018-07-15 21:36:26');
INSERT INTO `lesson` VALUES ('31', 'Python操作三大主流数据库', '15316605094533D3C5400FF2317BB44874CA333E47CC059eeb2040001752d05400300-360-202.jpg', '500', '<p><img src=\"/webapps/../upload/image/20180715/1531660591316009779.png\" title=\"1531660591316009779.png\" alt=\"image.png\"/></p>', 'Python', '1', '2018-07-15 21:16:33');
INSERT INTO `lesson` VALUES ('32', 'Python', '15316609173633D3C5400FF2317BB44874CA333E47CC05ab84f650001f0b005400300-360-202.jpg', '500', '<p><img src=\"/webapps/../upload/image/20180715/1531660945241025433.png\" title=\"1531660945241025433.png\" alt=\"image.png\"/></p>', 'Python', '1', '2018-07-15 21:55:23');
INSERT INTO `lesson` VALUES ('33', 'Python移动自动化测试面试', '15316609702093D3C5400FF2317BB44874CA333E47CC05a794b0700011e4b05400300-360-202.jpg', '600', '<p><img src=\"/webapps/../upload/image/20180715/1531660994651078637.png\" title=\"1531660994651078637.png\" alt=\"image.png\"/></p>', 'Python', '1', '2018-07-15 21:23:16');
INSERT INTO `lesson` VALUES ('34', 'Python3实用编程技巧进阶', '15316610382223D3C5400FF2317BB44874CA333E47CC05aec33fd0001c86805400300-360-202.jpg', '300', '<p><img src=\"/webapps/../upload/image/20180715/1531661063379059071.png\" title=\"1531661063379059071.png\" alt=\"image.png\"/></p>', 'Python', '1', '2018-07-15 21:24:25');
INSERT INTO `lesson` VALUES ('35', 'Python高级编程和异步IO并发编程', '15316610965183D3C5400FF2317BB44874CA333E47CC05abcabea00014f6b10800600-360-202.jpg', '800', '<p><img src=\"/webapps/../upload/image/20180715/1531661117073016995.png\" title=\"1531661117073016995.png\" alt=\"image.png\"/></p>', 'Python', '1', '2018-07-15 21:25:18');
INSERT INTO `lesson` VALUES ('36', '基于Python玩转人工智能最火框架', '15316611624483D3C5400FF2317BB44874CA333E47CC05a5ddeda000145b405400300-360-202.jpg', '650', '<p><img src=\"/webapps/../upload/image/20180715/1531661186689026198.png\" title=\"1531661186689026198.png\" alt=\"image.png\"/></p>', 'Python', '1', '2018-07-15 21:26:40');
INSERT INTO `lesson` VALUES ('37', 'Python开发环境搭建', '15316612644443D3C5400FF2317BB44874CA333E47CC05705b57b0001f4b306000338-240-135.jpg', '750', '<p style=\"margin-top: 15px;\">简介：学习一门语言，首先要把环境准备好，本课程主要讲解在不同系统（Window、Linux）中搭建Python开发环境，及Eclipse配置和 Python 文件类型，让您快速了解和应用Python开发环境及工具，为后续Python学习打好基础。</p><h3 style=\"margin: 15px 0px 0px; padding: 0px; font-size: 16px; line-height: 24px;\">第1章 Window Python安装</h3><p style=\"margin-top: 15px;\">本章主要讲解 Window 操作系统下，如何安装 Python 和使用。</p><ul class=\"video list-paddingleft-2\" style=\"list-style-type: none;\"><li><p style=\"margin-top: 15px;\"><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;1-1 window下安装python&nbsp;</p></li></ul><h3 style=\"margin: 15px 0px 0px; padding: 0px; font-size: 16px; line-height: 24px;\">第2章 Linux下Python使用</h3><p style=\"margin-top: 15px;\">本章主要讲解 linux 操作系统下，Python工具安装和运行。</p><ul class=\"video list-paddingleft-2\" style=\"list-style-type: none;\"><li><p style=\"margin-top: 15px;\"><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;2-1 Liunx下Python使用&nbsp;</p></li></ul><h3 style=\"margin: 15px 0px 0px; padding: 0px; font-size: 16px; line-height: 24px;\">第3章 Python文件类型</h3><p style=\"margin-top: 15px;\">本章主要讲解 Python文件运行、文件类型和源码执行过程分析</p><ul class=\"video list-paddingleft-2\" style=\"list-style-type: none;\"><li><p style=\"margin-top: 15px;\"><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;3-1 python文件类型&nbsp;</p></li></ul><h3 style=\"margin: 15px 0px 0px; padding: 0px; font-size: 16px; line-height: 24px;\">第4章 Eclipse Python配置</h3><p style=\"margin-top: 15px;\">本章主要讲解，在Eclipse开发工具下，如何配置Python开发环境。</p><ul class=\"video list-paddingleft-2\" style=\"list-style-type: none;\"><li><p style=\"margin-top: 15px;\"><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;4-1 Eclipse Python配置&nbsp;</p></li></ul><p><br/></p>', 'Python', '1', '2018-07-15 21:55:04');
INSERT INTO `lesson` VALUES ('38', '入门微信小程序开发', '15316614085593D3C5400FF2317BB44874CA333E47CC05ac3418d0001a9b806000338-240-135.jpg', '500', '<p style=\"margin-top: 15px;\">简介：讲解微信小程序的基本知识，如何注册，并开发一个自己的小程序，以及小程序开发过程中部分常见的问题。</p><h3 style=\"margin: 15px 0px 0px; padding: 0px; font-size: 16px; line-height: 24px;\">第1章 微信小程序基础</h3><p style=\"margin-top: 15px;\">本章节什么是微信小程序，小程序有哪些宣传方式，小程序官方文档介绍，小程序开发流程，如何注册小程序，新建小程序项目，小程序开发工具讲解，小程序代码结构讲解，代码编写-tabbar的配置。</p><ul class=\"video list-paddingleft-2\" style=\"list-style-type: none;\"><li><p style=\"margin-top: 15px;\"><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;1-1 什么是微信小程序&nbsp;</p></li><li><p style=\"margin-top: 15px;\"><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;1-2 小程序有哪些宣传方式</p></li><li><p style=\"margin-top: 15px;\"><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;1-3 小程序官方文档介绍&nbsp;</p></li><li><p style=\"margin-top: 15px;\"><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;1-5 小程序开发流程&nbsp;</p></li><li><p style=\"margin-top: 15px;\"><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;1-6 如何注册小程序&nbsp;</p></li><li><p style=\"margin-top: 15px;\"><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;1-7 新建小程序项目&nbsp;</p></li><li><p style=\"margin-top: 15px;\"><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;1-8 微信开发者工具的使用 (</p></li><li><p style=\"margin-top: 15px;\"><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;1-9 代码结构讲解</p></li><li><p style=\"margin-top: 15px;\"><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;1-10 代码编写-Tabbar配置 (</p></li></ul><h3 style=\"margin: 15px 0px 0px; padding: 0px; font-size: 16px; line-height: 24px;\">第2章 代码编写-小案例实操</h3><p><br/></p>', 'HTML5', '1', '2018-07-15 21:54:27');
INSERT INTO `lesson` VALUES ('39', 'css定位', '15316615075613D3C5400FF2317BB44874CA333E47CC05a43337e0001160006000338-240-135.jpg', '80', '<p style=\"margin-top: 15px;\">简介：本课程，将带领大家了解一下定位的知识，教大家如何通过定位来进行布局。</p><h3 style=\"margin: 15px 0px 0px; padding: 0px; font-size: 16px; line-height: 24px;\">第1章 课程介绍</h3><p style=\"margin-top: 15px;\">本章节主要跟大家介绍一下position在网页制作中的作用，以及我们的课程安排。</p><ul class=\"video list-paddingleft-2\" style=\"list-style-type: none;\"><li><p style=\"margin-top: 15px;\"><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;1-1 课程简介 (00:53)</p></li></ul><h3 style=\"margin: 15px 0px 0px; padding: 0px; font-size: 16px; line-height: 24px;\">第2章 position属性值详解</h3><p style=\"margin-top: 15px;\">本章节主要带领大家学习position的几个属性，以及每个属性的作用，并通过经典案例来实现。</p><ul class=\"video list-paddingleft-2\" style=\"list-style-type: none;\"><li><p style=\"margin-top: 15px;\"><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;2-1 文档流 (03:40)</p></li><li><p style=\"margin-top: 15px;\"><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;2-2 position-relative (07:16)</p></li><li><p style=\"margin-top: 15px;\"><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;2-3 position-absolute (10:35)</p></li><li><p style=\"margin-top: 15px;\"><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;2-4 position-fiexed (04:03)</p></li><li><p style=\"margin-top: 15px;\"><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;2-5 position-inherit (03:48)</p></li></ul><h3 style=\"margin: 15px 0px 0px; padding: 0px; font-size: 16px; line-height: 24px;\">第3章 z-index 详解</h3><h3 style=\"margin: 15px 0px 0px; padding: 0px; font-size: 16px; line-height: 24px;\">第4章 position实际应用</h3><p><br/></p>', 'HTML5', '1', '2018-07-15 21:52:42');
INSERT INTO `lesson` VALUES ('40', 'CSS深入理解之border', '15316615912953D3C5400FF2317BB44874CA333E47CC05829792f00012c1f06000338-240-135.jpg', '50', '<p>简介：本课程将深入讲解CSS中的border属性，深入介绍border-color之间的关系，以及border与background定位、border与透明边框，并教你如果使用border进行图形构建，以及如何借助border使用有限标签完成我们的布局。</p><h3 style=\"margin: 0px; padding: 0px; font-size: 16px; line-height: 24px;\">第1章 border-width不支持百分比</h3><p>本章中，张鑫旭老师将带领大家了解前端CSS中border-width属性。</p><ul class=\"video list-paddingleft-2\" style=\"list-style-type: none;\"><li><p><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;1-1 1. border-width为何不支持百分比值 (04:00)</p></li></ul><h3 style=\"margin: 0px; padding: 0px; font-size: 16px; line-height: 24px;\">第2章 深入了解各种border-style类型</h3><p>本章中，张鑫旭老师将为大家讲解一些前端CSS中不常用border-style属性值露脸。</p><ul class=\"video list-paddingleft-2\" style=\"list-style-type: none;\"><li><p><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;2-1 2. 了解各种border-style类型 (09:12)</p></li></ul><h3 style=\"margin: 0px; padding: 0px; font-size: 16px; line-height: 24px;\">第3章 border与color</h3><p>张鑫旭老师将在本章带领大家深入了解前端CSS中border-color之间的关系。</p><ul class=\"video list-paddingleft-2\" style=\"list-style-type: none;\"><li><p><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;3-1 3. border-color与color (04:23)</p></li></ul><h3 style=\"margin: 0px; padding: 0px; font-size: 16px; line-height: 24px;\">第4章 border与background定位</h3><p>张鑫旭老师将详细为大家讲解前端CSS中border属性在某些背景定位需求下的妙用。</p><ul class=\"video list-paddingleft-2\" style=\"list-style-type: none;\"><li><p><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;4-1 4. border与background定位 (03:18)</p></li></ul><h3 style=\"margin: 0px; padding: 0px; font-size: 16px; line-height: 24px;\">第5章 border与三角等图形构建</h3><p>张鑫旭老师将为大家介绍为什么前端CSS中border为CSS2.1时代最强图形构建利器。</p><ul class=\"video list-paddingleft-2\" style=\"list-style-type: none;\"><li><p><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;5-1 5. border与三角等图形构建 (07:39)</p></li></ul><h3 style=\"margin: 0px; padding: 0px; font-size: 16px; line-height: 24px;\">第6章 border与透明边框</h3><p>本章中，张鑫旭老师主要介绍前端CSS中透明边框的作用。</p><ul class=\"video list-paddingleft-2\" style=\"list-style-type: none;\"><li><p><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;6-1 6. border与透明边框 (07:29)</p></li></ul><h3 style=\"margin: 0px; padding: 0px; font-size: 16px; line-height: 24px;\">第7章 border在布局中的应用</h3><p>张鑫旭老师在本章为大家介绍在前端工作中，如何借助border使用有限标签完成我们的布局。</p><ul class=\"video list-paddingleft-2\" style=\"list-style-type: none;\"><li><p><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;7-1 7. border在布局中的应用 (04:46)</p></li></ul><p><br/></p>', 'JAVA', '1', '2018-07-15 22:01:30');
INSERT INTO `lesson` VALUES ('41', 'CSS深入理解之z-index', '15316618023173D3C5400FF2317BB44874CA333E47CC056fb2f5c00013edf06000338-240-135.jpg', '60', '<p>简介：本课程中，张鑫旭大大将带领大家学习z-index的基本知识，并深入讲解嵌套表现以及z-index计算规则。同时还将介绍CSS中非常基础且重要的元素层叠表现的概念、元素的层叠顺序，以及z-index、还有其他CSS属性与层叠上下文的关系。还有最值得期待的z-index实践经验分享！</p><h3 style=\"margin: 0px; padding: 0px; font-size: 16px; line-height: 24px;\">第1章 CSS z-index基础</h3><p>本章主要是介绍z-index的语法以及它支持的属性值等。</p><ul class=\"video list-paddingleft-2\" style=\"list-style-type: none;\"><li><p><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;1-1 z-index基础 (04:20)</p></li></ul><h3 style=\"margin: 0px; padding: 0px; font-size: 16px; line-height: 24px;\">第2章 z-index与CSS定位属性</h3><p>通过本章学习我们要对嵌套表现以及z-index计算规则有一个了解</p><ul class=\"video list-paddingleft-2\" style=\"list-style-type: none;\"><li><p><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;2-1 z-index与定位元素 (05:41)</p></li></ul><h3 style=\"margin: 0px; padding: 0px; font-size: 16px; line-height: 24px;\">第3章 CSS中的层叠上下文和层叠水平</h3><p>通过本章学习我们要能够深入的理解元素层叠表现的概念。</p><ul class=\"video list-paddingleft-2\" style=\"list-style-type: none;\"><li><p><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;3-1 CSS中层叠上下文和层叠水平 (10:06)</p></li></ul><h3 style=\"margin: 0px; padding: 0px; font-size: 16px; line-height: 24px;\">第4章 元素的层叠顺序</h3><p>你知道块状元素，浮动元素，内联元素发生重叠时候的层叠顺序吗？</p><ul class=\"video list-paddingleft-2\" style=\"list-style-type: none;\"><li><p><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;4-1 层叠顺序 (06:35)</p></li></ul><h3 style=\"margin: 0px; padding: 0px; font-size: 16px; line-height: 24px;\">第5章 z-index与层叠上下文</h3><p>z-index的一些行为表现实际上就是层叠上下文的作用。</p><ul class=\"video list-paddingleft-2\" style=\"list-style-type: none;\"><li><p><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;5-1 z-index与层叠上下文 (09:28)</p></li></ul><h3 style=\"margin: 0px; padding: 0px; font-size: 16px; line-height: 24px;\">第6章 其他CSS属性与层叠上下文</h3><p>除了z-index, CSS中还有很多其他属性也会影响层叠上下文。</p><ul class=\"video list-paddingleft-2\" style=\"list-style-type: none;\"><li><p><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;6-1 其他CSS属性与层叠上下文 (09:38)</p></li></ul><h3 style=\"margin: 0px; padding: 0px; font-size: 16px; line-height: 24px;\">第7章 z-index与其他CSS属性层叠上下文</h3><p>非定位元素的z-index层叠顺序，z-index与非定位层叠上下文关系，以及一些奇怪现象的解释（透明动画的显隐）。</p><ul class=\"video list-paddingleft-2\" style=\"list-style-type: none;\"><li><p><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;7-1 z-index与其他CSS属性层叠上下文 (09:20)</p></li></ul><h3 style=\"margin: 0px; padding: 0px; font-size: 16px; line-height: 24px;\">第8章 z-index相关实践分享</h3><p>最小化影响原则，负值隐藏，组件计数器等。</p><ul class=\"video list-paddingleft-2\" style=\"list-style-type: none;\"><li><p><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;8-1 z-index相关实践分享 (09:35)</p></li></ul><p><br/></p>', 'HTML5', '1', '2018-07-15 21:51:55');
INSERT INTO `lesson` VALUES ('42', 'JS+CSS3实现“粽情端午”', '15316618688503D3C5400FF2317BB44874CA333E47CC05704a9a30001a6ef06000338-240-135.jpg', '60', '<p>简介：本课程带领大家使用JS和CSS3技术实现粽子动画的效果，课程分为“分析动画特效”和“开发”两个部分，分析动画部分使用“关键时间点逆向分析”的方法带领大家把动画制作过程揭秘出来，“开发”部分，首先对动画效果进行深入剖析、然后再进行动画的一步一步分步制作。</p><h3 style=\"margin: 15px 0px 0px; padding: 0px; font-size: 16px; line-height: 24px;\">第1章 课程介绍及分析</h3><p style=\"margin-top: 10px;\">本章节对效果进行了演示，以及使用了“关键时间点逆向分析”的方法带领大家把动画制作过程揭秘出来。</p><ul class=\"video list-paddingleft-2\" style=\"list-style-type: none;\"><li><p><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;1-1 案例介绍和分析&nbsp;</p></li><li><p><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;1-2 实现思路</p></li></ul><h3 style=\"margin: 15px 0px 0px; padding: 0px; font-size: 16px; line-height: 24px;\">第2章 代码实现</h3><p style=\"margin-top: 10px;\">本章节先对静态界面&amp;元件概念进行讲解，然后使用纯 CSS 实现动画和过渡动画效果，以及脚本实现时间线类和构建场景动画，到最后完成粽子的旋转动画效果。</p><ul class=\"video list-paddingleft-2\" style=\"list-style-type: none;\"><li><p><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;2-1 开发环境介绍</p></li><li><p><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;2-2 完成基本界面元素（一）&nbsp;</p></li><li><p><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;2-3 完成基本界面元素（二）</p></li><li><p><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;2-4 定义抖动的CSS动画</p></li><li><p><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;2-5 完成祝福语CSS过渡动画&nbsp;</p></li><li><p><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;2-6 动画样式（粽肉动画）</p></li><li><p><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;2-7 动画样式（文字动画）</p></li><li><p><a href=\"https://www.imooc.com/video/8300\" class=\"J-media-item\" style=\"outline: 0px; text-decoration-line: none; color: rgb(28, 31, 33); display: block; overflow: hidden; word-break: break-all;\"><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;2-8 动画样式定义（文字视角）</a></p></li><li><p><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;2-9 脚本编写时间类构造器&nbsp;</p></li><li><p><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;2-10 用时间类编写展开粽子动画序列（一）</p></li><li><p><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;2-11 用时间类编写展开粽子动画序列（二）</p></li><li><p><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;2-12 实现托盘旋转动画&nbsp;</p></li><li><p><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;2-13 图片加载器解决闪动&nbsp;</p></li></ul><h3 style=\"margin: 15px 0px 0px; padding: 0px; font-size: 16px; line-height: 24px;\">第3章 总结</h3><p style=\"margin-top: 10px;\">本章带领大家对课程所讲解到的关键知识点进行了总结及知识扩展。</p><ul class=\"video list-paddingleft-2\" style=\"list-style-type: none;\"><li><p><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;3-1 垂直翻动扩展与总结&nbsp;</p></li></ul><p><br/></p>', 'HTML5', '1', '2018-07-15 21:44:08');
INSERT INTO `lesson` VALUES ('43', '企业网站综合布局实战', '15316619454883D3C5400FF2317BB44874CA333E47CC05705d01e0001a04a06000338-240-135.jpg', '80', '<p>简介：本课程重点介绍HTML/CSS实现常见企业网站布局的方法、布局中常用的基本盒子模型、三列布局、两列自适应高度及基于jQ的开源图片幻灯片切换效果插件的使用。让您快速掌握企业网站的基本布局方法，同时对HTML、CSS、JS、jQ等知识的综合运用和提升。</p><h3 style=\"margin: 15px 0px 5px; padding: 0px; font-size: 16px; line-height: 1.5em;\">第1章 网站分析与展示</h3><p style=\"margin-top: 15px; line-height: 1.5em; margin-bottom: 5px;\">通过企业网站案例的分析和展示，让您清楚讲解思路。</p><ul class=\"video list-paddingleft-2\" style=\"list-style-type: none;\"><li><p><p style=\"outline: 0px; text-decoration-line: none; color: rgb(28, 31, 33); display: block; overflow: hidden; word-break: break-all; margin-top: 15px; line-height: 1.5em; margin-bottom: 5px;\"><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;1-1 网站分析与展示 (02:07)</p></p></li></ul><h3 style=\"margin: 15px 0px 5px; padding: 0px; font-size: 16px; line-height: 1.5em;\">第2章 必备基础知识</h3><p style=\"margin-top: 15px; line-height: 1.5em; margin-bottom: 5px;\">了解网站布局基础知识，为后续课程学习打下基础。</p><ul class=\"video list-paddingleft-2\" style=\"list-style-type: none;\"><li><p><p style=\"outline: 0px; text-decoration-line: none; color: rgb(28, 31, 33); display: block; overflow: hidden; word-break: break-all; margin-top: 15px; line-height: 1.5em; margin-bottom: 5px;\"><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;2-1 盒子模型 (12:25)</p></p></li><li><p><p style=\"outline: 0px; text-decoration-line: none; color: rgb(28, 31, 33); display: block; overflow: hidden; word-break: break-all; margin-top: 15px; line-height: 1.5em; margin-bottom: 5px;\"><span class=\"imv2-exercise_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;2-2 练习题</p></p></li><li><p><p style=\"outline: 0px; text-decoration-line: none; color: rgb(28, 31, 33); display: block; overflow: hidden; word-break: break-all; margin-top: 15px; line-height: 1.5em; margin-bottom: 5px;\"><span class=\"imv2-code_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;2-3 编程练习</p></p></li><li><p><p style=\"outline: 0px; text-decoration-line: none; color: rgb(28, 31, 33); display: block; overflow: hidden; word-break: break-all; margin-top: 15px; line-height: 1.5em; margin-bottom: 5px;\"><span class=\"imv2-play_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;2-4 浮动 float (07:07)</p></p></li><li><p><p style=\"outline: 0px; text-decoration-line: none; color: rgb(28, 31, 33); display: block; overflow: hidden; word-break: break-all; margin-top: 15px; line-height: 1.5em; margin-bottom: 5px;\"><span class=\"imv2-exercise_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;2-5 练习题</p></p></li><li><p><p style=\"outline: 0px; text-decoration-line: none; color: rgb(28, 31, 33); display: block; overflow: hidden; word-break: break-all; margin-top: 15px; line-height: 1.5em; margin-bottom: 5px;\"><span class=\"imv2-code_circle type\" style=\"speak: none; font-variant-numeric: normal; font-variant-east-asian: normal; line-height: 24px; -webkit-font-smoothing: antialiased; font-size: 24px; color: rgb(145, 153, 161); position: relative; top: 3px; margin-right: 4px; font-family: imv2 !important;\"></span>&nbsp;2-6 编程练习</p></p></li></ul><h3 style=\"margin: 15px 0px 5px; padding: 0px; font-size: 16px; line-height: 1.5em;\">第3章 首页制作<br/></h3><ul class=\"video list-paddingleft-2\" style=\"list-style-type: none;\"></ul><h3 style=\"margin: 15px 0px 5px; padding: 0px; font-size: 16px; line-height: 1.5em;\">第4章 新闻列表页制作<br/></h3><ul class=\"video list-paddingleft-2\" style=\"list-style-type: none;\"></ul><h3 style=\"margin: 15px 0px 5px; padding: 0px; font-size: 16px; line-height: 1.5em;\">第5章 新闻详细页制作<br/></h3><ul class=\"video list-paddingleft-2\" style=\"list-style-type: none;\"></ul><h3 style=\"margin: 15px 0px 5px; padding: 0px; font-size: 16px; line-height: 1.5em;\">第6章 课程总结<br/></h3><ul class=\"video list-paddingleft-2\" style=\"list-style-type: none;\"></ul><h3 style=\"margin: 15px 0px 5px; padding: 0px; font-size: 16px; line-height: 1.5em;\">第7章 编程挑战</h3><p><br/></p><ul class=\"video list-paddingleft-2\" style=\"list-style-type: none;\"></ul><p><br/></p>', 'HTML5', '1', '2018-07-15 21:47:45');
INSERT INTO `lesson` VALUES ('44', 'Java', '153166950941191248322E84BD48C8275ED990124C1E92.jpg', '6665', '<p>你值得拥有</p>', 'JAVA', '1', '2018-07-15 23:45:39');
INSERT INTO `lesson` VALUES ('45', '大学英语', '15317043089238B07BBE0AD077696D7C9C5158138C341course2.jpg', '6000', '<p>学好英语，打败代码，emmmmmm，嗯？</p>', 'HTML5', '1', '2018-07-16 09:25:57');
INSERT INTO `lesson` VALUES ('46', '设计模式', '1531708495997987B68315ED890D96E6B2685B35C4D161.jpg', '6625', '<p>欢迎听课</p><p>学好设计模式，还是很重要滴</p>', 'JAVA', '1', '2018-07-16 10:36:06');
INSERT INTO `lesson` VALUES ('47', 'python实现线性回归', '1531708516253525B1626EA6F755C5DA42D136B5679475abc6159000142f706000338-240-135.jpg', '699', '<p style=\"text-align:center\"><img src=\"/webapps/../upload/image/20180716/1531708742234048121.png\" title=\"1531708742234048121.png\" alt=\"icon8.png\" width=\"134\" height=\"138\"/></p><p>你需要好好学习python</p>', 'Python', '1', '2018-07-16 10:40:57');

-- ----------------------------
-- Table structure for lessonbranch
-- ----------------------------
DROP TABLE IF EXISTS `lessonbranch`;
CREATE TABLE `lessonbranch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lid` int(11) DEFAULT NULL,
  `branchid` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lessonbranch
-- ----------------------------
INSERT INTO `lessonbranch` VALUES ('12', '11', '1');
INSERT INTO `lessonbranch` VALUES ('13', '12', '1');
INSERT INTO `lessonbranch` VALUES ('14', '13', '1');
INSERT INTO `lessonbranch` VALUES ('15', '14', '1');
INSERT INTO `lessonbranch` VALUES ('16', '15', '1');
INSERT INTO `lessonbranch` VALUES ('17', '16', '4');
INSERT INTO `lessonbranch` VALUES ('18', '17', '4');
INSERT INTO `lessonbranch` VALUES ('19', '18', '1');
INSERT INTO `lessonbranch` VALUES ('20', '19', '2');
INSERT INTO `lessonbranch` VALUES ('21', '20', '1');
INSERT INTO `lessonbranch` VALUES ('22', '21', '1');
INSERT INTO `lessonbranch` VALUES ('23', '22', '4');
INSERT INTO `lessonbranch` VALUES ('24', '23', '4');
INSERT INTO `lessonbranch` VALUES ('25', '24', '3');
INSERT INTO `lessonbranch` VALUES ('26', '25', '3');
INSERT INTO `lessonbranch` VALUES ('27', '26', '2');
INSERT INTO `lessonbranch` VALUES ('28', '27', '2');
INSERT INTO `lessonbranch` VALUES ('29', '28', '3');
INSERT INTO `lessonbranch` VALUES ('30', '29', '1');
INSERT INTO `lessonbranch` VALUES ('31', '30', '1');
INSERT INTO `lessonbranch` VALUES ('32', '31', '2');
INSERT INTO `lessonbranch` VALUES ('33', '32', '2');
INSERT INTO `lessonbranch` VALUES ('34', '33', '3');
INSERT INTO `lessonbranch` VALUES ('35', '34', '4');
INSERT INTO `lessonbranch` VALUES ('36', '35', '3');
INSERT INTO `lessonbranch` VALUES ('37', '36', '4');
INSERT INTO `lessonbranch` VALUES ('38', '37', '2');
INSERT INTO `lessonbranch` VALUES ('39', '38', '2');
INSERT INTO `lessonbranch` VALUES ('40', '39', '2');
INSERT INTO `lessonbranch` VALUES ('41', '40', '3');
INSERT INTO `lessonbranch` VALUES ('42', '41', '2');
INSERT INTO `lessonbranch` VALUES ('43', '42', '1');
INSERT INTO `lessonbranch` VALUES ('44', '43', '1');
INSERT INTO `lessonbranch` VALUES ('45', '44', '3');
INSERT INTO `lessonbranch` VALUES ('46', '45', '5');
INSERT INTO `lessonbranch` VALUES ('47', '46', '5');
INSERT INTO `lessonbranch` VALUES ('48', '47', '4');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `mtitle` varchar(255) DEFAULT NULL,
  `mtime` datetime DEFAULT NULL,
  `qid` int(11) DEFAULT NULL,
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('14', '快乐每一天', '2018-07-06 22:46:46', '1');
INSERT INTO `message` VALUES ('16', '坚持就是胜利', '2018-07-06 23:59:01', '1');
INSERT INTO `message` VALUES ('18', '生活不止眼前的苟且', '2018-07-08 11:21:49', '1');
INSERT INTO `message` VALUES ('23', '一只特立独行的猫', '2018-07-10 10:30:13', '1');

-- ----------------------------
-- Table structure for messageimg
-- ----------------------------
DROP TABLE IF EXISTS `messageimg`;
CREATE TABLE `messageimg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) DEFAULT NULL,
  `imgurl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of messageimg
-- ----------------------------
INSERT INTO `messageimg` VALUES ('10', '11', '15308344925686.jpg');
INSERT INTO `messageimg` VALUES ('16', '14', '153088840630910.jpg');
INSERT INTO `messageimg` VALUES ('17', '14', '153088840631111.jpg');
INSERT INTO `messageimg` VALUES ('19', '16', '15308927412218.jpg');
INSERT INTO `messageimg` VALUES ('23', '18', '153102010978412.jpg');
INSERT INTO `messageimg` VALUES ('37', '23', '153118981388613.jpg');

-- ----------------------------
-- Table structure for messagelike
-- ----------------------------
DROP TABLE IF EXISTS `messagelike`;
CREATE TABLE `messagelike` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `stime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=239 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of messagelike
-- ----------------------------
INSERT INTO `messagelike` VALUES ('211', '18', 'shata', '2018-07-16 08:10:02');
INSERT INTO `messagelike` VALUES ('212', '18', '田野正式用户名', '2018-07-16 09:15:49');
INSERT INTO `messagelike` VALUES ('217', '18', '千阳', '2018-07-16 09:30:02');
INSERT INTO `messagelike` VALUES ('218', '23', 'chen', '2018-07-16 09:41:11');
INSERT INTO `messagelike` VALUES ('219', '23', 'chenyu', '2018-07-16 09:44:42');
INSERT INTO `messagelike` VALUES ('220', '18', 'chenyu', '2018-07-16 09:44:44');
INSERT INTO `messagelike` VALUES ('221', '16', 'chenyu', '2018-07-16 09:54:12');
INSERT INTO `messagelike` VALUES ('222', '16', '千阳', '2018-07-16 09:59:09');
INSERT INTO `messagelike` VALUES ('228', '23', '王', '2018-07-16 10:48:30');
INSERT INTO `messagelike` VALUES ('237', '23', 'Noah', '2018-07-16 13:52:55');
INSERT INTO `messagelike` VALUES ('238', '18', '王', '2018-07-16 14:58:04');

-- ----------------------------
-- Table structure for messagereply
-- ----------------------------
DROP TABLE IF EXISTS `messagereply`;
CREATE TABLE `messagereply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `stime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of messagereply
-- ----------------------------
INSERT INTO `messagereply` VALUES ('73', '23', 'hha', 'chen', '2018-07-16 02:09:01');
INSERT INTO `messagereply` VALUES ('74', '16', 'hhh', 'Noah', '2018-07-16 02:34:45');
INSERT INTO `messagereply` VALUES ('75', '18', '还有诗和远方', '王', '2018-07-16 08:05:47');
INSERT INTO `messagereply` VALUES ('76', '18', '歌也好听哦', 'shata', '2018-07-16 08:10:25');
INSERT INTO `messagereply` VALUES ('77', '23', '喵喵喵', 'shata', '2018-07-16 08:10:34');
INSERT INTO `messagereply` VALUES ('78', '23', 'emmmm', 'zxh', '2018-07-16 09:16:05');
INSERT INTO `messagereply` VALUES ('79', '18', '很期待去东软睿道学习', '田野正式用户名', '2018-07-16 09:16:11');
INSERT INTO `messagereply` VALUES ('80', '23', '真的是特立独行的么', 'zxh', '2018-07-16 09:16:21');
INSERT INTO `messagereply` VALUES ('81', '18', '还有未来的苟且', 'chenyu', '2018-07-16 09:16:52');
INSERT INTO `messagereply` VALUES ('83', '23', 'ummm', '千阳', '2018-07-16 09:29:59');
INSERT INTO `messagereply` VALUES ('84', '18', '哈哈哈', '千阳', '2018-07-16 09:30:12');
INSERT INTO `messagereply` VALUES ('85', '23', '或许是吧', '千阳', '2018-07-16 09:33:06');
INSERT INTO `messagereply` VALUES ('86', '23', '楼上的，不是我针对谁，在座的各位都是垃圾', 'chen', '2018-07-16 09:40:08');
INSERT INTO `messagereply` VALUES ('87', '16', '从坚持到放弃', 'zxh', '2018-07-16 09:40:53');
INSERT INTO `messagereply` VALUES ('88', '16', '坚持！', '田野正式用户名', '2018-07-16 09:41:59');
INSERT INTO `messagereply` VALUES ('89', '18', '这是一条用于占位的评论', 'zxh', '2018-07-16 09:42:06');
INSERT INTO `messagereply` VALUES ('90', '16', '努力学习进步！', '田野正式用户名', '2018-07-16 09:42:17');
INSERT INTO `messagereply` VALUES ('91', '23', '楼下的年轻人很膨胀啊', '千阳', '2018-07-16 09:42:24');
INSERT INTO `messagereply` VALUES ('93', '18', '楼下的各位，不用我重复了吧', 'chenyu', '2018-07-16 09:43:41');
INSERT INTO `messagereply` VALUES ('94', '14', '沙发', 'chenyu', '2018-07-16 09:44:28');
INSERT INTO `messagereply` VALUES ('95', '18', '还有诗和远方', '田野正式用户名', '2018-07-16 09:52:05');
INSERT INTO `messagereply` VALUES ('96', '18', '我想住在这样的小屋欣赏这里的景色', '田野正式用户名', '2018-07-16 09:52:23');
INSERT INTO `messagereply` VALUES ('97', '18', '生活不止眼前的代码', '田野正式用户名', '2018-07-16 09:52:35');
INSERT INTO `messagereply` VALUES ('98', '18', '晴天沙滩和代码很搭配', '田野正式用户名', '2018-07-16 09:53:03');
INSERT INTO `messagereply` VALUES ('99', '18', '海鸟飞', '田野正式用户名', '2018-07-16 09:53:19');
INSERT INTO `messagereply` VALUES ('100', '18', '楼下的你太啰嗦了', 'chenyu', '2018-07-16 09:53:57');
INSERT INTO `messagereply` VALUES ('101', '18', '请立即去世', 'chenyu', '2018-07-16 09:54:07');
INSERT INTO `messagereply` VALUES ('102', '23', '啦啦啦', '王', '2018-07-16 10:49:03');
INSERT INTO `messagereply` VALUES ('104', '18', '座山观虎斗', '千阳', '2018-07-16 10:56:16');
INSERT INTO `messagereply` VALUES ('105', '18', '辣鸡！', 'chenyu', '2018-07-16 10:56:26');
INSERT INTO `messagereply` VALUES ('106', '18', '(*/ω＼*)', 'chenyu', '2018-07-16 10:58:03');
INSERT INTO `messagereply` VALUES ('107', '18', '发起进攻(　 ´-ω ･)▄︻┻┳══━一', 'chenyu', '2018-07-16 10:58:28');
INSERT INTO `messagereply` VALUES ('108', '18', '凸(艹皿艹&nbsp;)', 'chenyu', '2018-07-16 10:59:57');
INSERT INTO `messagereply` VALUES ('109', '23', '我是千阳', '千阳', '2018-07-16 12:48:01');
INSERT INTO `messagereply` VALUES ('110', '23', 'jjj', 'Noah', '2018-07-16 13:53:04');

-- ----------------------------
-- Table structure for refund
-- ----------------------------
DROP TABLE IF EXISTS `refund`;
CREATE TABLE `refund` (
  `oid` int(11) NOT NULL,
  `refundreason` varchar(3000) DEFAULT NULL,
  `refundtime` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of refund
-- ----------------------------

-- ----------------------------
-- Table structure for sorder
-- ----------------------------
DROP TABLE IF EXISTS `sorder`;
CREATE TABLE `sorder` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `lid` int(11) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `status` char(255) DEFAULT NULL,
  `ordertime` datetime DEFAULT NULL,
  `qid` int(11) DEFAULT NULL,
  `transactionid` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `rating` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sorder
-- ----------------------------
INSERT INTO `sorder` VALUES ('80', '14', '3000', '待付款', '2018-07-15 20:48:37', '1', '2018-07-15 20:48:37FF2BEC0B86AE05957E1A17B9DFCE29D5', '15888', '田野', null);
INSERT INTO `sorder` VALUES ('81', '17', '5000', '已使用', '2018-07-15 20:50:27', '1', '2018-07-15 20:50:27FF2BEC0B86AE05957E1A17B9DFCE29D5', '158', '田野2', '4.0');
INSERT INTO `sorder` VALUES ('82', '28', '6000', '已退款', '2018-07-15 20:58:36', '1', '2018-07-15 20:58:360A09CDAB1B81DE6A059AF865A5195A73', '15840147983', '周慕贤', null);
INSERT INTO `sorder` VALUES ('83', '30', '12', '已退款', '2018-07-15 21:04:19', '1', '2018-07-15 21:04:190A09CDAB1B81DE6A059AF865A5195A73', '15840147983', '周慕贤', null);
INSERT INTO `sorder` VALUES ('84', '17', '5000', '已使用', '2018-07-15 21:04:34', '1', '2018-07-15 21:04:340A09CDAB1B81DE6A059AF865A5195A73', '15840147983', '周慕贤', null);
INSERT INTO `sorder` VALUES ('85', '27', '31', '已使用', '2018-07-15 21:04:46', '1', '2018-07-15 21:04:460A09CDAB1B81DE6A059AF865A5195A73', '15840147983', '周慕贤', '4.0');
INSERT INTO `sorder` VALUES ('86', '21', '9000', '已退款', '2018-07-15 21:50:18', '1', '2018-07-15 21:50:18A80B86889A6F12707C3CEBDB4B01B6B9', '13942453912', 'zxh', null);
INSERT INTO `sorder` VALUES ('87', '35', '800', '待付款', '2018-07-15 21:54:47', '1', '2018-07-15 21:54:47A80B86889A6F12707C3CEBDB4B01B6B9', '13234045967', '周欣昊', null);
INSERT INTO `sorder` VALUES ('88', '37', '750', '待付款', '2018-07-15 21:56:02', '1', '2018-07-15 21:56:02A80B86889A6F12707C3CEBDB4B01B6B9', '13234045967', '周欣昊', null);
INSERT INTO `sorder` VALUES ('90', '27', '31', '已退款', '2018-07-15 21:58:34', '1', '2018-07-15 21:58:34A80B86889A6F12707C3CEBDB4B01B6B9', '13942453912', '周欣昊', null);
INSERT INTO `sorder` VALUES ('91', '34', '300', '已使用', '2018-07-15 21:59:33', '1', '2018-07-15 21:59:33A80B86889A6F12707C3CEBDB4B01B6B9', '13942453912', '周欣昊', '5.0');
INSERT INTO `sorder` VALUES ('92', '35', '800', '已取消', '2018-07-15 22:00:48', '1', '2018-07-15 22:00:48A80B86889A6F12707C3CEBDB4B01B6B9', '13942453912', '周欣昊', null);
INSERT INTO `sorder` VALUES ('93', '17', '5000', '已使用', '2018-07-15 22:18:58', '1', '2018-07-15 22:18:58A80B86889A6F12707C3CEBDB4B01B6B9', '13942453912', '周欣昊', '4.0');
INSERT INTO `sorder` VALUES ('94', '22', '7000', '已使用', '2018-07-15 23:22:37', '1', '2018-07-15 23:22:37E1AAD823118A3958681A81A93053154A', '182', '田某', null);
INSERT INTO `sorder` VALUES ('95', '28', '6000', '已使用', '2018-07-15 23:49:57', '1', '2018-07-15 23:49:5791248322E84BD48C8275ED990124C1E9', '13942453912', '周欣昊', '4.0');
INSERT INTO `sorder` VALUES ('96', '44', '6665', '已使用', '2018-07-15 23:51:18', '1', '2018-07-15 23:51:18A17765663D7F54723112242D74508647', '158', '王超', '4.0');
INSERT INTO `sorder` VALUES ('97', '44', '6665', '已使用', '2018-07-15 23:52:42', '1', '2018-07-15 23:52:4291248322E84BD48C8275ED990124C1E9', '13942453912', '周欣昊', '4.0');
INSERT INTO `sorder` VALUES ('98', '17', '5000', '已使用', '2018-07-15 23:54:06', '1', '2018-07-15 23:54:0691248322E84BD48C8275ED990124C1E9', '13942453912', '周欣昊', '2.5');
INSERT INTO `sorder` VALUES ('99', '44', '6665', '已使用', '2018-07-15 23:56:09', '1', '2018-07-15 23:56:0991248322E84BD48C8275ED990124C1E9', '13942453912', '周欣昊', '4.0');
INSERT INTO `sorder` VALUES ('100', '26', '5000', '已使用', '2018-07-16 00:01:58', '1', '2018-07-16 00:01:5891248322E84BD48C8275ED990124C1E9', '13942453912', '周欣昊', '1.0');
INSERT INTO `sorder` VALUES ('101', '17', '5000', '已使用', '2018-07-16 00:05:14', '1', '2018-07-16 00:05:14204525FCB3BDCA5C232EBCE8A8135247', '13940207621', '陈宇', '5.0');
INSERT INTO `sorder` VALUES ('102', '36', '650', '已使用', '2018-07-16 00:05:59', '1', '2018-07-16 00:05:59204525FCB3BDCA5C232EBCE8A8135247', '13940207621', '陈宇', '4.0');
INSERT INTO `sorder` VALUES ('103', '28', '6000', '已使用', '2018-07-16 00:06:02', '1', '2018-07-16 00:06:022AD9FC9B430999E54D71853497DEA35D', '1837922', '田野', '4.0');
INSERT INTO `sorder` VALUES ('104', '36', '650', '已使用', '2018-07-16 00:06:30', '1', '2018-07-16 00:06:302AD9FC9B430999E54D71853497DEA35D', '1837922', '田野', '2.0');
INSERT INTO `sorder` VALUES ('105', '34', '300', '已使用', '2018-07-16 00:06:44', '1', '2018-07-16 00:06:442AD9FC9B430999E54D71853497DEA35D', '1837922', '田野', '2.0');
INSERT INTO `sorder` VALUES ('106', '37', '750', '已使用', '2018-07-16 00:06:58', '1', '2018-07-16 00:06:582AD9FC9B430999E54D71853497DEA35D', '1837922', '田野', '5.0');
INSERT INTO `sorder` VALUES ('107', '28', '6000', '已使用', '2018-07-16 00:07:45', '1', '2018-07-16 00:07:45204525FCB3BDCA5C232EBCE8A8135247', '13940207621', '陈宇', '5.0');
INSERT INTO `sorder` VALUES ('108', '40', '50', '已使用', '2018-07-16 00:08:57', '1', '2018-07-16 00:08:572AD9FC9B430999E54D71853497DEA35D', '1837922', '田野', '1.0');
INSERT INTO `sorder` VALUES ('109', '21', '9000', '已使用', '2018-07-16 00:09:10', '1', '2018-07-16 00:09:102AD9FC9B430999E54D71853497DEA35D', '1837922', '田野', '4.0');
INSERT INTO `sorder` VALUES ('110', '33', '600', '已退款', '2018-07-16 00:09:38', '1', '2018-07-16 00:09:382AD9FC9B430999E54D71853497DEA35D', '1837922', '田野', null);
INSERT INTO `sorder` VALUES ('111', '15', '199', '已使用', '2018-07-16 00:09:48', '1', '2018-07-16 00:09:48204525FCB3BDCA5C232EBCE8A8135247', '13940207621', '陈宇', '5.0');
INSERT INTO `sorder` VALUES ('112', '17', '5000', '已使用', '2018-07-16 00:15:12', '1', '2018-07-16 00:15:12204525FCB3BDCA5C232EBCE8A8135247', '13940207621', '陈宇', '5.0');
INSERT INTO `sorder` VALUES ('113', '44', '6665', '已使用', '2018-07-16 00:15:25', '1', '2018-07-16 00:15:25204525FCB3BDCA5C232EBCE8A8135247', '13940207621', '陈宇', '5.0');
INSERT INTO `sorder` VALUES ('114', '44', '6665', '已使用', '2018-07-16 00:15:33', '1', '2018-07-16 00:15:33204525FCB3BDCA5C232EBCE8A8135247', '13940207621', '陈宇', '5.0');
INSERT INTO `sorder` VALUES ('115', '44', '6665', '已使用', '2018-07-16 00:15:41', '1', '2018-07-16 00:15:41204525FCB3BDCA5C232EBCE8A8135247', '13940207621', '陈宇', '5.0');
INSERT INTO `sorder` VALUES ('116', '44', '6665', '已使用', '2018-07-16 00:15:50', '1', '2018-07-16 00:15:50204525FCB3BDCA5C232EBCE8A8135247', '13940207621', '陈宇', '5.0');
INSERT INTO `sorder` VALUES ('117', '44', '6665', '已使用', '2018-07-16 00:16:11', '1', '2018-07-16 00:16:11204525FCB3BDCA5C232EBCE8A8135247', '13940207621', '陈宇', null);
INSERT INTO `sorder` VALUES ('118', '44', '6665', '已使用', '2018-07-16 00:16:20', '1', '2018-07-16 00:16:20204525FCB3BDCA5C232EBCE8A8135247', '13940207621', '陈宇', '5.0');
INSERT INTO `sorder` VALUES ('119', '24', '500', '已使用', '2018-07-16 00:16:21', '1', '2018-07-16 00:16:2191248322E84BD48C8275ED990124C1E9', '13942453912', '周欣昊', '2.5');
INSERT INTO `sorder` VALUES ('120', '44', '6665', '已使用', '2018-07-16 00:16:27', '1', '2018-07-16 00:16:27204525FCB3BDCA5C232EBCE8A8135247', '13940207621', '陈宇', null);
INSERT INTO `sorder` VALUES ('121', '44', '6665', '已使用', '2018-07-16 00:16:35', '1', '2018-07-16 00:16:35204525FCB3BDCA5C232EBCE8A8135247', '13940207621', '陈宇', null);
INSERT INTO `sorder` VALUES ('122', '44', '6665', '已使用', '2018-07-16 00:16:43', '1', '2018-07-16 00:16:43204525FCB3BDCA5C232EBCE8A8135247', '13940207621', '陈宇', null);
INSERT INTO `sorder` VALUES ('123', '17', '5000', '已使用', '2018-07-16 00:16:53', '1', '2018-07-16 00:16:53204525FCB3BDCA5C232EBCE8A8135247', '13940207621', '陈宇', '5.0');
INSERT INTO `sorder` VALUES ('124', '17', '5000', '已使用', '2018-07-16 00:17:05', '1', '2018-07-16 00:17:05204525FCB3BDCA5C232EBCE8A8135247', '13940207621', '陈宇', null);
INSERT INTO `sorder` VALUES ('125', '17', '5000', '已使用', '2018-07-16 00:17:24', '1', '2018-07-16 00:17:24204525FCB3BDCA5C232EBCE8A8135247', '13940207621', '陈宇', '5.0');
INSERT INTO `sorder` VALUES ('126', '17', '5000', '已使用', '2018-07-16 00:17:34', '1', '2018-07-16 00:17:34204525FCB3BDCA5C232EBCE8A8135247', '13940207621', '陈宇', '5.0');
INSERT INTO `sorder` VALUES ('127', '17', '5000', '待付款', '2018-07-16 00:49:24', '1', '2018-07-16 00:49:246EC24BD52513454B57C1F1395F9B4B13', '111444', '田野的小号', null);
INSERT INTO `sorder` VALUES ('128', '36', '650', '待付款', '2018-07-16 00:50:36', '1', '2018-07-16 00:50:366EC24BD52513454B57C1F1395F9B4B13', '111444', '田野', null);
INSERT INTO `sorder` VALUES ('129', '28', '6000', '待付款', '2018-07-16 00:50:50', '1', '2018-07-16 00:50:506EC24BD52513454B57C1F1395F9B4B13', '111444', '田野', null);
INSERT INTO `sorder` VALUES ('130', '35', '800', '待付款', '2018-07-16 00:51:05', '1', '2018-07-16 00:51:056EC24BD52513454B57C1F1395F9B4B13', '111444', '田野', null);
INSERT INTO `sorder` VALUES ('131', '23', '1600', '待付款', '2018-07-16 00:51:17', '1', '2018-07-16 00:51:176EC24BD52513454B57C1F1395F9B4B13', '111444', '田野', null);
INSERT INTO `sorder` VALUES ('132', '35', '800', '待付款', '2018-07-16 00:51:30', '1', '2018-07-16 00:51:306EC24BD52513454B57C1F1395F9B4B13', '111444', '田野', null);
INSERT INTO `sorder` VALUES ('133', '40', '50', '待付款', '2018-07-16 00:52:44', '1', '2018-07-16 00:52:446EC24BD52513454B57C1F1395F9B4B13', '111444', '田野', null);
INSERT INTO `sorder` VALUES ('134', '44', '6665', '已使用', '2018-07-16 00:53:44', '1', '2018-07-16 00:53:446EC24BD52513454B57C1F1395F9B4B13', '80993', '田野', '4.0');
INSERT INTO `sorder` VALUES ('135', '26', '5000', '已使用', '2018-07-16 00:54:19', '1', '2018-07-16 00:54:196EC24BD52513454B57C1F1395F9B4B13', '80993', '田野', '2.0');
INSERT INTO `sorder` VALUES ('136', '40', '50', '已使用', '2018-07-16 00:54:33', '1', '2018-07-16 00:54:336EC24BD52513454B57C1F1395F9B4B13', '80993', '田野', '5.0');
INSERT INTO `sorder` VALUES ('137', '23', '1600', '已使用', '2018-07-16 00:54:48', '1', '2018-07-16 00:54:486EC24BD52513454B57C1F1395F9B4B13', '80993', '田野', '5.0');
INSERT INTO `sorder` VALUES ('138', '33', '600', '已使用', '2018-07-16 00:55:13', '1', '2018-07-16 00:55:136EC24BD52513454B57C1F1395F9B4B13', '80993', '田野', '2.0');
INSERT INTO `sorder` VALUES ('139', '15', '199', '待付款', '2018-07-16 00:56:00', '1', '2018-07-16 00:56:006EC24BD52513454B57C1F1395F9B4B13', '田野', '80993', null);
INSERT INTO `sorder` VALUES ('140', '37', '750', '已使用', '2018-07-16 00:56:38', '1', '2018-07-16 00:56:386EC24BD52513454B57C1F1395F9B4B13', '80993', '田野', '5.0');
INSERT INTO `sorder` VALUES ('141', '28', '6000', '已使用', '2018-07-16 00:56:58', '1', '2018-07-16 00:56:586EC24BD52513454B57C1F1395F9B4B13', '80993', '田野', '5.0');
INSERT INTO `sorder` VALUES ('142', '17', '5000', '已退款', '2018-07-16 00:57:08', '1', '2018-07-16 00:57:0827E36E7ACEB4023B7935B5B7778EE161', '13940207621', 'chenyu', null);
INSERT INTO `sorder` VALUES ('143', '38', '500', '已使用', '2018-07-16 01:03:53', '1', '2018-07-16 01:03:53E43EEDDC4CF01F4E861CB5C671F303BF', '15840147983', '周慕贤', '2.0');
INSERT INTO `sorder` VALUES ('144', '18', '16000', '已使用', '2018-07-16 01:04:22', '1', '2018-07-16 01:04:22E43EEDDC4CF01F4E861CB5C671F303BF', '15840147983', '周慕贤', '2.5');
INSERT INTO `sorder` VALUES ('146', '32', '500', '已使用', '2018-07-16 01:04:49', '1', '2018-07-16 01:04:49E43EEDDC4CF01F4E861CB5C671F303BF', '15840147983', '周慕贤', '5.0');
INSERT INTO `sorder` VALUES ('147', '23', '1600', '已使用', '2018-07-16 01:05:26', '1', '2018-07-16 01:05:26E43EEDDC4CF01F4E861CB5C671F303BF', '15840147983', '周慕贤', null);
INSERT INTO `sorder` VALUES ('148', '24', '500', '已使用', '2018-07-16 03:32:29', '1', '2018-07-16 03:32:297DA38403F3B494CC57E06DF8B91A0422', '15840147983', '周慕贤', null);
INSERT INTO `sorder` VALUES ('149', '39', '80', '已取消', '2018-07-16 03:32:58', '1', '2018-07-16 03:32:587DA38403F3B494CC57E06DF8B91A0422', '15840147983', '周慕贤', null);
INSERT INTO `sorder` VALUES ('150', '17', '5000', '已付款', '2018-07-16 03:36:57', '1', '2018-07-16 03:36:577DA38403F3B494CC57E06DF8B91A0422', '15840147983', '周慕贤', null);
INSERT INTO `sorder` VALUES ('151', '36', '650', '已使用', '2018-07-16 03:37:13', '1', '2018-07-16 03:37:137DA38403F3B494CC57E06DF8B91A0422', '15840147983', '周慕贤', null);
INSERT INTO `sorder` VALUES ('152', '35', '800', '已使用', '2018-07-16 03:37:26', '1', '2018-07-16 03:37:267DA38403F3B494CC57E06DF8B91A0422', '15840147983', '周慕贤', null);
INSERT INTO `sorder` VALUES ('153', '22', '7000', '退款中', '2018-07-16 03:37:37', '1', '2018-07-16 03:37:377DA38403F3B494CC57E06DF8B91A0422', '15840147983', '周慕贤', null);
INSERT INTO `sorder` VALUES ('154', '45', '6000', '待付款', '2018-07-16 09:36:50', '1', '2018-07-16 09:36:505B13326BA91D08986956E57626C5EF60', '13940207621', '陈宇', null);
INSERT INTO `sorder` VALUES ('157', '24', '500', '已使用', '2018-07-16 09:57:31', '1', '2018-07-16 09:57:31525B1626EA6F755C5DA42D136B567947', '13550044777', '陈陈陈', '5.0');
INSERT INTO `sorder` VALUES ('158', '46', '6625', '已退款', '2018-07-16 13:51:30', '1', '2018-07-16 13:51:303CF8CFB0AB828122829EBC5DE7CFF107', '15840147983', 'zmx', null);
INSERT INTO `sorder` VALUES ('159', '42', '60', '已使用', '2018-07-16 14:04:14', '1', '2018-07-16 14:04:143CF8CFB0AB828122829EBC5DE7CFF107', '15840147983', 'zmx', '5.0');

-- ----------------------------
-- Table structure for swiper
-- ----------------------------
DROP TABLE IF EXISTS `swiper`;
CREATE TABLE `swiper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qid` int(11) DEFAULT NULL,
  `imgurl` varchar(255) DEFAULT NULL,
  `category` char(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of swiper
-- ----------------------------
INSERT INTO `swiper` VALUES ('5', '1', '1.jpg', 'A');
INSERT INTO `swiper` VALUES ('6', '1', '2.jpg', 'A');
INSERT INTO `swiper` VALUES ('9', '1', '3.jpg', 'A');
INSERT INTO `swiper` VALUES ('11', '1', '4.png', 'A');
INSERT INTO `swiper` VALUES ('16', '1', '15316723627994 - 副本.png', 'B');
INSERT INTO `swiper` VALUES ('17', '1', '15316723628045.jpg', 'B');
INSERT INTO `swiper` VALUES ('18', '1', '15316723628066.jpg', 'B');
INSERT INTO `swiper` VALUES ('19', '1', '15316723628107 - 副本.jpg', 'B');
INSERT INTO `swiper` VALUES ('20', '1', '153167296301612 - 副本.jpg', 'B');
INSERT INTO `swiper` VALUES ('21', '1', '153167296302012.jpg', 'B');
INSERT INTO `swiper` VALUES ('22', '1', '153167296302213.jpg', 'B');
INSERT INTO `swiper` VALUES ('23', '1', '1531672963029dongruan.jpg', 'B');
INSERT INTO `swiper` VALUES ('24', '1', '15317040425551.jpg', 'B');
INSERT INTO `swiper` VALUES ('25', '1', '15317040425582.jpg', 'B');
INSERT INTO `swiper` VALUES ('26', '1', '15317040425613.jpg', 'B');
INSERT INTO `swiper` VALUES ('27', '1', '15317040425634.png', 'B');
INSERT INTO `swiper` VALUES ('28', '1', '6.jpg', 'A');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `tname` varchar(255) DEFAULT NULL,
  `tphoto` varchar(255) DEFAULT NULL,
  `introduction` varchar(255) DEFAULT NULL,
  `qid` int(11) DEFAULT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('4', '费园园', 'teacher4.jpg', '主要从事HTML5、Java开源领域及Android移动开发，在东软集团担任过6年的软件工程师，2年半的HTML5、JAVA培训讲师，承担过东北大学，北交大等重点高校培训项目。', '1');
INSERT INTO `teacher` VALUES ('5', '孙老师', 'teacher5.png', '主要从事开源软件和嵌入式产品开发，十年以上JAVA开发及教学经验，在计算机应用软件专业具有丰富的基础课、专业课教学经验，在各教学实验环节具有扎实的指导、组织经验。在嵌入式系统、ARM系统、物联网系统的教学与产品研发过程中积累了大量的实际经验。', '1');
INSERT INTO `teacher` VALUES ('6', '任老师', 'teacher6.png', '主要从事Java领域开发及教学，七年以上软件开发及教学经验。擅长Java、JavaEE软件开发，精通SSH,SMH等多个当前较流行的框架，在系统架构整合方面有深入理解和研究。先后参与多个大型软件开发项目，如索尼，联想等公司的大型项目。教学方面，则经验丰厚，教学质量极高，所教授的学员百分百就业。', '1');
INSERT INTO `teacher` VALUES ('7', '张老师', 'teacher7.jpg', '14年IT从业经验以及项目管理经验，熟练掌握Mac、Linux、Windows操作系统、精通Java、Python、JavaScript。精通HTML5、CSS3、Web大前端框架Fundation、BootStrap、Jquery、AngularJS以及最新Web解决方案（AngularJS Express NodeJS MongoDB ）。精通手机端框架VUE、Ionic。精通Oracle、Mysql、以及MongoDB数据库。', '1');
INSERT INTO `teacher` VALUES ('8', '金老师', 'teacher8.jpg', '东软睿道金牌讲师，熟悉Java方向技术研发，曾经参与多个政府行业软件的技术研发，相关培训和项目管理工作。', '1');
INSERT INTO `teacher` VALUES ('9', '宋老师', 'teacher9.jpg', '12年开发经验，2年教学经验,精通JAVA、C、C++、C#、PHP等多种编程语言，熟悉ios，android移动平台APP开发，语言功底扎实浑厚，精通数据结构和算法，积累多套软件开发框架。', '1');
INSERT INTO `teacher` VALUES ('10', '费园园', 'teacher4.jpg', '主要从事HTML5、Java开源领域及Android移动开发，在东软集团担任过6年的软件工程师，2年半的HTML5、JAVA培训讲师，承担过东北大学，北交大等重点高校培训项目。', '1');
INSERT INTO `teacher` VALUES ('11', '费园园', 'teacher4.jpg', '主要从事HTML5、Java开源领域及Android移动开发，在东软集团担任过6年的软件工程师，2年半的HTML5、JAVA培训讲师，承担过东北大学，北交大等重点高校培训项目。', '1');
INSERT INTO `teacher` VALUES ('12', '费园园', 'teacher4.jpg', '主要从事HTML5、Java开源领域及Android移动开发，在东软集团担任过6年的软件工程师，2年半的HTML5、JAVA培训讲师，承担过东北大学，北交大等重点高校培训项目。', '1');
INSERT INTO `teacher` VALUES ('13', '费园园', 'teacher4.jpg', '主要从事HTML5、Java开源领域及Android移动开发，在东软集团担任过6年的软件工程师，2年半的HTML5、JAVA培训讲师，承担过东北大学，北交大等重点高校培训项目。', '1');
INSERT INTO `teacher` VALUES ('14', '费园园', 'teacher4.jpg', '主要从事HTML5、Java开源领域及Android移动开发，在东软集团担任过6年的软件工程师，2年半的HTML5、JAVA培训讲师，承担过东北大学，北交大等重点高校培训项目。', '1');
INSERT INTO `teacher` VALUES ('15', '任老师', 'teacher6.png', '主要从事Java领域开发及教学，七年以上软件开发及教学经验。擅长Java、JavaEE软件开发，精通SSH,SMH等多个当前较流行的框架，在系统架构整合方面有深入理解和研究。先后参与多个大型软件开发项目，如索尼，联想等公司的大型项目。教学方面，则经验丰厚，教学质量极高，所教授的学员百分百就业。', '1');
INSERT INTO `teacher` VALUES ('16', '任老师', 'teacher6.png', '主要从事Java领域开发及教学，七年以上软件开发及教学经验。擅长Java、JavaEE软件开发，精通SSH,SMH等多个当前较流行的框架，在系统架构整合方面有深入理解和研究。先后参与多个大型软件开发项目，如索尼，联想等公司的大型项目。教学方面，则经验丰厚，教学质量极高，所教授的学员百分百就业。', '1');
INSERT INTO `teacher` VALUES ('17', '任老师', 'teacher6.png', '主要从事Java领域开发及教学，七年以上软件开发及教学经验。擅长Java、JavaEE软件开发，精通SSH,SMH等多个当前较流行的框架，在系统架构整合方面有深入理解和研究。先后参与多个大型软件开发项目，如索尼，联想等公司的大型项目。教学方面，则经验丰厚，教学质量极高，所教授的学员百分百就业。', '1');
INSERT INTO `teacher` VALUES ('18', '任老师', 'teacher6.png', '主要从事Java领域开发及教学，七年以上软件开发及教学经验。擅长Java、JavaEE软件开发，精通SSH,SMH等多个当前较流行的框架，在系统架构整合方面有深入理解和研究。先后参与多个大型软件开发项目，如索尼，联想等公司的大型项目。教学方面，则经验丰厚，教学质量极高，所教授的学员百分百就业。', '1');
INSERT INTO `teacher` VALUES ('19', '金老师', 'teacher8.jpg', '东软睿道金牌讲师，熟悉Java方向技术研发，曾经参与多个政府行业软件的技术研发，相关培训和项目管理工作。', '1');
INSERT INTO `teacher` VALUES ('20', '金老师', 'teacher8.jpg', '东软睿道金牌讲师，熟悉Java方向技术研发，曾经参与多个政府行业软件的技术研发，相关培训和项目管理工作。', '1');
INSERT INTO `teacher` VALUES ('21', '金老师', 'teacher8.jpg', '东软睿道金牌讲师，熟悉Java方向技术研发，曾经参与多个政府行业软件的技术研发，相关培训和项目管理工作。', '1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `tel` varchar(11) NOT NULL,
  `nickname` varchar(255) NOT NULL,
  `iconurl` varchar(255) DEFAULT NULL,
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `qid` int(11) DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('158', '王', '153164272289712.jpg', '1', '1', '1997');
INSERT INTO `user` VALUES ('15804049157', '千阳', null, '2', '1', '1997');
INSERT INTO `user` VALUES ('15840147983', 'Noah', '1531721134725dd.png', '3', '1', 'zmx9708191001');
INSERT INTO `user` VALUES ('2500401618', 'super', null, '4', '1', '1997');
INSERT INTO `user` VALUES ('123456', 'shata', null, '5', '1', '1997');
INSERT INTO `user` VALUES ('13234045967', '周大胖', null, '6', '1', '123');
INSERT INTO `user` VALUES ('18379227704', '请求', null, '7', '1', 'dwd');
INSERT INTO `user` VALUES ('15940471397', 'aaa', null, '8', '1', '1234');
INSERT INTO `user` VALUES ('13942453912', 'zxh', '1531662572303teacher4.jpg', '9', '1', '123');
INSERT INTO `user` VALUES ('182', 'ooo', null, '10', '1', '123456');
INSERT INTO `user` VALUES ('13940207621', 'chenyu', '1531703784217QQ20180129132853.png', '11', '1', '2018');
INSERT INTO `user` VALUES ('1837922', '田野正式用户名', null, '12', '1', '123456');
INSERT INTO `user` VALUES ('111444', '田野的小号2', null, '13', '1', '123456');
INSERT INTO `user` VALUES ('80993', '田野小号3', null, '14', '1', '123456');
INSERT INTO `user` VALUES ('15804035697', 'chen', '1531705302631icon5.png', '15', '1', '2018');
INSERT INTO `user` VALUES ('250040', 'shata', null, '16', '1', '1234');
INSERT INTO `user` VALUES ('13550044777', '陈陈陈', null, '17', '1', '2018');
INSERT INTO `user` VALUES ('111', 'hhh', null, '18', '1', '111');
SET FOREIGN_KEY_CHECKS=1;
