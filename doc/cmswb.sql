/*
Navicat MySQL Data Transfer

Source Server         : 123.206.87.60
Source Server Version : 50560
Source Host           : 123.206.87.60:3306
Source Database       : cmswb

Target Server Type    : MYSQL
Target Server Version : 50560
File Encoding         : 65001

Date: 2020-11-02 20:36:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for Article
-- ----------------------------
DROP TABLE IF EXISTS `Article`;
CREATE TABLE `Article` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cate` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `content` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `createtime` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `imgurl` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `updatetime` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `upindex` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of Article
-- ----------------------------

-- ----------------------------
-- Table structure for Baoxiang
-- ----------------------------
DROP TABLE IF EXISTS `Baoxiang`;
CREATE TABLE `Baoxiang` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `lineid` bigint(20) DEFAULT NULL,
  `linename` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `line_id` bigint(20) DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ifrtrm19hi4rfqi88p6nysoee` (`line_id`),
  CONSTRAINT `FK_ifrtrm19hi4rfqi88p6nysoee` FOREIGN KEY (`line_id`) REFERENCES `Line` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of Baoxiang
-- ----------------------------
INSERT INTO `Baoxiang` VALUES ('23', 'P1,1;P2,2;P3,3;P4,4;P5,5;P6,6', '10', '探索美的秘密', '徐悲鸿', null, '');

-- ----------------------------
-- Table structure for Cate
-- ----------------------------
DROP TABLE IF EXISTS `Cate`;
CREATE TABLE `Cate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `catid1` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `catid2` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `catid3` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `catname1` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `catname2` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `catname3` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of Cate
-- ----------------------------

-- ----------------------------
-- Table structure for Exam
-- ----------------------------
DROP TABLE IF EXISTS `Exam`;
CREATE TABLE `Exam` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `answer` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `chance` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `description` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL,
  `fail` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `picture1` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `pointid` bigint(20) DEFAULT NULL,
  `pointname` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `prize` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `prizeimg` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `showanswer` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `success` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `cate` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `radiolist` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of Exam
-- ----------------------------
INSERT INTO `Exam` VALUES ('18', 'B', '10', '你手中编号为01-A、01-B、01-C、01-D的答题卡中，有一张是徐悲鸿在这封信中示范的所画的马蹄，请你仔细观察一下，在下面选择正确的选项吧！', '很遗憾，你的回答错误，请你再仔细观察一下吧！', '探索任务', '', '101', '01 徐悲鸿教你如何画马', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '0', '恭喜你，回答正确，奖励10个积分！\\n继续探索下一个任务吧！\\n', '3', '01-A,A;01-B,B;01-C,C;01-D,D');
INSERT INTO `Exam` VALUES ('95', 'D', '10', '你手中编号为02-A、02-B、02-C、02-D的答题卡中，只有一张出自于在展的这幅画中，是哪一张呢？\r\n', '很遗憾，你的回答错误，请你再仔细观察一下吧！', '探索任务', '', '102', '02 中国画', 'BX02', '2020-10-12/e96154e9-fe41-4a16-9c01-aba0d6d91f3b_bx02.jpg', '0', '恭喜你，回答正确，奖励10个积分！\\n你同时获得了一块“拼图碎片”，集齐6块拼图可以兑换小礼物哦！\\n\\n快去探索下一个任务吧！\\n', '3', '02-A,A;02-B,B;02-C,C;02-D,D');
INSERT INTO `Exam` VALUES ('96', 'A', '10', '编号为03-A、03-B、03-C、03-D的答题卡中，四种动物中的哪一种出现在了这幅画中，请你仔细观察一下，在下面选择正确的选项吧！\r\n', '很遗憾，你的回答错误，请你再仔细观察一下吧！', '探索任务', '', '103', '03 徐悲鸿的“动物园”', 'BX06', '2020-10-12/b95c0ff2-9acf-4d17-af5a-14ec4165626b_bx06.jpg', '0', '恭喜你，回答正确，奖励10个积分！\\n你同时获得了一块“拼图碎片”，集齐6块拼图可以兑换小礼物哦！\\n\\n快去探索下一个任务吧！\\n', '3', '03-A,A;03-B,B;03-C,C;03-D,D');
INSERT INTO `Exam` VALUES ('97', 'A', '10', '编号为04-A、04-B、04-C、04-D的答题卡中，有一张没有在展出中，与展出的作品有细微的差别，请你仔细观察，把它选出来吧！\r\n', '很遗憾，你的回答错误，请你再仔细观察一下吧！', '探索任务', '', '104', '04 心中的圣山', 'BX01', '2020-10-12/877fc95c-e48d-47ff-aaa5-bc38d3a414eb_bx01.jpg', '0', '恭喜你，回答正确，奖励10个积分！\\n你同时获得了一块“拼图碎片”，集齐6块拼图可以兑换小礼物哦！\\n\\n快去探索下一个任务吧！\\n', '3', '04-A,A;04-B,B;04-C,C;04-D,D');
INSERT INTO `Exam` VALUES ('98', 'C', '10', '编号为05-A、05-B、05-C、05-D的答题卡中，有一段文字出自于《中国画改良论》这篇著作，请你选出它吧！', '很遗憾，你的回答错误，请你再仔细观察一下吧！', '探索任务', '', '105', '05 著书立说', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '0', '恭喜你，回答正确，奖励10个积分！\\n继续探索下一个任务吧！\\n', '3', '05-A,A;05-B,B;05-C,C;05-D,D');
INSERT INTO `Exam` VALUES ('99', 'A', '10', '编号为06-A、06-B、06-C、06-D的答题卡中，哪个人物在这幅画中，把它找出来吧！', '很遗憾，你的回答错误，请你再仔细观察一下吧！', '探索任务', '', '106', '06 家国情怀', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '0', '恭喜你，回答正确，奖励10个积分！\\n继续探索下一个任务吧！\\n', '3', '06-A,A;06-B,B;06-C,C;06-D,D');
INSERT INTO `Exam` VALUES ('100', 'D', '10', '画家为了创作这幅巨幅画作画了很多的草稿，但有一些草稿的人物并没有出现在这幅油画中，编号为07-A、07-B、07-C、07-D的答题卡中，哪一个不在画中？', '很遗憾，你的回答错误，请你再仔细观察一下吧！', '探索任务', '', '107', '07 借古说今', 'BX03', '2020-10-12/3020d2e0-6fb8-4862-81a3-4a20ae0a0656_bx03.jpg', '0', '恭喜你，回答正确，奖励10个积分！\\n你同时获得了一块“拼图碎片”，集齐6块拼图可以兑换小礼物哦！\\n\\n快去探索下一个任务吧！\\n', '3', '07-A,A;07-B,B;07-C,C;07-D,D');
INSERT INTO `Exam` VALUES ('101', 'C', '10', '画家为这位大师创作了多幅速写，你手中编号为08-A、08-B、08-C、08-D的答题卡中，哪一个是此次展出中速写作品？', '很遗憾，你的回答错误，请你再仔细观察一下吧！', '探索任务', '', '108', '08 大师与大师', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '0', '恭喜你，回答正确，奖励10个积分！\\n继续探索下一个任务吧！\\n', '3', '08-A,A;08-B,B;08-C,C;08-D,D');
INSERT INTO `Exam` VALUES ('102', 'A', '10', '你手中编号为09-A、09-B、09-C、09-D的答题卡中，哪一个印章是徐悲鸿印在这幅藏品中的？', '很遗憾，你的回答错误，请你再仔细观察一下吧！', '探索任务', '', '109', '09 守护珍宝', 'BX05', '2020-10-12/8cb8fb4b-1f62-43e6-bf7d-62bbf1bc7c9f_bx05.jpg', '0', '恭喜你，回答正确，奖励10个积分！\\n你同时获得了一块“拼图碎片”，集齐6块拼图可以兑换小礼物哦！\\n\\n快去探索下一个任务吧！\\n', '3', '09-A,A;09-B,B;09-C,C;09-D,D');
INSERT INTO `Exam` VALUES ('103', '齐白石', '10', '你知道徐悲鸿的这位好友是谁了吗？请在下面写出他的名字吧！', '很遗憾，你的回答错误，请你再仔细观察一下吧！', '探索任务', '', '110', '10 高山流水', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '0', '恭喜你，你出色地完成了所有探索任务！\\n\\n  下面还有一个加分任务，完成这个任务你将获得额外积分奖励哦！\\n\\n 你也可以直接前往二楼展厅，在那里你可以和大师共同完成一幅画作哦。\\n', '1', '');
INSERT INTO `Exam` VALUES ('104', 'C', '10', '徐悲鸿留下了很多与其他画家的共同完成的作品，编号为10-A、10-B、10-C、10-D的答题卡中，哪一幅是与这位知己好友共同完成的？', '很遗憾，你的回答错误，请你再仔细观察一下吧！', '加分任务', '', '110', '10 高山流水', 'BX04', '2020-10-12/44dad0f7-4723-4b53-ae4e-85fb1d3ca2cc_bx04.jpg', '0', '恭喜你，你出色地完成了所有探索任务！\\n\\n接下来请你前往二楼展厅，那里有一幅画家未能完成的画稿，你可以和大师共同完成一幅画作哦。\\n', '3', '10-A,A;10-B,B;10-C,C;10-D,D');
INSERT INTO `Exam` VALUES ('197', '', '1', '在画作前模仿其中一个人物的动作和表情拍一张照片并上传。\\n\\n完成这项任务，你将获得额外的10个积分哦！', '', '加分任务', '', '107', '07 借古说今', '', '', '0', '恭喜你，获得了额外的10个积分！\\n\\n快去探索下一个任务吧！\\n', '2', '');
INSERT INTO `Exam` VALUES ('198', '34', '10', '请你仔细数一数，这幅画中有多少个人物？\\n\\n要注意，并不是所有画中的人物都有完整的面部哦，例如下面这张图。\\n', '很遗憾，你的回答错误，请你再仔细观察一下吧！', '加分任务', '2020-10-30/063773dd-2d84-4ebc-b4f0-e943fb3f1e46_tywbs.jpg', '106', '06 家国情怀', 'BX04', '2020-10-12/44dad0f7-4723-4b53-ae4e-85fb1d3ca2cc_bx04.jpg', '0', '恭喜你，回答正确，奖励10个积分！\\n你同时获得了一块“拼图碎片”，集齐6块拼图可以兑换小礼物哦！\\n\\n快去探索下一个任务吧！\\n', '1', '');

-- ----------------------------
-- Table structure for Goods
-- ----------------------------
DROP TABLE IF EXISTS `Goods`;
CREATE TABLE `Goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `brand` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `brandorcatemsid` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `cate` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `cid` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `cid2` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `cid2Name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `cid3` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `cid3Name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `cidName` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `domain` int(11) DEFAULT NULL,
  `endtime` bigint(20) DEFAULT NULL,
  `huashu` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `iddayu` bigint(20) DEFAULT NULL,
  `inOrderCount` int(11) DEFAULT NULL,
  `linktype` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `materialUrl` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(1000) COLLATE utf8mb4_bin DEFAULT NULL,
  `oneflag` int(11) DEFAULT NULL,
  `orderby` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `price` float DEFAULT NULL,
  `pricel` float DEFAULT NULL,
  `q` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `ratio` int(11) DEFAULT NULL,
  `recpoint` varchar(1000) COLLATE utf8mb4_bin DEFAULT NULL,
  `remark` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL,
  `skuid` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `skulink` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `skupicture` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `updatetime` bigint(20) DEFAULT NULL,
  `upindex` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of Goods
-- ----------------------------

-- ----------------------------
-- Table structure for Line
-- ----------------------------
DROP TABLE IF EXISTS `Line`;
CREATE TABLE `Line` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL,
  `jingdu` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL,
  `picture1` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `picture2` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `picture3` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `weidu` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `canyu` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `changdu` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `dianshu` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `jifen` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `yidaka` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `yijifen` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `yiyongshi` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `ditudaxiao` int(11) DEFAULT NULL,
  `qiandaojuli` int(11) DEFAULT NULL,
  `shunxu` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `shijian` bigint(20) DEFAULT NULL,
  `onshow` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `mima` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `orderflag` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `qizhidaxiao` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of Line
-- ----------------------------
INSERT INTO `Line` VALUES ('1', 'wb封面专用-请勿删除', '1', 'wb封面专用-请勿删除', '2020-09-28/f397513e-a8b4-4cd3-bfbe-09f4949455e1_xbhfmt2.jpg', '2020-10-30/3b733a75-2c37-49da-b476-067ba5bc92d4_fmt.jpg', null, '1', null, '1', '1', '1', null, null, null, '14', '1000', '1', null, '0', '', '0', '17');
INSERT INTO `Line` VALUES ('3', '', '1', 'wb分享页背景图专用-请勿删除', '2020-10-30/96a3b3da-c347-4543-8d7f-47db85bc1565_btj.jpg', '2020-10-30/cfff096e-a433-4782-9fed-bcc687b1afca_wbtmxcxm.jpg', null, '1', null, '1', '1', '1', null, null, null, '14', '1000', '', null, '0', '', '0', '17');
INSERT INTO `Line` VALUES ('10', '', '116.371565', '探索美的秘密', '2020-10-30/2a3e60d4-def9-4697-a5ae-84fbbbff3cea_xbhlb.jpg', '2020-10-30/3b733a75-2c37-49da-b476-067ba5bc92d4_fmt.jpg', '2020-10-30/9b74fa0c-8a15-4854-b8c7-5fdc4b14213e_ditu.png', '39.945049', null, '1.5', '10', '120', null, null, null, '16', '99999', '1', '180000000', '1', '', '1', '18');

-- ----------------------------
-- Table structure for LineUser
-- ----------------------------
DROP TABLE IF EXISTS `LineUser`;
CREATE TABLE `LineUser` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addScore` int(11) DEFAULT NULL,
  `begintime` bigint(20) DEFAULT NULL,
  `endtime` bigint(20) DEFAULT NULL,
  `finish` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `flag` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `lineid` bigint(20) DEFAULT NULL,
  `linename` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `line_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_3u716wc9ulvg8030fesbnqm19` (`user_id`),
  KEY `FK_dpw0r3k83ulfih2964tq7cl4l` (`line_id`),
  CONSTRAINT `FK_3u716wc9ulvg8030fesbnqm19` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_dpw0r3k83ulfih2964tq7cl4l` FOREIGN KEY (`line_id`) REFERENCES `Line` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=926 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of LineUser
-- ----------------------------
INSERT INTO `LineUser` VALUES ('885', '0', null, null, null, '1', '10', null, '74042', null, '10', '74042');
INSERT INTO `LineUser` VALUES ('887', '0', '1600748457203', null, null, '2', '10', null, '74044', null, '10', '74044');
INSERT INTO `LineUser` VALUES ('888', '0', null, null, null, '1', '10', null, '74044', null, '10', '74044');
INSERT INTO `LineUser` VALUES ('890', '0', '1600749409558', '1604025341958', '1', '2', '10', null, '74043', null, '10', '74043');
INSERT INTO `LineUser` VALUES ('891', '0', '1602488397267', null, null, '1', '10', null, '74046', null, '10', '74046');
INSERT INTO `LineUser` VALUES ('892', '0', '1600751376453', null, null, '2', '10', null, '74046', null, '10', '74046');
INSERT INTO `LineUser` VALUES ('893', '0', '1604128633677', null, null, '1', '10', null, '74048', null, '10', '74048');
INSERT INTO `LineUser` VALUES ('895', '0', '1600814064029', null, null, '2', '10', null, '74049', null, '10', '74049');
INSERT INTO `LineUser` VALUES ('896', '0', '1600955149196', null, null, '2', '10', null, '74050', null, '10', '74050');
INSERT INTO `LineUser` VALUES ('899', '0', '1601286363646', null, null, '2', '10', null, '74051', null, '10', '74051');
INSERT INTO `LineUser` VALUES ('900', '0', null, null, null, '1', '10', null, '74051', null, '10', '74051');
INSERT INTO `LineUser` VALUES ('901', '0', null, null, null, '1', '10', null, '74052', null, '10', '74052');
INSERT INTO `LineUser` VALUES ('904', '0', null, null, null, '1', '10', null, '74054', null, '10', '74054');
INSERT INTO `LineUser` VALUES ('905', '0', '1602232048279', null, null, '2', '10', null, '74054', null, '10', '74054');
INSERT INTO `LineUser` VALUES ('906', '0', null, null, null, '1', '10', null, '74055', null, '10', '74055');
INSERT INTO `LineUser` VALUES ('922', '0', '1602300003136', null, null, '2', '10', null, '74056', null, '10', '74056');
INSERT INTO `LineUser` VALUES ('923', '0', '1604020058068', null, null, '1', '10', null, '74043', null, '10', '74043');
INSERT INTO `LineUser` VALUES ('925', '0', '1604032796933', null, null, '1', '10', null, '74047', null, '10', '74047');

-- ----------------------------
-- Table structure for Message
-- ----------------------------
DROP TABLE IF EXISTS `Message`;
CREATE TABLE `Message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `avatarUrl` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL,
  `time` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `lineid` bigint(20) DEFAULT NULL,
  `linename` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `show` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of Message
-- ----------------------------

-- ----------------------------
-- Table structure for Point
-- ----------------------------
DROP TABLE IF EXISTS `Point`;
CREATE TABLE `Point` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `jingdu` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `lineid` bigint(20) DEFAULT NULL,
  `linename` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL,
  `picture1` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `picture2` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `picture3` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `weidu` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `line_id` bigint(20) DEFAULT NULL,
  `jifen` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `shunxu` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_r331p3se0a84rdv9o1k4djlsp` (`line_id`),
  CONSTRAINT `FK_r331p3se0a84rdv9o1k4djlsp` FOREIGN KEY (`line_id`) REFERENCES `Line` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of Point
-- ----------------------------
INSERT INTO `Point` VALUES ('1', '每日打卡题库专用-请勿删除', '1', '2', '每日打卡题库专用-请勿删除', '每日打卡题库专用-请勿删除', '', null, null, '1', null, '1', '1');
INSERT INTO `Point` VALUES ('101', '', '116.371565', '10', '探索美的秘密', '01 徐悲鸿教你如何画马', '', null, null, '39.945049', null, '10', '1');
INSERT INTO `Point` VALUES ('102', '', '116.371565', '10', '探索美的秘密', '02 中国画', '', null, null, '39.945049', null, '10', '2');
INSERT INTO `Point` VALUES ('103', '', '116.371565', '10', '探索美的秘密', '03 徐悲鸿的“动物园”', '', null, null, '39.945049', null, '10', '3');
INSERT INTO `Point` VALUES ('104', '', '116.371565', '10', '探索美的秘密', '04 心中的圣山', '', null, null, '39.945049', null, '10', '4');
INSERT INTO `Point` VALUES ('105', '', '116.371565', '10', '探索美的秘密', '05 著书立说', '', null, null, '39.945049', null, '10', '5');
INSERT INTO `Point` VALUES ('106', '', '116.371565', '10', '探索美的秘密', '06 家国情怀', '', null, null, '39.945049', null, '10', '6');
INSERT INTO `Point` VALUES ('107', '', '116.371565', '10', '探索美的秘密', '07 借古说今', '', null, null, '39.945049', null, '10', '7');
INSERT INTO `Point` VALUES ('108', '', '116.371565', '10', '探索美的秘密', '08 大师与大师', '', null, null, '39.945049', null, '10', '8');
INSERT INTO `Point` VALUES ('109', '', '116.371565', '10', '探索美的秘密', '09 守护珍宝', '', null, null, '39.945049', null, '10', '9');
INSERT INTO `Point` VALUES ('110', '', '116.371565', '10', '探索美的秘密', '10 高山流水', '', null, null, '39.945049', null, '10', '10');
INSERT INTO `Point` VALUES ('137', '封面专用-图1', '1', '1', '封面专用', '封面专用-图1', '2020-09-10/c04b26c9-e0c4-4404-8112-27afc033988c_icon-des - d@3x.png', null, null, '1', null, '1', null);
INSERT INTO `Point` VALUES ('138', '封面专用-图2', '1', '1', '封面专用', '封面专用-图2', '2020-09-10/04a76303-066e-46b2-89bb-27b8142d8900_icon-des - und@2x.png', null, null, '1', null, '1', '1');
INSERT INTO `Point` VALUES ('139', '封面专用-图3', '1', '1', 'wb封面专用-请勿删除', '封面专用-图3', '2020-10-30/9b74fa0c-8a15-4854-b8c7-5fdc4b14213e_ditu.png', null, null, '1', null, '1', '1');
INSERT INTO `Point` VALUES ('140', '分享页背景图专用-请勿删除1', '1', '3', 'wb分享页背景图专用-请勿删除', '分享页背景图专用-请勿删除1', '2020-10-30/2a3e60d4-def9-4697-a5ae-84fbbbff3cea_xbhlb.jpg', null, null, '1', null, '1', '1');

-- ----------------------------
-- Table structure for PointUserinfo
-- ----------------------------
DROP TABLE IF EXISTS `PointUserinfo`;
CREATE TABLE `PointUserinfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addScore` int(11) DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `finish` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `message` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL,
  `picture` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `pointid` bigint(20) DEFAULT NULL,
  `pointname` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `point_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `lineid` bigint(20) DEFAULT NULL,
  `time` bigint(20) DEFAULT NULL,
  `answer` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `examid` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `prize` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `prizeimg` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `cate` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `chance` int(11) DEFAULT NULL,
  `linename` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_lowy535ea3jphxc41e7inx3tg` (`point_id`),
  KEY `FK_7vfyny3rqa9u7x8v8yixrdekk` (`user_id`),
  CONSTRAINT `FK_7vfyny3rqa9u7x8v8yixrdekk` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`),
  CONSTRAINT `FK_lowy535ea3jphxc41e7inx3tg` FOREIGN KEY (`point_id`) REFERENCES `Point` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=339 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of PointUserinfo
-- ----------------------------
INSERT INTO `PointUserinfo` VALUES ('184', '10', '', '1', '', '', '', '101', '01 徐悲鸿教你如何画马', '74042', '早起的小闹钟', null, null, '10', '1603281171800', 'B', '18', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('185', '10', '', '1', '', '', '', '101', '01 徐悲鸿教你如何画马', '74078', '小燕子?', null, null, '10', '1603592504100', 'B', '18', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('186', '10', '', '1', '', '', '', '101', '01 徐悲鸿教你如何画马', '74076', 'Kepler-Tracer', null, null, '10', '1603592514100', 'B', '18', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('187', '10', '', '1', '', '', '', '101', '01 徐悲鸿教你如何画马', '74075', '可爱的小企鹅?', null, null, '10', '1603592520700', 'B; B', '18', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '8', '');
INSERT INTO `PointUserinfo` VALUES ('188', '10', '', '1', '', '', '', '101', '01 徐悲鸿教你如何画马', '74077', 'Mnixy', null, null, '10', '1603592525700', 'B', '18', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('189', '10', '', '1', '', '', '', '101', '01 徐悲鸿教你如何画马', '74074', 'XY i MN', null, null, '10', '1603592526000', 'B', '18', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('190', '10', '', '1', '', '', '', '101', '01 徐悲鸿教你如何画马', '74079', 'A. ?????', null, null, '10', '1603592529700', 'B', '18', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('191', '10', '', '1', '', '', '', '102', '02 中国画', '74074', 'XY i MN', null, null, '10', '1603592573600', 'D', '95', 'BX02', '2020-10-12/e96154e9-fe41-4a16-9c01-aba0d6d91f3b_bx02.jpg', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('192', '10', '', '1', '', '', '', '103', '03 徐悲鸿的“动物园”', '74074', 'XY i MN', null, null, '10', '1603592599900', 'A', '96', 'BX06', '2020-10-12/b95c0ff2-9acf-4d17-af5a-14ec4165626b_bx06.jpg', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('193', '10', '', '1', '', '', '', '104', '04 心中的圣山', '74074', 'XY i MN', null, null, '10', '1603592640200', 'D; C; B; B; D; B; A', '97', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '8', '');
INSERT INTO `PointUserinfo` VALUES ('194', '10', '', '1', '', '', '', '102', '02 中国画', '74076', 'Kepler-Tracer', null, null, '10', '1603592670300', 'D', '95', 'BX02', '2020-10-12/e96154e9-fe41-4a16-9c01-aba0d6d91f3b_bx02.jpg', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('195', '10', '', '1', '', '', '', '102', '02 中国画', '74078', '小燕子?', null, null, '10', '1603592671600', 'D', '95', 'BX02', '2020-10-12/e96154e9-fe41-4a16-9c01-aba0d6d91f3b_bx02.jpg', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('196', '10', '', '1', '', '', '', '102', '02 中国画', '74075', '可爱的小企鹅?', null, null, '10', '1603592671800', 'D; D', '95', 'BX02', '2020-10-12/e96154e9-fe41-4a16-9c01-aba0d6d91f3b_bx02.jpg', '3', '8', '');
INSERT INTO `PointUserinfo` VALUES ('197', '10', '', '1', '', '', '', '102', '02 中国画', '74079', 'A. ?????', null, null, '10', '1603592704200', 'D', '95', 'BX02', '2020-10-12/e96154e9-fe41-4a16-9c01-aba0d6d91f3b_bx02.jpg', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('198', '10', '', '1', '', '', '', '103', '03 徐悲鸿的“动物园”', '74079', 'A. ?????', null, null, '10', '1603592717400', 'A', '96', 'BX06', '2020-10-12/b95c0ff2-9acf-4d17-af5a-14ec4165626b_bx06.jpg', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('199', '10', '', '1', '', '', '', '104', '04 心中的圣山', '74079', 'A. ?????', null, null, '10', '1603592738200', 'A', '97', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('200', '10', '', '1', '', '', '', '105', '05 著书立说', '74074', 'XY i MN', null, null, '10', '1603592799700', 'C', '98', 'BX01', '2020-10-12/877fc95c-e48d-47ff-aaa5-bc38d3a414eb_bx01.jpg', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('201', '10', '', '1', '', '', '', '103', '03 徐悲鸿的“动物园”', '74078', '小燕子?', null, null, '10', '1603592800200', 'A', '96', 'BX06', '2020-10-12/b95c0ff2-9acf-4d17-af5a-14ec4165626b_bx06.jpg', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('202', '10', '', '1', '', '', '', '105', '05 著书立说', '74079', 'A. ?????', null, null, '10', '1603592801700', 'C; C', '98', 'BX01', '2020-10-12/877fc95c-e48d-47ff-aaa5-bc38d3a414eb_bx01.jpg', '3', '8', '');
INSERT INTO `PointUserinfo` VALUES ('203', '10', '', '1', '', '', '', '103', '03 徐悲鸿的“动物园”', '74075', '可爱的小企鹅?', null, null, '10', '1603592803400', 'A', '96', 'BX06', '2020-10-12/b95c0ff2-9acf-4d17-af5a-14ec4165626b_bx06.jpg', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('204', '10', '', '1', '', '', '', '103', '03 徐悲鸿的“动物园”', '74076', 'Kepler-Tracer', null, null, '10', '1603592811000', 'A; A; A; A; A; A', '96', 'BX06', '2020-10-12/b95c0ff2-9acf-4d17-af5a-14ec4165626b_bx06.jpg', '3', '8', '');
INSERT INTO `PointUserinfo` VALUES ('205', '10', '', '1', '', '', '', '106', '06 家国情怀', '74074', 'XY i MN', null, null, '10', '1603592864200', 'A', '99', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('206', '10', '', '1', '', '', '', '104', '04 心中的圣山', '74078', '小燕子?', null, null, '10', '1603592925800', 'A', '97', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('207', '10', '', '1', '', '', '', '104', '04 心中的圣山', '74076', 'Kepler-Tracer', null, null, '10', '1603592930400', 'A', '97', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('208', '10', '', '1', '', '', '', '104', '04 心中的圣山', '74075', '可爱的小企鹅?', null, null, '10', '1603592930800', 'A', '97', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('209', '10', '', '1', '', '', '', '105', '05 著书立说', '74078', '小燕子?', null, null, '10', '1603592969200', 'C', '98', 'BX01', '2020-10-12/877fc95c-e48d-47ff-aaa5-bc38d3a414eb_bx01.jpg', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('210', '10', '', '1', '', '', '', '105', '05 著书立说', '74075', '可爱的小企鹅?', null, null, '10', '1603592983700', 'C', '98', 'BX01', '2020-10-12/877fc95c-e48d-47ff-aaa5-bc38d3a414eb_bx01.jpg', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('211', '10', '', '1', '', '', '', '105', '05 著书立说', '74076', 'Kepler-Tracer', null, null, '10', '1603592985500', 'C', '98', 'BX01', '2020-10-12/877fc95c-e48d-47ff-aaa5-bc38d3a414eb_bx01.jpg', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('212', '10', '', '1', '', '', '', '107', '07 借古说今', '74074', 'XY i MN', null, null, '10', '1603593032400', 'B; D', '100', 'BX03', '2020-10-12/3020d2e0-6fb8-4862-81a3-4a20ae0a0656_bx03.jpg', '3', '8', '');
INSERT INTO `PointUserinfo` VALUES ('213', '10', '', '1', '', '', '', '106', '06 家国情怀', '74078', '小燕子?', null, null, '10', '1603593038300', 'A', '99', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('214', '10', '', '1', '', '', '', '106', '06 家国情怀', '74076', 'Kepler-Tracer', null, null, '10', '1603593042500', 'A', '99', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('215', '10', '', '1', '', '', '', '106', '06 家国情怀', '74079', 'A. ?????', null, null, '10', '1603593051100', 'A', '99', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('216', '10', '', '1', '', '', '', '106', '06 家国情怀', '74075', '可爱的小企鹅?', null, null, '10', '1603593051300', 'A', '99', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('217', '10', '', '1', '', '', '', '107', '07 借古说今', '74079', 'A. ?????', null, null, '10', '1603593070400', 'D', '100', 'BX03', '2020-10-12/3020d2e0-6fb8-4862-81a3-4a20ae0a0656_bx03.jpg', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('218', '10', '', '1', '', '', '', '107', '07 借古说今', '74076', 'Kepler-Tracer', null, null, '10', '1603593112000', 'D', '100', 'BX03', '2020-10-12/3020d2e0-6fb8-4862-81a3-4a20ae0a0656_bx03.jpg', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('219', '10', '', '1', '', '', '', '107', '07 借古说今', '74078', '小燕子?', null, null, '10', '1603593112600', 'D', '100', 'BX03', '2020-10-12/3020d2e0-6fb8-4862-81a3-4a20ae0a0656_bx03.jpg', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('220', '10', '', '1', '', '', '', '107', '07 借古说今', '74075', '可爱的小企鹅?', null, null, '10', '1603593116700', 'D', '100', 'BX03', '2020-10-12/3020d2e0-6fb8-4862-81a3-4a20ae0a0656_bx03.jpg', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('221', '10', '', '1', '', '', '', '108', '08 大师与大师', '74074', 'XY i MN', null, null, '10', '1603593132400', 'C', '101', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('222', '10', '', '1', '', '', '', '108', '08 大师与大师', '74079', 'A. ?????', null, null, '10', '1603593137100', 'C', '101', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('223', '10', '', '1', '', '', '', '108', '08 大师与大师', '74076', 'Kepler-Tracer', null, null, '10', '1603593149600', 'C; C', '101', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '8', '');
INSERT INTO `PointUserinfo` VALUES ('224', '10', '', '1', '', '', '', '101', '01 徐悲鸿教你如何画马', '74080', '悦', null, null, '10', '1603593154400', 'B', '18', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('225', '10', '', '1', '', '', '', '101', '01 徐悲鸿教你如何画马', '74081', '李晴', null, null, '10', '1603593160100', 'B', '18', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('226', '10', '', '1', '', '', '', '109', '09 守护珍宝', '74074', 'XY i MN', null, null, '10', '1603593169600', 'A', '102', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('227', '10', '', '1', '', '', '', '108', '08 大师与大师', '74078', '小燕子?', null, null, '10', '1603593172500', 'C', '101', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('228', '10', '', '1', '', '', '', '108', '08 大师与大师', '74075', '可爱的小企鹅?', null, null, '10', '1603593175200', 'C', '101', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('229', '10', '', '1', '', '', '', '109', '09 守护珍宝', '74079', 'A. ?????', null, null, '10', '1603593183000', 'A', '102', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('230', '10', '', '1', '', '', '', '109', '09 守护珍宝', '74078', '小燕子?', null, null, '10', '1603593191900', 'A', '102', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('231', '10', '', '1', '', '', '', '109', '09 守护珍宝', '74076', 'Kepler-Tracer', null, null, '10', '1603593193300', 'A', '102', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('232', '10', '', '1', '', '', '', '109', '09 守护珍宝', '74075', '可爱的小企鹅?', null, null, '10', '1603593200500', 'A', '102', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('233', '10', '', '1', '', '', '', '110', '10 高山流水', '74074', 'XY i MN', null, null, '10', '1603593208700', 'C', '103', 'BX04', '2020-10-12/44dad0f7-4723-4b53-ae4e-85fb1d3ca2cc_bx04.jpg', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('234', '10', '', '1', '', '', '', '110', '10 高山流水', '74079', 'A. ?????', null, null, '10', '1603593211100', 'C; A; C', '103', 'BX04', '2020-10-12/44dad0f7-4723-4b53-ae4e-85fb1d3ca2cc_bx04.jpg', '3', '8', '');
INSERT INTO `PointUserinfo` VALUES ('235', '10', '', '1', '', '', '', '110', '10 高山流水', '74078', '小燕子?', null, null, '10', '1603593224600', 'C', '103', 'BX04', '2020-10-12/44dad0f7-4723-4b53-ae4e-85fb1d3ca2cc_bx04.jpg', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('236', '10', '', '1', '', '', '', '110', '10 高山流水', '74076', 'Kepler-Tracer', null, null, '10', '1603593225800', 'C; C', '103', 'BX04', '2020-10-12/44dad0f7-4723-4b53-ae4e-85fb1d3ca2cc_bx04.jpg', '3', '8', '');
INSERT INTO `PointUserinfo` VALUES ('237', '10', '', '1', '', '', '', '110', '10 高山流水', '74075', '可爱的小企鹅?', null, null, '10', '1603593234200', 'C; C; C', '103', 'BX04', '2020-10-12/44dad0f7-4723-4b53-ae4e-85fb1d3ca2cc_bx04.jpg', '3', '8', '');
INSERT INTO `PointUserinfo` VALUES ('238', '10', '', '1', '', '', '', '101', '01 徐悲鸿教你如何画马', '74082', '咸鱼', null, null, '10', '1603593291500', 'B', '18', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('239', '10', '', '1', '', '', '', '102', '02 中国画', '74082', '咸鱼', null, null, '10', '1603593364600', 'C; D', '95', 'BX02', '2020-10-12/e96154e9-fe41-4a16-9c01-aba0d6d91f3b_bx02.jpg', '3', '8', '');
INSERT INTO `PointUserinfo` VALUES ('240', '10', '', '1', '', '', '', '103', '03 徐悲鸿的“动物园”', '74082', '咸鱼', null, null, '10', '1603593417100', 'A', '96', 'BX06', '2020-10-12/b95c0ff2-9acf-4d17-af5a-14ec4165626b_bx06.jpg', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('241', '10', '', '1', '', '', '', '104', '04 心中的圣山', '74082', '咸鱼', null, null, '10', '1603593429300', 'A', '97', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('242', '10', '', '1', '', '', '', '105', '05 著书立说', '74082', '咸鱼', null, null, '10', '1603593481000', 'C', '98', 'BX01', '2020-10-12/877fc95c-e48d-47ff-aaa5-bc38d3a414eb_bx01.jpg', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('243', '10', '', '1', '', '', '', '102', '02 中国画', '74080', '悦', null, null, '10', '1603593550700', 'D', '95', 'BX02', '2020-10-12/e96154e9-fe41-4a16-9c01-aba0d6d91f3b_bx02.jpg', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('244', '10', '', '1', '', '', '', '102', '02 中国画', '74081', '李晴', null, null, '10', '1603593551400', 'D', '95', 'BX02', '2020-10-12/e96154e9-fe41-4a16-9c01-aba0d6d91f3b_bx02.jpg', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('245', '10', '', '1', '', '', '', '106', '06 家国情怀', '74082', '咸鱼', null, null, '10', '1603593589700', 'A', '99', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('246', '10', '', '1', '', '', '', '101', '01 徐悲鸿教你如何画马', '74046', '刁小麦ོ   ', null, null, '10', '1603593611400', 'B', '18', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('247', '10', '', '1', '', '', '', '102', '02 中国画', '74046', '刁小麦ོ   ', null, null, '10', '1603593628800', 'D', '95', 'BX02', '2020-10-12/e96154e9-fe41-4a16-9c01-aba0d6d91f3b_bx02.jpg', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('248', '10', '', '1', '', '', '', '107', '07 借古说今', '74082', '咸鱼', null, null, '10', '1603593640700', 'D', '100', 'BX03', '2020-10-12/3020d2e0-6fb8-4862-81a3-4a20ae0a0656_bx03.jpg', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('249', '10', '', '1', '', '', '', '108', '08 大师与大师', '74082', '咸鱼', null, null, '10', '1603593669000', 'C', '101', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('250', '10', '', '1', '', '', '', '109', '09 守护珍宝', '74082', '咸鱼', null, null, '10', '1603593689800', 'D; A', '102', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '8', '');
INSERT INTO `PointUserinfo` VALUES ('251', '10', '', '1', '', '', '', '110', '10 高山流水', '74082', '咸鱼', null, null, '10', '1603593732500', 'C', '103', 'BX04', '2020-10-12/44dad0f7-4723-4b53-ae4e-85fb1d3ca2cc_bx04.jpg', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('252', '10', '', '1', '', '', '', '103', '03 徐悲鸿的“动物园”', '74081', '李晴', null, null, '10', '1603593831300', 'A', '96', 'BX06', '2020-10-12/b95c0ff2-9acf-4d17-af5a-14ec4165626b_bx06.jpg', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('253', '10', '', '1', '', '', '', '103', '03 徐悲鸿的“动物园”', '74080', '悦', null, null, '10', '1603593902700', 'D; A', '96', 'BX06', '2020-10-12/b95c0ff2-9acf-4d17-af5a-14ec4165626b_bx06.jpg', '3', '8', '');
INSERT INTO `PointUserinfo` VALUES ('254', '10', '', '1', '', '', '', '101', '01 徐悲鸿教你如何画马', '74083', 'Angel', null, null, '10', '1603593970200', 'B', '18', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('255', '0', '', '0', '', '', '', '102', '02 中国画', '74083', 'Angel', null, null, '10', '1603593975600', 'C; A', '95', '答案错误', '', '3', '8', '');
INSERT INTO `PointUserinfo` VALUES ('256', '10', '', '1', '', '', '', '104', '04 心中的圣山', '74080', '悦', null, null, '10', '1603594019900', 'A', '97', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('257', '10', '', '1', '', '', '', '103', '03 徐悲鸿的“动物园”', '74046', '刁小麦ོ   ', null, null, '10', '1603594074700', 'A', '96', 'BX06', '2020-10-12/b95c0ff2-9acf-4d17-af5a-14ec4165626b_bx06.jpg', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('258', '10', '', '1', '', '', '', '104', '04 心中的圣山', '74081', '李晴', null, null, '10', '1603594132800', 'A', '97', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('259', '10', '', '1', '', '', '', '104', '04 心中的圣山', '74046', '刁小麦ོ   ', null, null, '10', '1603594261400', 'A', '97', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('260', '10', '', '1', '', '', '', '105', '05 著书立说', '74081', '李晴', null, null, '10', '1603594582000', 'C', '98', 'BX01', '2020-10-12/877fc95c-e48d-47ff-aaa5-bc38d3a414eb_bx01.jpg', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('261', '10', '', '1', '', '', '', '105', '05 著书立说', '74080', '悦', null, null, '10', '1603594632800', 'A; C', '98', 'BX01', '2020-10-12/877fc95c-e48d-47ff-aaa5-bc38d3a414eb_bx01.jpg', '3', '8', '');
INSERT INTO `PointUserinfo` VALUES ('262', '10', '', '1', '', '', '', '106', '06 家国情怀', '74081', '李晴', null, null, '10', '1603594718300', 'C; A', '99', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '8', '');
INSERT INTO `PointUserinfo` VALUES ('263', '0', '', '1', '', '', '', '106', '06 家国情怀', '74081', '李晴', null, null, '10', '1603594782100', '500', '199', '答案错误', '', '1', '4', '');
INSERT INTO `PointUserinfo` VALUES ('264', '10', '', '1', '', '', '', '107', '07 借古说今', '74081', '李晴', null, null, '10', '1603594825700', 'D; C; D', '100', 'BX03', '2020-10-12/3020d2e0-6fb8-4862-81a3-4a20ae0a0656_bx03.jpg', '3', '8', '');
INSERT INTO `PointUserinfo` VALUES ('265', '10', '', '1', '', '', '', '108', '08 大师与大师', '74081', '李晴', null, null, '10', '1603594910000', 'C', '101', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('266', '10', '', '1', '', '', '', '109', '09 守护珍宝', '74081', '李晴', null, null, '10', '1603594928300', 'C; A; A; A', '102', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '8', '');
INSERT INTO `PointUserinfo` VALUES ('267', '10', '', '1', '', '', '', '110', '10 高山流水', '74081', '李晴', null, null, '10', '1603595189700', 'C', '103', 'BX04', '2020-10-12/44dad0f7-4723-4b53-ae4e-85fb1d3ca2cc_bx04.jpg', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('268', '10', '', '1', '', '', '', '105', '05 著书立说', '74046', '刁小麦ོ   ', null, null, '10', '1603596003500', 'A; C', '98', 'BX01', '2020-10-12/877fc95c-e48d-47ff-aaa5-bc38d3a414eb_bx01.jpg', '3', '8', '');
INSERT INTO `PointUserinfo` VALUES ('269', '10', '', '1', '', '', '', '101', '01 徐悲鸿教你如何画马', '74086', '囍', null, null, '10', '1603596017700', 'C; B', '18', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '8', '');
INSERT INTO `PointUserinfo` VALUES ('270', '10', '', '1', '', '', '', '106', '06 家国情怀', '74046', '刁小麦ོ   ', null, null, '10', '1603596024500', 'C; B; D; A', '99', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '8', '');
INSERT INTO `PointUserinfo` VALUES ('271', '10', '', '1', '', '', '', '107', '07 借古说今', '74046', '刁小麦ོ   ', null, null, '10', '1603596039400', 'C; B; A; D', '100', 'BX03', '2020-10-12/3020d2e0-6fb8-4862-81a3-4a20ae0a0656_bx03.jpg', '3', '8', '');
INSERT INTO `PointUserinfo` VALUES ('272', '10', '', '1', '', '', '', '108', '08 大师与大师', '74046', '刁小麦ོ   ', null, null, '10', '1603596059900', 'B; B; A; C', '101', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '8', '');
INSERT INTO `PointUserinfo` VALUES ('273', '10', '', '1', '', '', '', '109', '09 守护珍宝', '74046', '刁小麦ོ   ', null, null, '10', '1603596077300', 'A', '102', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('274', '10', '', '1', '', '', '', '110', '10 高山流水', '74046', '刁小麦ོ   ', null, null, '10', '1603596082200', 'A; C; C', '103', 'BX04', '2020-10-12/44dad0f7-4723-4b53-ae4e-85fb1d3ca2cc_bx04.jpg', '3', '8', '');
INSERT INTO `PointUserinfo` VALUES ('275', '10', '', '1', '', '', '', '101', '01 徐悲鸿教你如何画马', '74087', '究传', null, null, '10', '1603596132600', 'B', '18', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('276', '10', '', '1', '', '', '', '101', '01 徐悲鸿教你如何画马', '74085', 'ฅ幽凛ฅ', null, null, '10', '1603596166500', 'B', '18', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('277', '10', '', '1', '', '', '', '102', '02 中国画', '74087', '究传', null, null, '10', '1603596207000', 'D', '95', 'BX02', '2020-10-12/e96154e9-fe41-4a16-9c01-aba0d6d91f3b_bx02.jpg', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('278', '10', '', '1', '', '', '', '102', '02 中国画', '74086', '囍', null, null, '10', '1603596231000', 'D', '95', 'BX02', '2020-10-12/e96154e9-fe41-4a16-9c01-aba0d6d91f3b_bx02.jpg', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('279', '10', '', '1', '', '', '', '102', '02 中国画', '74077', 'Mnixy', null, null, '10', '1603596269200', 'D', '95', 'BX02', '2020-10-12/e96154e9-fe41-4a16-9c01-aba0d6d91f3b_bx02.jpg', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('280', '10', '', '1', '', '', '', '103', '03 徐悲鸿的“动物园”', '74077', 'Mnixy', null, null, '10', '1603596281900', 'A', '96', 'BX06', '2020-10-12/b95c0ff2-9acf-4d17-af5a-14ec4165626b_bx06.jpg', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('281', '10', '', '1', '', '', '', '103', '03 徐悲鸿的“动物园”', '74086', '囍', null, null, '10', '1603596284700', 'A', '96', 'BX06', '2020-10-12/b95c0ff2-9acf-4d17-af5a-14ec4165626b_bx06.jpg', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('282', '10', '', '1', '', '', '', '104', '04 心中的圣山', '74077', 'Mnixy', null, null, '10', '1603596322300', 'A', '97', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('283', '10', '', '1', '', '', '', '105', '05 著书立说', '74077', 'Mnixy', null, null, '10', '1603596332500', 'C', '98', 'BX01', '2020-10-12/877fc95c-e48d-47ff-aaa5-bc38d3a414eb_bx01.jpg', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('284', '10', '', '1', '', '', '', '102', '02 中国画', '74085', 'ฅ幽凛ฅ', null, null, '10', '1603596351400', 'D; D; D; D', '95', 'BX02', '2020-10-12/e96154e9-fe41-4a16-9c01-aba0d6d91f3b_bx02.jpg', '3', '8', '');
INSERT INTO `PointUserinfo` VALUES ('285', '10', '', '1', '', '', '', '106', '06 家国情怀', '74077', 'Mnixy', null, null, '10', '1603596351400', 'A; A', '99', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '8', '');
INSERT INTO `PointUserinfo` VALUES ('286', '10', '', '1', '', '', '', '103', '03 徐悲鸿的“动物园”', '74087', '究传', null, null, '10', '1603596365200', 'A', '96', 'BX06', '2020-10-12/b95c0ff2-9acf-4d17-af5a-14ec4165626b_bx06.jpg', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('287', '10', '', '1', '', '', '', '107', '07 借古说今', '74077', 'Mnixy', null, null, '10', '1603596377600', 'D', '100', 'BX03', '2020-10-12/3020d2e0-6fb8-4862-81a3-4a20ae0a0656_bx03.jpg', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('288', '10', '', '1', '', '', '', '108', '08 大师与大师', '74077', 'Mnixy', null, null, '10', '1603596406600', 'C', '101', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('289', '10', '', '1', '', '', '', '104', '04 心中的圣山', '74086', '囍', null, null, '10', '1603596408200', 'A', '97', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('290', '10', '', '1', '', '', '', '109', '09 守护珍宝', '74077', 'Mnixy', null, null, '10', '1603596416600', 'A', '102', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('291', '10', '', '1', '', '', '', '110', '10 高山流水', '74077', 'Mnixy', null, null, '10', '1603596430000', 'C', '103', 'BX04', '2020-10-12/44dad0f7-4723-4b53-ae4e-85fb1d3ca2cc_bx04.jpg', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('292', '10', '', '1', '', '', '', '104', '04 心中的圣山', '74087', '究传', null, null, '10', '1603596437700', 'A', '97', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('293', '10', '', '1', '', '', '', '105', '05 著书立说', '74087', '究传', null, null, '10', '1603596458600', 'C', '98', 'BX01', '2020-10-12/877fc95c-e48d-47ff-aaa5-bc38d3a414eb_bx01.jpg', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('294', '10', '', '1', '', '', '', '105', '05 著书立说', '74086', '囍', null, null, '10', '1603596466400', 'C', '98', 'BX01', '2020-10-12/877fc95c-e48d-47ff-aaa5-bc38d3a414eb_bx01.jpg', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('295', '10', '', '1', '', '', '', '103', '03 徐悲鸿的“动物园”', '74085', 'ฅ幽凛ฅ', null, null, '10', '1603596492600', 'A', '96', 'BX06', '2020-10-12/b95c0ff2-9acf-4d17-af5a-14ec4165626b_bx06.jpg', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('296', '10', '', '1', '', '', '', '104', '04 心中的圣山', '74085', 'ฅ幽凛ฅ', null, null, '10', '1603596593600', 'D; C; B; A', '97', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '8', '');
INSERT INTO `PointUserinfo` VALUES ('297', '10', '', '1', '', '', '', '106', '06 家国情怀', '74086', '囍', null, null, '10', '1603596597200', 'A', '99', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('298', '10', '', '1', '', '', '', '106', '06 家国情怀', '74087', '究传', null, null, '10', '1603596599100', 'A', '99', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('299', '10', '', '1', '', '', '', '105', '05 著书立说', '74085', 'ฅ幽凛ฅ', null, null, '10', '1603596672000', 'A; C', '98', 'BX01', '2020-10-12/877fc95c-e48d-47ff-aaa5-bc38d3a414eb_bx01.jpg', '3', '8', '');
INSERT INTO `PointUserinfo` VALUES ('300', '10', '', '1', '', '', '', '106', '06 家国情怀', '74086', '囍', null, null, '10', '1603596674900', '33', '199', 'BX05', '2020-10-12/8cb8fb4b-1f62-43e6-bf7d-62bbf1bc7c9f_bx05.jpg', '1', '4', '');
INSERT INTO `PointUserinfo` VALUES ('301', '10', '', '1', '', '', '', '107', '07 借古说今', '74087', '究传', null, null, '10', '1603596700600', 'D', '100', 'BX03', '2020-10-12/3020d2e0-6fb8-4862-81a3-4a20ae0a0656_bx03.jpg', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('302', '10', '', '1', '', '', '', '107', '07 借古说今', '74086', '囍', null, null, '10', '1603596708500', 'D', '100', 'BX03', '2020-10-12/3020d2e0-6fb8-4862-81a3-4a20ae0a0656_bx03.jpg', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('303', '10', '', '1', '', '', '', '108', '08 大师与大师', '74087', '究传', null, null, '10', '1603596799800', 'C', '101', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('304', '10', '', '1', '', '', '', '108', '08 大师与大师', '74086', '囍', null, null, '10', '1603596810900', 'C', '101', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('305', '10', '', '1', '', '', '', '109', '09 守护珍宝', '74087', '究传', null, null, '10', '1603596821000', 'A', '102', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('306', '10', '', '1', '', '', '', '106', '06 家国情怀', '74085', 'ฅ幽凛ฅ', null, null, '10', '1603596838900', 'C; A; A', '99', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '8', '');
INSERT INTO `PointUserinfo` VALUES ('307', '10', '', '1', '', '', '', '109', '09 守护珍宝', '74086', '囍', null, null, '10', '1603596860400', 'A', '102', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('308', '10', '', '1', '', '', '', '110', '10 高山流水', '74087', '究传', null, null, '10', '1603596880400', 'C', '103', 'BX04', '2020-10-12/44dad0f7-4723-4b53-ae4e-85fb1d3ca2cc_bx04.jpg', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('309', '10', '', '1', '', '', '', '110', '10 高山流水', '74086', '囍', null, null, '10', '1603596895900', 'C', '103', 'BX04', '2020-10-12/44dad0f7-4723-4b53-ae4e-85fb1d3ca2cc_bx04.jpg', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('310', '10', '', '1', '', '', '', '107', '07 借古说今', '74085', 'ฅ幽凛ฅ', null, null, '10', '1603596960600', 'D', '100', 'BX03', '2020-10-12/3020d2e0-6fb8-4862-81a3-4a20ae0a0656_bx03.jpg', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('311', '10', '', '1', '', '', '', '108', '08 大师与大师', '74085', 'ฅ幽凛ฅ', null, null, '10', '1603596992400', 'C', '101', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('312', '10', '', '1', '', '', '', '109', '09 守护珍宝', '74085', 'ฅ幽凛ฅ', null, null, '10', '1603597024300', 'A', '102', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('313', '10', '', '1', '', '', '', '110', '10 高山流水', '74085', 'ฅ幽凛ฅ', null, null, '10', '1603597077800', 'C', '103', 'BX04', '2020-10-12/44dad0f7-4723-4b53-ae4e-85fb1d3ca2cc_bx04.jpg', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('314', '10', '', '1', '', '', '', '101', '01 徐悲鸿教你如何画马', '74043', '李春波', null, null, '10', '1603597256300', 'B', '18', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('315', '10', '', '1', '', '', '', '102', '02 中国画', '74043', '李春波', null, null, '10', '1603597550200', 'D', '95', 'BX02', '2020-10-12/e96154e9-fe41-4a16-9c01-aba0d6d91f3b_bx02.jpg', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('316', '10', '', '1', '', '', '', '103', '03 徐悲鸿的“动物园”', '74043', '李春波', null, null, '10', '1603598001600', 'A', '96', 'BX06', '2020-10-12/b95c0ff2-9acf-4d17-af5a-14ec4165626b_bx06.jpg', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('317', '10', '', '1', '', '', '', '104', '04 心中的圣山', '74043', '李春波', null, null, '10', '1603598414100', 'C; A', '97', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '8', '');
INSERT INTO `PointUserinfo` VALUES ('318', '10', '', '1', '', '', '', '105', '05 著书立说', '74043', '李春波', null, null, '10', '1603599556000', 'C', '98', 'BX01', '2020-10-12/877fc95c-e48d-47ff-aaa5-bc38d3a414eb_bx01.jpg', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('319', '10', '', '1', '', '', '', '106', '06 家国情怀', '74043', '李春波', null, null, '10', '1603600079000', 'A', '99', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('320', '10', '', '1', '', '', '', '106', '06 家国情怀', '74043', '李春波', null, null, '10', '1603600122200', '32; 33', '199', 'BX05', '2020-10-12/8cb8fb4b-1f62-43e6-bf7d-62bbf1bc7c9f_bx05.jpg', '1', '3', '');
INSERT INTO `PointUserinfo` VALUES ('321', '10', '', '1', '', '', '', '107', '07 借古说今', '74043', '李春波', null, null, '10', '1603600567200', 'D', '100', 'BX03', '2020-10-12/3020d2e0-6fb8-4862-81a3-4a20ae0a0656_bx03.jpg', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('322', '10', '', '1', '', '', '2020-10-25/tmp_b367f1b13fe150660d10bfdc495aba5429d3be9e11407641.jpg', '107', '07 借古说今', '74043', '李春波', null, null, '10', '1603600632200', '', '197', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '2', '0', '');
INSERT INTO `PointUserinfo` VALUES ('323', '10', '', '1', '', '', '', '108', '08 大师与大师', '74043', '李春波', null, null, '10', '1603600934000', 'C', '101', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('324', '10', '', '1', '', '', '', '109', '09 守护珍宝', '74043', '李春波', null, null, '10', '1603601321600', 'A', '102', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('325', '10', '', '1', '', '', '', '110', '10 高山流水', '74043', '李春波', null, null, '10', '1603601839800', 'C', '103', 'BX04', '2020-10-12/44dad0f7-4723-4b53-ae4e-85fb1d3ca2cc_bx04.jpg', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('326', '10', '', '1', '', '', '', '101', '01 徐悲鸿教你如何画马', '74058', '李春波', null, null, '10', '1603623520700', 'B', '18', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('327', '10', '', '1', '', '', '', '102', '02 中国画', '74058', '李春波', null, null, '10', '1603623532200', 'C; C; A; D', '95', 'BX02', '2020-10-12/e96154e9-fe41-4a16-9c01-aba0d6d91f3b_bx02.jpg', '3', '8', '');
INSERT INTO `PointUserinfo` VALUES ('328', '10', '', '1', '', '', '', '103', '03 徐悲鸿的“动物园”', '74058', '李春波', null, null, '10', '1603623762400', 'C; D; A', '96', 'BX06', '2020-10-12/b95c0ff2-9acf-4d17-af5a-14ec4165626b_bx06.jpg', '3', '8', '');
INSERT INTO `PointUserinfo` VALUES ('329', '10', '', '1', '', '', '', '104', '04 心中的圣山', '74058', '李春波', null, null, '10', '1603623848800', 'A', '97', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('330', '10', '', '1', '', '', '', '105', '05 著书立说', '74058', '李春波', null, null, '10', '1603623901300', 'B; C', '98', 'BX01', '2020-10-12/877fc95c-e48d-47ff-aaa5-bc38d3a414eb_bx01.jpg', '3', '8', '');
INSERT INTO `PointUserinfo` VALUES ('331', '10', '', '1', '', '', '', '106', '06 家国情怀', '74058', '李春波', null, null, '10', '1603623934100', 'B; A', '99', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '8', '');
INSERT INTO `PointUserinfo` VALUES ('332', '10', '', '1', '', '', '', '107', '07 借古说今', '74058', '李春波', null, null, '10', '1603623985000', 'B; C; D', '100', 'BX03', '2020-10-12/3020d2e0-6fb8-4862-81a3-4a20ae0a0656_bx03.jpg', '3', '8', '');
INSERT INTO `PointUserinfo` VALUES ('333', '10', '', '1', '', '', '', '108', '08 大师与大师', '74058', '李春波', null, null, '10', '1603624009500', 'A; C', '101', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '8', '');
INSERT INTO `PointUserinfo` VALUES ('334', '10', '', '1', '', '', '', '109', '09 守护珍宝', '74058', '李春波', null, null, '10', '1603624024000', 'A', '102', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '9', '');
INSERT INTO `PointUserinfo` VALUES ('336', '10', '', '1', '', '', '', '110', '10 高山流水', '74058', '李春波', null, null, '10', '1603634101100', '齐白石; 齐白石', '103', '', '', '1', '8', '');
INSERT INTO `PointUserinfo` VALUES ('337', '10', '', '1', '', '', '', '110', '10 高山流水', '74058', '李春波', null, null, '10', '1603634109200', 'A; C; C', '105', 'BX04', '2020-10-12/44dad0f7-4723-4b53-ae4e-85fb1d3ca2cc_bx04.jpg', '3', '8', '');
INSERT INTO `PointUserinfo` VALUES ('338', '10', null, '1', null, null, '', '101', '01 徐悲鸿教你如何画马', '74048', 'Kylin', null, null, '10', '1604128641927', 'A; B', '18', 'LOGO', '2020-10-12/1b94a77f-1066-410c-a40b-79935048e0c7_logo.png', '3', '8', null);

-- ----------------------------
-- Table structure for Score
-- ----------------------------
DROP TABLE IF EXISTS `Score`;
CREATE TABLE `Score` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL,
  `openid` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of Score
-- ----------------------------

-- ----------------------------
-- Table structure for Suipian
-- ----------------------------
DROP TABLE IF EXISTS `Suipian`;
CREATE TABLE `Suipian` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `baoxiangid` bigint(20) DEFAULT NULL,
  `baoxiangname` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `bianhao` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `baoxiang_id` bigint(20) DEFAULT NULL,
  `lineid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_gm7qlj87pdm9i0epsd9b2vwrx` (`baoxiang_id`),
  CONSTRAINT `FK_gm7qlj87pdm9i0epsd9b2vwrx` FOREIGN KEY (`baoxiang_id`) REFERENCES `Baoxiang` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of Suipian
-- ----------------------------
INSERT INTO `Suipian` VALUES ('110', '23', '徐悲鸿', '1', 'BX01', null, '10');
INSERT INTO `Suipian` VALUES ('111', '23', '徐悲鸿', '2', 'BX02', null, '10');
INSERT INTO `Suipian` VALUES ('112', '23', '徐悲鸿', '3', 'BX03', null, '10');
INSERT INTO `Suipian` VALUES ('113', '23', '徐悲鸿', '4', 'BX04', null, '10');
INSERT INTO `Suipian` VALUES ('114', '23', '徐悲鸿', '5', 'BX05', null, '10');
INSERT INTO `Suipian` VALUES ('115', '23', '徐悲鸿', '6', 'BX06', null, '10');

-- ----------------------------
-- Table structure for Tip
-- ----------------------------
DROP TABLE IF EXISTS `Tip`;
CREATE TABLE `Tip` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `jifen` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `lockflag` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL,
  `pointid` bigint(20) DEFAULT NULL,
  `pointname` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `shunxu` int(11) DEFAULT NULL,
  `img` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of Tip
-- ----------------------------
INSERT INTO `Tip` VALUES ('88', '提起徐悲鸿，你可能会想到他笔下的骏马，他不仅马画得好，他还总结了很多画马的方法。\\n\\n在一层展厅中，就有这样一件有趣的藏品，这是当年52岁的徐悲鸿写给一个12岁小朋友的书信，在信中他用图文结合的方式教这个小朋友如何画马。\\n\\n根据下图中提示的局部线索，去找找他是如何教学生画马的吧！\\n\\n（也可以在线索海报上查看图片线索）', '0', '0', '', '101', '01 徐悲鸿教你如何画马', '1', '2020-10-12/6b0cb171-d9c9-47cf-a194-cbf6f33388e2_xs01.jpg');
INSERT INTO `Tip` VALUES ('89', '展品位于一层展厅，“中央美术学院成立献词”的旁边。', '1', '1', '【点击下面的小锁头可以获取更多提示哦！】', '101', '01 徐悲鸿教你如何画马', '2', '');
INSERT INTO `Tip` VALUES ('91', '徐悲鸿一生画了立马、群马、奔马、饮马等等千姿百态的马。他所画的马无论是在草原奔驰，还是在溪边饮水，都是无拘无束、精力充沛的野马。\\n\\n徐悲鸿为了画马，对马的肌肉、骨骼经过了长期的研究，大胆地用写意的方式勾勒出马的体态，开创了大写意画法。\\n\\n在三层展馆中，展出了多幅徐悲鸿关于马的画作，请你仔细观察一下，下图中的局部出自那一幅画作吧？\\n\\n（也可以在线索海报上查看图片线索）', '0', '0', ' ', '102', '02 中国画', '1', '2020-10-12/b52ec791-ea20-4eb3-9911-90d6cbaaa744_xs02.jpg');
INSERT INTO `Tip` VALUES ('92', '展品位于三层展厅，这幅画中只有一匹马。', '1', '1', '【点击下面的小锁头可以获取更多提示哦！】', '102', '02 中国画', '2', null);
INSERT INTO `Tip` VALUES ('93', '这幅画作创作于1942年。', '1', '1', '【如果还不能确定，可以解锁更多线索哦！】', '102', '02 中国画', '3', '');
INSERT INTO `Tip` VALUES ('94', '徐悲鸿除了喜欢画马，他还喜欢画各种各样的动物。\\n\\n猫、八哥、麻雀、狮子……\\n在他的笔下都惟妙惟肖，在三层展馆展出了徐悲鸿画过的许多动物，去看看它们吧！\\n\\n画中的动物经常成双成对地出现，接下来你要去寻找的就是它们中的一对。\\n\\n这一对小动物正在一种很独特的树上休息，这种树因为其独特的树皮形态而得名，下面图中真实的树皮图片。\\n\\n（也可以在线索海报上查看图片线索）', '0', '0', ' ', '103', '03 徐悲鸿的“动物园”', '1', '2020-10-12/0fcb86f4-92c4-4361-b431-af5ba853c853_xs03.jpg');
INSERT INTO `Tip` VALUES ('95', '这幅画较大，分为上下两幅，高110厘米，宽108厘米X2。', '1', '1', '【点击下面的小锁头可以获取更多提示哦！】', '103', '03 徐悲鸿的“动物园”', '3', '');
INSERT INTO `Tip` VALUES ('96', '这幅画作创作于1935年。', '1', '1', '【如果还不能确定，可以解锁更多线索哦！】', '103', '03 徐悲鸿的“动物园”', '4', '');
INSERT INTO `Tip` VALUES ('97', '徐悲鸿不仅在国画方面功力深厚，对西方美术也有精深的研究，在三楼展厅中就展出了许多他的油画作品。\\n\\n下面图片中的风景是一座著名的山脉，徐悲鸿的多幅画作描绘了这里的壮丽风光，快去欣赏一下吧!\\n', '0', '0', ' ', '104', '04 心中的圣山', '1', '2020-10-12/90180bf5-c669-424c-a92e-2aef91cf54c4_xs04.jpeg');
INSERT INTO `Tip` VALUES ('98', '图中的山脉位于中国与其他国家的边界上，徐悲鸿是在国外完成的这些画作。', '1', '1', '【点击下面的小锁头可以获取更多提示哦！】', '104', '04 心中的圣山', '2', '');
INSERT INTO `Tip` VALUES ('99', '这几幅作品创作时间都是1940年。', '1', '1', '【如果还不能确定，可以解锁更多线索哦！】', '104', '04 心中的圣山', '3', '');
INSERT INTO `Tip` VALUES ('100', '徐悲鸿不仅仅是一名伟大的画家，更是一位伟大的美术教育家。\\n\\n1918年，徐悲鸿经北京大学校长蔡元培推荐被聘为北京大学画法研究会导师，发表了关于中国绘画发展的重要论述，其中的核心观点也成为指导徐悲鸿美术教育事业的重要思想。\\n\\n下面这张照片就是徐悲鸿受聘北京大学画法研究会期间的合影。\\n', '0', '0', ' ', '105', '05 著书立说', '1', '2020-10-12/832fd6c8-3413-4108-a53a-af21ca5d8d97_xs05.JPG');
INSERT INTO `Tip` VALUES ('101', '三层展厅入口，展示了徐悲鸿美术思想的主要观点，请你仔细观察，了解大师的思想理论吧！', '0', '0', '', '105', '05 著书立说', '2', '');
INSERT INTO `Tip` VALUES ('102', '1918年发表的这篇著作名为《中国画改良论》。', '1', '1', '【点击下面的小锁头可以获取更多提示哦！】', '105', '05 著书立说', '3', '');
INSERT INTO `Tip` VALUES ('103', '徐悲鸿的艺术创作与他的爱国主义的政治主张是分不开的，在画家生活的那个时代，中国面临内忧外患，人民生活非常困苦。他以许多历史或古代传说为主题来进行创作，歌颂中国人民的气节和精神。\\n\\n二楼展厅中有一幅巨幅油画，作者根据历史故事中的一个场景，大约花了两年才绘制完成，快去欣赏一下吧!\\n\\n 下面这张图片就出自于这个巨幅油画哦。\\n', '0', '0', ' ', '106', '06 家国情怀', '1', '2020-10-12/d4e1fd9d-8d58-4e02-9cce-fadf1c286900_xs06.jpg');
INSERT INTO `Tip` VALUES ('104', '这幅画中一共画了3匹马，线索图片中的两匹马在图中不是很显眼的位置。', '1', '1', '【点击下面的小锁头可以获取更多提示哦！】', '106', '06 家国情怀', '3', '');
INSERT INTO `Tip` VALUES ('105', '这是徐悲鸿画过的人物最多的一幅画。', '1', '1', '【如果还不能确定，可以解锁更多线索哦！】', '106', '06 家国情怀', '2', '');
INSERT INTO `Tip` VALUES ('106', '在二层展厅中，有一幅他构思了近20年才完成的画作。\\n他根据一则中国古代寓言故事创作了这幅画，这个故事发生在王屋、太行两个大山的山脚，故事赞颂中国人民百折不挠、持之以恒的精神。\\n\\n 下面这张图片就出自于这个巨幅油画哦。\\n', '0', '0', ' ', '107', '07 借古说今', '1', '2020-10-12/9b1d10b3-627f-43e8-9504-39d32954cb82_xs07.jpg');
INSERT INTO `Tip` VALUES ('107', '徐悲鸿有一个创作习惯，如果他要画比较复杂的主题，都要绘制多幅写生素描、草图乃至油画稿才能最终确定，这幅画作的旁边还展示了多幅画稿。', '1', '1', '【点击下面的小锁头可以获取更多提示哦！】', '107', '07 借古说今', '2', '');
INSERT INTO `Tip` VALUES ('109', '与前面你观察的《喜马拉雅山》画作一样，画家是在印度访问期间完成了这幅画作，所以画中有些模特的样貌与典型中国人的样貌有所差别。', '1', '1', '【如果还不能确定，可以解锁更多线索哦！】', '107', '07 借古说今', '3', '');
INSERT INTO `Tip` VALUES ('110', '1939年，悲鸿受一位大文豪之邀赴印度讲学与展览。这段时间，徐悲鸿与大师朝夕相处，频频接触，因为仰慕他的高贵精神，徐悲鸿先后为他画了十几幅素描速写，表现了诗人工作、生活的多方面情形。\\n\\n在二层展厅中展出了徐悲鸿当时记录大师肖像的多幅速写，快来欣赏一下吧!\\n', '0', '0', ' ', '108', '08 大师与大师', '1', '2020-10-12/40ff60f1-1c28-49af-8b38-12ed9b43ab4e_xs08.jpg');
INSERT INTO `Tip` VALUES ('111', '这位印度的大文豪的《飞鸟集》是世界上最杰出的诗集之一。', '1', '1', '【点击下面的小锁头可以获取更多提示哦！】', '108', '08 大师与大师', '2', '');
INSERT INTO `Tip` VALUES ('112', '这位大文豪是泰戈尔。', '1', '1', '【如果还不能确定，可以解锁更多线索哦！】', '108', '08 大师与大师', '3', '');
INSERT INTO `Tip` VALUES ('113', '徐悲鸿酷爱收藏，但他的收藏不是为了商品交易，而是为了国宝不要流失海外。他收藏了唐、宋、元、明、清绘画精品1200余幅，很多重要的藏品都历尽坎坷而得来。\\n\\n在一层展厅中有一幅他最为珍视的藏品，还专门刻了一枚印章小心地印在了画上，你能找到这枚印章吗？\\n\\n下图为这件藏品的局部。\\n', '0', '0', ' ', '109', '09 守护珍宝', '1', '2020-10-12/463095af-a2fc-4e9a-a218-be5b5f1da4cc_xs09.jpg');
INSERT INTO `Tip` VALUES ('114', '徐悲鸿推断这幅画是唐代画家吴道子的作品。', '1', '1', '【点击下面的小锁头可以获取更多提示哦！】', '109', '09 守护珍宝', '2', '');
INSERT INTO `Tip` VALUES ('115', '这幅画中一共绘制了87个人物。', '1', '1', '【如果还不能确定，可以解锁更多线索哦！】', '109', '09 守护珍宝', '3', '');
INSERT INTO `Tip` VALUES ('116', '徐悲鸿是一位致力于改良中国画的中西融合型画家，但他的一位好朋友却是从继承传统中创新的保守型画家。他比徐悲鸿年长三十二岁，但他们结成了真正的忘年交，情谊深厚。\\n\\n作为知己好友，他们还一同创作过不少美术作品。在一层展厅还展出了两位好友的合影，你能认出画家的这位好朋友吗？', '0', '0', ' ', '110', '10 高山流水', '1', '2020-10-12/e18b175c-99f4-49c4-83ef-f05fdce4bccb_xs10.jpg');
INSERT INTO `Tip` VALUES ('117', '这位好朋友擅画花鸟、虫鱼、山水、人物，他笔下的“虾”尤其出名。', '1', '1', '【点击下面的小锁头可以获取更多提示哦！】', '110', '10 高山流水', '2', '');
INSERT INTO `Tip` VALUES ('120', '', '0', '0', '【点击“签到”按钮，去完成你的探索任务吧！】', '101', '01 徐悲鸿教你如何画马', '3', '');
INSERT INTO `Tip` VALUES ('121', null, '0', '0', '【点击“签到”按钮，去完成你的探索任务吧！】', '102', null, '4', null);
INSERT INTO `Tip` VALUES ('122', null, '0', '0', '【点击“签到”按钮，去完成你的探索任务吧！】', '103', null, '5', null);
INSERT INTO `Tip` VALUES ('123', null, '0', '0', '【点击“签到”按钮，去完成你的探索任务吧！】', '104', null, '4', null);
INSERT INTO `Tip` VALUES ('124', null, '0', '0', '【点击“签到”按钮，去完成你的探索任务吧！】', '105', null, '4', null);
INSERT INTO `Tip` VALUES ('125', null, '0', '0', '【点击“签到”按钮，去完成你的探索任务吧！】', '106', null, '4', null);
INSERT INTO `Tip` VALUES ('126', null, '0', '0', '【点击“签到”按钮，去完成你的探索任务吧！】', '107', null, '4', null);
INSERT INTO `Tip` VALUES ('127', null, '0', '0', '【点击“签到”按钮，去完成你的探索任务吧！】', '108', null, '4', null);
INSERT INTO `Tip` VALUES ('128', null, '0', '0', '【点击“签到”按钮，去完成你的探索任务吧！】', '109', null, '4', null);
INSERT INTO `Tip` VALUES ('129', null, '0', '0', '【点击“签到”按钮，去完成你的探索任务吧！】', '110', null, '4', null);
INSERT INTO `Tip` VALUES ('130', '这种独特的树皮在画家笔下呈现出下面图中的样子。\\n', '0', '0', '', '103', '03 徐悲鸿的“动物园”', '2', '2020-10-30/ccb12f8e-8221-4d2a-99b9-655f85810a27_bps.jpg');

-- ----------------------------
-- Table structure for TipUser
-- ----------------------------
DROP TABLE IF EXISTS `TipUser`;
CREATE TABLE `TipUser` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `reduceScore` int(11) DEFAULT NULL,
  `time` bigint(20) DEFAULT NULL,
  `tipid` bigint(20) DEFAULT NULL,
  `tipname` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `lineid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of TipUser
-- ----------------------------
INSERT INTO `TipUser` VALUES ('1', '0', '1602212205954', '89', '点击下面的小锁头可以获得更多线索提示', '74052', '楊燁', '10');
INSERT INTO `TipUser` VALUES ('2', '0', '1602212253078', '89', '点击下面的小锁头可以获得更多线索提示', '74043', '李春波', '10');
INSERT INTO `TipUser` VALUES ('3', '1', '1602488897893', '89', '【点击下面的小锁头可以获取更多提示哦！】', '74047', '涂涂', '10');
INSERT INTO `TipUser` VALUES ('4', '1', '1602489108030', '92', '【点击下面的小锁头可以获取更多提示哦！】', '74047', '涂涂', '10');
INSERT INTO `TipUser` VALUES ('5', '1', '1602489110201', '93', '【如果还不能确定，可以解锁更多线索哦！】', '74047', '涂涂', '10');
INSERT INTO `TipUser` VALUES ('6', '1', '1602489262388', '95', '【点击下面的小锁头可以获取更多提示哦！】', '74047', '涂涂', '10');
INSERT INTO `TipUser` VALUES ('7', '1', '1602489264149', '96', '【如果还不能确定，可以解锁更多线索哦！】', '74047', '涂涂', '10');
INSERT INTO `TipUser` VALUES ('8', '1', '1602489302980', '98', '【点击下面的小锁头可以获取更多提示哦！】', '74047', '涂涂', '10');
INSERT INTO `TipUser` VALUES ('9', '1', '1602489304830', '99', '【如果还不能确定，可以解锁更多线索哦！】', '74047', '涂涂', '10');
INSERT INTO `TipUser` VALUES ('10', '1', '1602489320149', '101', '【点击下面的小锁头可以获取更多提示哦！】', '74047', '涂涂', '10');
INSERT INTO `TipUser` VALUES ('11', '1', '1602489322760', '102', '【如果还不能确定，可以解锁更多线索哦！】', '74047', '涂涂', '10');
INSERT INTO `TipUser` VALUES ('12', '1', '1602489336897', '104', '【点击下面的小锁头可以获取更多提示哦！】', '74047', '涂涂', '10');
INSERT INTO `TipUser` VALUES ('13', '1', '1602489340491', '105', '【如果还不能确定，可以解锁更多线索哦！】', '74047', '涂涂', '10');
INSERT INTO `TipUser` VALUES ('14', '1', '1602489359511', '107', '【点击下面的小锁头可以获取更多提示哦！】', '74047', '涂涂', '10');
INSERT INTO `TipUser` VALUES ('15', '1', '1602489361268', '108', '【如果还不能确定，可以解锁更多线索哦！】', '74047', '涂涂', '10');
INSERT INTO `TipUser` VALUES ('16', '1', '1602489369250', '109', '【如果还不能确定，可以解锁更多线索哦！】', '74047', '涂涂', '10');
INSERT INTO `TipUser` VALUES ('17', '1', '1604020172180', '92', '【点击下面的小锁头可以获取更多提示哦！】', '74043', '李春波', '10');
INSERT INTO `TipUser` VALUES ('18', '1', '1604020187760', '93', '【如果还不能确定，可以解锁更多线索哦！】', '74043', '李春波', '10');
INSERT INTO `TipUser` VALUES ('19', '1', '1604021089715', '95', '【点击下面的小锁头可以获取更多提示哦！】', '74043', '李春波', '10');
INSERT INTO `TipUser` VALUES ('20', '1', '1604021092677', '96', '【如果还不能确定，可以解锁更多线索哦！】', '74043', '李春波', '10');
INSERT INTO `TipUser` VALUES ('21', '1', '1604021736986', '98', '【点击下面的小锁头可以获取更多提示哦！】', '74043', '李春波', '10');
INSERT INTO `TipUser` VALUES ('22', '1', '1604021892341', '99', '【如果还不能确定，可以解锁更多线索哦！】', '74043', '李春波', '10');
INSERT INTO `TipUser` VALUES ('23', '1', '1604022426595', '104', '【点击下面的小锁头可以获取更多提示哦！】', '74043', '李春波', '10');
INSERT INTO `TipUser` VALUES ('24', '1', '1604022429578', '105', '【如果还不能确定，可以解锁更多线索哦！】', '74043', '李春波', '10');
INSERT INTO `TipUser` VALUES ('25', '1', '1604023625746', '114', '【点击下面的小锁头可以获取更多提示哦！】', '74043', '李春波', '10');
INSERT INTO `TipUser` VALUES ('26', '1', '1604023628426', '115', '【如果还不能确定，可以解锁更多线索哦！】', '74043', '李春波', '10');
INSERT INTO `TipUser` VALUES ('27', '1', '1604023721567', '117', '【点击下面的小锁头可以获取更多提示哦！】', '74043', '李春波', '10');
INSERT INTO `TipUser` VALUES ('28', '1', '1604128636913', '89', '【点击下面的小锁头可以获取更多提示哦！】', '74048', 'Kylin', '10');

-- ----------------------------
-- Table structure for User
-- ----------------------------
DROP TABLE IF EXISTS `User`;
CREATE TABLE `User` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `age` int(11) DEFAULT NULL,
  `brandId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `brandorcatemsid` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `cat1` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `cat2` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `cat3` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `couponprom` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `gid` bigint(20) DEFAULT NULL,
  `name` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL,
  `nice_name` varchar(500) COLLATE utf8mb4_bin DEFAULT NULL,
  `oneflag` int(11) DEFAULT NULL,
  `onsale` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `orderby` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `price2` int(11) DEFAULT NULL,
  `price3` int(11) DEFAULT NULL,
  `pricelowest` int(11) DEFAULT NULL,
  `shopId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `updatetime` bigint(20) DEFAULT NULL,
  `updatetime2` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `venderId` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `yjyouhui` int(11) DEFAULT NULL,
  `youhui` int(11) DEFAULT NULL,
  `zhekou` int(11) DEFAULT NULL,
  `avatarUrl` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `openid` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `linkmobile` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `linkopenid` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74057 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of User
-- ----------------------------
INSERT INTO `User` VALUES ('1', null, null, null, null, null, null, null, null, 'admin', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '100', null, null, 'wb6789');
INSERT INTO `User` VALUES ('74042', null, null, null, null, null, null, null, null, '早起的小闹钟', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://thirdwx.qlogo.cn/mmopen/vi_32/mIy5JewSRJbWfVdKJrSPtPM68Bp5XGiaTXdXn28cicrIE1tlsg8Fedxvv3SnuPYqNFobCR9z4vrfVdl2EqVRwp2g/132', 'oV7TJ5aUD5RQDMkT4y3B3JTGBfoE', '100', null, null, null);
INSERT INTO `User` VALUES ('74043', null, null, null, null, null, null, null, null, '李春波', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83erxXFNpvV9tqNStGFoJ7fwkN2jZjuchDTSczIFGrUicYuGKrw52TwvZKRrKZxkqm3DE7dEC5ZWq1hw/132', 'oV7TJ5f8WWJpjjreqgoMlYjCKOsI', '897', null, null, null);
INSERT INTO `User` VALUES ('74044', null, null, null, null, null, null, null, null, '蓝色妖姬', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://thirdwx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEKGMjytBRAqThy4q4iaFEpYhMV91dAyN5HHfhiaTgia4TE2Gg9xATXhw5f1vSHicKufvhsU3QvGmIeUBw/132', 'oV7TJ5eKvfQGIIPbGE_Eu5bjLxJ4', '100', null, null, null);
INSERT INTO `User` VALUES ('74045', null, null, null, null, null, null, null, null, '林怡纯', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://thirdwx.qlogo.cn/mmhead/dHfmd8kxSXtvzAn9EKGDU7eDGNk3WaqeNg2FIRlvjvc/132', 'oV7TJ5VFMT0OqO64Ut7Z9r6wkoHI', '100', null, null, null);
INSERT INTO `User` VALUES ('74046', null, null, null, null, null, null, null, null, '刁小麦ོ   ', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://thirdwx.qlogo.cn/mmopen/vi_32/5LjBibnE7thgL9UWJTKGXKBZiajl0kgHRFg4P62TibsJlNTck3X3vucysyFGl6VkViavgJIQbHIKPGGymMoSiajLt1Q/132', 'oV7TJ5VJBawf_cob1BCgXD1__HoY', '110', null, null, null);
INSERT INTO `User` VALUES ('74047', null, null, null, null, null, null, null, null, '涂涂', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://thirdwx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEJ7USCyH2OnSg1fuguiaqQrVDUBjDhIr2ibv0PwUTEVKHWRFFbm8P8fyPqhkLY2jskXpiaNd4U5rNvRg/132', 'oV7TJ5WLAmeI8l18LT0o9hCYn_Oo', '146', null, null, null);
INSERT INTO `User` VALUES ('74048', null, null, null, null, null, null, null, null, 'Kylin', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIT7JZTZfia19hOialxvex40CAibPp5GqptFvOBQOmGrvbbhNPuibpuHv0bt1QictGq1sB86tzAyrcS9uw/132', 'oV7TJ5bs28jwtVNFkKOxKaw0oQOM', '109', null, null, null);
INSERT INTO `User` VALUES ('74049', null, null, null, null, null, null, null, null, '黄建依', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://thirdwx.qlogo.cn/mmhead/ibdowAJc1Mp3IRPxhO4ywC1hXAq2gSqYexoQeuTNjocA/132', 'oV7TJ5UK_rH_m0m5U-T16iaREnRs', '100', null, null, null);
INSERT INTO `User` VALUES ('74050', null, null, null, null, null, null, null, null, '郭睿纬', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://thirdwx.qlogo.cn/mmhead/3SlrLwt0T5hAXXvBdicJjicvJR93s9k6cvDwLy8a4iavtI/132', 'oV7TJ5SmGABZPF-2ljpDBUXiI8UM', '100', null, null, null);
INSERT INTO `User` VALUES ('74051', null, null, null, null, null, null, null, null, '福星高照', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://thirdwx.qlogo.cn/mmopen/vi_32/qYIqibSGuqs3icpBVIaNiag59g4fIElGFCkYqIgmw4KJvib7dNr1Z0ribLsFiaKNNhMMkCjI9pO5GUbSpxPb6tB3BZBg/132', 'oV7TJ5aKvV3FCi7hoKRDLCQu1kqc', '100', null, null, null);
INSERT INTO `User` VALUES ('74052', null, null, null, null, null, null, null, null, '楊燁', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q3auHgzwzM4TyYItEvF5ZZZYenu9mORZGsX3VibxDCUtoJ2Y046PpKvVbq0Q5VBghPBEoq1HRJXicszuLqtOEFMQ/132', 'oV7TJ5dT0iZELXnfqiw7lYIOK7VY', '100', null, null, null);
INSERT INTO `User` VALUES ('74053', null, null, null, null, null, null, null, null, '漫咖啡', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q3auHgzwzM5lxAlItky5Gnjye9kyAJEdqdylx8lwxoK9xYKicib3AiaDtA5HZh8BJG7Ul6yCOvIbIGF8R4x8iaBpEg/132', 'oV7TJ5XFaAB2CaRzeKbR8xKdkB6A', '100', null, null, null);
INSERT INTO `User` VALUES ('74054', null, null, null, null, null, null, null, null, '10.11', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTInShcaY9KZ8KWRlBWDY6TPjREj50V39kNWDvxVPIUlBNHV88zWu2jMgrBQmYbajQb9vr1PCHib7CA/132', 'oV7TJ5U16cPbIXEIB2O8EI3QvvgY', '100', null, null, null);
INSERT INTO `User` VALUES ('74055', null, null, null, null, null, null, null, null, '郭玟旺', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://thirdwx.qlogo.cn/mmhead/ibUkwRR2dgNicq9ibs13zBcicPyywf6dricx0dUiciaL2bgMoA/132', 'oV7TJ5baQ5W8n506Qm0J5uxDddb8', '100', null, null, null);
INSERT INTO `User` VALUES ('74056', null, null, null, null, null, null, null, null, '黄沛文', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://thirdwx.qlogo.cn/mmhead/t3tayQTctnicJbjL7CHOyerkIiak1wwNqhxCGwBdH0FEE/132', 'oV7TJ5a2ra7TnuCL9N4RODfu-26A', '100', null, null, null);

-- ----------------------------
-- Table structure for WeCate
-- ----------------------------
DROP TABLE IF EXISTS `WeCate`;
CREATE TABLE `WeCate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of WeCate
-- ----------------------------

-- ----------------------------
-- Table structure for WeItem
-- ----------------------------
DROP TABLE IF EXISTS `WeItem`;
CREATE TABLE `WeItem` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createtime` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `picture1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `picture2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `picture3` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `picture4` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `picture5` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `picture6` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `picture7` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `picture8` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `picture9` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `priceUnit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shunxu` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `stocknum` int(11) DEFAULT NULL,
  `updatetime` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  `weCateName` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weCateid` bigint(20) DEFAULT NULL,
  `weShopid` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `weCate_id` bigint(20) DEFAULT NULL,
  `weShop_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_f82k141j29qvviujbxj62g6p6` (`user_id`),
  KEY `FK_1464cgph5bnu5pisua5sk64a0` (`weCate_id`),
  KEY `FK_cexnweug74gn0xmo8v1mplopg` (`weShop_id`),
  CONSTRAINT `FK_1464cgph5bnu5pisua5sk64a0` FOREIGN KEY (`weCate_id`) REFERENCES `WeCate` (`id`),
  CONSTRAINT `FK_cexnweug74gn0xmo8v1mplopg` FOREIGN KEY (`weShop_id`) REFERENCES `WeShop` (`id`),
  CONSTRAINT `FK_f82k141j29qvviujbxj62g6p6` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of WeItem
-- ----------------------------

-- ----------------------------
-- Table structure for WeItemUser
-- ----------------------------
DROP TABLE IF EXISTS `WeItemUser`;
CREATE TABLE `WeItemUser` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createtime` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quhuodate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `selected` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `totalPrice` double DEFAULT NULL,
  `updatetime` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  `weItemid` bigint(20) DEFAULT NULL,
  `yudingdate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `weItem_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_8hc369fjy9wo3abwvdpratooo` (`user_id`),
  KEY `FK_ffhux616u2eyr3lohymtr827e` (`weItem_id`),
  CONSTRAINT `FK_8hc369fjy9wo3abwvdpratooo` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`),
  CONSTRAINT `FK_ffhux616u2eyr3lohymtr827e` FOREIGN KEY (`weItem_id`) REFERENCES `WeItem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of WeItemUser
-- ----------------------------

-- ----------------------------
-- Table structure for WeShop
-- ----------------------------
DROP TABLE IF EXISTS `WeShop`;
CREATE TABLE `WeShop` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_roo9b4a5bvm43jrdyqdmnxlgg` (`user_id`),
  CONSTRAINT `FK_roo9b4a5bvm43jrdyqdmnxlgg` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of WeShop
-- ----------------------------
