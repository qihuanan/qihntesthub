/*
Navicat MySQL Data Transfer

Source Server         : 123.206.87.60
Source Server Version : 50560
Source Host           : 123.206.87.60:3306
Source Database       : cms

Target Server Type    : MYSQL
Target Server Version : 50560
File Encoding         : 65001

Date: 2020-11-02 20:36:03
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
  PRIMARY KEY (`id`),
  KEY `FK_ifrtrm19hi4rfqi88p6nysoee` (`line_id`),
  CONSTRAINT `FK_ifrtrm19hi4rfqi88p6nysoee` FOREIGN KEY (`line_id`) REFERENCES `Line` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of Baoxiang
-- ----------------------------
INSERT INTO `Baoxiang` VALUES ('1', '金符藏宝图宝箱可以到前台兑换xx奖品', '11', 'qihntest', '金符藏宝图', null);
INSERT INTO `Baoxiang` VALUES ('2', '木符藏宝图xx', '11', 'qihntest', '木符藏宝图', null);
INSERT INTO `Baoxiang` VALUES ('3', '水符藏宝图xxx', '11', 'qihntest', '水符藏宝图', null);
INSERT INTO `Baoxiang` VALUES ('5', '金符', '12', '世界花卉大观园', '金符', null);
INSERT INTO `Baoxiang` VALUES ('6', '', '12', '世界花卉大观园', '木符', null);
INSERT INTO `Baoxiang` VALUES ('7', '', '12', '世界花卉大观园', '水符', null);
INSERT INTO `Baoxiang` VALUES ('11', '', '13', '游美-华彬生态园', 'YES', null);
INSERT INTO `Baoxiang` VALUES ('13', 'AS01,1;AS02,2;AS03,3;AS04,4;AS05,5;AS06,6', '7', '奥森北园线', '神秘小礼物', null);
INSERT INTO `Baoxiang` VALUES ('14', 'ZJ01,1;ZJ02,2;ZJ03,3;ZJ04,4;ZJ05,5;ZJ06,6', '9', '终于见到你-寻访之旅', '到店礼物', null);
INSERT INTO `Baoxiang` VALUES ('15', 'CSCBT01,1;CSCBT02,2;CSCBT03,3;CSCBT04,4;CSCBT05,5;CSCBT06,6', '10', '测试线路', '藏宝图', null);
INSERT INTO `Baoxiang` VALUES ('16', 'H01,1;H02,2;H03,3;H04,4;H05,5;H06,6', '12', '世界花卉大观园', '火符', null);
INSERT INTO `Baoxiang` VALUES ('17', 'T01,1;T02,2;T03,3;T04,4;T05,5;T06,6', '12', '世界花卉大观园', '土符', null);
INSERT INTO `Baoxiang` VALUES ('19', 'A01,1;A02,2;A03,3;A04,4;A05,5;A06,6', '14', '未来科学城滨水公园', 'A+', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of Exam
-- ----------------------------
INSERT INTO `Exam` VALUES ('2', '答案1;答案2', '2', '答题1描述', '你答错了111', '答题1', '2020-04-21/336203a2-8760-45fe-9ff6-5dd8a7399195_1.png', '41', '签到点2', 'j101', '2020-05-11/6bef49fb-f42b-4054-8231-8cb114d72642_a1.jpg', '0', '恭喜你答对了111', '2', null);
INSERT INTO `Exam` VALUES ('4', '1', '1', '', '1', '拍个照吧！', '', '37', '9号点', '1', '', '0', '1', '2', null);
INSERT INTO `Exam` VALUES ('6', '', '1', '', '', '拍个照吧！', '', '34', '6号点', '', '', '0', '', '2', null);
INSERT INTO `Exam` VALUES ('7', '', '1', '', '', '拍个照吧！', '', '33', '5号点', '', '', '0', '', '2', null);
INSERT INTO `Exam` VALUES ('8', '', '1', '', '', '拍个照吧！', '', '32', '4号点', '', '', '0', '', '2', null);
INSERT INTO `Exam` VALUES ('9', '', '1', '', '', '拍个照吧！', '', '31', '3号点', '', '', '0', '', '2', null);
INSERT INTO `Exam` VALUES ('10', '', '1', '', '', '拍个照吧！', '', '30', '2号点', '', '', '0', '', '2', null);
INSERT INTO `Exam` VALUES ('11', '', '1', '', '', '拍个照吧！', '', '4', '1号点', '', '', '0', '', '2', null);
INSERT INTO `Exam` VALUES ('12', 'a;b;c;A;B;C;D', '5', 'abcd选哪个', '错误，很遗憾，你错过了这块藏宝图碎片！', '试验', '2020-04-25/58491843-9b89-443a-96be-7edd7ff9f2dc_sj0523cf02.jpg', '29', '5号点', '恭喜你获得一次抽取拼图的机会！', '2020-04-27/73c9a132-382e-4e1c-945e-ba7b428f7f1f_pt.png', '1', '正确，恭喜您获得一块藏宝图碎片', '1', null);
INSERT INTO `Exam` VALUES ('13', '', '1', '', '', '1', '', '28', '4号点', '', '', '0', '', '2', null);
INSERT INTO `Exam` VALUES ('14', '1', '1', '1akjsk', '很遗憾，你错过了机会。', '2bjcks', '', '27', '3号点', '1', '', '0', '恭喜获得碎片。', '1', null);
INSERT INTO `Exam` VALUES ('15', '222', '1', '2', '', '2', '', '26', '2号点', '22', '', '0', '', '2', null);
INSERT INTO `Exam` VALUES ('16', '2', '1', '22', '', '222', '', '25', '1号点', '2', '', '0', '', '2', null);
INSERT INTO `Exam` VALUES ('17', '', '1', '可以参考这张照片。', '错误，很遗憾，再想想其他答案吧！', '请你给这棵树的叶子拍一张特写照片吧！', '2020-04-29/d47ee5be-1942-4d8c-a969-d3c8b48c7ea8_yezi2020-04-29 153712.png', '42', '一号点', 'CSCBT02', '2020-04-29/9a38b5c9-74bd-490e-acb2-204bf80e11d0_cbt-1_02.jpg', '0', '恭喜你，获得一张寻宝图碎片！', '2', null);
INSERT INTO `Exam` VALUES ('18', '不及汪伦送我情', '2', '“桃花潭水深千尺”的下一句是什么？', '很遗憾，再想想其他答案吧！', '诗词接龙', '', '43', '二号点', 'CSCBT01', '2020-04-29/2f9b001b-bb90-49f7-b268-0c043e8b0f10_cbt-1_01.jpg', '0', '一张藏宝图碎片！', '1', null);
INSERT INTO `Exam` VALUES ('19', '16', '1', '最大的三角形的面积是最小的三角形的几倍？', '', '', '2020-04-30/087e7976-a455-4d64-bae9-1efa893a9623_sample24_zh-af71c7ca09827903b3fa580e2b96711d.webp', '44', '三号点', 'CSCBT06', '2020-04-29/1914b75a-e869-4e3b-a42f-21cdea9b9d93_cbt-1_06.jpg', '0', '', '1', null);
INSERT INTO `Exam` VALUES ('20', '八骏图', '3', '请你找到上面这张图的来自哪张画作？', '', '', '2020-05-24/48c2f770-2778-43bb-b7ac-c02f9243228d_timg.jpg', '45', '四号点', 'CSCBT05', '2020-04-29/67adb866-028c-4fbf-a284-8894b5e8a25f_cbt-1_05.jpg', '0', '获得一张拼图碎片！', '1', null);
INSERT INTO `Exam` VALUES ('21', '心形', '3', '仔细观察一下你面前这棵树的叶子，它的叶子属于那种类型呢？', '不对哦，再想想吧！加油！', '', '2020-04-30/7a394501-97f7-4d22-89d6-cfc2747cd94b_yx2.webp', '46', '五号点', 'CSCBT04', '2020-04-30/86df304c-58e2-43a8-873c-ab81a21c0612_cbt-1_04.jpg', '0', '你真的是太棒了，你获得了新的线索哦！', '1', null);
INSERT INTO `Exam` VALUES ('22', 'B', '3', '万条垂下绿丝绦，形容的是哪种植物？', '正确答案是柳树哦！', '', '', '47', '六号点', 'CSCBT03', '2020-05-22/759a469a-00b7-4ed5-9890-c0c95790ffdb_cbt-1_03.jpg', '0', '获得一块拼图碎片！', '3', '梧桐,A; 柳树,B; 杨树,C; 油松,D;');
INSERT INTO `Exam` VALUES ('23', '', '1', '', '', '请你给这棵树拍张照吧！', '', '23', '3号点', '', '', '0', '', '2', null);
INSERT INTO `Exam` VALUES ('24', '', '1', '', '', '给这棵树拍个照吧', '', '22', '4号点', '', '', '0', '', '2', null);
INSERT INTO `Exam` VALUES ('25', '', '1', '', '', '给这棵树拍个照吧！', '', '21', '18号点', '', '', '0', '', '2', null);
INSERT INTO `Exam` VALUES ('26', '', '1', '', '', '给这棵树拍个照吧！', '', '20', '17号点', '', '', '0', '', '2', null);
INSERT INTO `Exam` VALUES ('27', '', '1', '', '', '给这棵树拍个照吧！', '', '19', '15号点', '', '', '0', '', '2', null);
INSERT INTO `Exam` VALUES ('28', '', '1', '', '', '给这棵树拍个照吧！', '', '18', '16号点', '', '', '0', '', '2', null);
INSERT INTO `Exam` VALUES ('29', '', '1', '', '', '给这棵树拍个照吧！', '', '17', '7号点', '', '', '0', '', '2', null);
INSERT INTO `Exam` VALUES ('30', '', '1', '', '', '给这棵树拍个照吧！', '', '16', '2号点', '', '', '0', '', '2', null);
INSERT INTO `Exam` VALUES ('31', '', '1', '', '', '给这棵树拍个照吧！', '', '15', '6号点', '', '', '0', '', '2', null);
INSERT INTO `Exam` VALUES ('32', '', '1', '', '', '给这棵树拍个照吧！', '', '14', '12号点', '', '', '0', '', '2', null);
INSERT INTO `Exam` VALUES ('33', '', '1', '', '', '给这棵树拍个照吧！', '', '13', '11号点', '', '', '0', '', '2', null);
INSERT INTO `Exam` VALUES ('34', '', '1', '', '', '给这棵树拍个照吧！', '', '12', '10号点', '', '', '0', '', '2', null);
INSERT INTO `Exam` VALUES ('35', '', '1', '', '', '给这棵树拍个照吧！', '', '11', '9号点', '', '', '0', '', '2', null);
INSERT INTO `Exam` VALUES ('36', '', '1', '', '', '拍个照吧！', '', '10', '8号点', '', '', '0', '', '2', null);
INSERT INTO `Exam` VALUES ('37', '', '1', '', '', '拍个照吧！', '', '9', '13号点', '', '', '0', '', '2', null);
INSERT INTO `Exam` VALUES ('38', '', '1', '', '', '拍个照吧！', '', '8', '14号点', '', '', '0', '', '2', null);
INSERT INTO `Exam` VALUES ('39', '', '1', '', '', '拍个照吧！', '', '7', '5号点', '', '', '0', '', '2', null);
INSERT INTO `Exam` VALUES ('40', '', '1', '', '', '拍个照吧！', '', '6', '1号点', '', '', '0', '', '2', null);
INSERT INTO `Exam` VALUES ('41', '', '1', '', '', '拍个照吧！', '', '38', '10号点', '', '', '0', '', '2', null);
INSERT INTO `Exam` VALUES ('42', '', '1', '', '', '拍个照吧！', '', '36', '8号点', '', '', '0', '', '2', null);
INSERT INTO `Exam` VALUES ('43', '', '1', '', '', '拍个照吧！', '', '35', '7号点', '', '', '0', '', '2', null);
INSERT INTO `Exam` VALUES ('44', '', '1', '', '', '如果有两个题目会怎么样？', '', '46', '五号点', '', '', '0', '', '2', null);
INSERT INTO `Exam` VALUES ('45', '倒卵形', '1', '', '错误，正确答案应该是“倒卵形”，请你前往下一个打卡点吧！', '在你的身边的这种植物的叶子是什么形状呢？', '2020-05-05/89dc359e-4148-4377-830a-2db54fa0e958_3cb5186f262fa521baa1482de45b381.jpg', '48', 'CP1', 'M03', '2020-05-16/703ecf61-f8bc-48a6-b426-74b79076d323_cbt-1_03.jpg', '0', '一片灵符拼图', '1', null);
INSERT INTO `Exam` VALUES ('46', '4', '1', '', '错误，很遗憾，再想想其他答案吧！', '想想办法测量一下在你旁边的这棵树有多高呢？', '2020-05-05/8e7e9b43-65e7-430c-a594-6a0c010cbac3_af4926ce589fc0ce99b5fdb472e7fd5.jpg', '49', 'CP2', '', '', '0', '正确，恭喜您获得以下藏宝图碎片', '1', null);
INSERT INTO `Exam` VALUES ('47', '铁线蕨', '1', '', '错误，很遗憾，再想想其他答案吧！', '下面哪种植物的的叶脉与银杏是一样的？', '2020-05-05/a11f1550-f9ba-4b47-a419-104ad83c1a0e_leaf veins.jpg', '50', 'CP3', '', '', '0', '正确，恭喜您获得以下藏宝图碎片', '1', null);
INSERT INTO `Exam` VALUES ('48', 'D', '1', '', '错误，很遗憾，再想想其他答案吧！', '下面图片中哪种鸟的足迹并不属于这里？', '2020-05-05/9649dd2e-eeac-4ada-8ece-e49cdc787dc4_birds footprints.jpg', '51', 'CP4', '', '', '0', '正确，恭喜您获得以下藏宝图碎片', '1', null);
INSERT INTO `Exam` VALUES ('49', '是', '1', '', '错误，很遗憾，再想想其他答案吧！', '你身边这两种开着红色花朵和白色花朵的树，是同一种吗？', '', '52', 'CP5', '正确，恭喜您！', '', '0', '正确，恭喜您获得以下藏宝图碎片', '1', null);
INSERT INTO `Exam` VALUES ('50', '20cm', '1', '你需要先知道怎么测算一棵树的粗细哦', '错误，很遗憾，再想想其他答案吧！', '这个树有多粗？', '', '53', 'CP6', '正确，恭喜您！', '', '0', '正确，恭喜您获得以下藏宝图碎片', '1', null);
INSERT INTO `Exam` VALUES ('51', '9', '1', '', '错误，很遗憾，再想想其他答案吧！', '下图色卡中第几号色并不在这丛郁金香花丛中？', '2020-05-05/6e1d6278-f58c-4e4d-a960-5e45c5748993_color.jpg', '54', 'CP7', '', '', '0', '正确，恭喜您获得以下藏宝图碎片', '1', null);
INSERT INTO `Exam` VALUES ('52', '种子', '1', '', '错误，很遗憾，再想想其他答案吧！', '榆钱是这棵树的花瓣、种子还是叶子？', '2020-05-05/2418e48c-4a1d-4f36-9cac-eb7b3aee12de_3b95865aa2d66f3da517cb436090741.jpg', '55', 'CP8', '', '', '0', '正确，恭喜您获得以下藏宝图碎片', '1', null);
INSERT INTO `Exam` VALUES ('53', '洋白蜡', '1', '', '错误，很遗憾，再想想其他答案吧！', '找一找周围那种树有这样的树皮？', '2020-05-05/a2277094-12e9-4f89-9488-287fbca64ff7_timg.jpg', '56', 'CP9', '', '', '0', '正确，恭喜您获得以下藏宝图碎片', '1', null);
INSERT INTO `Exam` VALUES ('54', 'B', '1', 'A 松子  B 橡子   C 板栗   D 榛子', '错误，很遗憾，再想想其他答案吧！', '龙猫刚刚从这里跑过去了，它不小心把种子洒落在这里了，你找到了吗？这是什么种子？', '2020-05-05/05b88314-d304-4a2d-a090-be22f2582ec8_912341fb9c1447c5a9094e51ee2a97a4.png', '57', 'CP10', '', '', '1', '正确，恭喜您获得以下藏宝图碎片', '1', null);
INSERT INTO `Exam` VALUES ('55', 'B', '1', 'A 因为它的花有金银两色，它的另一个别称是金银花\r\n\r\nB 它的绿色的小枝条像吸管一样是中空的\r\n\r\nC 金银木的花是传统医学中的一种药材\r\n\r\nD 它的果实是黑色的\r\n', '错误，很遗憾，再想想其他答案吧！', '下面关于金银木的哪个说法是正确的？', '', '58', 'CP11', '', '', '0', '正确，恭喜您获得以下藏宝图碎片', '1', null);
INSERT INTO `Exam` VALUES ('56', 'C', '1', 'A 它生病了\r\n\r\nB 桑葚还没有成熟\r\n\r\nC 因为桑树雌雄异株，只有开雌花的才会结桑葚\r\n\r\nD 这是另外一种桑', '错误，很遗憾，再想想其他答案吧！', '为什么这株桑树没有结桑葚？', '', '59', 'CP12', '', '', '0', '正确，恭喜您获得以下藏宝图碎片', '1', null);
INSERT INTO `Exam` VALUES ('57', '芦苇', '1', '（回答植物的中文名）', '错误，很遗憾，再想想其他答案吧！', '解锁下面这组摩尔斯电码，找到这种植物吧', '2020-05-06/299abcfb-c568-4e89-b0ea-4ce207bec056_morse.jpg', '60', 'CP13', '', '', '0', '正确，恭喜您获得以下藏宝图碎片', '1', null);
INSERT INTO `Exam` VALUES ('58', '水仙', '1', '', '错误，很遗憾，再想想其他答案吧！', '这个广场上介绍了12种植物，哪一种植物与郁金香来自同一个地方？', '', '61', 'CP14', '', '', '0', '这个广场上介绍了12种植物，哪一种植物与郁金香来自同一个地方？', '1', null);
INSERT INTO `Exam` VALUES ('59', '', '1', '拍摄你的作品上传', '错误，很遗憾，再想想其他答案吧！', '试着编一个这样的松针环吧', '2020-05-06/19e704b4-15de-4d6c-9578-3528dd6985b1__20200506103548.jpg', '62', 'CP15', '', '', '0', '正确，恭喜您获得以下藏宝图碎片', '2', null);
INSERT INTO `Exam` VALUES ('60', 'C', '1', '', '错误，很遗憾，再想想其他答案吧！', '透过这个万花筒看一看，感受一下通过蜻蜓的眼睛所看到的世界，下面哪种昆虫不是这样的眼睛？', '2020-05-06/38ff6ca2-0c2f-452c-90be-1fc55a3ccb8c_eyes.jpg', '63', 'CP16', '', '', '1', '正确，恭喜您获得以下藏宝图碎片', '1', null);
INSERT INTO `Exam` VALUES ('61', '1', '1', '1', '22', '1', '', '40', '签到1', 'j102', '2020-05-11/60011a2d-d989-434d-8b22-a1577976f575_a2.jpg', '0', '11', '1', null);
INSERT INTO `Exam` VALUES ('62', '行歌荒野中', '1', '请按照藏宝盒中任务卡的提示完成任务，并在下方输入答案！', '很遗憾，你的回答错误！请前往下一个点吧！', '', '', '78', 'CP01', 'YM04', '2020-05-26/c7bfe905-f7e2-4285-8343-3e79dc44a35a_YM04.jpg', '0', '一片拼图碎片！', '1', null);
INSERT INTO `Exam` VALUES ('63', '', '1', '请按照藏宝盒中任务卡的提示完成任务，并拍照上传！', '很遗憾，继续努力吧！', '', '', '79', 'CP02', '', '2020-05-25/70313be5-b27f-4fa4-a4eb-8617ee0c333f_slice_1_1.jpg', '0', '一块不一样的碎片！', '2', null);
INSERT INTO `Exam` VALUES ('64', 'SOS;求救;求救信号;紧急求救;呼救;紧急呼救;sos;Sos;', '2', '请按照藏宝盒中任务卡的提示完成任务，并在下方输入答案！如果遇到困难，可以在知识卡片中寻找信息！', '很遗憾，你的答案不准确，请前往下一个任务点吧！', '', '', '80', 'CP03', 'YM01', '2020-05-26/91b543c5-07f7-4a37-a3e4-b71d4961fbfd_YM01.jpg', '0', '获得一块拼图碎片！', '1', null);
INSERT INTO `Exam` VALUES ('65', '', '1', '请按照藏宝盒中任务卡的提示完成任务，并拍照上传！如果遇到困难，可以在知识卡片中寻找信息！', '很遗憾！', '', '', '87', 'CP10', '', '2020-05-26/75ce5db0-15e0-4a17-b8db-92d6f5d94902_slice_0_0.jpg', '0', '一块不一样的拼图碎片！', '2', null);
INSERT INTO `Exam` VALUES ('67', 'DBCAE;dbcae;Dbcae', '3', '请按照藏宝盒中任务卡的提示完成任务，并在下方输入答案！如果遇到困难，可以在知识卡片中寻找信息！	', '很遗憾，你的答案不准确，请前往下一个任务点吧！', '', '', '82', 'CP05', 'YM03', '2020-05-26/34c7344c-b20f-41e4-87d4-86ea78f57e66_YM03.jpg', '0', '一块拼图碎片！', '1', null);
INSERT INTO `Exam` VALUES ('68', 'C;c', '1', '请按照藏宝盒中任务卡的提示完成任务，并在下方输入答案！如果遇到困难，可以在知识卡片中寻找信息！	', '很遗憾，你的答案不准确，请前往下一个任务点吧！', '', '', '81', 'CP04', '', '', '0', '一次成功的喜悦！', '1', null);
INSERT INTO `Exam` VALUES ('69', '300米;300m;300', '2', '请按照藏宝盒中任务卡的提示完成任务，并在下方输入答案！如果遇到困难，可以在知识卡片中寻找信息！	', '很遗憾，你的答案不准确，请前往下一个任务点吧！', '', '', '83', 'CP06', '', '', '0', '一次成功的喜悦！', '1', '');
INSERT INTO `Exam` VALUES ('70', '', '1', '请按照藏宝盒中任务卡的提示完成任务，并拍照上传！如果遇到困难，可以在知识卡片中寻找信息！', '很遗憾，你的答案不准确，请前往下一个任务点吧！', '', '', '84', 'CP07', 'YM02', '2020-05-26/5bac7338-ace7-429c-9c00-a2db871ff5e7_YM02.jpg', '0', '一块拼图碎片！', '2', null);
INSERT INTO `Exam` VALUES ('71', '13米;13m;14米;14m;12米;12m', '3', '请按照藏宝盒中任务卡的提示完成任务，并在下方输入答案！如果遇到困难，可以在知识卡片中寻找信息！	', '很遗憾，你的答案不准确，请前往下一个任务点吧！', '', '', '86', 'CP09', 'YM06', '2020-05-26/94eb9b04-0684-47c8-af41-b6fbf96f9c39_YM06.jpg', '0', '一块拼图碎片！', '1', '');
INSERT INTO `Exam` VALUES ('72', 'D;d', '2', '请按照藏宝盒中任务卡的提示完成任务，并在下方输入答案！如果遇到困难，可以在知识卡片中寻找信息！	', '很遗憾，你的答案不准确，请前往下一个任务点吧！', '', '', '85', 'CP08', 'YM05', '2020-05-26/5266ccb6-53c8-4f15-bac7-5af3761ab919_YM05.jpg', '0', '一块拼图碎片！', '1', null);
INSERT INTO `Exam` VALUES ('73', '是', '1', '回到“是”或者“否”', '答案是“是”', '杨树分为雌株和雄株吗？', '', '100', 'cp1', '', '2020-05-28/e2ae7706-9dcd-4596-9a88-ccf5ce4c856e_20200528014516.jpg', '0', '正确，恭喜你获得一只小蜜蜂', '1', '');
INSERT INTO `Exam` VALUES ('74', 'B;b;花萼', '1', 'A 叶子     B  花萼    C 花柄    D 花瓣', '答案是花萼', '睡莲开放前，它的花被什么包裹着？', '2020-05-28/13d75e29-e1e8-4ebb-b77e-e40e84cd3b39_20200528153643.jpg', '101', 'cp2', 'A01', '2020-05-28/9f1a26ca-c095-4bef-b6c8-4876c69a9634_slice_0_0.gif', '0', '正确，恭喜您获得以下藏宝图碎片', '1', '');
INSERT INTO `Exam` VALUES ('75', 'A;a', '1', '', '答案是A', '水在荷叶上为什么会形成水珠？下列哪个说法不正确', '2020-05-28/e8c92dff-e164-4ce3-bc2b-4fe7b26f9dad_tim.jpg', '102', 'cp3', '', '2020-05-28/85ea01c4-3c88-4d15-a740-bdc8001df224_20200528014516.jpg', '0', '正确，恭喜你获得一只小蜜蜂', '1', '');
INSERT INTO `Exam` VALUES ('76', 'A;a', '1', '', '答案是A', '一棵树一般由哪几部分组成的？', '2020-05-28/a6aeb589-1e43-4237-abc6-6469ad0edffb_111.jpg', '103', 'cp4', 'A05', '2020-05-28/c68e5a0a-ac03-4792-8bf4-e8cf7eff680b_slice_1_1.gif', '0', '正确，继续探索吧', '1', '');
INSERT INTO `Exam` VALUES ('77', 'C;c;风;风力', '1', 'A 鸟类传播  B 昆虫传播  C 风力传播 D 自体传播', '答案是风力传播', '这棵树叫茶条槭，树上的那些“小飞虫”是它的种子，你觉得它的种子是靠什么传播的呢？', '', '104', 'cp5', '', '2020-05-28/e8b3572f-5545-4b99-9b70-a1e49fb026a7_20200528014516.jpg', '0', '正确，恭喜你获得一只小蜜蜂', '1', '');
INSERT INTO `Exam` VALUES ('78', '挺水植物;挺水', '1', '', '答案是挺水植物', '小蜜蜂所在的这株植物属于沉水植物还是挺水植物？', '2020-05-28/102d94a6-cb30-4e33-8539-4f24f0ce5e2c_plantpond.png', '105', 'cp6', 'A01', '2020-05-28/eeb09651-57e4-406c-86c9-1e62943b3fa6_slice_0_0.gif', '0', '正确，继续探索吧', '1', '');
INSERT INTO `Exam` VALUES ('79', '钟形;钟', '1', '', '答案是钟形', '小蜜蜂所在的这种花的花冠属于什么类型？', '2020-05-28/fc32e5f0-b940-4863-aaad-401bd0ced521_timg (1).jpg', '106', 'cp7', '', '2020-05-28/ea0fd11e-0e04-403f-9450-c91b3bda7ac4_20200528014516.jpg', '0', '正确，继续探索吧', '1', '');
INSERT INTO `Exam` VALUES ('80', '果序;果', '1', '', '答案是果序', '这种雾蒙蒙的枝条，是黄栌的花序还是果序？', '2020-05-28/a1c32f8a-7da5-483a-b4d3-7a5bc304b4ad_20200528014535.jpg', '107', 'cp8', 'A05', '2020-05-28/30b9cefb-f8c0-42ac-bf05-1cd89d101082_slice_1_1.gif', '0', '正确，继续探索吧', '1', '');
INSERT INTO `Exam` VALUES ('81', 'D;d;花瓣', '1', 'A雌蕊 B花粉 C雄蕊 D花瓣', '答案是花瓣，香气来自花瓣中的油细胞', '月季有着芬芳的气味，吸引小蜜蜂前来采蜜，并帮助花朵传粉，你觉得花的香味是从哪个部位散发出来的呢？', '', '108', 'cp9', '', '2020-05-28/42a6c012-30eb-402d-874f-c26e63d6d06d_20200528014516.jpg', '0', '正确，继续探索吧', '1', '');
INSERT INTO `Exam` VALUES ('82', '黄花菜', '1', '', '答案是黄花菜，但是公园里的大花萱草可不能吃哦', '小蜜蜂所在的这种花和我们会吃到的哪种食物很像？', '', '109', 'cp10', 'A02', '2020-05-28/d284c16c-eeb0-421f-876a-e6bd395507a5_slice_0_1.gif', '0', '正确，恭喜您获得以下藏宝图碎片', '1', '');
INSERT INTO `Exam` VALUES ('83', '2;两;两针一束;两针', '1', '', '答案是两针一束', '这棵油松的松针是几针一束的？', '', '110', 'cp11', '', '2020-05-28/c730a0e5-647b-4065-a7f6-e521ee1e70c5_20200528014516.jpg', '0', '正确，继续探索吧', '1', '');
INSERT INTO `Exam` VALUES ('85', '否', '1', '回答“是”或者“否”', '绣线菊不是菊花哦', '小蜜蜂所在的这株植物叫做绣线菊，它是菊花吗？', '', '112', 'cp12', 'A04', '2020-05-28/a3277489-86e7-4fb9-b285-6f51390f5df4_slice_1_0.gif', '0', '正确，恭喜您获得以下藏宝图碎片', '1', '');
INSERT INTO `Exam` VALUES ('86', '卵圆形;卵圆', '1', '', '错误，很遗憾，正确答案为卵圆形', '丁香的叶子属于哪种叶形', '2020-05-28/e392552f-74e8-4546-9b23-933a3c8710bc_leaf.jpg', '111', 'cp13', '', '', '0', '正确，继续探索吧', '1', '');
INSERT INTO `Exam` VALUES ('87', '有', '1', '回答“有”或者“没有”', '柽柳有叶子，只是叶子很小，鳞形', '小蜜蜂所在的这种树有叶子吗？', '', '113', 'cp14', 'A04', '2020-05-28/b722c622-4223-4672-b01a-d7ac837e5164_slice_1_0.gif', '0', '正确，恭喜您获得以下藏宝图碎片', '1', '');
INSERT INTO `Exam` VALUES ('88', 'B;b;花萼', '1', 'A 花瓣  B花萼 C花托 D雌蕊', '答案是花萼', '小蜜蜂所在的这个果实上的“五角星”是花的那个部位留下的？', '2020-05-28/f2aad8e6-8758-4e29-8aea-c4f05a1b4e44_flowee.jpg', '114', 'cp15', '', '2020-05-28/3bf704b8-86d3-40e0-b4c2-9f8a3317bc1e_20200528014516.jpg', '0', '正确，继续探索吧', '1', '');
INSERT INTO `Exam` VALUES ('89', 'c;C;啄木鸟', '1', '', '这个树洞不是啄木鸟干的，啄木鸟的树洞是圆形的', '这个树洞是由于什么原因形成的呢？下面几种猜测有哪个是不正确的？', '2020-05-29/93fb9994-8cde-4d7a-8e69-ceda99d4d3f1_hole.jpg', '115', 'cp16', 'A02', '2020-05-28/b15f6730-6c9e-4785-93cf-12e1249d4056_slice_0_1.gif', '0', '正确，恭喜您获得以下藏宝图碎片', '1', '');
INSERT INTO `Exam` VALUES ('90', 'B;b;山楂', '1', 'A樱桃  B山楂  C杏   D西红柿', '海棠、苹果、梨等果实是同一种类型', '海棠的果实类型与下列哪种水果是一样的？', '', '116', 'cp17', '', '2020-05-28/29607a89-697b-4bd2-bfaa-2617c02c5688_20200528014516.jpg', '0', '正确，继续探索吧', '1', '');
INSERT INTO `Exam` VALUES ('91', '聚伞花序;聚伞', '1', '', '答案是聚伞花序', '红瑞木的花序是哪种类型呢？', '2020-05-28/cbb89eb4-b192-4acf-928d-cd3096d50ed1_timg (2).jpg', '117', 'cp18', 'A03', '2020-05-28/2fa8a38a-6b4b-4e85-a825-348e0b8f4935_slice_0_2.gif', '0', '正确，恭喜您获得以下藏宝图碎片', '1', '');
INSERT INTO `Exam` VALUES ('92', '', '1', '', '', '数一数，你身边（以小蜜蜂所在的位置，2m左右的半径内）有几个种类的野花正在盛开呢？', '', '118', 'cp19', 'A06', '2020-05-28/41306da9-16b2-49ea-887a-2541f3ee1af8_slice_1_2.gif', '0', '正确，恭喜您获得以下藏宝图碎片', '1', '');
INSERT INTO `Exam` VALUES ('93', 'B;b;蚯蚓', '1', 'A风 B蚯蚓 C鸟类 D蜜蜂', '蚯蚓是没有办法帮助花朵传粉的', '下列哪种方式不能帮助花朵传粉呢？', '', '119', 'cp20', '', '2020-05-28/a257c3c4-9ba2-4406-9e5c-ac62c6dd5b2e_20200528014516.jpg', '0', '正确，恭喜你获得一只小蜜蜂', '1', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of Line
-- ----------------------------
INSERT INTO `Line` VALUES ('7', '奥森北园', '116.398257', '奥森北园', '2020-04-18/2fcd1363-7dd2-4d5d-aca6-651fe8dd6d30_IMG_20200317_171842_3.jpg', '2020-04-18/af548bb2-7e5a-48cd-9020-59cb103f0fb0_IMG_20200317_171842_1.jpg', null, '40.027106', null, '6', '18', '180', null, null, null, '15', '3000000', '1', '36000000', '1', '', '1', '17');
INSERT INTO `Line` VALUES ('8', '颐和园线', '116.273', '颐和园线', '2020-04-18/963697e5-91c6-4f3b-b516-c8d754b05498_yhyxtt.jpg', '2020-04-18/c5b8fc7b-3a02-4e18-8ab7-01dfb81e2e7c_timg.jfif', null, '39.9929', null, '5', '10', '100', null, null, null, '14', '50', '2', '36000', '0', '', '0', null);
INSERT INTO `Line` VALUES ('9', '', '116.636527', '寻访“终于见到你”', '2020-04-18/003dc06d-3428-4634-8651-cdd6c4ca158d_zyjdntt.jpg', '2020-04-18/ea40d681-4e58-4f7c-aaa9-3c812518e00c_mmexport1501682098858.jpg', null, '40.541082', null, '50', '20', '200', null, null, null, '11', '100', '3', '100000', '1', '', '0', null);
INSERT INTO `Line` VALUES ('10', '', '116.399997', '测试线路', '2020-04-19/b01ab527-3ca2-42f3-b7ce-869739397c3a_llm.jpg', '2020-06-09/75829c3c-8819-4767-8c7c-bddeae058518_ls2.png', null, '40.0266', null, '1', '6', '60', null, null, null, '16', '10000000', '4', '1800000', '0', '', '0', '19');
INSERT INTO `Line` VALUES ('11', 'testtest3', '116.565456', 'testtest', '2020-04-21/6d78a307-1c3b-4039-88a5-a7aef8a560f8_sdf.jpg', '2020-04-21/113e90da-126e-4bd9-a008-cd7cb725fa68_sdf.jpg', null, '39.795446', null, '5', '10', '100', null, null, null, '14', '500000', '5', '1000000', '0', '', '0', null);
INSERT INTO `Line` VALUES ('12', '', '116.353412', '世界花卉大观园', '2020-05-11/3741969b-acdd-427e-b9e9-02dabd9ffd99_hhdgy11.jpg', '2020-05-11/192c2577-5d21-4c16-ba67-09094236dde7_hhdgy.jpg', null, '39.835333', null, '4', '30', '300', null, null, null, '16', '30000', '6', '14400', '1', '349', '1', '18');
INSERT INTO `Line` VALUES ('13', '', '116.127537', '华彬生态园', '2020-05-19/eee66c42-1e09-4bb4-9a32-62a064fadfba_huabin.jpg', '2020-05-18/f6b352f6-e537-467e-855a-f9d2e7783b3c_youmei.jpg', null, '40.208221', null, '2', '10', '100', null, null, null, '16', '50', '7', '10800', '0', '', '0', null);
INSERT INTO `Line` VALUES ('14', 'A+定制', '116.467033', '未来科学城滨水公园', '2020-05-28/a903b06a-fd2a-443a-b863-5e1b6bc8cada_wlkxc.jpeg', '2020-05-28/336a6653-dddf-441e-bd59-6a1d2b02a600_aplus.jpg', null, '40.125502', null, '6', '20', '200', null, null, null, '15', '500000', '8', '36000', '0', 'A+', '1', '18');

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
) ENGINE=InnoDB AUTO_INCREMENT=694 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of LineUser
-- ----------------------------
INSERT INTO `LineUser` VALUES ('71', null, '1587291411383', '1587291559473', '1', '1', '8', null, '73768', null, '8', '73768');
INSERT INTO `LineUser` VALUES ('73', null, '1592984194274', null, null, '1', '8', null, '73760', null, '8', '73760');
INSERT INTO `LineUser` VALUES ('74', null, '1587292136840', '1587341484906', '1', '1', '8', null, '73761', null, '8', '73761');
INSERT INTO `LineUser` VALUES ('75', null, '1592620137972', null, null, '1', '7', null, '73760', null, '7', '73760');
INSERT INTO `LineUser` VALUES ('76', null, '1591710872464', null, null, '1', '7', null, '73768', null, '7', '73768');
INSERT INTO `LineUser` VALUES ('85', null, '1587309777762', null, null, '1', '7', null, '1', null, '7', '1');
INSERT INTO `LineUser` VALUES ('91', null, '1597158483220', null, null, '1', '7', null, '73766', null, '7', '73766');
INSERT INTO `LineUser` VALUES ('93', null, '1587351770999', null, null, '1', '7', null, '73762', null, '7', '73762');
INSERT INTO `LineUser` VALUES ('94', null, '1587354618694', null, null, '1', '9', null, '73772', null, '9', '73772');
INSERT INTO `LineUser` VALUES ('95', null, '1587354659023', null, null, '1', '7', null, '73763', null, '7', '73763');
INSERT INTO `LineUser` VALUES ('97', null, '1591975240909', null, null, '1', '7', null, '73773', null, '7', '73773');
INSERT INTO `LineUser` VALUES ('99', null, '1587365022256', null, null, '1', '9', null, '73773', null, '9', '73773');
INSERT INTO `LineUser` VALUES ('101', null, '1587431205956', null, null, '1', '8', null, '73765', null, '8', '73765');
INSERT INTO `LineUser` VALUES ('102', null, '1587433047101', null, null, '2', '7', null, '73774', null, '7', '73774');
INSERT INTO `LineUser` VALUES ('103', null, '1592640489681', null, null, '1', '7', null, '73765', null, '7', '73765');
INSERT INTO `LineUser` VALUES ('104', null, '1587457970465', null, null, '1', '8', null, '1', null, '8', '1');
INSERT INTO `LineUser` VALUES ('105', null, '1587459948539', null, null, '1', '7', null, '73772', null, '7', '73772');
INSERT INTO `LineUser` VALUES ('106', null, '1587460194418', null, null, '2', '7', null, '73775', null, '7', '73775');
INSERT INTO `LineUser` VALUES ('107', null, '1587460197491', null, null, '1', '7', null, '73775', null, '7', '73775');
INSERT INTO `LineUser` VALUES ('108', null, '1587460398785', null, null, '1', '8', null, '73777', null, '8', '73777');
INSERT INTO `LineUser` VALUES ('109', null, '1589106347938', null, null, '1', '8', null, '73776', null, '8', '73776');
INSERT INTO `LineUser` VALUES ('110', null, '1587460651281', null, null, '1', '9', null, '73776', null, '9', '73776');
INSERT INTO `LineUser` VALUES ('112', null, '1587460711836', null, null, '2', '9', null, '73776', null, '9', '73776');
INSERT INTO `LineUser` VALUES ('113', null, '1588172837323', null, null, '1', '8', null, '73764', null, '8', '73764');
INSERT INTO `LineUser` VALUES ('114', null, '1587460739345', null, null, '1', '9', null, '73779', null, '9', '73779');
INSERT INTO `LineUser` VALUES ('115', null, '1587460807748', null, null, '1', '8', null, '73779', null, '8', '73779');
INSERT INTO `LineUser` VALUES ('116', null, '1587460976025', null, null, '1', '9', null, '73780', null, '9', '73780');
INSERT INTO `LineUser` VALUES ('117', null, '1587461381782', null, null, '1', '8', null, '73781', null, '8', '73781');
INSERT INTO `LineUser` VALUES ('119', null, '1587467234810', null, null, '1', '8', null, '73782', null, '8', '73782');
INSERT INTO `LineUser` VALUES ('120', null, '1587478573592', '1589471893547', '1', '1', '11', null, '73768', null, '11', '73768');
INSERT INTO `LineUser` VALUES ('121', null, '1587550432885', null, null, '1', '7', null, '73783', null, '7', '73783');
INSERT INTO `LineUser` VALUES ('122', null, '1587567221600', null, null, '1', '8', null, '73784', null, '8', '73784');
INSERT INTO `LineUser` VALUES ('123', null, '1587597665220', null, null, '1', '7', null, '73785', null, '7', '73785');
INSERT INTO `LineUser` VALUES ('124', null, '1587597707981', null, null, '1', '8', null, '73785', null, '8', '73785');
INSERT INTO `LineUser` VALUES ('125', null, '1587597721412', null, null, '1', '9', null, '73785', null, '9', '73785');
INSERT INTO `LineUser` VALUES ('126', null, '1587603274280', null, null, '2', '7', null, '73786', null, '7', '73786');
INSERT INTO `LineUser` VALUES ('127', null, '1587603298090', null, null, '1', '7', null, '73786', null, '7', '73786');
INSERT INTO `LineUser` VALUES ('128', null, '1587603333713', null, null, '1', '9', null, '73786', null, '9', '73786');
INSERT INTO `LineUser` VALUES ('129', null, '1587726158045', null, null, '1', '8', null, '73787', null, '8', '73787');
INSERT INTO `LineUser` VALUES ('130', null, '1587727060494', null, null, '1', '9', null, '73775', null, '9', '73775');
INSERT INTO `LineUser` VALUES ('131', null, '1587727103021', null, null, '1', '8', null, '73775', null, '8', '73775');
INSERT INTO `LineUser` VALUES ('132', null, '1587731095204', null, null, '2', '9', null, '73790', null, '9', '73790');
INSERT INTO `LineUser` VALUES ('133', null, '1587731098235', null, null, '1', '9', null, '73790', null, '9', '73790');
INSERT INTO `LineUser` VALUES ('135', null, '1587731132817', null, null, '2', '8', null, '73790', null, '8', '73790');
INSERT INTO `LineUser` VALUES ('136', null, '1587731134295', null, null, '1', '8', null, '73790', null, '8', '73790');
INSERT INTO `LineUser` VALUES ('137', null, '1587733129271', null, null, '1', '8', null, '73791', null, '8', '73791');
INSERT INTO `LineUser` VALUES ('139', null, '1587733635099', null, null, '2', '8', null, '73776', null, '8', '73776');
INSERT INTO `LineUser` VALUES ('140', null, '1587735797612', null, null, '1', '7', null, '73792', null, '7', '73792');
INSERT INTO `LineUser` VALUES ('141', null, '1587736203390', null, null, '1', '8', null, '73793', null, '8', '73793');
INSERT INTO `LineUser` VALUES ('143', null, '1587790702532', null, null, '2', '8', null, '73794', null, '8', '73794');
INSERT INTO `LineUser` VALUES ('144', null, '1587790732312', null, null, '1', '8', null, '73794', null, '8', '73794');
INSERT INTO `LineUser` VALUES ('146', null, '1587791615404', null, null, '1', '7', null, '73787', null, '7', '73787');
INSERT INTO `LineUser` VALUES ('148', null, '1587791787250', null, null, '1', '8', null, '73788', null, '8', '73788');
INSERT INTO `LineUser` VALUES ('150', null, '1587815318532', null, null, '1', '8', null, '73795', null, '8', '73795');
INSERT INTO `LineUser` VALUES ('169', null, '1587846653224', null, null, '2', '7', null, '73798', null, '7', '73798');
INSERT INTO `LineUser` VALUES ('171', null, '1587846655076', null, null, '2', '8', null, '73798', null, '8', '73798');
INSERT INTO `LineUser` VALUES ('173', null, '1587846656882', null, null, '2', '9', null, '73798', null, '9', '73798');
INSERT INTO `LineUser` VALUES ('178', null, '1587861800587', null, null, '1', '8', null, '73799', null, '8', '73799');
INSERT INTO `LineUser` VALUES ('184', null, '1590159155194', null, null, '1', '10', null, '73768', null, '10', '73768');
INSERT INTO `LineUser` VALUES ('186', null, '1587916274904', null, null, '1', '10', null, '73765', null, '10', '73765');
INSERT INTO `LineUser` VALUES ('187', null, '1587950266157', null, null, '1', '8', null, '73800', null, '8', '73800');
INSERT INTO `LineUser` VALUES ('188', null, '1587950292694', null, null, '1', '9', null, '73800', null, '9', '73800');
INSERT INTO `LineUser` VALUES ('189', null, '1587950310602', null, null, '1', '10', null, '73800', null, '10', '73800');
INSERT INTO `LineUser` VALUES ('190', null, '1587950332496', null, null, '1', '7', null, '73800', null, '7', '73800');
INSERT INTO `LineUser` VALUES ('193', null, '1588051416462', null, null, '1', '9', null, '73801', null, '9', '73801');
INSERT INTO `LineUser` VALUES ('194', null, '1588051439997', null, null, '1', '7', null, '73801', null, '7', '73801');
INSERT INTO `LineUser` VALUES ('204', null, '1588099380051', null, null, '2', '7', null, '73803', null, '7', '73803');
INSERT INTO `LineUser` VALUES ('206', null, '1588099381870', null, null, '2', '8', null, '73803', null, '8', '73803');
INSERT INTO `LineUser` VALUES ('208', null, '1588104728530', null, null, '2', '7', null, '73804', null, '7', '73804');
INSERT INTO `LineUser` VALUES ('210', null, '1588104730320', null, null, '2', '8', null, '73804', null, '8', '73804');
INSERT INTO `LineUser` VALUES ('216', null, '1588112728249', null, null, '2', '8', null, '73805', null, '8', '73805');
INSERT INTO `LineUser` VALUES ('218', null, '1588116204413', null, null, '2', '7', null, '73806', null, '7', '73806');
INSERT INTO `LineUser` VALUES ('220', null, '1588116206264', null, null, '2', '8', null, '73806', null, '8', '73806');
INSERT INTO `LineUser` VALUES ('228', null, '1588120380952', null, null, '2', '7', null, '73807', null, '7', '73807');
INSERT INTO `LineUser` VALUES ('230', null, '1588120382865', null, null, '2', '8', null, '73807', null, '8', '73807');
INSERT INTO `LineUser` VALUES ('234', null, '1588121858463', null, null, '2', '8', null, '73808', null, '8', '73808');
INSERT INTO `LineUser` VALUES ('236', null, '1588124256643', null, null, '2', '7', null, '73809', null, '7', '73809');
INSERT INTO `LineUser` VALUES ('238', null, '1588124258484', null, null, '2', '8', null, '73809', null, '8', '73809');
INSERT INTO `LineUser` VALUES ('240', null, '1588126264990', null, null, '2', '7', null, '73810', null, '7', '73810');
INSERT INTO `LineUser` VALUES ('242', null, '1588126266789', null, null, '2', '8', null, '73810', null, '8', '73810');
INSERT INTO `LineUser` VALUES ('248', null, '1588127191205', null, null, '2', '7', null, '73811', null, '7', '73811');
INSERT INTO `LineUser` VALUES ('250', null, '1588127192974', null, null, '2', '8', null, '73811', null, '8', '73811');
INSERT INTO `LineUser` VALUES ('251', null, '1588138517623', null, null, '1', '9', null, '73762', null, '9', '73762');
INSERT INTO `LineUser` VALUES ('252', null, '1588138574964', null, null, '2', '7', null, '73762', null, '7', '73762');
INSERT INTO `LineUser` VALUES ('253', null, '1588148584956', null, null, '1', '10', null, '73773', null, '10', '73773');
INSERT INTO `LineUser` VALUES ('254', null, '1604315697259', null, null, '1', '9', null, '73760', null, '9', '73760');
INSERT INTO `LineUser` VALUES ('255', null, '1588175449656', null, null, '1', '10', null, '73760', null, '10', '73760');
INSERT INTO `LineUser` VALUES ('259', null, '1596969406664', null, null, '1', '7', null, '73764', null, '7', '73764');
INSERT INTO `LineUser` VALUES ('263', null, '1588174258740', null, null, '2', '10', null, '1', null, '10', '1');
INSERT INTO `LineUser` VALUES ('265', null, '1588174275662', null, null, '1', '7', null, '73812', null, '7', '73812');
INSERT INTO `LineUser` VALUES ('267', null, '1588174321649', null, null, '1', '8', null, '73812', null, '8', '73812');
INSERT INTO `LineUser` VALUES ('268', null, '1597728834012', null, null, '1', '12', null, '73761', null, '12', '73761');
INSERT INTO `LineUser` VALUES ('270', null, '1588227705712', null, null, '1', '12', null, '73764', null, '12', '73764');
INSERT INTO `LineUser` VALUES ('273', null, '1588242334320', null, null, '2', '7', null, '73813', null, '7', '73813');
INSERT INTO `LineUser` VALUES ('278', null, '1588242458412', null, null, '2', '7', null, '73814', null, '7', '73814');
INSERT INTO `LineUser` VALUES ('282', null, '1588242834533', null, null, '2', '7', null, '73815', null, '7', '73815');
INSERT INTO `LineUser` VALUES ('284', null, '1588242963680', null, null, '2', '7', null, '73816', null, '7', '73816');
INSERT INTO `LineUser` VALUES ('286', null, '1588243117623', null, null, '2', '7', null, '73817', null, '7', '73817');
INSERT INTO `LineUser` VALUES ('288', null, '1588243151164', null, null, '2', '7', null, '73818', null, '7', '73818');
INSERT INTO `LineUser` VALUES ('292', null, '1588243424001', null, null, '2', '7', null, '73819', null, '7', '73819');
INSERT INTO `LineUser` VALUES ('294', null, '1588243426416', null, null, '2', '7', null, '73820', null, '7', '73820');
INSERT INTO `LineUser` VALUES ('297', null, '1588295445348', null, null, '2', '7', null, '73821', null, '7', '73821');
INSERT INTO `LineUser` VALUES ('298', null, '1590278490467', null, null, '1', '12', null, '73765', null, '12', '73765');
INSERT INTO `LineUser` VALUES ('299', null, '1589473442410', '1589473838945', '1', '1', '11', null, '73760', null, '11', '73760');
INSERT INTO `LineUser` VALUES ('300', null, '1590497630925', null, null, '1', '11', null, '73761', null, '11', '73761');
INSERT INTO `LineUser` VALUES ('302', null, '1597728839468', null, null, '1', '9', null, '73761', null, '9', '73761');
INSERT INTO `LineUser` VALUES ('304', null, '1593504225022', null, null, '1', '7', null, '73761', null, '7', '73761');
INSERT INTO `LineUser` VALUES ('305', null, '1590131243675', '1590141108734', '1', '2', '10', null, '73761', null, '10', '73761');
INSERT INTO `LineUser` VALUES ('306', null, '1595909050588', null, null, '1', '10', null, '73761', null, '10', '73761');
INSERT INTO `LineUser` VALUES ('313', null, '1590723710417', null, null, '1', '13', null, '73765', null, '13', '73765');
INSERT INTO `LineUser` VALUES ('315', null, '1590188468854', null, null, '2', '7', null, '73823', null, '7', '73823');
INSERT INTO `LineUser` VALUES ('316', null, '1590543924099', null, null, '1', '13', null, '73760', null, '13', '73760');
INSERT INTO `LineUser` VALUES ('317', null, '1595780821328', null, null, '1', '12', null, '73760', null, '12', '73760');
INSERT INTO `LineUser` VALUES ('326', null, '1590294706157', null, null, '1', '7', null, '73824', null, '7', '73824');
INSERT INTO `LineUser` VALUES ('328', null, '1590294765622', null, null, '1', '12', null, '73824', null, '12', '73824');
INSERT INTO `LineUser` VALUES ('329', null, '1590299310253', null, null, '1', '13', null, '73825', null, '13', '73825');
INSERT INTO `LineUser` VALUES ('345', null, '1590386913102', null, null, '2', '7', null, '73826', null, '7', '73826');
INSERT INTO `LineUser` VALUES ('347', null, '1590395986505', null, null, '1', '7', null, '73827', null, '7', '73827');
INSERT INTO `LineUser` VALUES ('349', null, '1590395943376', null, null, '2', '7', null, '73827', null, '7', '73827');
INSERT INTO `LineUser` VALUES ('350', null, '1590396001982', null, null, '1', '12', null, '73827', null, '12', '73827');
INSERT INTO `LineUser` VALUES ('351', null, '1590396100264', null, null, '1', '9', null, '73827', null, '9', '73827');
INSERT INTO `LineUser` VALUES ('352', null, '1590475240679', null, null, '1', '7', null, '73828', null, '7', '73828');
INSERT INTO `LineUser` VALUES ('353', null, '1590476196239', null, null, '1', '13', null, '73829', null, '13', '73829');
INSERT INTO `LineUser` VALUES ('354', null, '1590476119070', null, null, '1', '13', null, '73830', null, '13', '73830');
INSERT INTO `LineUser` VALUES ('355', null, '1590477854665', null, null, '2', '13', null, '73829', null, '13', '73829');
INSERT INTO `LineUser` VALUES ('356', null, '1597731086377', null, null, '1', '13', null, '73761', null, '13', '73761');
INSERT INTO `LineUser` VALUES ('358', null, '1590711509968', null, null, '1', '13', null, '73768', null, '13', '73768');
INSERT INTO `LineUser` VALUES ('359', null, '1590650835223', null, null, '1', '14', null, '73765', null, '14', '73765');
INSERT INTO `LineUser` VALUES ('360', null, '1592375194361', null, null, '1', '9', null, '73765', null, '9', '73765');
INSERT INTO `LineUser` VALUES ('361', null, '1595908761822', null, null, '1', '14', null, '73761', null, '14', '73761');
INSERT INTO `LineUser` VALUES ('368', null, '1590632859484', null, null, '1', '13', null, '73767', null, '13', '73767');
INSERT INTO `LineUser` VALUES ('369', null, '1592642134222', null, null, '1', '9', null, '73767', null, '9', '73767');
INSERT INTO `LineUser` VALUES ('371', null, '1590642019217', null, null, '1', '13', null, '73833', null, '13', '73833');
INSERT INTO `LineUser` VALUES ('372', null, '1590726412000', null, null, '1', '14', null, '73764', null, '14', '73764');
INSERT INTO `LineUser` VALUES ('373', null, '1590652169536', null, null, '1', '13', null, '73835', null, '13', '73835');
INSERT INTO `LineUser` VALUES ('374', null, '1590652171240', null, null, '2', '13', null, '73835', null, '13', '73835');
INSERT INTO `LineUser` VALUES ('375', null, '1590667447431', null, null, '1', '13', null, '73764', null, '13', '73764');
INSERT INTO `LineUser` VALUES ('376', null, '1592628395376', null, null, '1', '9', null, '73768', null, '9', '73768');
INSERT INTO `LineUser` VALUES ('377', null, '1590667158528', null, null, '1', '14', null, '73836', null, '14', '73836');
INSERT INTO `LineUser` VALUES ('378', null, '1590720780687', null, null, '1', '14', null, '73837', null, '14', '73837');
INSERT INTO `LineUser` VALUES ('380', null, '1590716825913', null, null, '1', '14', null, '73838', null, '14', '73838');
INSERT INTO `LineUser` VALUES ('382', null, '1590720081771', null, null, '1', '14', null, '73839', null, '14', '73839');
INSERT INTO `LineUser` VALUES ('389', null, '1590997131876', null, null, '1', '14', null, '73842', null, '14', '73842');
INSERT INTO `LineUser` VALUES ('390', null, '1590818170936', null, null, '1', '13', null, '73843', null, '13', '73843');
INSERT INTO `LineUser` VALUES ('391', null, '1590734326693', null, null, '1', '14', null, '73844', null, '14', '73844');
INSERT INTO `LineUser` VALUES ('392', null, '1590731414243', null, null, '1', '14', null, '73845', null, '14', '73845');
INSERT INTO `LineUser` VALUES ('410', null, '1590709897029', null, null, '2', '14', null, '73849', null, '14', '73849');
INSERT INTO `LineUser` VALUES ('414', null, '1590720325151', null, null, '1', '14', null, '73849', null, '14', '73849');
INSERT INTO `LineUser` VALUES ('416', null, '1590733649371', null, null, '1', '14', null, '73853', null, '14', '73853');
INSERT INTO `LineUser` VALUES ('418', null, '1590711547436', null, null, '2', '14', null, '73854', null, '14', '73854');
INSERT INTO `LineUser` VALUES ('419', null, '1590815966929', null, null, '1', '14', null, '73847', null, '14', '73847');
INSERT INTO `LineUser` VALUES ('420', null, '1590711786576', null, null, '2', '13', null, '73847', null, '13', '73847');
INSERT INTO `LineUser` VALUES ('421', null, '1590711789690', null, null, '2', '12', null, '73847', null, '12', '73847');
INSERT INTO `LineUser` VALUES ('422', null, '1590711790695', null, null, '2', '9', null, '73847', null, '9', '73847');
INSERT INTO `LineUser` VALUES ('423', null, '1590711793079', null, null, '2', '7', null, '73847', null, '7', '73847');
INSERT INTO `LineUser` VALUES ('424', null, '1590716795687', null, null, '2', '14', null, '73838', null, '14', '73838');
INSERT INTO `LineUser` VALUES ('425', null, '1590732859971', null, null, '1', '14', null, '73855', null, '14', '73855');
INSERT INTO `LineUser` VALUES ('426', null, '1590718542290', null, null, '1', '14', null, '73856', null, '14', '73856');
INSERT INTO `LineUser` VALUES ('427', null, '1590719955829', null, null, '1', '14', null, '73850', null, '14', '73850');
INSERT INTO `LineUser` VALUES ('429', null, '1590717942248', null, null, '2', '14', null, '73857', null, '14', '73857');
INSERT INTO `LineUser` VALUES ('430', null, '1590718512332', null, null, '1', '14', null, '73857', null, '14', '73857');
INSERT INTO `LineUser` VALUES ('434', null, '1590720655269', null, null, '1', '14', null, '73858', null, '14', '73858');
INSERT INTO `LineUser` VALUES ('435', null, '1590720376966', null, null, '1', '14', null, '73859', null, '14', '73859');
INSERT INTO `LineUser` VALUES ('436', null, '1590720289990', null, null, '2', '14', null, '73859', null, '14', '73859');
INSERT INTO `LineUser` VALUES ('437', null, '1590724275493', null, null, '1', '14', null, '73860', null, '14', '73860');
INSERT INTO `LineUser` VALUES ('438', null, '1590720453192', null, null, '1', '14', null, '73861', null, '14', '73861');
INSERT INTO `LineUser` VALUES ('439', null, '1590997102632', null, null, '1', '14', null, '73862', null, '14', '73862');
INSERT INTO `LineUser` VALUES ('440', null, '1590720696614', null, null, '1', '14', null, '73863', null, '14', '73863');
INSERT INTO `LineUser` VALUES ('441', null, '1590727526653', null, null, '1', '14', null, '73864', null, '14', '73864');
INSERT INTO `LineUser` VALUES ('442', null, '1590723816276', '1590914924808', '1', '1', '14', null, '73865', null, '14', '73865');
INSERT INTO `LineUser` VALUES ('443', null, '1590721964510', null, null, '1', '14', null, '73848', null, '14', '73848');
INSERT INTO `LineUser` VALUES ('445', null, '1590722214134', null, null, '1', '14', null, '73867', null, '14', '73867');
INSERT INTO `LineUser` VALUES ('446', null, '1590721921029', null, null, '1', '14', null, '73868', null, '14', '73868');
INSERT INTO `LineUser` VALUES ('448', null, '1590721967178', null, null, '1', '14', null, '73869', null, '14', '73869');
INSERT INTO `LineUser` VALUES ('449', null, '1591002434335', null, null, '1', '14', null, '73851', null, '14', '73851');
INSERT INTO `LineUser` VALUES ('451', null, '1590728371849', null, null, '1', '14', null, '73872', null, '14', '73872');
INSERT INTO `LineUser` VALUES ('452', null, '1590722530102', null, null, '1', '14', null, '73854', null, '14', '73854');
INSERT INTO `LineUser` VALUES ('454', null, '1590723739620', null, null, '1', '14', null, '73871', null, '14', '73871');
INSERT INTO `LineUser` VALUES ('455', null, '1590723404672', null, null, '1', '14', null, '73873', null, '14', '73873');
INSERT INTO `LineUser` VALUES ('456', null, '1590723423834', null, null, '1', '14', null, '73874', null, '14', '73874');
INSERT INTO `LineUser` VALUES ('457', null, '1590722155692', null, null, '2', '14', null, '73856', null, '14', '73856');
INSERT INTO `LineUser` VALUES ('461', null, '1590722827368', null, null, '1', '14', null, '73875', null, '14', '73875');
INSERT INTO `LineUser` VALUES ('464', null, '1590724726058', null, null, '1', '14', null, '73877', null, '14', '73877');
INSERT INTO `LineUser` VALUES ('465', null, '1590723688394', null, null, '1', '14', null, '73878', null, '14', '73878');
INSERT INTO `LineUser` VALUES ('466', null, '1590723874324', null, null, '1', '14', null, '73879', null, '14', '73879');
INSERT INTO `LineUser` VALUES ('468', null, '1590724024932', null, null, '2', '14', null, '73880', null, '14', '73880');
INSERT INTO `LineUser` VALUES ('469', null, '1590724498655', null, null, '1', '14', null, '73880', null, '14', '73880');
INSERT INTO `LineUser` VALUES ('470', null, '1596719271416', null, null, '1', '14', null, '73760', null, '14', '73760');
INSERT INTO `LineUser` VALUES ('472', null, '1590724885473', null, null, '1', '14', null, '73768', null, '14', '73768');
INSERT INTO `LineUser` VALUES ('473', null, '1590726482987', null, null, '2', '14', null, '73865', null, '14', '73865');
INSERT INTO `LineUser` VALUES ('474', null, '1590728203637', null, null, '1', '14', null, '73881', null, '14', '73881');
INSERT INTO `LineUser` VALUES ('475', null, '1590727710085', null, null, '1', '14', null, '73882', null, '14', '73882');
INSERT INTO `LineUser` VALUES ('477', null, '1590728389600', null, null, '2', '14', null, '73869', null, '14', '73869');
INSERT INTO `LineUser` VALUES ('478', null, '1590728713247', null, null, '2', '14', null, '73861', null, '14', '73861');
INSERT INTO `LineUser` VALUES ('479', null, '1590728967660', null, null, '2', '14', null, '73839', null, '14', '73839');
INSERT INTO `LineUser` VALUES ('480', null, '1590729273339', null, null, '2', '14', null, '73867', null, '14', '73867');
INSERT INTO `LineUser` VALUES ('481', null, '1590731219907', null, null, '1', '14', null, '73883', null, '14', '73883');
INSERT INTO `LineUser` VALUES ('483', null, '1590733640262', null, null, '1', '14', null, '73884', null, '14', '73884');
INSERT INTO `LineUser` VALUES ('487', null, '1590732844988', null, null, '2', '14', null, '73850', null, '14', '73850');
INSERT INTO `LineUser` VALUES ('488', null, '1590742307993', null, null, '1', '14', null, '73885', null, '14', '73885');
INSERT INTO `LineUser` VALUES ('489', null, '1590734332580', null, null, '1', '14', null, '73886', null, '14', '73886');
INSERT INTO `LineUser` VALUES ('491', null, '1590736014566', null, null, '1', '14', null, '73840', null, '14', '73840');
INSERT INTO `LineUser` VALUES ('492', null, '1590733627919', null, null, '2', '14', null, '73884', null, '14', '73884');
INSERT INTO `LineUser` VALUES ('493', null, '1590733844915', null, null, '1', '14', null, '73887', null, '14', '73887');
INSERT INTO `LineUser` VALUES ('495', null, '1590734343462', null, null, '1', '14', null, '73889', null, '14', '73889');
INSERT INTO `LineUser` VALUES ('498', null, '1590736536592', null, null, '1', '14', null, '73890', null, '14', '73890');
INSERT INTO `LineUser` VALUES ('499', null, '1590737658795', null, null, '2', '14', null, '73883', null, '14', '73883');
INSERT INTO `LineUser` VALUES ('501', null, '1590740823425', null, null, '1', '14', null, '73891', null, '14', '73891');
INSERT INTO `LineUser` VALUES ('503', null, '1590738688963', null, null, '2', '14', null, '73871', null, '14', '73871');
INSERT INTO `LineUser` VALUES ('504', null, '1590738689049', null, null, '2', '14', null, '73858', null, '14', '73858');
INSERT INTO `LineUser` VALUES ('505', null, '1590739491729', null, null, '2', '14', null, '73892', null, '14', '73892');
INSERT INTO `LineUser` VALUES ('506', null, '1590740340249', null, null, '2', '14', null, '73891', null, '14', '73891');
INSERT INTO `LineUser` VALUES ('507', null, '1591166008260', null, null, '1', '14', null, '1', null, '14', '1');
INSERT INTO `LineUser` VALUES ('508', null, '1590744014268', null, null, '1', '14', null, '73894', null, '14', '73894');
INSERT INTO `LineUser` VALUES ('509', null, '1590743971134', null, null, '1', '13', null, '73894', null, '13', '73894');
INSERT INTO `LineUser` VALUES ('510', null, '1590743989292', null, null, '2', '9', null, '73894', null, '9', '73894');
INSERT INTO `LineUser` VALUES ('511', null, '1590743992014', null, null, '2', '7', null, '73894', null, '7', '73894');
INSERT INTO `LineUser` VALUES ('512', null, '1590743994199', null, null, '2', '13', null, '73894', null, '13', '73894');
INSERT INTO `LineUser` VALUES ('513', null, '1590743995420', null, null, '2', '14', null, '73894', null, '14', '73894');
INSERT INTO `LineUser` VALUES ('514', null, '1590748710289', null, null, '1', '14', null, '73892', null, '14', '73892');
INSERT INTO `LineUser` VALUES ('515', null, '1590751191799', null, null, '1', '14', null, '73895', null, '14', '73895');
INSERT INTO `LineUser` VALUES ('517', null, '1590754509015', null, null, '2', '14', null, '73853', null, '14', '73853');
INSERT INTO `LineUser` VALUES ('519', null, '1590803122771', null, null, '1', '14', null, '73897', null, '14', '73897');
INSERT INTO `LineUser` VALUES ('520', null, '1590803226946', null, null, '1', '14', null, '73898', null, '14', '73898');
INSERT INTO `LineUser` VALUES ('521', null, '1590803591193', null, null, '1', '7', null, '73847', null, '7', '73847');
INSERT INTO `LineUser` VALUES ('522', null, '1590805211354', null, null, '1', '13', null, '73901', null, '13', '73901');
INSERT INTO `LineUser` VALUES ('523', null, '1590805716683', null, null, '1', '13', null, '73900', null, '13', '73900');
INSERT INTO `LineUser` VALUES ('524', null, '1590804860683', null, null, '1', '13', null, '73903', null, '13', '73903');
INSERT INTO `LineUser` VALUES ('525', null, '1590805249466', null, null, '1', '13', null, '73904', null, '13', '73904');
INSERT INTO `LineUser` VALUES ('526', null, '1590805675841', null, null, '1', '13', null, '73899', null, '13', '73899');
INSERT INTO `LineUser` VALUES ('527', null, '1590806006680', null, null, '1', '13', null, '73905', null, '13', '73905');
INSERT INTO `LineUser` VALUES ('528', null, '1590806142548', null, null, '1', '13', null, '73906', null, '13', '73906');
INSERT INTO `LineUser` VALUES ('529', null, '1590806017001', null, null, '1', '13', null, '73907', null, '13', '73907');
INSERT INTO `LineUser` VALUES ('530', null, '1590822843908', null, null, '1', '13', null, '73908', null, '13', '73908');
INSERT INTO `LineUser` VALUES ('531', null, '1590806096249', null, null, '1', '13', null, '73909', null, '13', '73909');
INSERT INTO `LineUser` VALUES ('532', null, '1590804738421', null, null, '1', '13', null, '73902', null, '13', '73902');
INSERT INTO `LineUser` VALUES ('534', null, '1590805956786', null, null, '2', '14', null, '73847', null, '14', '73847');
INSERT INTO `LineUser` VALUES ('535', null, '1590806194413', null, null, '1', '14', null, '73910', null, '14', '73910');
INSERT INTO `LineUser` VALUES ('536', null, '1590806274274', null, null, '2', '13', null, '73908', null, '13', '73908');
INSERT INTO `LineUser` VALUES ('537', null, '1590806578736', null, null, '2', '14', null, '73898', null, '14', '73898');
INSERT INTO `LineUser` VALUES ('538', null, '1590806599069', null, null, '2', '14', null, '73897', null, '14', '73897');
INSERT INTO `LineUser` VALUES ('539', null, '1590807870961', null, null, '1', '14', null, '73911', null, '14', '73911');
INSERT INTO `LineUser` VALUES ('540', null, '1590807821031', null, null, '1', '14', null, '73912', null, '14', '73912');
INSERT INTO `LineUser` VALUES ('541', null, '1590809800636', null, null, '1', '13', null, '73915', null, '13', '73915');
INSERT INTO `LineUser` VALUES ('542', null, '1590811450834', null, null, '1', '13', null, '73914', null, '13', '73914');
INSERT INTO `LineUser` VALUES ('543', null, '1590809385887', null, null, '1', '13', null, '73917', null, '13', '73917');
INSERT INTO `LineUser` VALUES ('544', null, '1590809783699', null, null, '1', '13', null, '73919', null, '13', '73919');
INSERT INTO `LineUser` VALUES ('545', null, '1590810029855', null, null, '1', '13', null, '73916', null, '13', '73916');
INSERT INTO `LineUser` VALUES ('546', null, '1590809137763', null, null, '1', '13', null, '73921', null, '13', '73921');
INSERT INTO `LineUser` VALUES ('547', null, '1590810083413', null, null, '1', '13', null, '73920', null, '13', '73920');
INSERT INTO `LineUser` VALUES ('548', null, '1590810878657', null, null, '1', '13', null, '73918', null, '13', '73918');
INSERT INTO `LineUser` VALUES ('549', null, '1590809984187', null, null, '1', '13', null, '73922', null, '13', '73922');
INSERT INTO `LineUser` VALUES ('550', null, '1590809097433', null, null, '1', '13', null, '73923', null, '13', '73923');
INSERT INTO `LineUser` VALUES ('553', null, '1590816074255', null, null, '1', '14', null, '73924', null, '14', '73924');
INSERT INTO `LineUser` VALUES ('556', null, '1590812244491', null, null, '2', '14', null, '1', null, '14', '1');
INSERT INTO `LineUser` VALUES ('557', null, '1590816082945', null, null, '1', '14', null, '73925', null, '14', '73925');
INSERT INTO `LineUser` VALUES ('559', null, '1590818760190', null, null, '1', '13', null, '73926', null, '13', '73926');
INSERT INTO `LineUser` VALUES ('560', null, '1590819177948', null, null, '1', '13', null, '73929', null, '13', '73929');
INSERT INTO `LineUser` VALUES ('561', null, '1590818509036', null, null, '1', '13', null, '73927', null, '13', '73927');
INSERT INTO `LineUser` VALUES ('562', null, '1590818705650', null, null, '1', '13', null, '73930', null, '13', '73930');
INSERT INTO `LineUser` VALUES ('563', null, '1590817780413', null, null, '1', '13', null, '73931', null, '13', '73931');
INSERT INTO `LineUser` VALUES ('564', null, '1590817782895', null, null, '2', '13', null, '73930', null, '13', '73930');
INSERT INTO `LineUser` VALUES ('565', null, '1590818829989', null, null, '1', '13', null, '73932', null, '13', '73932');
INSERT INTO `LineUser` VALUES ('566', null, '1590819247668', null, null, '1', '13', null, '73928', null, '13', '73928');
INSERT INTO `LineUser` VALUES ('567', null, '1590818738582', null, null, '1', '13', null, '73933', null, '13', '73933');
INSERT INTO `LineUser` VALUES ('574', null, '1590818287799', null, null, '2', '13', null, '73932', null, '13', '73932');
INSERT INTO `LineUser` VALUES ('576', null, '1590819957976', null, null, '1', '13', null, '73934', null, '13', '73934');
INSERT INTO `LineUser` VALUES ('579', null, '1590818767575', null, null, '2', '13', null, '73926', null, '13', '73926');
INSERT INTO `LineUser` VALUES ('581', null, '1590818973404', null, null, '2', '14', null, '73925', null, '14', '73925');
INSERT INTO `LineUser` VALUES ('582', null, '1590819181468', null, null, '2', '13', null, '73929', null, '13', '73929');
INSERT INTO `LineUser` VALUES ('584', null, '1590820636654', null, null, '1', '13', null, '73924', null, '13', '73924');
INSERT INTO `LineUser` VALUES ('585', null, '1590820655209', null, null, '2', '14', null, '73924', null, '14', '73924');
INSERT INTO `LineUser` VALUES ('586', null, '1590820764477', null, null, '1', '14', null, '73935', null, '14', '73935');
INSERT INTO `LineUser` VALUES ('587', null, '1590823737687', null, null, '1', '14', null, '73846', null, '14', '73846');
INSERT INTO `LineUser` VALUES ('589', null, '1590822161867', null, null, '2', '14', null, '73846', null, '14', '73846');
INSERT INTO `LineUser` VALUES ('590', null, '1590823160704', null, null, '2', '14', null, '73937', null, '14', '73937');
INSERT INTO `LineUser` VALUES ('591', null, '1590826870490', null, null, '1', '14', null, '73937', null, '14', '73937');
INSERT INTO `LineUser` VALUES ('593', null, '1590832561274', null, null, '1', '14', null, '73938', null, '14', '73938');
INSERT INTO `LineUser` VALUES ('594', null, '1590831976695', null, null, '2', '14', null, '73939', null, '14', '73939');
INSERT INTO `LineUser` VALUES ('595', null, '1590832405977', null, null, '1', '14', null, '73939', null, '14', '73939');
INSERT INTO `LineUser` VALUES ('596', null, '1590886487430', null, null, '2', '14', null, '73940', null, '14', '73940');
INSERT INTO `LineUser` VALUES ('597', null, '1590889697465', null, null, '1', '14', null, '73940', null, '14', '73940');
INSERT INTO `LineUser` VALUES ('598', null, '1590902307593', null, null, '1', '14', null, '73941', null, '14', '73941');
INSERT INTO `LineUser` VALUES ('599', null, '1590896438142', null, null, '1', '14', null, '73832', null, '14', '73832');
INSERT INTO `LineUser` VALUES ('600', null, '1590901379310', null, null, '1', '14', null, '73942', null, '14', '73942');
INSERT INTO `LineUser` VALUES ('601', null, '1590903902974', null, null, '1', '14', null, '73943', null, '14', '73943');
INSERT INTO `LineUser` VALUES ('602', null, '1590906877256', null, null, '2', '14', null, '73832', null, '14', '73832');
INSERT INTO `LineUser` VALUES ('603', null, '1590912367573', null, null, '1', '14', null, '73870', null, '14', '73870');
INSERT INTO `LineUser` VALUES ('604', null, '1590912196843', null, null, '2', '14', null, '73870', null, '14', '73870');
INSERT INTO `LineUser` VALUES ('605', null, '1590912416317', null, null, '1', '14', null, '73944', null, '14', '73944');
INSERT INTO `LineUser` VALUES ('607', null, '1590913368059', null, null, '2', '14', null, '73875', null, '14', '73875');
INSERT INTO `LineUser` VALUES ('609', null, '1590921452213', null, null, '1', '14', null, '73945', null, '14', '73945');
INSERT INTO `LineUser` VALUES ('610', null, '1590919738266', null, null, '1', '14', null, '73946', null, '14', '73946');
INSERT INTO `LineUser` VALUES ('611', null, '1590920989391', null, null, '1', '14', null, '73947', null, '14', '73947');
INSERT INTO `LineUser` VALUES ('612', null, '1590922833441', null, null, '1', '14', null, '73948', null, '14', '73948');
INSERT INTO `LineUser` VALUES ('613', null, '1590930641400', null, null, '2', '14', null, '73948', null, '14', '73948');
INSERT INTO `LineUser` VALUES ('617', null, '1590996888339', null, null, '1', '14', null, '73950', null, '14', '73950');
INSERT INTO `LineUser` VALUES ('621', null, '1591095448091', null, null, '2', '7', null, '73881', null, '7', '73881');
INSERT INTO `LineUser` VALUES ('622', null, '1591095490020', null, null, '1', '7', null, '73881', null, '7', '73881');
INSERT INTO `LineUser` VALUES ('623', null, '1591245117958', null, null, '1', '7', null, '73951', null, '7', '73951');
INSERT INTO `LineUser` VALUES ('624', null, '1591245062244', null, null, '2', '7', null, '73951', null, '7', '73951');
INSERT INTO `LineUser` VALUES ('625', null, '1591245224443', null, null, '1', '9', null, '73951', null, '9', '73951');
INSERT INTO `LineUser` VALUES ('626', null, '1591411364602', null, null, '1', '7', null, '73952', null, '7', '73952');
INSERT INTO `LineUser` VALUES ('627', null, '1591412369337', null, null, '1', '14', null, '73952', null, '14', '73952');
INSERT INTO `LineUser` VALUES ('628', null, '1591433465140', null, null, '2', '7', null, '73761', null, '7', '73761');
INSERT INTO `LineUser` VALUES ('629', null, '1591522457579', null, null, '1', '7', null, '73954', null, '7', '73954');
INSERT INTO `LineUser` VALUES ('631', null, '1591857065371', null, null, '1', '9', null, '73956', null, '9', '73956');
INSERT INTO `LineUser` VALUES ('633', null, '1591856460376', null, null, '1', '7', null, '73956', null, '7', '73956');
INSERT INTO `LineUser` VALUES ('634', null, '1591856484939', null, null, '2', '9', null, '73956', null, '9', '73956');
INSERT INTO `LineUser` VALUES ('639', null, '1592383930122', null, null, '1', '7', null, '73861', null, '7', '73861');
INSERT INTO `LineUser` VALUES ('640', null, '1597119582343', null, null, '1', '7', null, '73823', null, '7', '73823');
INSERT INTO `LineUser` VALUES ('641', '0', '1592627399092', null, null, '2', '7', null, '73764', null, '7', '73764');
INSERT INTO `LineUser` VALUES ('642', '0', '1592627409950', null, null, '2', '9', null, '73764', null, '9', '73764');
INSERT INTO `LineUser` VALUES ('648', '0', '1592642133257', null, null, '2', '9', null, '73767', null, '9', '73767');
INSERT INTO `LineUser` VALUES ('649', '0', '1592642149233', null, null, '2', '7', null, '73767', null, '7', '73767');
INSERT INTO `LineUser` VALUES ('650', '0', null, null, null, '1', '7', null, '73767', null, '7', '73767');
INSERT INTO `LineUser` VALUES ('651', '0', null, null, null, '1', '9', null, '73959', null, '9', '73959');
INSERT INTO `LineUser` VALUES ('658', '0', '1592656254278', null, null, '2', '12', null, '73960', null, '12', '73960');
INSERT INTO `LineUser` VALUES ('660', '0', '1592656256785', null, null, '2', '12', null, '73961', null, '12', '73961');
INSERT INTO `LineUser` VALUES ('662', '0', '1592656283524', null, null, '2', '12', null, '73963', null, '12', '73963');
INSERT INTO `LineUser` VALUES ('667', '0', '1592656947053', null, null, '2', '12', null, '73964', null, '12', '73964');
INSERT INTO `LineUser` VALUES ('668', '0', '1592824515045', null, null, '2', '12', null, '73776', null, '12', '73776');
INSERT INTO `LineUser` VALUES ('669', '0', '1593494241799', null, null, '2', '12', null, '73761', null, '12', '73761');
INSERT INTO `LineUser` VALUES ('670', '0', null, null, null, '1', '7', null, '73966', null, '7', '73966');
INSERT INTO `LineUser` VALUES ('671', '0', null, null, null, '1', '9', null, '73966', null, '9', '73966');
INSERT INTO `LineUser` VALUES ('672', '0', '1593677182880', null, null, '2', '12', null, '73966', null, '12', '73966');
INSERT INTO `LineUser` VALUES ('673', '0', null, null, null, '1', '12', null, '73966', null, '12', '73966');
INSERT INTO `LineUser` VALUES ('680', '0', null, null, null, '1', '7', null, '73971', null, '7', '73971');
INSERT INTO `LineUser` VALUES ('681', '0', null, null, null, '1', '9', null, '73971', null, '9', '73971');
INSERT INTO `LineUser` VALUES ('682', '0', null, null, null, '1', '9', null, '73952', null, '9', '73952');
INSERT INTO `LineUser` VALUES ('683', '0', null, null, null, '1', '7', null, '73953', null, '7', '73953');
INSERT INTO `LineUser` VALUES ('684', '0', null, null, null, '1', '9', null, '73953', null, '9', '73953');
INSERT INTO `LineUser` VALUES ('689', '0', '1597158470360', null, null, '2', '12', null, '1', null, '12', '1');
INSERT INTO `LineUser` VALUES ('690', '0', '1597158482206', null, null, '2', '7', null, '73766', null, '7', '73766');
INSERT INTO `LineUser` VALUES ('691', '0', null, null, null, '1', '7', null, '73972', null, '7', '73972');
INSERT INTO `LineUser` VALUES ('692', '0', null, null, null, '1', '9', null, '73823', null, '9', '73823');
INSERT INTO `LineUser` VALUES ('693', '0', '1597742792393', null, null, '2', '9', null, '1', null, '9', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of Point
-- ----------------------------
INSERT INTO `Point` VALUES ('4', '', '116.2785', '8', '颐和园线', '1号点', '', null, null, '39.9896', null, '10', '1');
INSERT INTO `Point` VALUES ('6', '', '116.4010102\r\n', '7', '奥森北园线', '1号点', '', null, null, '40.03168404\r\n', null, '10', '1');
INSERT INTO `Point` VALUES ('7', '', '116.4025738\r\n', '7', '奥森北园线', '5号点', '', null, null, '40.02776334\r\n', null, '10', '5');
INSERT INTO `Point` VALUES ('8', '', '116.3982649\r\n', '7', '奥森北园线', '14号点', '', null, null, '40.02710508\r\n', null, '10', '14');
INSERT INTO `Point` VALUES ('9', '', '116.3967294\r\n', '7', '奥森北园线', '13号点', '', null, null, '40.0289063\r\n', null, '10', '13');
INSERT INTO `Point` VALUES ('10', '', '116.3957798\r\n', '7', '奥森北园线', '8号点', '', null, null, '40.03078963\r\n', null, '10', '8');
INSERT INTO `Point` VALUES ('11', '', '116.3936488\r\n', '7', '奥森北园线', '9号点', '', null, null, '40.03014372\r\n', null, '10', '9');
INSERT INTO `Point` VALUES ('12', '', '116.3922192\r\n', '7', '奥森北园线', '10号点', '', null, null, '40.02950499\r\n', null, '10', '10');
INSERT INTO `Point` VALUES ('13', '', '116.3940526\r\n', '7', '奥森北园线', '11号点', '', null, null, '40.02726939\r\n', null, '10', '11');
INSERT INTO `Point` VALUES ('14', '', '116.3932103\r\n', '7', '奥森北园线', '12号点', '', null, null, '40.02678878\r\n', null, '10', '12');
INSERT INTO `Point` VALUES ('15', '', '116.3994343\r\n', '7', '奥森北园线', '6号点', '', null, null, '40.02840208\r\n', null, '10', '6');
INSERT INTO `Point` VALUES ('16', '', '116.402', '7', '奥森北园线', '2号点', '', null, null, '40.029', null, '10', '2');
INSERT INTO `Point` VALUES ('17', '', '116.398', '7', '奥森北园线', '7号点', '', null, null, '40.03', null, '10', '7');
INSERT INTO `Point` VALUES ('18', '', '116.397', '7', '奥森北园线', '16号点', '', null, null, '40.0251', null, '10', '16');
INSERT INTO `Point` VALUES ('19', '', '116.398', '7', '奥森北园线', '15号点', '', null, null, '40.0265', null, '10', '15');
INSERT INTO `Point` VALUES ('20', '', '116.399', '7', '奥森北园线', '17号点', '', null, null, '40.0255', null, '10', '17');
INSERT INTO `Point` VALUES ('21', '', '116.4', '7', '奥森北园线', '18号点', '', null, null, '40.0266', null, '10', '18');
INSERT INTO `Point` VALUES ('22', '', '116.404', '7', '奥森北园线', '4号点', '', null, null, '40.0282', null, '10', '4');
INSERT INTO `Point` VALUES ('23', '', '116.405', '7', '奥森北园线', '3号点', '', null, null, '40.0292', null, '10', '3');
INSERT INTO `Point` VALUES ('30', '', '116.2795', '8', '颐和园线', '2号点', '', null, null, '39.9813', null, '10', '2');
INSERT INTO `Point` VALUES ('31', '', '116.2738', '8', '颐和园线', '3号点', '', null, null, '39.9831', null, '10', '3');
INSERT INTO `Point` VALUES ('32', '', '116.2716', '8', '颐和园线', '4号点', '', null, null, '39.9893', null, '10', '4');
INSERT INTO `Point` VALUES ('33', '', '116.2667', '8', '颐和园线', '5号点', '', null, null, '39.9929', null, '10', '5');
INSERT INTO `Point` VALUES ('34', '', '116.2642', '8', '颐和园线', '6号点', '', null, null, '39.9957', null, '10', '6');
INSERT INTO `Point` VALUES ('35', '', '116.272', '8', '颐和园线', '7号点', '', null, null, '40.0003', null, '10', '7');
INSERT INTO `Point` VALUES ('36', '', '116.27387', '8', '颐和园线', '8号点', '', null, null, '39.99955', null, '10', '8');
INSERT INTO `Point` VALUES ('37', '', '116.2773', '8', '颐和园线', '9号点', '', null, null, '39.9984', null, '10', '9');
INSERT INTO `Point` VALUES ('38', '', '116.279', '8', '颐和园线', '10号点', '', null, null, '39.9967', null, '10', '10');
INSERT INTO `Point` VALUES ('40', '是的发放', '116.584768', '11', 'qihntest', '签到1', '', null, null, '39.793699', null, '10', '1');
INSERT INTO `Point` VALUES ('41', 'cesssssssssssssssssss', '116.578074', '11', 'qihntest', '签到点2', '2020-04-27/8981776f-3758-494b-ba6e-5d08d25cfa15_1.png', null, null, '39.794194', null, '20', '2');
INSERT INTO `Point` VALUES ('42', '', '116.401998', '10', '测试线路', '一号点', '', null, null, '40.029', null, '10', '1');
INSERT INTO `Point` VALUES ('43', '', '116.398', '10', '测试线路', '二号点', '', null, null, '40.029999', null, '10', '2');
INSERT INTO `Point` VALUES ('44', '', '116.396996', '10', '测试线路', '三号点', '', null, null, '40.0251', null, '10', '3');
INSERT INTO `Point` VALUES ('45', '', '116.398', '10', '测试线路', '四号点', '', null, null, '40.0265', null, '10', '4');
INSERT INTO `Point` VALUES ('46', '', '116.399', '10', '测试线路', '五号点', '', null, null, '40.0255', null, '10', '5');
INSERT INTO `Point` VALUES ('47', '', '116.399997', '10', '测试线路', '六号点', '', null, null, '40.0266', null, '10', '6');
INSERT INTO `Point` VALUES ('48', '', '116.3536652\r\n', '12', '世界花卉大观园线', 'CP1', '', null, null, '39.83254011\r\n', null, '10', '1');
INSERT INTO `Point` VALUES ('49', '', '116.3537711\r\n', '12', '世界花卉大观园线', 'CP2', '', null, null, '39.83307976\r\n', null, '10', '2');
INSERT INTO `Point` VALUES ('50', '', '116.3542673\r\n', '12', '世界花卉大观园线', 'CP3', '', null, null, '39.83372341\r\n', null, '10', '3');
INSERT INTO `Point` VALUES ('51', '', '116.353995\r\n', '12', '世界花卉大观园线', 'CP4', '', null, null, '39.83383154\r\n', null, '10', '4');
INSERT INTO `Point` VALUES ('52', '', '116.3545275\r\n', '12', '世界花卉大观园线', 'CP5', '', null, null, '39.83374606\r\n', null, '10', '5');
INSERT INTO `Point` VALUES ('53', '', '116.3547635\r\n', '12', '世界花卉大观园线', 'CP6', '', null, null, '39.83397057\r\n', null, '10', '6');
INSERT INTO `Point` VALUES ('54', '', '116.3547219\r\n', '12', '世界花卉大观园线', 'CP7', '', null, null, '39.83404987\r\n', null, '10', '7');
INSERT INTO `Point` VALUES ('55', '', '116.3548856\r\n', '12', '世界花卉大观园线', 'CP8', '', null, null, '39.83501585\r\n', null, '10', '8');
INSERT INTO `Point` VALUES ('56', '', '116.3548977\r\n', '12', '世界花卉大观园线', 'CP9', '', null, null, '39.83545558\r\n', null, '10', '9');
INSERT INTO `Point` VALUES ('57', '', '116.3549218\r\n', '12', '世界花卉大观园线', 'CP10', '', null, null, '39.83541748\r\n', null, '10', '10');
INSERT INTO `Point` VALUES ('58', '', '116.3538704\r\n', '12', '世界花卉大观园线', 'CP11', '', null, null, '39.83541749\r\n', null, '10', '11');
INSERT INTO `Point` VALUES ('59', '', '116.3539736\r\n', '12', '世界花卉大观园线', 'CP12', '', null, null, '39.83558122\r\n', null, '10', '12');
INSERT INTO `Point` VALUES ('60', '', '116.3535404\r\n', '12', '世界花卉大观园线', 'CP13', '', null, null, '39.83507043\r\n', null, '10', '13');
INSERT INTO `Point` VALUES ('61', '', '116.3537309\r\n', '12', '世界花卉大观园线', 'CP14', '', null, null, '39.83599006\r\n', null, '10', '14');
INSERT INTO `Point` VALUES ('62', '', '116.3544416\r\n', '12', '世界花卉大观园线', 'CP15', '', null, null, '39.83651114\r\n', null, '10', '15');
INSERT INTO `Point` VALUES ('63', '', '116.3539991\r\n', '12', '世界花卉大观园线', 'CP16', '', null, null, '39.83721964\r\n', null, '10', '16');
INSERT INTO `Point` VALUES ('64', '', '116.3536102\r\n', '12', '世界花卉大观园线', 'CP17', '', null, null, '39.83754917\r\n', null, '10', '17');
INSERT INTO `Point` VALUES ('65', '', '116.3535404\r\n', '12', '世界花卉大观园线', 'CP18', '', null, null, '39.83822573\r\n', null, '10', '18');
INSERT INTO `Point` VALUES ('66', '', '116.353016\r\n', '12', '世界花卉大观园线', 'CP19', '', null, null, '39.83908045\r\n', null, '10', '19');
INSERT INTO `Point` VALUES ('67', '', '116.3527546\r\n', '12', '世界花卉大观园线', 'CP20', '', null, null, '39.83845846\r\n', null, '10', '20');
INSERT INTO `Point` VALUES ('68', '', '116.3527425\r\n', '12', '世界花卉大观园线', 'CP21', '', null, null, '39.83698279\r\n', null, '10', '21');
INSERT INTO `Point` VALUES ('69', '', '116.3524971\r\n', '12', '世界花卉大观园线', 'CP22', '', null, null, '39.83661\r\n', null, '10', '22');
INSERT INTO `Point` VALUES ('70', '', '116.3526232\r\n', '12', '世界花卉大观园线', 'CP23', '', null, null, '39.8357326\r\n', null, '10', '23');
INSERT INTO `Point` VALUES ('71', '', '116.3528028\r\n', '12', '世界花卉大观园线', 'CP24', '', null, null, '39.83576349\r\n', null, '10', '24');
INSERT INTO `Point` VALUES ('72', '', '116.3516481\r\n', '12', '世界花卉大观园线', 'CP25', '', null, null, '39.83551016\r\n', null, '10', '25');
INSERT INTO `Point` VALUES ('73', '', '116.3519177\r\n', '12', '世界花卉大观园线', 'CP26', '', null, null, '39.83458333\r\n', null, '10', '26');
INSERT INTO `Point` VALUES ('74', '', '116.3528498\r\n', '12', '世界花卉大观园线', 'CP27', '', null, null, '39.83384081\r\n', null, '10', '27');
INSERT INTO `Point` VALUES ('75', '', '116.3526983\r\n', '12', '世界花卉大观园线', 'CP28', '', null, null, '39.83289438\r\n', null, '10', '28');
INSERT INTO `Point` VALUES ('76', '', '116.3523549\r\n', '12', '世界花卉大观园线', 'CP29', '', null, null, '39.83381713\r\n', null, '10', '29');
INSERT INTO `Point` VALUES ('77', '', '116.353304', '12', '世界花卉大观园线', 'CP30', '', null, null, '39.831943', null, '10', '30');
INSERT INTO `Point` VALUES ('78', '', '116.126042', '13', '华彬生态园', '一号点', '', null, null, '40.2086', null, '10', '1');
INSERT INTO `Point` VALUES ('79', '', '116.12698', '13', '华彬生态园', '二号点', '', null, null, '40.20915', null, '10', '2');
INSERT INTO `Point` VALUES ('80', '', '116.12749\r\n', '13', '华彬生态园', '三号点', '', null, null, '40.2088\r\n', null, '10', '3');
INSERT INTO `Point` VALUES ('81', '', '116.12853', '13', '华彬生态园', '四号点', '', null, null, '40.20935', null, '10', '4');
INSERT INTO `Point` VALUES ('82', '', '116.128582', '13', '华彬生态园', '五号点', '', null, null, '40.20901\r\n', null, '10', '5');
INSERT INTO `Point` VALUES ('83', '', '116.129066\r\n', '13', '华彬生态园', '六号点', '', null, null, '40.208020', null, '10', '6');
INSERT INTO `Point` VALUES ('84', '', '116.12804', '13', '华彬生态园', '七号点', '', null, null, '40.20727', null, '10', '7');
INSERT INTO `Point` VALUES ('85', '', '116.12775', '13', '华彬生态园', '八号点', '', null, null, '40.20750', null, '10', '8');
INSERT INTO `Point` VALUES ('86', '', '116.127068', '13', '华彬生态园', '九号点', '', null, null, '40.20777', null, '10', '9');
INSERT INTO `Point` VALUES ('87', '', '116.12662\r\n', '13', '华彬生态园', '十号点', '', null, null, '40.20739\r\n', null, '10', '10');
INSERT INTO `Point` VALUES ('88', '', '116.661930', '9', '终于见到你-寻访之旅', '第二站', '', null, null, '40.494098', null, '10', '2');
INSERT INTO `Point` VALUES ('89', '', '116.677589', '9', '终于见到你-寻访之旅', '开始啦', '', null, null, '40.437753', null, '10', '1');
INSERT INTO `Point` VALUES ('90', '', '116.672004', '9', '终于见到你-寻访之旅', '第三站', '', null, null, '40.533943', null, '10', '3');
INSERT INTO `Point` VALUES ('91', '', '116.679654', '9', '终于见到你-寻访之旅', '第四站', '', null, null, '40.556999', null, '10', '4');
INSERT INTO `Point` VALUES ('92', '', '116.664205', '9', '终于见到你-寻访之旅', '第五站', '', null, null, '40.604602', null, '10', '5');
INSERT INTO `Point` VALUES ('93', '', '116.644914', '9', '终于见到你-寻访之旅', '湿地公园', '', null, null, '40.625801', null, '10', '6');
INSERT INTO `Point` VALUES ('94', '', '116.603957', '9', '终于见到你-寻访之旅', '崎峰茶', '', null, null, '40.585498', null, '10', '7');
INSERT INTO `Point` VALUES ('95', '', '116.581700', '9', '终于见到你-寻访之旅', '腊千山', '', null, null, '40.594733', null, '10', '8');
INSERT INTO `Point` VALUES ('96', '', '116.575638', '9', '终于见到你-寻访之旅', '鸽子洞', '', null, null, '40.574730', null, '10', '9');
INSERT INTO `Point` VALUES ('97', '', '116.556337', '9', '终于见到你-寻访之旅', '三岔口', '', null, null, '40.568654', null, '10', '10');
INSERT INTO `Point` VALUES ('98', '', '116.529788', '9', '终于见到你-寻访之旅', '终于见到你', '', null, null, '40.546507', null, '10', '11');
INSERT INTO `Point` VALUES ('99', '', '116.606591', '9', '终于见到你-寻访之旅', '篱苑书屋', '', null, null, '40.464960', null, '10', '12');
INSERT INTO `Point` VALUES ('100', '', '116.465087017695', '14', '未来科学城滨水公园', 'cp1', '', null, null, '40.1196699925261', null, '10', '1');
INSERT INTO `Point` VALUES ('101', '', '116.465543812434', '14', '未来科学城滨水公园', 'cp2', '', null, null, '40.1210770468038', null, '10', '2');
INSERT INTO `Point` VALUES ('102', '', '116.4671719871', '14', '未来科学城滨水公园', 'cp3', '', null, null, '40.1224613089571', null, '10', '3');
INSERT INTO `Point` VALUES ('103', '', '116.464897217449', '14', '未来科学城滨水公园', 'cp4', '', null, null, '40.1245728657647', null, '10', '4');
INSERT INTO `Point` VALUES ('104', '', '116.462159278585', '14', '未来科学城滨水公园', 'cp5', '', null, null, '40.1243090794765', null, '10', '5');
INSERT INTO `Point` VALUES ('105', '', '116.46077437077', '14', '未来科学城滨水公园', 'cp6', '', null, null, '40.1250552209712', null, '10', '6');
INSERT INTO `Point` VALUES ('106', '', '116.459610790907', '14', '未来科学城滨水公园', 'cp7', '', null, null, '40.1261148420549', null, '10', '7');
INSERT INTO `Point` VALUES ('107', '', '116.459433552466', '14', '未来科学城滨水公园', 'cp8', '', null, null, '40.127759414849', null, '10', '8');
INSERT INTO `Point` VALUES ('108', '', '116.457868989358', '14', '未来科学城滨水公园', 'cp9', '', null, null, '40.1291708140355', null, '10', '9');
INSERT INTO `Point` VALUES ('109', '', '116.456598311049', '14', '未来科学城滨水公园', 'cp10', '', null, null, '40.1283873688415', null, '10', '10');
INSERT INTO `Point` VALUES ('110', '', '116.456369678057', '14', '未来科学城滨水公园', 'cp11', '', null, null, '40.1265066641055', null, '10', '11');
INSERT INTO `Point` VALUES ('111', '', '116.45596555976', '14', '未来科学城滨水公园', 'cp13', '', null, null, '40.1250463525104', null, '10', '12');
INSERT INTO `Point` VALUES ('112', '', '116.457419711118', '14', '未来科学城滨水公园', 'cp12', '', null, null, '40.1252953970173', null, '10', '13');
INSERT INTO `Point` VALUES ('113', '', '116.454740666364', '14', '未来科学城滨水公园', 'cp14', '', null, null, '40.1243657403853', null, '10', '14');
INSERT INTO `Point` VALUES ('114', '', '116.45574485103', '14', '未来科学城滨水公园', 'cp15', '', null, null, '40.1227885969517', null, '10', '15');
INSERT INTO `Point` VALUES ('115', '', '116.4571760105', '14', '未来科学城滨水公园', 'cp16', '', null, null, '40.1225036530251', null, '10', '16');
INSERT INTO `Point` VALUES ('116', '', '116.459618417353', '14', '未来科学城滨水公园', 'cp17', '', null, null, '40.1233635795111', null, '10', '17');
INSERT INTO `Point` VALUES ('117', '', '116.462949709356', '14', '未来科学城滨水公园', 'cp18', '', null, null, '40.1221781212302', null, '10', '18');
INSERT INTO `Point` VALUES ('118', '', '116.4628888028', '14', '未来科学城滨水公园', 'cp19', '', null, null, '40.1215102003423', null, '10', '19');
INSERT INTO `Point` VALUES ('119', '', '116.464418123987', '14', '未来科学城滨水公园', 'cp20', '', null, null, '40.1203966078156', null, '10', '20');

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
) ENGINE=InnoDB AUTO_INCREMENT=1236 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of PointUserinfo
-- ----------------------------
INSERT INTO `PointUserinfo` VALUES ('164', '10', null, '1', null, null, '2020-05-22/wxa8e0a9a2f65066a5.o6zAJs8wWUB39rzuCg8Nk1v_2OP4.PUGWufFC0WOt1ca42512fce332322a823077cc72532e.jpg', '42', '一号点', '73768', '早起的小闹钟', null, null, '10', '1590159195172', '', '17', 'CSCBT02', '2020-04-29/9a38b5c9-74bd-490e-acb2-204bf80e11d0_cbt-1_02.jpg', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('165', '10', null, '1', null, null, '', '43', '二号点', '73768', '早起的小闹钟', null, null, '10', '1590159231915', '不及汪伦送我情', '18', 'CSCBT01', '2020-04-29/2f9b001b-bb90-49f7-b268-0c043e8b0f10_cbt-1_01.jpg', '1', '1', null);
INSERT INTO `PointUserinfo` VALUES ('166', '0', null, '0', null, null, '', '40', '签到1', '73760', '华南虎', null, null, '11', '1590240029238', '', '61', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('167', '20', null, '1', null, null, '2020-05-23/tmp_039bd23a31fb6987cd59c1035bad250ea1ebe076421cca46.jpg', '41', '签到点2', '73760', '华南虎', null, null, '11', '1590240039926', '', '2', 'j101', '2020-05-11/6bef49fb-f42b-4054-8231-8cb114d72642_a1.jpg', '2', '1', null);
INSERT INTO `PointUserinfo` VALUES ('174', '10', null, '1', null, null, '', '78', 'CP01', '73830', '法治（龙马）', null, null, '13', '1590476200140', '行歌荒野中', '62', 'YM04', '2020-05-25/8ff6c59f-6e6a-4fa6-ba0b-9932d3163362_YM04.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('175', '10', null, '1', null, null, '', '78', 'CP01', '73829', '纳之   luke', null, null, '13', '1590476208798', '行歌荒野中', '62', 'YM04', '2020-05-25/8ff6c59f-6e6a-4fa6-ba0b-9932d3163362_YM04.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('176', '10', null, '1', null, null, '2020-05-26/tmp_72c99c7244f6e221c6a31b073ad7d2274d84a6a577c3b3b9.jpg', '79', 'CP02', '73829', '纳之   luke', null, null, '13', '1590476617828', '', '63', '', '2020-05-25/70313be5-b27f-4fa4-a4eb-8617ee0c333f_slice_1_1.jpg', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('177', '10', null, '1', null, null, '2020-05-26/tmp_aada3953d246f52d4d027205c6c7342364d8c18dd015a02d.jpg', '79', 'CP02', '73830', '法治（龙马）', null, null, '13', '1590476622963', '', '63', '', '2020-05-25/70313be5-b27f-4fa4-a4eb-8617ee0c333f_slice_1_1.jpg', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('178', '0', null, '0', null, null, '', '80', 'CP03', '73829', '纳之   luke', null, null, '13', '1590476746343', '', '64', '答案错误', '', '1', '1', null);
INSERT INTO `PointUserinfo` VALUES ('179', '10', null, '1', null, null, '', '80', 'CP03', '73830', '法治（龙马）', null, null, '13', '1590476747510', 'SOS', '64', 'YM01', '2020-05-26/38bcde63-306c-43aa-a403-73cd19751558_YM01.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('180', '0', null, '0', null, null, '', '81', 'CP04', '73829', '纳之   luke', null, null, '13', '1590476754857', '', '68', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('181', '0', null, '0', null, null, '', '82', 'CP05', '73829', '纳之   luke', null, null, '13', '1590476765420', '', '67', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('186', '10', null, '1', null, null, '', '81', 'CP04', '73830', '法治（龙马）', null, null, '13', '1590477327219', 'c', '68', '', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('188', '0', null, '0', null, null, '', '83', 'CP06', '73829', '纳之   luke', null, null, '13', '1590477490556', '', '69', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('189', '10', null, '1', null, null, '', '82', 'CP05', '73830', '法治（龙马）', null, null, '13', '1590477502645', '', '67', 'YM03', '2020-05-26/e8fff4f9-4144-4128-921c-860727cbcbcb_YM03.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('190', '0', null, '0', null, null, '', '83', 'CP06', '73830', '法治（龙马）', null, null, '13', '1590477764958', '', '69', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('192', '10', null, '1', null, null, '2020-05-26/tmp_3bc2d0c9d08c373de1a60db8871b4557577f71792199900f.jpg', '84', 'CP07', '73830', '法治（龙马）', null, null, '13', '1590477818190', '', '70', '', '', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('194', '10', null, '1', null, null, '2020-05-26/tmp_0c03975330408268f2d1a855f19928d7260a1322f2848a4c.jpg', '84', 'CP07', '73829', '纳之   luke', null, null, '13', '1590478025213', '', '70', '', '', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('196', '10', null, '1', null, null, '', '85', 'CP08', '73829', '纳之   luke', null, null, '13', '1590478587495', '', '72', 'YM05', '2020-05-26/ba69fa6f-26ef-4fef-95d3-e725199e8cf7_YM05.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('199', '10', null, '1', null, null, '2020-05-26/tmp_96e3b16c72b352a2961a4269448ff494791bd24577023f51.jpg', '87', 'CP10', '73829', '纳之   luke', null, null, '13', '1590479659038', '', '65', '', '2020-05-26/75ce5db0-15e0-4a17-b8db-92d6f5d94902_slice_0_0.jpg', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('255', '0', null, '0', null, null, '', '78', '一号点', '73760', '华南虎', null, null, '13', '1590543929180', '', '62', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('256', '10', null, '1', null, null, '2020-05-27/tmp_b08bd859c32d6f4af77bd9c25c5571dcf3586b6e7243ccbb.jpg', '79', '二号点', '73760', '华南虎', null, null, '13', '1590543958028', '', '63', '', '2020-05-25/70313be5-b27f-4fa4-a4eb-8617ee0c333f_slice_1_1.jpg', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('257', '0', null, '0', null, null, '', '80', '三号点', '73760', '华南虎', null, null, '13', '1590544161326', '', '64', '答案错误', '', '1', '1', null);
INSERT INTO `PointUserinfo` VALUES ('276', '10', null, '1', null, null, '', '100', 'cp1', '73765', '涂涂', null, null, '14', '1590650854295', '是', '73', '', '2020-05-28/e2ae7706-9dcd-4596-9a88-ccf5ce4c856e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('277', '10', null, '1', null, null, '', '101', 'cp2', '73765', '涂涂', null, null, '14', '1590650891678', 'b', '74', 'A01', '2020-05-28/9f1a26ca-c095-4bef-b6c8-4876c69a9634_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('278', '0', null, '1', null, null, '', '102', 'cp3', '73765', '涂涂', null, null, '14', '1590650920112', '; C', '75', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('279', '10', null, '1', null, null, '', '103', 'cp4', '73765', '涂涂', null, null, '14', '1590650979230', 'A', '76', 'A05', '2020-05-28/c68e5a0a-ac03-4792-8bf4-e8cf7eff680b_slice_1_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('280', '10', null, '1', null, null, '', '104', 'cp5', '73765', '涂涂', null, null, '14', '1590650994773', 'C', '77', '', '2020-05-28/e8b3572f-5545-4b99-9b70-a1e49fb026a7_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('281', '10', null, '1', null, null, '', '105', 'cp6', '73765', '涂涂', null, null, '14', '1590651011365', '挺水', '78', 'A01', '2020-05-28/eeb09651-57e4-406c-86c9-1e62943b3fa6_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('282', '10', null, '1', null, null, '', '106', 'cp7', '73765', '涂涂', null, null, '14', '1590651026659', '钟形', '79', '', '2020-05-28/ea0fd11e-0e04-403f-9450-c91b3bda7ac4_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('283', '10', null, '1', null, null, '', '107', 'cp8', '73765', '涂涂', null, null, '14', '1590651038158', '果序', '80', 'A05', '2020-05-28/30b9cefb-f8c0-42ac-bf05-1cd89d101082_slice_1_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('284', '10', null, '1', null, null, '', '108', 'cp9', '73765', '涂涂', null, null, '14', '1590651054390', 'd', '81', '', '2020-05-28/42a6c012-30eb-402d-874f-c26e63d6d06d_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('285', '10', null, '1', null, null, '', '109', 'cp10', '73765', '涂涂', null, null, '14', '1590651064834', '黄花菜', '82', 'A02', '2020-05-28/d284c16c-eeb0-421f-876a-e6bd395507a5_slice_0_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('286', '10', null, '1', null, null, '', '110', 'cp11', '73765', '涂涂', null, null, '14', '1590651073162', '两', '83', '', '2020-05-28/c730a0e5-647b-4065-a7f6-e521ee1e70c5_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('287', '10', null, '1', null, null, '', '111', 'cp13', '73765', '涂涂', null, null, '14', '1590651093343', '卵圆形', '86', '', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('288', '10', null, '1', null, null, '', '112', 'cp12', '73765', '涂涂', null, null, '14', '1590651120301', '否', '85', 'A04', '2020-05-28/a3277489-86e7-4fb9-b285-6f51390f5df4_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('289', '10', null, '1', null, null, '', '113', 'cp14', '73765', '涂涂', null, null, '14', '1590651128760', '有', '87', 'A04', '2020-05-28/b722c622-4223-4672-b01a-d7ac837e5164_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('290', '10', null, '1', null, null, '', '114', 'cp15', '73765', '涂涂', null, null, '14', '1590651145954', 'b', '88', '', '2020-05-28/3bf704b8-86d3-40e0-b4c2-9f8a3317bc1e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('291', '10', null, '1', null, null, '', '115', 'cp16', '73765', '涂涂', null, null, '14', '1590651160228', 'c', '89', 'A02', '2020-05-28/b15f6730-6c9e-4785-93cf-12e1249d4056_slice_0_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('292', '10', null, '1', null, null, '', '116', 'cp17', '73765', '涂涂', null, null, '14', '1590651168221', 'b', '90', '', '2020-05-28/29607a89-697b-4bd2-bfaa-2617c02c5688_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('293', '10', null, '1', null, null, '', '117', 'cp18', '73765', '涂涂', null, null, '14', '1590651196072', '聚伞花序', '91', 'A03', '2020-05-28/2fa8a38a-6b4b-4e85-a825-348e0b8f4935_slice_0_2.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('294', '10', null, '1', null, null, '', '118', 'cp19', '73765', '涂涂', null, null, '14', '1590651211569', '', '92', 'A06', '2020-05-28/41306da9-16b2-49ea-887a-2541f3ee1af8_slice_1_2.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('295', '0', null, '0', null, null, '', '119', 'cp20', '73765', '涂涂', null, null, '14', '1590651239920', '', '93', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('302', '10', null, '1', null, null, '', '100', 'cp1', '73857', '王蕾', null, null, '14', '1590718531600', '是', '73', '', '2020-05-28/e2ae7706-9dcd-4596-9a88-ccf5ce4c856e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('303', '10', null, '1', null, null, '', '100', 'cp1', '73856', '昨日重现', null, null, '14', '1590718615261', '是', '73', '', '2020-05-28/e2ae7706-9dcd-4596-9a88-ccf5ce4c856e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('304', '0', null, '0', null, null, '', '119', 'cp20', '73857', '王蕾', null, null, '14', '1590719040718', '', '93', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('305', '10', null, '1', null, null, '', '101', 'cp2', '73856', '昨日重现', null, null, '14', '1590719168284', 'b', '74', 'A01', '2020-05-28/9f1a26ca-c095-4bef-b6c8-4876c69a9634_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('306', '0', null, '0', null, null, '', '102', 'cp3', '73856', '昨日重现', null, null, '14', '1590719387639', '', '75', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('307', '10', null, '1', null, null, '', '103', 'cp4', '73856', '昨日重现', null, null, '14', '1590719640189', 'a', '76', 'A05', '2020-05-28/c68e5a0a-ac03-4792-8bf4-e8cf7eff680b_slice_1_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('308', '0', null, '0', null, null, '', '101', 'cp2', '73857', '王蕾', null, null, '14', '1590719757184', '', '74', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('309', '10', null, '1', null, null, '', '100', 'cp1', '73850', '吴昊@SaaS', null, null, '14', '1590720016162', '是', '73', '', '2020-05-28/e2ae7706-9dcd-4596-9a88-ccf5ce4c856e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('310', '0', null, '0', null, null, '', '100', 'cp1', '73839', '清风', null, null, '14', '1590720099048', '', '73', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('311', '10', null, '1', null, null, '', '104', 'cp5', '73856', '昨日重现', null, null, '14', '1590720149146', 'c', '77', '', '2020-05-28/e8b3572f-5545-4b99-9b70-a1e49fb026a7_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('312', '10', null, '1', null, null, '', '119', 'cp20', '73850', '吴昊@SaaS', null, null, '14', '1590720272694', 'B', '93', '', '2020-05-28/a257c3c4-9ba2-4406-9e5c-ac62c6dd5b2e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('313', '0', null, '0', null, null, '', '102', 'cp3', '73857', '王蕾', null, null, '14', '1590720333692', '', '75', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('314', '0', null, '0', null, null, '', '119', 'cp20', '73839', '清风', null, null, '14', '1590720376284', '', '93', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('315', '10', null, '1', null, null, '', '100', 'cp1', '73859', '过站不停', null, null, '14', '1590720453737', '是', '73', '', '2020-05-28/e2ae7706-9dcd-4596-9a88-ccf5ce4c856e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('316', '10', null, '1', null, null, '', '100', 'cp1', '73861', 'Frank', null, null, '14', '1590720592610', '是', '73', '', '2020-05-28/e2ae7706-9dcd-4596-9a88-ccf5ce4c856e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('317', '10', null, '1', null, null, '', '100', 'cp1', '73858', '邓超人001号。', null, null, '14', '1590720694606', '是', '73', '', '2020-05-28/e2ae7706-9dcd-4596-9a88-ccf5ce4c856e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('318', '10', null, '1', null, null, '', '100', 'cp1', '73863', '情绪，认知-代松', null, null, '14', '1590720721055', '是', '73', '', '2020-05-28/e2ae7706-9dcd-4596-9a88-ccf5ce4c856e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('319', '10', null, '1', null, null, '', '101', 'cp2', '73839', '清风', null, null, '14', '1590720732929', 'B', '74', 'A01', '2020-05-28/9f1a26ca-c095-4bef-b6c8-4876c69a9634_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('320', '10', null, '1', null, null, '', '105', 'cp6', '73856', '昨日重现', null, null, '14', '1590720831749', '挺水植物', '78', 'A01', '2020-05-28/eeb09651-57e4-406c-86c9-1e62943b3fa6_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('321', '0', null, '0', null, null, '', '101', 'cp2', '73837', '李文芳', null, null, '14', '1590720927816', '', '74', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('322', '10', null, '1', null, null, '', '101', 'cp2', '73850', '吴昊@SaaS', null, null, '14', '1590720987197', 'B', '74', 'A01', '2020-05-28/9f1a26ca-c095-4bef-b6c8-4876c69a9634_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('323', '10', null, '1', null, null, '', '119', 'cp20', '73859', '过站不停', null, null, '14', '1590721015827', 'B', '93', '', '2020-05-28/a257c3c4-9ba2-4406-9e5c-ac62c6dd5b2e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('324', '10', null, '1', null, null, '', '101', 'cp2', '73861', 'Frank', null, null, '14', '1590721018938', 'B', '74', 'A01', '2020-05-28/9f1a26ca-c095-4bef-b6c8-4876c69a9634_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('325', '10', null, '1', null, null, '', '101', 'cp2', '73863', '情绪，认知-代松', null, null, '14', '1590721039027', 'B', '74', 'A01', '2020-05-28/9f1a26ca-c095-4bef-b6c8-4876c69a9634_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('326', '0', null, '0', null, null, '', '103', 'cp4', '73857', '王蕾', null, null, '14', '1590721122542', '', '76', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('327', '10', null, '1', null, null, '', '106', 'cp7', '73856', '昨日重现', null, null, '14', '1590721256288', '钟形', '79', '', '2020-05-28/ea0fd11e-0e04-403f-9450-c91b3bda7ac4_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('328', '10', null, '1', null, null, '', '107', 'cp8', '73856', '昨日重现', null, null, '14', '1590721464946', '果序', '80', 'A05', '2020-05-28/30b9cefb-f8c0-42ac-bf05-1cd89d101082_slice_1_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('329', '0', null, '0', null, null, '', '102', 'cp3', '73839', '清风', null, null, '14', '1590721597976', '', '75', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('330', '0', null, '0', null, null, '', '102', 'cp3', '73861', 'Frank', null, null, '14', '1590721727616', '', '75', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('331', '0', null, '0', null, null, '', '104', 'cp5', '73857', '王蕾', null, null, '14', '1590721756703', '', '77', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('332', '10', null, '1', null, null, '', '102', 'cp3', '73837', '李文芳', null, null, '14', '1590721830987', 'a', '75', '', '2020-05-28/85ea01c4-3c88-4d15-a740-bdc8001df224_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('333', '10', null, '1', null, null, '', '102', 'cp3', '73850', '吴昊@SaaS', null, null, '14', '1590721852024', 'A', '75', '', '2020-05-28/85ea01c4-3c88-4d15-a740-bdc8001df224_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('334', '10', null, '1', null, null, '', '102', 'cp3', '73863', '情绪，认知-代松', null, null, '14', '1590721894291', 'a', '75', '', '2020-05-28/85ea01c4-3c88-4d15-a740-bdc8001df224_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('335', '0', null, '0', null, null, '', '108', 'cp9', '73856', '昨日重现', null, null, '14', '1590721911827', '', '81', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('336', '10', null, '1', null, null, '', '100', 'cp1', '73868', '楚门', null, null, '14', '1590721939161', '是', '73', '', '2020-05-28/e2ae7706-9dcd-4596-9a88-ccf5ce4c856e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('337', '10', null, '1', null, null, '', '100', 'cp1', '73848', '灵果Laura', null, null, '14', '1590721974226', '是', '73', '', '2020-05-28/e2ae7706-9dcd-4596-9a88-ccf5ce4c856e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('338', '10', null, '1', null, null, '', '100', 'cp1', '73869', 'a_nnie', null, null, '14', '1590722084774', '是', '73', '', '2020-05-28/e2ae7706-9dcd-4596-9a88-ccf5ce4c856e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('339', '0', null, '0', null, null, '', '101', 'cp2', '73858', '邓超人001号。', null, null, '14', '1590722138702', '', '74', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('340', '0', null, '0', null, null, '', '109', 'cp10', '73856', '昨日重现', null, null, '14', '1590722171081', '', '82', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('341', '10', null, '1', null, null, '', '100', 'cp1', '73867', 'Rich. W.', null, null, '14', '1590722279551', '是', '73', '', '2020-05-28/e2ae7706-9dcd-4596-9a88-ccf5ce4c856e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('342', '10', null, '1', null, null, '', '103', 'cp4', '73861', 'Frank', null, null, '14', '1590722427191', 'A', '76', 'A05', '2020-05-28/c68e5a0a-ac03-4792-8bf4-e8cf7eff680b_slice_1_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('343', '10', null, '1', null, null, '', '103', 'cp4', '73839', '清风', null, null, '14', '1590722442095', 'A', '76', 'A05', '2020-05-28/c68e5a0a-ac03-4792-8bf4-e8cf7eff680b_slice_1_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('344', '0', null, '0', null, null, '', '117', 'cp18', '73857', '王蕾', null, null, '14', '1590722458025', '', '91', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('345', '0', null, '0', null, null, '', '103', 'cp4', '73863', '情绪，认知-代松', null, null, '14', '1590722482144', '', '76', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('346', '0', null, '0', null, null, '', '101', 'cp2', '73869', 'a_nnie', null, null, '14', '1590722527834', '', '74', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('347', '10', null, '1', null, null, '', '101', 'cp2', '73867', 'Rich. W.', null, null, '14', '1590722588943', 'B', '74', 'A01', '2020-05-28/9f1a26ca-c095-4bef-b6c8-4876c69a9634_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('348', '10', null, '1', null, null, '', '101', 'cp2', '73848', '灵果Laura', null, null, '14', '1590722608577', 'B', '74', 'A01', '2020-05-28/9f1a26ca-c095-4bef-b6c8-4876c69a9634_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('349', '10', null, '1', null, null, '', '103', 'cp4', '73837', '李文芳', null, null, '14', '1590722612002', 'a', '76', 'A05', '2020-05-28/c68e5a0a-ac03-4792-8bf4-e8cf7eff680b_slice_1_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('350', '0', null, '0', null, null, '', '101', 'cp2', '73868', '楚门', null, null, '14', '1590722639827', '', '74', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('351', '10', null, '1', null, null, '', '101', 'cp2', '73859', '过站不停', null, null, '14', '1590722643927', 'B', '74', 'A01', '2020-05-28/9f1a26ca-c095-4bef-b6c8-4876c69a9634_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('352', '10', null, '1', null, null, '', '100', 'cp1', '73854', '灿米爸', null, null, '14', '1590722664803', '是', '73', '', '2020-05-28/e2ae7706-9dcd-4596-9a88-ccf5ce4c856e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('353', '10', null, '1', null, null, '', '100', 'cp1', '73876', '李大芳', null, null, '14', '1590722761926', '是', '73', '', '2020-05-28/e2ae7706-9dcd-4596-9a88-ccf5ce4c856e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('354', '0', null, '0', null, null, '', '110', 'cp11', '73856', '昨日重现', null, null, '14', '1590722774874', '', '83', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('355', '0', null, '0', null, null, '', '102', 'cp3', '73869', 'a_nnie', null, null, '14', '1590722777488', '', '75', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('356', '10', null, '1', null, null, '', '103', 'cp4', '73850', '吴昊@SaaS', null, null, '14', '1590722801725', 'A', '76', 'A05', '2020-05-28/c68e5a0a-ac03-4792-8bf4-e8cf7eff680b_slice_1_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('357', '10', null, '1', null, null, '', '100', 'cp1', '73875', '积雪爬上门前的台阶', null, null, '14', '1590722841930', '是', '73', '', '2020-05-28/e2ae7706-9dcd-4596-9a88-ccf5ce4c856e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('358', '0', null, '0', null, null, '', '104', 'cp5', '73839', '清风', null, null, '14', '1590722936849', '', '77', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('359', '10', null, '1', null, null, '', '101', 'cp2', '73876', '李大芳', null, null, '14', '1590723021201', 'B', '74', 'A01', '2020-05-28/9f1a26ca-c095-4bef-b6c8-4876c69a9634_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('360', '10', null, '1', null, null, '', '101', 'cp2', '73875', '积雪爬上门前的台阶', null, null, '14', '1590723034770', 'B', '74', 'A01', '2020-05-28/9f1a26ca-c095-4bef-b6c8-4876c69a9634_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('361', '0', null, '0', null, null, '', '102', 'cp3', '73868', '楚门', null, null, '14', '1590723123334', '', '75', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('362', '0', null, '0', null, null, '', '103', 'cp4', '73869', 'a_nnie', null, null, '14', '1590723147580', '', '76', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('363', '0', null, '0', null, null, '', '111', 'cp13', '73856', '昨日重现', null, null, '14', '1590723182373', '', '86', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('364', '10', null, '1', null, null, '', '105', 'cp6', '73839', '清风', null, null, '14', '1590723217640', '挺水植物', '78', 'A01', '2020-05-28/eeb09651-57e4-406c-86c9-1e62943b3fa6_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('365', '0', null, '0', null, null, '', '102', 'cp3', '73876', '李大芳', null, null, '14', '1590723316237', '', '75', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('366', '10', null, '1', null, null, '', '102', 'cp3', '73875', '积雪爬上门前的台阶', null, null, '14', '1590723330008', 'A', '75', '', '2020-05-28/85ea01c4-3c88-4d15-a740-bdc8001df224_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('367', '10', null, '1', null, null, '', '102', 'cp3', '73867', 'Rich. W.', null, null, '14', '1590723334541', 'A', '75', '', '2020-05-28/85ea01c4-3c88-4d15-a740-bdc8001df224_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('368', '10', null, '1', null, null, '', '112', 'cp12', '73856', '昨日重现', null, null, '14', '1590723413496', '否', '85', 'A04', '2020-05-28/a3277489-86e7-4fb9-b285-6f51390f5df4_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('369', '0', null, '0', null, null, '', '102', 'cp3', '73859', '过站不停', null, null, '14', '1590723600063', '', '75', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('370', '0', null, '0', null, null, '', '106', 'cp7', '73839', '清风', null, null, '14', '1590723604795', '', '79', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('371', '10', null, '1', null, null, '', '104', 'cp5', '73874', '?温柔的刘鑫?', null, null, '14', '1590723606105', 'C', '77', '', '2020-05-28/e8b3572f-5545-4b99-9b70-a1e49fb026a7_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('372', '0', null, '0', null, null, '', '104', 'cp5', '73837', '李文芳', null, null, '14', '1590723607939', '', '77', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('373', '10', null, '1', null, null, '', '104', 'cp5', '73869', 'a_nnie', null, null, '14', '1590723647760', 'C', '77', '', '2020-05-28/e8b3572f-5545-4b99-9b70-a1e49fb026a7_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('374', '10', null, '1', null, null, '', '102', 'cp3', '73848', '灵果Laura', null, null, '14', '1590723664643', 'A', '75', '', '2020-05-28/85ea01c4-3c88-4d15-a740-bdc8001df224_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('375', '10', null, '1', null, null, '', '104', 'cp5', '73878', '小莉', null, null, '14', '1590723726290', 'C', '77', '', '2020-05-28/e8b3572f-5545-4b99-9b70-a1e49fb026a7_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('376', '10', null, '1', null, null, '', '104', 'cp5', '73850', '吴昊@SaaS', null, null, '14', '1590723747581', 'C', '77', '', '2020-05-28/e8b3572f-5545-4b99-9b70-a1e49fb026a7_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('377', '0', null, '0', null, null, '', '102', 'cp3', '73858', '邓超人001号。', null, null, '14', '1590723766480', '', '75', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('378', '0', null, '0', null, null, '', '101', 'cp2', '73854', '灿米爸', null, null, '14', '1590723776835', '', '74', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('379', '10', null, '1', null, null, '', '103', 'cp4', '73875', '积雪爬上门前的台阶', null, null, '14', '1590723808190', 'A', '76', 'A05', '2020-05-28/c68e5a0a-ac03-4792-8bf4-e8cf7eff680b_slice_1_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('380', '10', null, '1', null, null, '', '103', 'cp4', '73876', '李大芳', null, null, '14', '1590723813843', 'A', '76', 'A05', '2020-05-28/c68e5a0a-ac03-4792-8bf4-e8cf7eff680b_slice_1_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('381', '10', null, '1', null, null, '', '103', 'cp4', '73868', '楚门', null, null, '14', '1590723834417', 'A', '76', 'A05', '2020-05-28/c68e5a0a-ac03-4792-8bf4-e8cf7eff680b_slice_1_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('382', '10', null, '1', null, null, '', '104', 'cp5', '73865', '奉新明～中信保诚', null, null, '14', '1590723842453', 'c', '77', '', '2020-05-28/e8b3572f-5545-4b99-9b70-a1e49fb026a7_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('383', '10', null, '1', null, null, '', '104', 'cp5', '73861', 'Frank', null, null, '14', '1590723910307', 'C', '77', '', '2020-05-28/e8b3572f-5545-4b99-9b70-a1e49fb026a7_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('384', '10', null, '1', null, null, '', '105', 'cp6', '73869', 'a_nnie', null, null, '14', '1590723947933', '挺水植物', '78', 'A01', '2020-05-28/eeb09651-57e4-406c-86c9-1e62943b3fa6_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('385', '10', null, '1', null, null, '', '103', 'cp4', '73867', 'Rich. W.', null, null, '14', '1590723954282', 'A', '76', 'A05', '2020-05-28/c68e5a0a-ac03-4792-8bf4-e8cf7eff680b_slice_1_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('386', '10', null, '1', null, null, '', '113', 'cp14', '73856', '昨日重现', null, null, '14', '1590723964656', '有', '87', 'A04', '2020-05-28/b722c622-4223-4672-b01a-d7ac837e5164_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('387', '10', null, '1', null, null, '', '104', 'cp5', '73863', '情绪，认知-代松', null, null, '14', '1590723991563', 'C', '77', '', '2020-05-28/e8b3572f-5545-4b99-9b70-a1e49fb026a7_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('388', '10', null, '1', null, null, '', '100', 'cp1', '73871', '王蕾', null, null, '14', '1590723999216', '是', '73', '', '2020-05-28/e2ae7706-9dcd-4596-9a88-ccf5ce4c856e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('389', '0', null, '0', null, null, '', '107', 'cp8', '73839', '清风', null, null, '14', '1590724102525', '', '80', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('390', '10', null, '1', null, null, '', '105', 'cp6', '73850', '吴昊@SaaS', null, null, '14', '1590724118159', '挺水植物', '78', 'A01', '2020-05-28/eeb09651-57e4-406c-86c9-1e62943b3fa6_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('391', '10', null, '1', null, null, '', '105', 'cp6', '73878', '小莉', null, null, '14', '1590724126970', '挺水', '78', 'A01', '2020-05-28/eeb09651-57e4-406c-86c9-1e62943b3fa6_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('392', '10', null, '1', null, null, '', '105', 'cp6', '73865', '奉新明～中信保诚', null, null, '14', '1590724127526', '挺水植物', '78', 'A01', '2020-05-28/eeb09651-57e4-406c-86c9-1e62943b3fa6_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('393', '0', null, '0', null, null, '', '102', 'cp3', '73854', '灿米爸', null, null, '14', '1590724136551', '', '75', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('394', '0', null, '0', null, null, '', '106', 'cp7', '73869', 'a_nnie', null, null, '14', '1590724163317', '', '79', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('395', '0', null, '0', null, null, '', '114', 'cp15', '73856', '昨日重现', null, null, '14', '1590724206685', '', '88', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('396', '0', null, '0', null, null, '', '104', 'cp5', '73876', '李大芳', null, null, '14', '1590724223591', '', '77', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('397', '10', null, '1', null, null, '', '104', 'cp5', '73875', '积雪爬上门前的台阶', null, null, '14', '1590724224282', 'C', '77', '', '2020-05-28/e8b3572f-5545-4b99-9b70-a1e49fb026a7_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('398', '10', null, '1', null, null, '', '105', 'cp6', '73860', '天恩', null, null, '14', '1590724304888', '挺水植物', '78', 'A01', '2020-05-28/eeb09651-57e4-406c-86c9-1e62943b3fa6_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('399', '10', null, '1', null, null, '', '103', 'cp4', '73874', '?温柔的刘鑫?', null, null, '14', '1590724311036', 'A', '76', 'A05', '2020-05-28/c68e5a0a-ac03-4792-8bf4-e8cf7eff680b_slice_1_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('400', '10', null, '1', null, null, '', '100', 'cp1', '73879', '王芳', null, null, '14', '1590724382842', '是', '73', '', '2020-05-28/e2ae7706-9dcd-4596-9a88-ccf5ce4c856e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('401', '10', null, '1', null, null, '', '105', 'cp6', '73875', '积雪爬上门前的台阶', null, null, '14', '1590724426284', '挺水植物', '78', 'A01', '2020-05-28/eeb09651-57e4-406c-86c9-1e62943b3fa6_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('402', '10', null, '1', null, null, '', '115', 'cp16', '73856', '昨日重现', null, null, '14', '1590724438960', 'c', '89', 'A02', '2020-05-28/b15f6730-6c9e-4785-93cf-12e1249d4056_slice_0_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('403', '10', null, '1', null, null, '', '105', 'cp6', '73861', 'Frank', null, null, '14', '1590724440678', '挺水植物', '78', 'A01', '2020-05-28/eeb09651-57e4-406c-86c9-1e62943b3fa6_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('404', '10', null, '1', null, null, '', '104', 'cp5', '73868', '楚门', null, null, '14', '1590724444680', 'C', '77', '', '2020-05-28/e8b3572f-5545-4b99-9b70-a1e49fb026a7_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('405', '10', null, '1', null, null, '', '104', 'cp5', '73867', 'Rich. W.', null, null, '14', '1590724455793', 'C', '77', '', '2020-05-28/e8b3572f-5545-4b99-9b70-a1e49fb026a7_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('406', '0', null, '0', null, null, '', '107', 'cp8', '73869', 'a_nnie', null, null, '14', '1590724486475', '', '80', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('407', '10', null, '1', null, null, '', '105', 'cp6', '73863', '情绪，认知-代松', null, null, '14', '1590724545326', '挺水植物', '78', 'A01', '2020-05-28/eeb09651-57e4-406c-86c9-1e62943b3fa6_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('408', '10', null, '1', null, null, '', '101', 'cp2', '73871', '王蕾', null, null, '14', '1590724551578', 'b', '74', 'A01', '2020-05-28/9f1a26ca-c095-4bef-b6c8-4876c69a9634_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('409', '10', null, '1', null, null, '', '103', 'cp4', '73854', '灿米爸', null, null, '14', '1590724617615', 'A', '76', 'A05', '2020-05-28/c68e5a0a-ac03-4792-8bf4-e8cf7eff680b_slice_1_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('410', '10', null, '1', null, null, '', '103', 'cp4', '73858', '邓超人001号。', null, null, '14', '1590724619201', 'A', '76', 'A05', '2020-05-28/c68e5a0a-ac03-4792-8bf4-e8cf7eff680b_slice_1_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('411', '0', null, '0', null, null, '', '108', 'cp9', '73839', '清风', null, null, '14', '1590724647064', '', '81', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('412', '10', null, '1', null, null, '', '116', 'cp17', '73856', '昨日重现', null, null, '14', '1590724661200', 'b', '90', '', '2020-05-28/29607a89-697b-4bd2-bfaa-2617c02c5688_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('413', '10', null, '1', null, null, '', '103', 'cp4', '73848', '灵果Laura', null, null, '14', '1590724705311', 'A', '76', 'A05', '2020-05-28/c68e5a0a-ac03-4792-8bf4-e8cf7eff680b_slice_1_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('414', '10', null, '1', null, null, '', '105', 'cp6', '73868', '楚门', null, null, '14', '1590724730011', '挺水植物', '78', 'A01', '2020-05-28/eeb09651-57e4-406c-86c9-1e62943b3fa6_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('415', '10', null, '1', null, null, '', '105', 'cp6', '73867', 'Rich. W.', null, null, '14', '1590724746804', '挺水植物', '78', 'A01', '2020-05-28/eeb09651-57e4-406c-86c9-1e62943b3fa6_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('416', '0', null, '0', null, null, '', '108', 'cp9', '73869', 'a_nnie', null, null, '14', '1590724818247', '', '81', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('417', '0', null, '0', null, null, '', '106', 'cp7', '73861', 'Frank', null, null, '14', '1590724828057', '', '79', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('418', '0', null, '0', null, null, '', '106', 'cp7', '73875', '积雪爬上门前的台阶', null, null, '14', '1590724829454', '', '79', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('419', '10', null, '1', null, null, '', '106', 'cp7', '73863', '情绪，认知-代松', null, null, '14', '1590724860940', '钟形', '79', '', '2020-05-28/ea0fd11e-0e04-403f-9450-c91b3bda7ac4_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('420', '10', null, '1', null, null, '', '106', 'cp7', '73865', '奉新明～中信保诚', null, null, '14', '1590724873146', '钟形', '79', '', '2020-05-28/ea0fd11e-0e04-403f-9450-c91b3bda7ac4_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('421', '0', null, '0', null, null, '', '109', 'cp10', '73839', '清风', null, null, '14', '1590724880194', '', '82', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('422', '10', null, '1', null, null, '', '103', 'cp4', '73859', '过站不停', null, null, '14', '1590724884380', 'A', '76', 'A05', '2020-05-28/c68e5a0a-ac03-4792-8bf4-e8cf7eff680b_slice_1_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('423', '10', null, '1', null, null, '', '106', 'cp7', '73850', '吴昊@SaaS', null, null, '14', '1590724884926', '钟形', '79', '', '2020-05-28/ea0fd11e-0e04-403f-9450-c91b3bda7ac4_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('424', '0', null, '0', null, null, '', '119', 'cp20', '73879', '王芳', null, null, '14', '1590724899895', '', '93', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('425', '10', null, '1', null, null, '', '106', 'cp7', '73878', '小莉', null, null, '14', '1590724931520', '钟形', '79', '', '2020-05-28/ea0fd11e-0e04-403f-9450-c91b3bda7ac4_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('426', '10', null, '1', null, null, '', '106', 'cp7', '73868', '楚门', null, null, '14', '1590724937212', '钟形', '79', '', '2020-05-28/ea0fd11e-0e04-403f-9450-c91b3bda7ac4_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('427', '10', null, '1', null, null, '', '106', 'cp7', '73867', 'Rich. W.', null, null, '14', '1590724961784', '钟形', '79', '', '2020-05-28/ea0fd11e-0e04-403f-9450-c91b3bda7ac4_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('428', '0', null, '0', null, null, '', '102', 'cp3', '73871', '王蕾', null, null, '14', '1590725005192', '', '75', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('429', '10', null, '1', null, null, '', '109', 'cp10', '73869', 'a_nnie', null, null, '14', '1590725018397', '黄花菜', '82', 'A02', '2020-05-28/d284c16c-eeb0-421f-876a-e6bd395507a5_slice_0_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('430', '0', null, '0', null, null, '', '117', 'cp18', '73856', '昨日重现', null, null, '14', '1590725147525', '', '91', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('431', '10', null, '1', null, null, '', '104', 'cp5', '73854', '灿米爸', null, null, '14', '1590725148648', 'C', '77', '', '2020-05-28/e8b3572f-5545-4b99-9b70-a1e49fb026a7_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('432', '10', null, '1', null, null, '', '104', 'cp5', '73858', '邓超人001号。', null, null, '14', '1590725152807', 'C', '77', '', '2020-05-28/e8b3572f-5545-4b99-9b70-a1e49fb026a7_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('433', '0', null, '0', null, null, '', '107', 'cp8', '73878', '小莉', null, null, '14', '1590725205374', '', '80', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('434', '10', null, '1', null, null, '', '107', 'cp8', '73861', 'Frank', null, null, '14', '1590725222039', '果序', '80', 'A05', '2020-05-28/30b9cefb-f8c0-42ac-bf05-1cd89d101082_slice_1_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('435', '10', null, '1', null, null, '', '107', 'cp8', '73867', 'Rich. W.', null, null, '14', '1590725232840', '果序', '80', 'A05', '2020-05-28/30b9cefb-f8c0-42ac-bf05-1cd89d101082_slice_1_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('436', '10', null, '1', null, null, '', '107', 'cp8', '73865', '奉新明～中信保诚', null, null, '14', '1590725242276', '果序', '80', 'A05', '2020-05-28/30b9cefb-f8c0-42ac-bf05-1cd89d101082_slice_1_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('437', '10', null, '1', null, null, '', '104', 'cp5', '73848', '灵果Laura', null, null, '14', '1590725262066', 'C', '77', '', '2020-05-28/e8b3572f-5545-4b99-9b70-a1e49fb026a7_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('438', '10', null, '1', null, null, '', '107', 'cp8', '73868', '楚门', null, null, '14', '1590725263315', '果序', '80', 'A05', '2020-05-28/30b9cefb-f8c0-42ac-bf05-1cd89d101082_slice_1_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('439', '10', null, '1', null, null, '', '110', 'cp11', '73869', 'a_nnie', null, null, '14', '1590725276492', '两', '83', '', '2020-05-28/c730a0e5-647b-4065-a7f6-e521ee1e70c5_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('440', '10', null, '1', null, null, '', '107', 'cp8', '73863', '情绪，认知-代松', null, null, '14', '1590725298469', '果序', '80', 'A05', '2020-05-28/30b9cefb-f8c0-42ac-bf05-1cd89d101082_slice_1_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('441', '0', null, '0', null, null, '', '110', 'cp11', '73839', '清风', null, null, '14', '1590725343931', '', '83', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('442', '10', null, '1', null, null, '', '118', 'cp19', '73856', '昨日重现', null, null, '14', '1590725435945', '', '92', 'A06', '2020-05-28/41306da9-16b2-49ea-887a-2541f3ee1af8_slice_1_2.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('443', '10', null, '1', null, null, '', '104', 'cp5', '73859', '过站不停', null, null, '14', '1590725474898', 'C', '77', '', '2020-05-28/e8b3572f-5545-4b99-9b70-a1e49fb026a7_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('444', '10', null, '1', null, null, '', '107', 'cp8', '73850', '吴昊@SaaS', null, null, '14', '1590725522811', '果序', '80', 'A05', '2020-05-28/30b9cefb-f8c0-42ac-bf05-1cd89d101082_slice_1_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('445', '10', null, '1', null, null, '', '108', 'cp9', '73878', '小莉', null, null, '14', '1590725576529', 'D', '81', '', '2020-05-28/42a6c012-30eb-402d-874f-c26e63d6d06d_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('446', '10', null, '1', null, null, '', '103', 'cp4', '73871', '王蕾', null, null, '14', '1590725576533', 'a', '76', 'A05', '2020-05-28/c68e5a0a-ac03-4792-8bf4-e8cf7eff680b_slice_1_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('447', '10', null, '1', null, null, '', '108', 'cp9', '73863', '情绪，认知-代松', null, null, '14', '1590725580635', 'D', '81', '', '2020-05-28/42a6c012-30eb-402d-874f-c26e63d6d06d_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('448', '10', null, '1', null, null, '', '108', 'cp9', '73861', 'Frank', null, null, '14', '1590725590015', 'D', '81', '', '2020-05-28/42a6c012-30eb-402d-874f-c26e63d6d06d_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('449', '0', null, '0', null, null, '', '108', 'cp9', '73868', '楚门', null, null, '14', '1590725604444', '', '81', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('450', '10', null, '1', null, null, '', '119', 'cp20', '73856', '昨日重现', null, null, '14', '1590725649367', 'b', '93', '', '2020-05-28/a257c3c4-9ba2-4406-9e5c-ac62c6dd5b2e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('451', '10', null, '1', null, null, '', '107', 'cp8', '73875', '积雪爬上门前的台阶', null, null, '14', '1590725650544', '果序', '80', 'A05', '2020-05-28/30b9cefb-f8c0-42ac-bf05-1cd89d101082_slice_1_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('452', '10', null, '1', null, null, '', '108', 'cp9', '73865', '奉新明～中信保诚', null, null, '14', '1590725736574', 'D', '81', '', '2020-05-28/42a6c012-30eb-402d-874f-c26e63d6d06d_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('453', '10', null, '1', null, null, '', '108', 'cp9', '73867', 'Rich. W.', null, null, '14', '1590725737652', 'D', '81', '', '2020-05-28/42a6c012-30eb-402d-874f-c26e63d6d06d_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('454', '10', null, '1', null, null, '', '108', 'cp9', '73850', '吴昊@SaaS', null, null, '14', '1590725738515', 'D', '81', '', '2020-05-28/42a6c012-30eb-402d-874f-c26e63d6d06d_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('455', '10', null, '1', null, null, '', '109', 'cp10', '73878', '小莉', null, null, '14', '1590725799866', '黄花菜', '82', 'A02', '2020-05-28/d284c16c-eeb0-421f-876a-e6bd395507a5_slice_0_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('456', '10', null, '1', null, null, '', '109', 'cp10', '73861', 'Frank', null, null, '14', '1590725810504', '黄花菜', '82', 'A02', '2020-05-28/d284c16c-eeb0-421f-876a-e6bd395507a5_slice_0_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('457', '10', null, '1', null, null, '', '109', 'cp10', '73868', '楚门', null, null, '14', '1590725818477', '黄花菜', '82', 'A02', '2020-05-28/d284c16c-eeb0-421f-876a-e6bd395507a5_slice_0_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('458', '10', null, '1', null, null, '', '109', 'cp10', '73867', 'Rich. W.', null, null, '14', '1590726008042', '黄花菜', '82', 'A02', '2020-05-28/d284c16c-eeb0-421f-876a-e6bd395507a5_slice_0_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('459', '10', null, '1', null, null, '', '109', 'cp10', '73863', '情绪，认知-代松', null, null, '14', '1590726015420', '黄花菜', '82', 'A02', '2020-05-28/d284c16c-eeb0-421f-876a-e6bd395507a5_slice_0_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('460', '10', null, '1', null, null, '', '109', 'cp10', '73850', '吴昊@SaaS', null, null, '14', '1590726019373', '黄花菜', '82', 'A02', '2020-05-28/d284c16c-eeb0-421f-876a-e6bd395507a5_slice_0_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('461', '10', null, '1', null, null, '', '109', 'cp10', '73865', '奉新明～中信保诚', null, null, '14', '1590726024564', '黄花菜', '82', 'A02', '2020-05-28/d284c16c-eeb0-421f-876a-e6bd395507a5_slice_0_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('462', '0', null, '0', null, null, '', '101', 'cp2', '73879', '王芳', null, null, '14', '1590726034410', '', '74', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('463', '10', null, '1', null, null, '', '110', 'cp11', '73878', '小莉', null, null, '14', '1590726083524', '2', '83', '', '2020-05-28/c730a0e5-647b-4065-a7f6-e521ee1e70c5_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('464', '0', null, '0', null, null, '', '110', 'cp11', '73861', 'Frank', null, null, '14', '1590726086900', '', '83', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('465', '10', null, '1', null, null, '', '111', 'cp13', '73839', '清风', null, null, '14', '1590726089911', '卵圆形', '86', '', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('466', '0', null, '0', null, null, '', '108', 'cp9', '73875', '积雪爬上门前的台阶', null, null, '14', '1590726118450', '', '81', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('467', '0', null, '0', null, null, '', '110', 'cp11', '73868', '楚门', null, null, '14', '1590726159989', '', '83', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('468', '0', null, '0', null, null, '', '111', 'cp13', '73869', 'a_nnie', null, null, '14', '1590726181160', '', '86', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('469', '10', null, '1', null, null, '', '112', 'cp12', '73861', 'Frank', null, null, '14', '1590726305330', '否', '85', 'A04', '2020-05-28/a3277489-86e7-4fb9-b285-6f51390f5df4_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('470', '10', null, '1', null, null, '', '104', 'cp5', '73871', '王蕾', null, null, '14', '1590726308811', 'c', '77', '', '2020-05-28/e8b3572f-5545-4b99-9b70-a1e49fb026a7_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('471', '10', null, '1', null, null, '', '112', 'cp12', '73878', '小莉', null, null, '14', '1590726313712', '否', '85', 'A04', '2020-05-28/a3277489-86e7-4fb9-b285-6f51390f5df4_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('472', '10', null, '1', null, null, '', '112', 'cp12', '73869', 'a_nnie', null, null, '14', '1590726346353', '否', '85', 'A04', '2020-05-28/a3277489-86e7-4fb9-b285-6f51390f5df4_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('473', '0', null, '0', null, null, '', '112', 'cp12', '73839', '清风', null, null, '14', '1590726408195', '', '85', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('474', '10', null, '1', null, null, '', '109', 'cp10', '73875', '积雪爬上门前的台阶', null, null, '14', '1590726426693', '黄花菜', '82', 'A02', '2020-05-28/d284c16c-eeb0-421f-876a-e6bd395507a5_slice_0_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('475', '0', null, '0', null, null, '', '110', 'cp11', '73863', '情绪，认知-代松', null, null, '14', '1590726436250', '', '83', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('476', '0', null, '0', null, null, '', '112', 'cp12', '73868', '楚门', null, null, '14', '1590726649056', '', '85', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('477', '10', null, '1', null, null, '', '113', 'cp14', '73869', 'a_nnie', null, null, '14', '1590726741095', '有', '87', 'A04', '2020-05-28/b722c622-4223-4672-b01a-d7ac837e5164_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('478', '0', null, '0', null, null, '', '111', 'cp13', '73861', 'Frank', null, null, '14', '1590726761935', '', '86', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('479', '10', null, '1', null, null, '', '110', 'cp11', '73875', '积雪爬上门前的台阶', null, null, '14', '1590726840230', '2', '83', '', '2020-05-28/c730a0e5-647b-4065-a7f6-e521ee1e70c5_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('480', '10', null, '1', null, null, '', '111', 'cp13', '73868', '楚门', null, null, '14', '1590726866517', '卵圆形', '86', '', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('481', '10', null, '1', null, null, '', '102', 'cp3', '73879', '王芳', null, null, '14', '1590726905384', 'A', '75', '', '2020-05-28/85ea01c4-3c88-4d15-a740-bdc8001df224_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('482', '10', null, '1', null, null, '', '110', 'cp11', '73850', '吴昊@SaaS', null, null, '14', '1590727036871', '2', '83', '', '2020-05-28/c730a0e5-647b-4065-a7f6-e521ee1e70c5_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('483', '10', null, '1', null, null, '', '110', 'cp11', '73865', '奉新明～中信保诚', null, null, '14', '1590727051228', '2', '83', '', '2020-05-28/c730a0e5-647b-4065-a7f6-e521ee1e70c5_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('484', '0', null, '0', null, null, '', '114', 'cp15', '73869', 'a_nnie', null, null, '14', '1590727060738', '', '88', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('485', '10', null, '1', null, null, '', '110', 'cp11', '73867', 'Rich. W.', null, null, '14', '1590727101020', '2', '83', '', '2020-05-28/c730a0e5-647b-4065-a7f6-e521ee1e70c5_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('486', '0', null, '0', null, null, '', '115', 'cp16', '73869', 'a_nnie', null, null, '14', '1590727255195', '', '89', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('487', '10', null, '1', null, null, '', '113', 'cp14', '73868', '楚门', null, null, '14', '1590727404769', '有', '87', 'A04', '2020-05-28/b722c622-4223-4672-b01a-d7ac837e5164_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('488', '0', null, '0', null, null, '', '113', 'cp14', '73839', '清风', null, null, '14', '1590727409738', '', '87', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('489', '10', null, '1', null, null, '', '113', 'cp14', '73861', 'Frank', null, null, '14', '1590727431223', '有', '87', 'A04', '2020-05-28/b722c622-4223-4672-b01a-d7ac837e5164_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('490', '10', null, '1', null, null, '', '112', 'cp12', '73850', '吴昊@SaaS', null, null, '14', '1590727439459', '否', '85', 'A04', '2020-05-28/a3277489-86e7-4fb9-b285-6f51390f5df4_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('491', '10', null, '1', null, null, '', '112', 'cp12', '73865', '奉新明～中信保诚', null, null, '14', '1590727448320', '否', '85', 'A04', '2020-05-28/a3277489-86e7-4fb9-b285-6f51390f5df4_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('492', '10', null, '1', null, null, '', '113', 'cp14', '73878', '小莉', null, null, '14', '1590727452592', '有', '87', 'A04', '2020-05-28/b722c622-4223-4672-b01a-d7ac837e5164_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('493', '10', null, '1', null, null, '', '112', 'cp12', '73867', 'Rich. W.', null, null, '14', '1590727476328', '否', '85', 'A04', '2020-05-28/a3277489-86e7-4fb9-b285-6f51390f5df4_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('494', '0', null, '0', null, null, '', '116', 'cp17', '73869', 'a_nnie', null, null, '14', '1590727530996', '', '90', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('495', '0', null, '0', null, null, '', '114', 'cp15', '73868', '楚门', null, null, '14', '1590727639052', '', '88', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('496', '10', null, '1', null, null, '', '111', 'cp13', '73867', 'Rich. W.', null, null, '14', '1590727656071', '卵圆形', '86', '', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('497', '10', null, '1', null, null, '', '111', 'cp13', '73865', '奉新明～中信保诚', null, null, '14', '1590727670634', '卵圆形', '86', '', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('498', '0', null, '0', null, null, '', '114', 'cp15', '73839', '清风', null, null, '14', '1590727783238', '', '88', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('499', '10', null, '1', null, null, '', '111', 'cp13', '73850', '吴昊@SaaS', null, null, '14', '1590727797829', '卵圆形', '86', '', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('500', '0', null, '0', null, null, '', '115', 'cp16', '73868', '楚门', null, null, '14', '1590727854098', '', '89', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('501', '0', null, '0', null, null, '', '103', 'cp4', '73879', '王芳', null, null, '14', '1590727890642', '', '76', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('502', '0', null, '0', null, null, '', '114', 'cp15', '73878', '小莉', null, null, '14', '1590727901621', '', '88', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('503', '10', null, '1', null, null, '', '111', 'cp13', '73875', '积雪爬上门前的台阶', null, null, '14', '1590727908513', '卵圆形', '86', '', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('504', '10', null, '1', null, null, '', '114', 'cp15', '73861', 'Frank', null, null, '14', '1590727909091', 'B', '88', '', '2020-05-28/3bf704b8-86d3-40e0-b4c2-9f8a3317bc1e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('505', '10', null, '1', null, null, '', '115', 'cp16', '73839', '清风', null, null, '14', '1590727941415', 'C', '89', 'A02', '2020-05-28/b15f6730-6c9e-4785-93cf-12e1249d4056_slice_0_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('506', '0', null, '0', null, null, '', '117', 'cp18', '73869', 'a_nnie', null, null, '14', '1590727957113', '', '91', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('507', '10', null, '1', null, null, '', '112', 'cp12', '73875', '积雪爬上门前的台阶', null, null, '14', '1590728082524', '否', '85', 'A04', '2020-05-28/a3277489-86e7-4fb9-b285-6f51390f5df4_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('508', '10', null, '1', null, null, '', '118', 'cp19', '73869', 'a_nnie', null, null, '14', '1590728087432', '', '92', 'A06', '2020-05-28/41306da9-16b2-49ea-887a-2541f3ee1af8_slice_1_2.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('509', '0', null, '0', null, null, '', '116', 'cp17', '73868', '楚门', null, null, '14', '1590728239845', '', '90', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('510', '0', null, '0', null, null, '', '115', 'cp16', '73878', '小莉', null, null, '14', '1590728247401', '', '89', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('511', '0', null, '0', null, null, '', '113', 'cp14', '73867', 'Rich. W.', null, null, '14', '1590728269171', '', '87', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('512', '10', null, '1', null, null, '', '115', 'cp16', '73861', 'Frank', null, null, '14', '1590728274872', 'C', '89', 'A02', '2020-05-28/b15f6730-6c9e-4785-93cf-12e1249d4056_slice_0_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('513', '10', null, '1', null, null, '', '113', 'cp14', '73865', '奉新明～中信保诚', null, null, '14', '1590728282969', '有', '87', 'A04', '2020-05-28/b722c622-4223-4672-b01a-d7ac837e5164_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('514', '0', null, '0', null, null, '', '116', 'cp17', '73839', '清风', null, null, '14', '1590728292715', '', '90', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('515', '0', null, '0', null, null, '', '119', 'cp20', '73869', 'a_nnie', null, null, '14', '1590728302066', '', '93', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('516', '10', null, '1', null, null, '', '113', 'cp14', '73850', '吴昊@SaaS', null, null, '14', '1590728330922', '有', '87', 'A04', '2020-05-28/b722c622-4223-4672-b01a-d7ac837e5164_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('517', '10', null, '1', null, null, '', '105', 'cp6', '73858', '邓超人001号。', null, null, '14', '1590728348007', '挺水植物', '78', 'A01', '2020-05-28/eeb09651-57e4-406c-86c9-1e62943b3fa6_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('518', '0', null, '0', null, null, '', '101', 'cp2', '73881', 'LucyLi', null, null, '14', '1590728393365', '', '74', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('519', '10', null, '1', null, null, '', '116', 'cp17', '73861', 'Frank', null, null, '14', '1590728559634', 'B', '90', '', '2020-05-28/29607a89-697b-4bd2-bfaa-2617c02c5688_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('520', '0', null, '0', null, null, '', '113', 'cp14', '73875', '积雪爬上门前的台阶', null, null, '14', '1590728610565', '', '87', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('521', '10', null, '1', null, null, '', '117', 'cp18', '73868', '楚门', null, null, '14', '1590728629535', '聚伞花序', '91', 'A03', '2020-05-28/2fa8a38a-6b4b-4e85-a825-348e0b8f4935_slice_0_2.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('522', '10', null, '1', null, null, '', '105', 'cp6', '73871', '王蕾', null, null, '14', '1590728773104', '挺水', '78', 'A01', '2020-05-28/eeb09651-57e4-406c-86c9-1e62943b3fa6_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('523', '0', null, '0', null, null, '', '117', 'cp18', '73839', '清风', null, null, '14', '1590728807504', '', '91', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('524', '10', null, '1', null, null, '', '114', 'cp15', '73875', '积雪爬上门前的台阶', null, null, '14', '1590728894179', 'B', '88', '', '2020-05-28/3bf704b8-86d3-40e0-b4c2-9f8a3317bc1e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('525', '10', null, '1', null, null, '', '118', 'cp19', '73868', '楚门', null, null, '14', '1590728894743', '', '92', 'A06', '2020-05-28/41306da9-16b2-49ea-887a-2541f3ee1af8_slice_1_2.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('526', '10', null, '1', null, null, '', '114', 'cp15', '73867', 'Rich. W.', null, null, '14', '1590728936071', 'B', '88', '', '2020-05-28/3bf704b8-86d3-40e0-b4c2-9f8a3317bc1e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('527', '10', null, '1', null, null, '', '114', 'cp15', '73865', '奉新明～中信保诚', null, null, '14', '1590728937867', 'b', '88', '', '2020-05-28/3bf704b8-86d3-40e0-b4c2-9f8a3317bc1e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('528', '10', null, '1', null, null, '', '118', 'cp19', '73839', '清风', null, null, '14', '1590728941664', '', '92', 'A06', '2020-05-28/41306da9-16b2-49ea-887a-2541f3ee1af8_slice_1_2.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('529', '0', null, '0', null, null, '', '115', 'cp16', '73875', '积雪爬上门前的台阶', null, null, '14', '1590729093764', '', '89', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('530', '10', null, '1', null, null, '', '116', 'cp17', '73878', '小莉', null, null, '14', '1590729114276', 'B', '90', '', '2020-05-28/29607a89-697b-4bd2-bfaa-2617c02c5688_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('531', '0', null, '0', null, null, '', '104', 'cp5', '73879', '王芳', null, null, '14', '1590729118208', '', '77', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('532', '10', null, '1', null, null, '', '119', 'cp20', '73868', '楚门', null, null, '14', '1590729162289', 'B', '93', '', '2020-05-28/a257c3c4-9ba2-4406-9e5c-ac62c6dd5b2e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('533', '10', null, '1', null, null, '', '115', 'cp16', '73867', 'Rich. W.', null, null, '14', '1590729258067', 'C', '89', 'A02', '2020-05-28/b15f6730-6c9e-4785-93cf-12e1249d4056_slice_0_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('534', '10', null, '1', null, null, '', '115', 'cp16', '73865', '奉新明～中信保诚', null, null, '14', '1590729265282', 'c', '89', 'A02', '2020-05-28/b15f6730-6c9e-4785-93cf-12e1249d4056_slice_0_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('535', '10', null, '1', null, null, '', '115', 'cp16', '73850', '吴昊@SaaS', null, null, '14', '1590729266738', 'C', '89', 'A02', '2020-05-28/b15f6730-6c9e-4785-93cf-12e1249d4056_slice_0_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('536', '10', null, '1', null, null, '', '116', 'cp17', '73875', '积雪爬上门前的台阶', null, null, '14', '1590729427704', 'B', '90', '', '2020-05-28/29607a89-697b-4bd2-bfaa-2617c02c5688_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('537', '0', null, '0', null, null, '', '117', 'cp18', '73878', '小莉', null, null, '14', '1590729772938', '', '91', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('538', '0', null, '0', null, null, '', '117', 'cp18', '73879', '王芳', null, null, '14', '1590729972913', '', '91', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('539', '0', null, '0', null, null, '', '117', 'cp18', '73875', '积雪爬上门前的台阶', null, null, '14', '1590730059061', '', '91', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('540', '10', null, '1', null, null, '', '116', 'cp17', '73850', '吴昊@SaaS', null, null, '14', '1590730082828', 'B', '90', '', '2020-05-28/29607a89-697b-4bd2-bfaa-2617c02c5688_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('541', '0', null, '0', null, null, '', '116', 'cp17', '73867', 'Rich. W.', null, null, '14', '1590730082931', '', '90', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('542', '10', null, '1', null, null, '', '116', 'cp17', '73865', '奉新明～中信保诚', null, null, '14', '1590730084580', 'b', '90', '', '2020-05-28/29607a89-697b-4bd2-bfaa-2617c02c5688_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('543', '10', null, '1', null, null, '', '102', 'cp3', '73881', 'LucyLi', null, null, '14', '1590730088523', 'A', '75', '', '2020-05-28/85ea01c4-3c88-4d15-a740-bdc8001df224_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('544', '10', null, '1', null, null, '', '118', 'cp19', '73875', '积雪爬上门前的台阶', null, null, '14', '1590730289472', '', '92', 'A06', '2020-05-28/41306da9-16b2-49ea-887a-2541f3ee1af8_slice_1_2.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('545', '10', null, '1', null, null, '', '118', 'cp19', '73879', '王芳', null, null, '14', '1590730343095', '', '92', 'A06', '2020-05-28/41306da9-16b2-49ea-887a-2541f3ee1af8_slice_1_2.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('546', '0', null, '0', null, null, '', '106', 'cp7', '73871', '王蕾', null, null, '14', '1590730462328', '', '79', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('547', '0', null, '0', null, null, '', '117', 'cp18', '73867', 'Rich. W.', null, null, '14', '1590730755182', '', '91', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('548', '10', null, '1', null, null, '', '119', 'cp20', '73875', '积雪爬上门前的台阶', null, null, '14', '1590730789354', 'B', '93', '', '2020-05-28/a257c3c4-9ba2-4406-9e5c-ac62c6dd5b2e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('549', '0', null, '0', null, null, '', '117', 'cp18', '73850', '吴昊@SaaS', null, null, '14', '1590730792337', '', '91', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('550', '10', null, '1', null, null, '', '117', 'cp18', '73865', '奉新明～中信保诚', null, null, '14', '1590730806418', '聚伞花序', '91', 'A03', '2020-05-28/2fa8a38a-6b4b-4e85-a825-348e0b8f4935_slice_0_2.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('551', '10', null, '1', null, null, '', '118', 'cp19', '73867', 'Rich. W.', null, null, '14', '1590730948587', '', '92', 'A06', '2020-05-28/41306da9-16b2-49ea-887a-2541f3ee1af8_slice_1_2.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('552', '10', null, '1', null, null, '', '118', 'cp19', '73865', '奉新明～中信保诚', null, null, '14', '1590730952498', '', '92', 'A06', '2020-05-28/41306da9-16b2-49ea-887a-2541f3ee1af8_slice_1_2.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('553', '10', null, '1', null, null, '', '118', 'cp19', '73850', '吴昊@SaaS', null, null, '14', '1590730960229', '', '92', 'A06', '2020-05-28/41306da9-16b2-49ea-887a-2541f3ee1af8_slice_1_2.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('554', '10', null, '1', null, null, '', '116', 'cp17', '73879', '王芳', null, null, '14', '1590731130941', 'B', '90', '', '2020-05-28/29607a89-697b-4bd2-bfaa-2617c02c5688_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('555', '10', null, '1', null, null, '', '119', 'cp20', '73867', 'Rich. W.', null, null, '14', '1590731318302', 'B', '93', '', '2020-05-28/a257c3c4-9ba2-4406-9e5c-ac62c6dd5b2e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('556', '10', null, '1', null, null, '', '119', 'cp20', '73865', '奉新明～中信保诚', null, null, '14', '1590731319517', 'b', '93', '', '2020-05-28/a257c3c4-9ba2-4406-9e5c-ac62c6dd5b2e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('557', '10', null, '1', null, null, '', '101', 'cp2', '73883', '陈福祥', null, null, '14', '1590731459057', 'B', '74', 'A01', '2020-05-28/9f1a26ca-c095-4bef-b6c8-4876c69a9634_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('558', '10', null, '1', null, null, '', '101', 'cp2', '73845', '焦南威', null, null, '14', '1590731468155', 'b', '74', 'A01', '2020-05-28/9f1a26ca-c095-4bef-b6c8-4876c69a9634_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('559', '10', null, '1', null, null, '', '100', 'cp1', '73865', '奉新明～中信保诚', null, null, '14', '1590731486549', '是', '73', '', '2020-05-28/e2ae7706-9dcd-4596-9a88-ccf5ce4c856e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('560', '10', null, '1', null, null, '', '105', 'cp6', '73848', '灵果Laura', null, null, '14', '1590731499571', '挺水植物', '78', 'A01', '2020-05-28/eeb09651-57e4-406c-86c9-1e62943b3fa6_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('561', '0', null, '0', null, null, '', '103', 'cp4', '73881', 'LucyLi', null, null, '14', '1590731603557', '', '76', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('562', '10', null, '1', null, null, '', '105', 'cp6', '73854', '灿米爸', null, null, '14', '1590731914387', '挺水', '78', 'A01', '2020-05-28/eeb09651-57e4-406c-86c9-1e62943b3fa6_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('563', '10', null, '1', null, null, '', '102', 'cp3', '73845', '焦南威', null, null, '14', '1590731937998', 'a', '75', '', '2020-05-28/85ea01c4-3c88-4d15-a740-bdc8001df224_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('564', '10', null, '1', null, null, '', '105', 'cp6', '73859', '过站不停', null, null, '14', '1590731944865', '挺水植物', '78', 'A01', '2020-05-28/eeb09651-57e4-406c-86c9-1e62943b3fa6_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('565', '10', null, '1', null, null, '', '102', 'cp3', '73883', '陈福祥', null, null, '14', '1590731948915', 'A', '75', '', '2020-05-28/85ea01c4-3c88-4d15-a740-bdc8001df224_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('566', '10', null, '1', null, null, '', '105', 'cp6', '73874', '?温柔的刘鑫?', null, null, '14', '1590731954481', '挺水植物', '78', 'A01', '2020-05-28/eeb09651-57e4-406c-86c9-1e62943b3fa6_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('567', '0', null, '0', null, null, '', '115', 'cp16', '73879', '王芳', null, null, '14', '1590732024810', '', '89', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('568', '10', null, '1', null, null, '', '114', 'cp15', '73879', '王芳', null, null, '14', '1590732461104', 'B', '88', '', '2020-05-28/3bf704b8-86d3-40e0-b4c2-9f8a3317bc1e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('569', '0', null, '0', null, null, '', '103', 'cp4', '73845', '焦南威', null, null, '14', '1590732549852', '', '76', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('570', '0', null, '0', null, null, '', '103', 'cp4', '73883', '陈福祥', null, null, '14', '1590732611312', '', '76', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('571', '10', null, '1', null, null, '', '106', 'cp7', '73858', '邓超人001号。', null, null, '14', '1590732696598', '钟形', '79', '', '2020-05-28/ea0fd11e-0e04-403f-9450-c91b3bda7ac4_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('572', '0', null, '0', null, null, '', '106', 'cp7', '73859', '过站不停', null, null, '14', '1590732701571', '', '79', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('573', '10', null, '1', null, null, '', '106', 'cp7', '73848', '灵果Laura', null, null, '14', '1590732773788', '钟形', '79', '', '2020-05-28/ea0fd11e-0e04-403f-9450-c91b3bda7ac4_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('574', '10', null, '1', null, null, '', '106', 'cp7', '73874', '?温柔的刘鑫?', null, null, '14', '1590732784393', '钟形', '79', '', '2020-05-28/ea0fd11e-0e04-403f-9450-c91b3bda7ac4_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('575', '0', null, '0', null, null, '', '104', 'cp5', '73845', '焦南威', null, null, '14', '1590733125356', '', '77', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('576', '0', null, '0', null, null, '', '104', 'cp5', '73883', '陈福祥', null, null, '14', '1590733134472', '', '77', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('577', '10', null, '1', null, null, '', '100', 'cp1', '73881', 'LucyLi', null, null, '14', '1590733251230', '是', '73', '', '2020-05-28/e2ae7706-9dcd-4596-9a88-ccf5ce4c856e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('578', '0', null, '0', null, null, '', '106', 'cp7', '73854', '灿米爸', null, null, '14', '1590733254243', '', '79', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('579', '10', null, '1', null, null, '', '100', 'cp1', '73884', '懒蜗牛', null, null, '14', '1590733658801', '是', '73', '', '2020-05-28/e2ae7706-9dcd-4596-9a88-ccf5ce4c856e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('580', '0', null, '0', null, null, '', '105', 'cp6', '73845', '焦南威', null, null, '14', '1590733671585', '', '78', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('581', '10', null, '1', null, null, '', '100', 'cp1', '73853', '? Erin程艳', null, null, '14', '1590733676776', '是', '73', '', '2020-05-28/e2ae7706-9dcd-4596-9a88-ccf5ce4c856e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('582', '10', null, '1', null, null, '', '105', 'cp6', '73883', '陈福祥', null, null, '14', '1590733705452', '挺水植物', '78', 'A01', '2020-05-28/eeb09651-57e4-406c-86c9-1e62943b3fa6_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('583', '10', null, '1', null, null, '', '119', 'cp20', '73881', 'LucyLi', null, null, '14', '1590733859203', 'B', '93', '', '2020-05-28/a257c3c4-9ba2-4406-9e5c-ac62c6dd5b2e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('584', '0', null, '0', null, null, '', '107', 'cp8', '73871', '王蕾', null, null, '14', '1590733884088', '', '80', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('585', '10', null, '1', null, null, '', '107', 'cp8', '73854', '灿米爸', null, null, '14', '1590733911705', '果序', '80', 'A05', '2020-05-28/30b9cefb-f8c0-42ac-bf05-1cd89d101082_slice_1_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('586', '10', null, '1', null, null, '', '107', 'cp8', '73859', '过站不停', null, null, '14', '1590733949344', '果序', '80', 'A05', '2020-05-28/30b9cefb-f8c0-42ac-bf05-1cd89d101082_slice_1_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('587', '10', null, '1', null, null, '', '107', 'cp8', '73848', '灵果Laura', null, null, '14', '1590733963225', '果序', '80', 'A05', '2020-05-28/30b9cefb-f8c0-42ac-bf05-1cd89d101082_slice_1_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('588', '10', null, '1', null, null, '', '107', 'cp8', '73874', '?温柔的刘鑫?', null, null, '14', '1590733964373', '果序', '80', 'A05', '2020-05-28/30b9cefb-f8c0-42ac-bf05-1cd89d101082_slice_1_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('589', '10', null, '1', null, null, '', '107', 'cp8', '73858', '邓超人001号。', null, null, '14', '1590734014058', '果序', '80', 'A05', '2020-05-28/30b9cefb-f8c0-42ac-bf05-1cd89d101082_slice_1_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('590', '10', null, '1', null, null, '', '100', 'cp1', '73887', '柏蘭', null, null, '14', '1590734039278', '是', '73', '', '2020-05-28/e2ae7706-9dcd-4596-9a88-ccf5ce4c856e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('591', '0', null, '0', null, null, '', '106', 'cp7', '73883', '陈福祥', null, null, '14', '1590734116552', '', '79', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('592', '0', null, '0', null, null, '', '106', 'cp7', '73845', '焦南威', null, null, '14', '1590734152290', '', '79', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('593', '0', null, '0', null, null, '', '119', 'cp20', '73886', '康庄大道', null, null, '14', '1590734368318', '', '93', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('594', '10', null, '1', null, null, '', '100', 'cp1', '73889', '金媛祥珠宝 王岩', null, null, '14', '1590734414639', '是', '73', '', '2020-05-28/e2ae7706-9dcd-4596-9a88-ccf5ce4c856e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('595', '0', null, '0', null, null, '', '119', 'cp20', '73884', '懒蜗牛', null, null, '14', '1590734433708', '', '93', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('596', '10', null, '1', null, null, '', '100', 'cp1', '73844', '张先森', null, null, '14', '1590734441175', '是', '73', '', '2020-05-28/e2ae7706-9dcd-4596-9a88-ccf5ce4c856e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('597', '10', null, '1', null, null, '', '107', 'cp8', '73845', '焦南威', null, null, '14', '1590734510807', '果序', '80', 'A05', '2020-05-28/30b9cefb-f8c0-42ac-bf05-1cd89d101082_slice_1_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('598', '10', null, '1', null, null, '', '107', 'cp8', '73883', '陈福祥', null, null, '14', '1590734537364', '果序', '80', 'A05', '2020-05-28/30b9cefb-f8c0-42ac-bf05-1cd89d101082_slice_1_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('599', '0', null, '0', null, null, '', '108', 'cp9', '73859', '过站不停', null, null, '14', '1590734698160', '', '81', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('600', '10', null, '1', null, null, '', '108', 'cp9', '73874', '?温柔的刘鑫?', null, null, '14', '1590734699927', 'D', '81', '', '2020-05-28/42a6c012-30eb-402d-874f-c26e63d6d06d_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('601', '0', null, '0', null, null, '', '108', 'cp9', '73854', '灿米爸', null, null, '14', '1590734704119', '', '81', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('602', '0', null, '0', null, null, '', '108', 'cp9', '73858', '邓超人001号。', null, null, '14', '1590734720867', '', '81', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('603', '10', null, '1', null, null, '', '108', 'cp9', '73871', '王蕾', null, null, '14', '1590734722455', 'D', '81', '', '2020-05-28/42a6c012-30eb-402d-874f-c26e63d6d06d_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('604', '10', null, '1', null, null, '', '108', 'cp9', '73845', '焦南威', null, null, '14', '1590734731152', 'D', '81', '', '2020-05-28/42a6c012-30eb-402d-874f-c26e63d6d06d_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('605', '10', null, '1', null, null, '', '101', 'cp2', '73886', '康庄大道', null, null, '14', '1590734737076', 'B', '74', 'A01', '2020-05-28/9f1a26ca-c095-4bef-b6c8-4876c69a9634_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('606', '10', null, '1', null, null, '', '108', 'cp9', '73848', '灵果Laura', null, null, '14', '1590734752301', 'D', '81', '', '2020-05-28/42a6c012-30eb-402d-874f-c26e63d6d06d_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('607', '10', null, '1', null, null, '', '101', 'cp2', '73884', '懒蜗牛', null, null, '14', '1590734766673', 'B', '74', 'A01', '2020-05-28/9f1a26ca-c095-4bef-b6c8-4876c69a9634_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('608', '0', null, '0', null, null, '', '108', 'cp9', '73883', '陈福祥', null, null, '14', '1590734777595', '', '81', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('609', '0', null, '0', null, null, '', '109', 'cp10', '73845', '焦南威', null, null, '14', '1590735040002', '', '82', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('610', '10', null, '1', null, null, '', '109', 'cp10', '73883', '陈福祥', null, null, '14', '1590735053463', '黄花菜', '82', 'A02', '2020-05-28/d284c16c-eeb0-421f-876a-e6bd395507a5_slice_0_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('611', '0', null, '0', null, null, '', '109', 'cp10', '73859', '过站不停', null, null, '14', '1590735347801', '', '82', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('612', '0', null, '0', null, null, '', '109', 'cp10', '73858', '邓超人001号。', null, null, '14', '1590735365009', '', '82', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('613', '10', null, '1', null, null, '', '109', 'cp10', '73848', '灵果Laura', null, null, '14', '1590735417612', '黄花菜', '82', 'A02', '2020-05-28/d284c16c-eeb0-421f-876a-e6bd395507a5_slice_0_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('614', '10', null, '1', null, null, '', '109', 'cp10', '73874', '?温柔的刘鑫?', null, null, '14', '1590735422718', '黄花菜', '82', 'A02', '2020-05-28/d284c16c-eeb0-421f-876a-e6bd395507a5_slice_0_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('615', '10', null, '1', null, null, '', '109', 'cp10', '73854', '灿米爸', null, null, '14', '1590735468456', '黄花菜', '82', 'A02', '2020-05-28/d284c16c-eeb0-421f-876a-e6bd395507a5_slice_0_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('616', '10', null, '1', null, null, '', '109', 'cp10', '73871', '王蕾', null, null, '14', '1590735510983', '黄花菜', '82', 'A02', '2020-05-28/d284c16c-eeb0-421f-876a-e6bd395507a5_slice_0_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('617', '10', null, '1', null, null, '', '110', 'cp11', '73845', '焦南威', null, null, '14', '1590735588539', '2', '83', '', '2020-05-28/c730a0e5-647b-4065-a7f6-e521ee1e70c5_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('618', '10', null, '1', null, null, '', '110', 'cp11', '73883', '陈福祥', null, null, '14', '1590735625510', '2', '83', '', '2020-05-28/c730a0e5-647b-4065-a7f6-e521ee1e70c5_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('619', '10', null, '1', null, null, '', '112', 'cp12', '73883', '陈福祥', null, null, '14', '1590735979021', '否', '85', 'A04', '2020-05-28/a3277489-86e7-4fb9-b285-6f51390f5df4_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('620', '10', null, '1', null, null, '', '112', 'cp12', '73845', '焦南威', null, null, '14', '1590736010987', '否', '85', 'A04', '2020-05-28/a3277489-86e7-4fb9-b285-6f51390f5df4_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('621', '10', null, '1', null, null, '', '100', 'cp1', '73890', '陈明群', null, null, '14', '1590736558180', '是', '73', '', '2020-05-28/e2ae7706-9dcd-4596-9a88-ccf5ce4c856e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('622', '0', null, '0', null, null, '', '101', 'cp2', '73890', '陈明群', null, null, '14', '1590736970018', '', '74', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('623', '10', null, '1', null, null, '', '110', 'cp11', '73871', '王蕾', null, null, '14', '1590737041927', '2', '83', '', '2020-05-28/c730a0e5-647b-4065-a7f6-e521ee1e70c5_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('624', '0', null, '0', null, null, '', '111', 'cp13', '73883', '陈福祥', null, null, '14', '1590737045974', '', '86', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('625', '10', null, '1', null, null, '', '110', 'cp11', '73858', '邓超人001号。', null, null, '14', '1590737066338', '两', '83', '', '2020-05-28/c730a0e5-647b-4065-a7f6-e521ee1e70c5_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('626', '10', null, '1', null, null, '', '110', 'cp11', '73874', '?温柔的刘鑫?', null, null, '14', '1590737072563', '两', '83', '', '2020-05-28/c730a0e5-647b-4065-a7f6-e521ee1e70c5_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('627', '10', null, '1', null, null, '', '110', 'cp11', '73854', '灿米爸', null, null, '14', '1590737072806', '两', '83', '', '2020-05-28/c730a0e5-647b-4065-a7f6-e521ee1e70c5_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('628', '0', null, '0', null, null, '', '110', 'cp11', '73859', '过站不停', null, null, '14', '1590737082510', '', '83', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('629', '10', null, '1', null, null, '', '110', 'cp11', '73848', '灵果Laura', null, null, '14', '1590737087003', '2', '83', '', '2020-05-28/c730a0e5-647b-4065-a7f6-e521ee1e70c5_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('630', '10', null, '1', null, null, '', '111', 'cp13', '73845', '焦南威', null, null, '14', '1590737247463', '卵圆形', '86', '', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('631', '10', null, '1', null, null, '', '111', 'cp13', '73854', '灿米爸', null, null, '14', '1590737456975', '卵圆形', '86', '', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('632', '0', null, '0', null, null, '', '111', 'cp13', '73871', '王蕾', null, null, '14', '1590737611836', '', '86', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('633', '10', null, '1', null, null, '', '111', 'cp13', '73848', '灵果Laura', null, null, '14', '1590737619444', '卵圆形', '86', '', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('634', '0', null, '0', null, null, '', '102', 'cp3', '73890', '陈明群', null, null, '14', '1590737678036', '', '75', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('635', '10', null, '1', null, null, '', '111', 'cp13', '73874', '?温柔的刘鑫?', null, null, '14', '1590737702734', '卵圆形', '86', '', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('636', '10', null, '1', null, null, '', '111', 'cp13', '73858', '邓超人001号。', null, null, '14', '1590737804449', '卵圆形', '86', '', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('637', '0', null, '0', null, null, '', '113', 'cp14', '73883', '陈福祥', null, null, '14', '1590738166414', '', '87', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('638', '10', null, '1', null, null, '', '111', 'cp13', '73859', '过站不停', null, null, '14', '1590738450648', '卵圆形', '86', '', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('639', '10', null, '1', null, null, '', '113', 'cp14', '73845', '焦南威', null, null, '14', '1590738569433', '有', '87', 'A04', '2020-05-28/b722c622-4223-4672-b01a-d7ac837e5164_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('640', '10', null, '1', null, null, '', '113', 'cp14', '73871', '王蕾', null, null, '14', '1590738639974', '有', '87', 'A04', '2020-05-28/b722c622-4223-4672-b01a-d7ac837e5164_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('641', '0', null, '0', null, null, '', '113', 'cp14', '73858', '邓超人001号。', null, null, '14', '1590738731252', '', '87', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('642', '10', null, '1', null, null, '', '119', 'cp20', '73861', 'Frank', null, null, '14', '1590738742123', 'B', '93', '', '2020-05-28/a257c3c4-9ba2-4406-9e5c-ac62c6dd5b2e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('643', '0', null, '0', null, null, '', '103', 'cp4', '73890', '陈明群', null, null, '14', '1590738750230', '', '76', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('644', '10', null, '1', null, null, '', '113', 'cp14', '73859', '过站不停', null, null, '14', '1590738879670', '有', '87', 'A04', '2020-05-28/b722c622-4223-4672-b01a-d7ac837e5164_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('645', '10', null, '1', null, null, '', '113', 'cp14', '73854', '灿米爸', null, null, '14', '1590738881027', '有', '87', 'A04', '2020-05-28/b722c622-4223-4672-b01a-d7ac837e5164_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('646', '10', null, '1', null, null, '', '114', 'cp15', '73883', '陈福祥', null, null, '14', '1590738907245', 'B', '88', '', '2020-05-28/3bf704b8-86d3-40e0-b4c2-9f8a3317bc1e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('647', '10', null, '1', null, null, '', '114', 'cp15', '73845', '焦南威', null, null, '14', '1590738917023', 'b', '88', '', '2020-05-28/3bf704b8-86d3-40e0-b4c2-9f8a3317bc1e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('648', '10', null, '1', null, null, '', '113', 'cp14', '73874', '?温柔的刘鑫?', null, null, '14', '1590738930000', '有', '87', 'A04', '2020-05-28/b722c622-4223-4672-b01a-d7ac837e5164_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('649', '10', null, '1', null, null, '', '113', 'cp14', '73848', '灵果Laura', null, null, '14', '1590738931930', '有', '87', 'A04', '2020-05-28/b722c622-4223-4672-b01a-d7ac837e5164_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('650', '10', null, '1', null, null, '', '118', 'cp19', '73861', 'Frank', null, null, '14', '1590738959198', '', '92', 'A06', '2020-05-28/41306da9-16b2-49ea-887a-2541f3ee1af8_slice_1_2.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('651', '0', null, '0', null, null, '', '117', 'cp18', '73861', 'Frank', null, null, '14', '1590739140418', '', '91', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('652', '0', null, '0', null, null, '', '115', 'cp16', '73845', '焦南威', null, null, '14', '1590739142800', '', '89', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('653', '0', null, '0', null, null, '', '115', 'cp16', '73883', '陈福祥', null, null, '14', '1590739144731', '', '89', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('654', '0', null, '0', null, null, '', '114', 'cp15', '73858', '邓超人001号。', null, null, '14', '1590739276454', '', '88', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('655', '0', null, '0', null, null, '', '116', 'cp17', '73883', '陈福祥', null, null, '14', '1590739437081', '', '90', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('656', '10', null, '1', null, null, '', '116', 'cp17', '73845', '焦南威', null, null, '14', '1590739440679', 'b', '90', '', '2020-05-28/29607a89-697b-4bd2-bfaa-2617c02c5688_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('657', '0', null, '0', null, null, '', '104', 'cp5', '73890', '陈明群', null, null, '14', '1590739533672', '', '77', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('658', '0', null, '0', null, null, '', '112', 'cp12', '73858', '邓超人001号。', null, null, '14', '1590740115228', '', '85', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('659', '10', null, '1', null, null, '', '112', 'cp12', '73871', '王蕾', null, null, '14', '1590740116136', '否', '85', 'A04', '2020-05-28/a3277489-86e7-4fb9-b285-6f51390f5df4_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('660', '10', null, '1', null, null, '', '112', 'cp12', '73859', '过站不停', null, null, '14', '1590740155498', '否', '85', 'A04', '2020-05-28/a3277489-86e7-4fb9-b285-6f51390f5df4_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('661', '10', null, '1', null, null, '', '112', 'cp12', '73854', '灿米爸', null, null, '14', '1590740173258', '否', '85', 'A04', '2020-05-28/a3277489-86e7-4fb9-b285-6f51390f5df4_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('662', '10', null, '1', null, null, '', '112', 'cp12', '73874', '?温柔的刘鑫?', null, null, '14', '1590740189600', '否', '85', 'A04', '2020-05-28/a3277489-86e7-4fb9-b285-6f51390f5df4_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('663', '0', null, '0', null, null, '', '117', 'cp18', '73883', '陈福祥', null, null, '14', '1590740190325', '', '91', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('664', '10', null, '1', null, null, '', '112', 'cp12', '73848', '灵果Laura', null, null, '14', '1590740192114', '否', '85', 'A04', '2020-05-28/a3277489-86e7-4fb9-b285-6f51390f5df4_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('665', '0', null, '0', null, null, '', '117', 'cp18', '73845', '焦南威', null, null, '14', '1590740227643', '', '91', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('666', '10', null, '1', null, null, '', '118', 'cp19', '73883', '陈福祥', null, null, '14', '1590740689979', '', '92', 'A06', '2020-05-28/41306da9-16b2-49ea-887a-2541f3ee1af8_slice_1_2.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('667', '10', null, '1', null, null, '', '118', 'cp19', '73845', '焦南威', null, null, '14', '1590740723476', '', '92', 'A06', '2020-05-28/41306da9-16b2-49ea-887a-2541f3ee1af8_slice_1_2.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('668', '0', null, '0', null, null, '', '103', 'cp4', '73891', '文静', null, null, '14', '1590740953869', '', '76', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('669', '10', null, '1', null, null, '', '114', 'cp15', '73871', '王蕾', null, null, '14', '1590741093494', 'B', '88', '', '2020-05-28/3bf704b8-86d3-40e0-b4c2-9f8a3317bc1e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('670', '10', null, '1', null, null, '', '119', 'cp20', '73883', '陈福祥', null, null, '14', '1590741120173', 'B', '93', '', '2020-05-28/a257c3c4-9ba2-4406-9e5c-ac62c6dd5b2e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('671', '10', null, '1', null, null, '', '119', 'cp20', '73845', '焦南威', null, null, '14', '1590741122125', 'b', '93', '', '2020-05-28/a257c3c4-9ba2-4406-9e5c-ac62c6dd5b2e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('672', '0', null, '0', null, null, '', '114', 'cp15', '73854', '灿米爸', null, null, '14', '1590741155051', '', '88', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('673', '10', null, '1', null, null, '', '114', 'cp15', '73848', '灵果Laura', null, null, '14', '1590741228913', 'B', '88', '', '2020-05-28/3bf704b8-86d3-40e0-b4c2-9f8a3317bc1e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('674', '10', null, '1', null, null, '', '114', 'cp15', '73874', '?温柔的刘鑫?', null, null, '14', '1590741233355', 'B', '88', '', '2020-05-28/3bf704b8-86d3-40e0-b4c2-9f8a3317bc1e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('675', '10', null, '1', null, null, '', '114', 'cp15', '73859', '过站不停', null, null, '14', '1590741235522', 'B', '88', '', '2020-05-28/3bf704b8-86d3-40e0-b4c2-9f8a3317bc1e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('676', '0', null, '0', null, null, '', '115', 'cp16', '73858', '邓超人001号。', null, null, '14', '1590741438352', '', '89', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('677', '10', null, '1', null, null, '', '115', 'cp16', '73859', '过站不停', null, null, '14', '1590741551291', 'C', '89', 'A02', '2020-05-28/b15f6730-6c9e-4785-93cf-12e1249d4056_slice_0_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('678', '10', null, '1', null, null, '', '115', 'cp16', '73874', '?温柔的刘鑫?', null, null, '14', '1590741563779', 'C', '89', 'A02', '2020-05-28/b15f6730-6c9e-4785-93cf-12e1249d4056_slice_0_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('679', '10', null, '1', null, null, '', '115', 'cp16', '73854', '灿米爸', null, null, '14', '1590741576430', 'C', '89', 'A02', '2020-05-28/b15f6730-6c9e-4785-93cf-12e1249d4056_slice_0_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('680', '10', null, '1', null, null, '', '100', 'cp1', '73883', '陈福祥', null, null, '14', '1590741582598', '是', '73', '', '2020-05-28/e2ae7706-9dcd-4596-9a88-ccf5ce4c856e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('681', '0', null, '0', null, null, '', '115', 'cp16', '73871', '王蕾', null, null, '14', '1590741584965', '', '89', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('682', '10', null, '1', null, null, '', '100', 'cp1', '73845', '焦南威', null, null, '14', '1590741620515', '是', '73', '', '2020-05-28/e2ae7706-9dcd-4596-9a88-ccf5ce4c856e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('683', '10', null, '1', null, null, '', '115', 'cp16', '73848', '灵果Laura', null, null, '14', '1590741680714', 'C', '89', 'A02', '2020-05-28/b15f6730-6c9e-4785-93cf-12e1249d4056_slice_0_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('684', '0', null, '0', null, null, '', '116', 'cp17', '73858', '邓超人001号。', null, null, '14', '1590741816819', '', '90', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('685', '0', null, '0', null, null, '', '116', 'cp17', '73871', '王蕾', null, null, '14', '1590741835610', '', '90', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('686', '0', null, '0', null, null, '', '116', 'cp17', '73854', '灿米爸', null, null, '14', '1590742126235', '', '90', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('687', '10', null, '1', null, null, '', '104', 'cp5', '73891', '文静', null, null, '14', '1590742159186', 'C', '77', '', '2020-05-28/e8b3572f-5545-4b99-9b70-a1e49fb026a7_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('688', '10', null, '1', null, null, '', '116', 'cp17', '73859', '过站不停', null, null, '14', '1590742449116', 'B', '90', '', '2020-05-28/29607a89-697b-4bd2-bfaa-2617c02c5688_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('689', '10', null, '1', null, null, '', '116', 'cp17', '73874', '?温柔的刘鑫?', null, null, '14', '1590742482770', 'B', '90', '', '2020-05-28/29607a89-697b-4bd2-bfaa-2617c02c5688_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('690', '10', null, '1', null, null, '', '116', 'cp17', '73848', '灵果Laura', null, null, '14', '1590742486439', 'B', '90', '', '2020-05-28/29607a89-697b-4bd2-bfaa-2617c02c5688_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('691', '10', null, '1', null, null, '', '105', 'cp6', '73891', '文静', null, null, '14', '1590742953338', '挺水', '78', 'A01', '2020-05-28/eeb09651-57e4-406c-86c9-1e62943b3fa6_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('692', '0', null, '0', null, null, '', '117', 'cp18', '73858', '邓超人001号。', null, null, '14', '1590743541793', '', '91', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('693', '0', null, '0', null, null, '', '117', 'cp18', '73854', '灿米爸', null, null, '14', '1590743583973', '', '91', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('694', '0', null, '0', null, null, '', '117', 'cp18', '73871', '王蕾', null, null, '14', '1590743645322', '', '91', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('695', '0', null, '0', null, null, '', '117', 'cp18', '73874', '?温柔的刘鑫?', null, null, '14', '1590743728519', '', '91', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('696', '0', null, '0', null, null, '', '117', 'cp18', '73859', '过站不停', null, null, '14', '1590743747664', '', '91', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('697', '0', null, '0', null, null, '', '117', 'cp18', '73848', '灵果Laura', null, null, '14', '1590743830947', '', '91', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('698', '0', null, '0', null, null, '', '106', 'cp7', '73891', '文静', null, null, '14', '1590743899449', '', '79', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('699', '10', null, '1', null, null, '', '118', 'cp19', '73858', '邓超人001号。', null, null, '14', '1590743979588', '', '92', 'A06', '2020-05-28/41306da9-16b2-49ea-887a-2541f3ee1af8_slice_1_2.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('700', '10', null, '1', null, null, '', '118', 'cp19', '73871', '王蕾', null, null, '14', '1590743988338', '', '92', 'A06', '2020-05-28/41306da9-16b2-49ea-887a-2541f3ee1af8_slice_1_2.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('701', '10', null, '1', null, null, '', '118', 'cp19', '73854', '灿米爸', null, null, '14', '1590744014395', '', '92', 'A06', '2020-05-28/41306da9-16b2-49ea-887a-2541f3ee1af8_slice_1_2.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('702', '10', null, '1', null, null, '', '118', 'cp19', '73874', '?温柔的刘鑫?', null, null, '14', '1590744174328', '', '92', 'A06', '2020-05-28/41306da9-16b2-49ea-887a-2541f3ee1af8_slice_1_2.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('703', '10', null, '1', null, null, '', '118', 'cp19', '73848', '灵果Laura', null, null, '14', '1590744181136', '', '92', 'A06', '2020-05-28/41306da9-16b2-49ea-887a-2541f3ee1af8_slice_1_2.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('704', '10', null, '1', null, null, '', '118', 'cp19', '73859', '过站不停', null, null, '14', '1590744277879', '', '92', 'A06', '2020-05-28/41306da9-16b2-49ea-887a-2541f3ee1af8_slice_1_2.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('705', '0', null, '0', null, null, '', '119', 'cp20', '73854', '灿米爸', null, null, '14', '1590744614858', '', '93', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('706', '10', null, '1', null, null, '', '119', 'cp20', '73874', '?温柔的刘鑫?', null, null, '14', '1590744692097', 'B', '93', '', '2020-05-28/a257c3c4-9ba2-4406-9e5c-ac62c6dd5b2e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('707', '10', null, '1', null, null, '', '119', 'cp20', '73848', '灵果Laura', null, null, '14', '1590744710054', 'B', '93', '', '2020-05-28/a257c3c4-9ba2-4406-9e5c-ac62c6dd5b2e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('708', '10', null, '1', null, null, '', '107', 'cp8', '73891', '文静', null, null, '14', '1590744715424', '果序', '80', 'A05', '2020-05-28/30b9cefb-f8c0-42ac-bf05-1cd89d101082_slice_1_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('709', '10', null, '1', null, null, '', '100', 'cp1', '73874', '?温柔的刘鑫?', null, null, '14', '1590744944293', '是', '73', '', '2020-05-28/e2ae7706-9dcd-4596-9a88-ccf5ce4c856e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('710', '10', null, '1', null, null, '', '101', 'cp2', '73874', '?温柔的刘鑫?', null, null, '14', '1590745266507', 'B', '74', 'A01', '2020-05-28/9f1a26ca-c095-4bef-b6c8-4876c69a9634_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('711', '10', null, '1', null, null, '', '119', 'cp20', '73858', '邓超人001号。', null, null, '14', '1590745529385', 'B', '93', '', '2020-05-28/a257c3c4-9ba2-4406-9e5c-ac62c6dd5b2e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('712', '10', null, '1', null, null, '', '117', 'cp18', '73891', '文静', null, null, '14', '1590745719742', '聚伞花序', '91', 'A03', '2020-05-28/2fa8a38a-6b4b-4e85-a825-348e0b8f4935_slice_0_2.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('713', '0', null, '0', null, null, '', '119', 'cp20', '73871', '王蕾', null, null, '14', '1590746264697', '', '93', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('714', '10', null, '1', null, null, '', '118', 'cp19', '73891', '文静', null, null, '14', '1590746282557', '', '92', 'A06', '2020-05-28/41306da9-16b2-49ea-887a-2541f3ee1af8_slice_1_2.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('715', '10', null, '1', null, null, '', '119', 'cp20', '73891', '文静', null, null, '14', '1590746743465', 'B', '93', '', '2020-05-28/a257c3c4-9ba2-4406-9e5c-ac62c6dd5b2e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('716', '0', null, '0', null, null, '', '100', 'cp1', '73891', '文静', null, null, '14', '1590747114284', '', '73', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('717', '0', null, '0', null, null, '', '114', 'cp15', '73892', '晓静', null, null, '14', '1590748799899', '', '88', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('718', '0', null, '0', null, null, '', '116', 'cp17', '73892', '晓静', null, null, '14', '1590749303469', '', '90', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('719', '10', null, '1', null, null, '', '100', 'cp1', '73895', 'Leah 利亚', null, null, '14', '1590751204909', '是', '73', '', '2020-05-28/e2ae7706-9dcd-4596-9a88-ccf5ce4c856e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('720', '0', null, '0', null, null, '', '116', 'cp17', '73881', 'LucyLi', null, null, '14', '1590789986069', '', '90', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('721', '10', null, '1', null, null, '', '115', 'cp16', '73881', 'LucyLi', null, null, '14', '1590790990676', 'C', '89', 'A02', '2020-05-28/b15f6730-6c9e-4785-93cf-12e1249d4056_slice_0_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('722', '0', null, '0', null, null, '', '117', 'cp18', '73881', 'LucyLi', null, null, '14', '1590793675932', '', '91', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('723', '10', null, '1', null, null, '', '118', 'cp19', '73881', 'LucyLi', null, null, '14', '1590793835446', '', '92', 'A06', '2020-05-28/41306da9-16b2-49ea-887a-2541f3ee1af8_slice_1_2.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('724', '10', null, '1', null, null, '', '100', 'cp1', '73898', '饶晨曦', null, null, '14', '1590803296326', '是', '73', '', '2020-05-28/e2ae7706-9dcd-4596-9a88-ccf5ce4c856e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('725', '10', null, '1', null, null, '', '100', 'cp1', '73897', 'Pu妈', null, null, '14', '1590803321588', '是', '73', '', '2020-05-28/e2ae7706-9dcd-4596-9a88-ccf5ce4c856e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('726', '10', null, '1', null, null, '', '119', 'cp20', '73898', '饶晨曦', null, null, '14', '1590803535558', 'B', '93', '', '2020-05-28/a257c3c4-9ba2-4406-9e5c-ac62c6dd5b2e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('727', '10', null, '1', null, null, '', '119', 'cp20', '73897', 'Pu妈', null, null, '14', '1590803562988', 'B', '93', '', '2020-05-28/a257c3c4-9ba2-4406-9e5c-ac62c6dd5b2e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('728', '10', null, '1', null, null, '', '101', 'cp2', '73897', 'Pu妈', null, null, '14', '1590803832079', 'B', '74', 'A01', '2020-05-28/9f1a26ca-c095-4bef-b6c8-4876c69a9634_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('729', '10', null, '1', null, null, '', '101', 'cp2', '73898', '饶晨曦', null, null, '14', '1590803863205', 'B', '74', 'A01', '2020-05-28/9f1a26ca-c095-4bef-b6c8-4876c69a9634_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('730', '10', null, '1', null, null, '', '102', 'cp3', '73897', 'Pu妈', null, null, '14', '1590804103338', 'A', '75', '', '2020-05-28/85ea01c4-3c88-4d15-a740-bdc8001df224_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('731', '10', null, '1', null, null, '', '102', 'cp3', '73898', '饶晨曦', null, null, '14', '1590804131987', 'A', '75', '', '2020-05-28/85ea01c4-3c88-4d15-a740-bdc8001df224_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('732', '0', null, '0', null, null, '', '78', '一号点', '73902', 'XD', null, null, '13', '1590804764225', '', '62', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('733', '10', null, '1', null, null, '', '103', 'cp4', '73897', 'Pu妈', null, null, '14', '1590804960435', 'A', '76', 'A05', '2020-05-28/c68e5a0a-ac03-4792-8bf4-e8cf7eff680b_slice_1_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('734', '10', null, '1', null, null, '', '103', 'cp4', '73898', '饶晨曦', null, null, '14', '1590804973795', 'A', '76', 'A05', '2020-05-28/c68e5a0a-ac03-4792-8bf4-e8cf7eff680b_slice_1_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('735', '10', null, '1', null, null, '', '86', '九号点', '73901', 'momo', null, null, '13', '1590805224930', '', '71', 'YM06', '2020-05-26/94eb9b04-0684-47c8-af41-b6fbf96f9c39_YM06.jpg', '1', '1', null);
INSERT INTO `PointUserinfo` VALUES ('736', '0', null, '0', null, null, '', '83', '六号点', '73904', 'thomas', null, null, '13', '1590805295174', '', '69', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('737', '0', null, '0', null, null, '', '104', 'cp5', '73897', 'Pu妈', null, null, '14', '1590805298362', '', '77', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('738', '0', null, '0', null, null, '', '104', 'cp5', '73898', '饶晨曦', null, null, '14', '1590805336645', '', '77', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('739', '0', null, '0', null, null, '', '78', '一号点', '73903', '杨丹', null, null, '13', '1590805379199', '', '62', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('740', '10', null, '1', null, null, '', '105', 'cp6', '73897', 'Pu妈', null, null, '14', '1590805742785', '挺水植物', '78', 'A01', '2020-05-28/eeb09651-57e4-406c-86c9-1e62943b3fa6_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('741', '0', null, '0', null, null, '', '80', '三号点', '73899', '波波', null, null, '13', '1590805795555', '', '64', '答案错误', '', '1', '1', null);
INSERT INTO `PointUserinfo` VALUES ('742', '10', null, '1', null, null, '', '80', '三号点', '73900', '崔岩', null, null, '13', '1590805802169', 'SOS', '64', 'YM01', '2020-05-26/91b543c5-07f7-4a37-a3e4-b71d4961fbfd_YM01.jpg', '1', '1', null);
INSERT INTO `PointUserinfo` VALUES ('743', '10', null, '1', null, null, '', '82', '五号点', '73904', 'thomas', null, null, '13', '1590805814880', 'DBCAE', '67', 'YM03', '2020-05-26/34c7344c-b20f-41e4-87d4-86ea78f57e66_YM03.jpg', '1', '2', null);
INSERT INTO `PointUserinfo` VALUES ('744', '10', null, '1', null, null, '', '105', 'cp6', '73898', '饶晨曦', null, null, '14', '1590805849338', '挺水植物', '78', 'A01', '2020-05-28/eeb09651-57e4-406c-86c9-1e62943b3fa6_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('745', '0', null, '0', null, null, '', '83', '六号点', '73901', 'momo', null, null, '13', '1590805926855', '', '69', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('746', '10', null, '1', null, null, '', '81', '四号点', '73904', 'thomas', null, null, '13', '1590805973200', 'C', '68', '', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('747', '0', null, '0', null, null, '', '86', '九号点', '73902', 'XD', null, null, '13', '1590806025003', '', '71', '答案错误', '', '1', '1', null);
INSERT INTO `PointUserinfo` VALUES ('748', '0', null, '0', null, null, '', '83', '六号点', '73905', '王倩Kaylee', null, null, '13', '1590806026022', '', '69', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('749', '10', null, '1', null, null, '2020-05-30/tmp_6d4f416ebb753ef3fbe57abb5e74e2d7.jpg', '79', '二号点', '73900', '崔岩', null, null, '13', '1590806032420', '', '63', '', '2020-05-25/70313be5-b27f-4fa4-a4eb-8617ee0c333f_slice_1_1.jpg', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('750', '10', null, '1', null, null, '2020-05-30/tmp_f90895f9071da1097453b64a03cae51f.jpg', '79', '二号点', '73899', '波波', null, null, '13', '1590806057881', '', '63', '', '2020-05-25/70313be5-b27f-4fa4-a4eb-8617ee0c333f_slice_1_1.jpg', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('751', '0', null, '0', null, null, '', '83', '六号点', '73907', 'Cindy歌', null, null, '13', '1590806066978', '', '69', '答案错误', '', '1', '1', null);
INSERT INTO `PointUserinfo` VALUES ('752', '10', null, '1', null, null, '', '83', '六号点', '73909', '白又白', null, null, '13', '1590806122223', '300米', '69', '', '', '1', '1', null);
INSERT INTO `PointUserinfo` VALUES ('753', '10', null, '1', null, null, '', '106', 'cp7', '73897', 'Pu妈', null, null, '14', '1590806221541', '钟形', '79', '', '2020-05-28/ea0fd11e-0e04-403f-9450-c91b3bda7ac4_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('754', '10', null, '1', null, null, '', '106', 'cp7', '73898', '饶晨曦', null, null, '14', '1590806286521', '钟形', '79', '', '2020-05-28/ea0fd11e-0e04-403f-9450-c91b3bda7ac4_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('755', '10', null, '1', null, null, '', '86', '九号点', '73906', '董湘辉', null, null, '13', '1590806313280', '13米', '71', 'YM06', '2020-05-26/94eb9b04-0684-47c8-af41-b6fbf96f9c39_YM06.jpg', '1', '2', null);
INSERT INTO `PointUserinfo` VALUES ('756', '10', null, '1', null, null, '', '78', '一号点', '73900', '崔岩', null, null, '13', '1590806331102', '行歌荒野中', '62', 'YM04', '2020-05-26/c7bfe905-f7e2-4285-8343-3e79dc44a35a_YM04.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('757', '10', null, '1', null, null, '', '78', '一号点', '73899', '波波', null, null, '13', '1590806340788', '行歌荒野中', '62', 'YM04', '2020-05-26/c7bfe905-f7e2-4285-8343-3e79dc44a35a_YM04.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('758', '10', null, '1', null, null, '2020-05-30/tmp_8d6f6972056c85be2295158f170a3aed4817da88257a65c4.jpg', '84', '七号点', '73907', 'Cindy歌', null, null, '13', '1590806367406', '', '70', 'YM02', '2020-05-26/5bac7338-ace7-429c-9c00-a2db871ff5e7_YM02.jpg', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('759', '10', null, '1', null, null, '2020-05-30/tmp_89fe96d8b768b6dd81438e03ac153005.jpg', '84', '七号点', '73905', '王倩Kaylee', null, null, '13', '1590806440501', '', '70', 'YM02', '2020-05-26/5bac7338-ace7-429c-9c00-a2db871ff5e7_YM02.jpg', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('760', '10', null, '1', null, null, '', '80', '三号点', '73904', 'thomas', null, null, '13', '1590806584346', 'SOS', '64', 'YM01', '2020-05-26/91b543c5-07f7-4a37-a3e4-b71d4961fbfd_YM01.jpg', '1', '1', null);
INSERT INTO `PointUserinfo` VALUES ('761', '10', null, '1', null, null, '', '82', '五号点', '73900', '崔岩', null, null, '13', '1590806638855', '', '67', 'YM03', '2020-05-26/34c7344c-b20f-41e4-87d4-86ea78f57e66_YM03.jpg', '1', '1', null);
INSERT INTO `PointUserinfo` VALUES ('762', '10', null, '1', null, null, '', '82', '五号点', '73901', 'momo', null, null, '13', '1590806670025', 'DBCAE', '67', 'YM03', '2020-05-26/34c7344c-b20f-41e4-87d4-86ea78f57e66_YM03.jpg', '1', '2', null);
INSERT INTO `PointUserinfo` VALUES ('763', '10', null, '1', null, null, '', '82', '五号点', '73899', '波波', null, null, '13', '1590806685602', 'DBCAE', '67', 'YM03', '2020-05-26/34c7344c-b20f-41e4-87d4-86ea78f57e66_YM03.jpg', '1', '2', null);
INSERT INTO `PointUserinfo` VALUES ('764', '0', null, '0', null, null, '', '107', 'cp8', '73897', 'Pu妈', null, null, '14', '1590806691345', '', '80', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('765', '10', null, '1', null, null, '', '82', '五号点', '73909', '白又白', null, null, '13', '1590806701149', '', '67', 'YM03', '2020-05-26/34c7344c-b20f-41e4-87d4-86ea78f57e66_YM03.jpg', '1', '1', null);
INSERT INTO `PointUserinfo` VALUES ('766', '10', null, '1', null, null, '', '107', 'cp8', '73898', '饶晨曦', null, null, '14', '1590806714518', '果序', '80', 'A05', '2020-05-28/30b9cefb-f8c0-42ac-bf05-1cd89d101082_slice_1_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('767', '10', null, '1', null, null, '', '85', '八号点', '73905', '王倩Kaylee', null, null, '13', '1590806732279', 'D', '72', 'YM05', '2020-05-26/5266ccb6-53c8-4f15-bac7-5af3761ab919_YM05.jpg', '1', '1', null);
INSERT INTO `PointUserinfo` VALUES ('768', '10', null, '1', null, null, '2020-05-30/tmp_28532af86b5242538e698878452e9cbe.jpg', '79', '二号点', '73904', 'thomas', null, null, '13', '1590806733263', '', '63', '', '2020-05-25/70313be5-b27f-4fa4-a4eb-8617ee0c333f_slice_1_1.jpg', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('769', '0', null, '0', null, null, '', '81', '四号点', '73899', '波波', null, null, '13', '1590806842832', '', '68', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('770', '10', null, '1', null, null, '', '81', '四号点', '73901', 'momo', null, null, '13', '1590806843848', 'C', '68', '', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('771', '10', null, '1', null, null, '', '81', '四号点', '73909', '白又白', null, null, '13', '1590806851369', 'C', '68', '', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('772', '0', null, '0', null, null, '', '81', '四号点', '73900', '崔岩', null, null, '13', '1590806851795', '', '68', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('773', '10', null, '1', null, null, '2020-05-30/tmp_8fff4d8aaa0c182f7795f43df171e963470e5f54e542e7d3.jpg', '79', '二号点', '73903', '杨丹', null, null, '13', '1590806857258', '', '63', '', '2020-05-25/70313be5-b27f-4fa4-a4eb-8617ee0c333f_slice_1_1.jpg', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('774', '10', null, '1', null, null, '2020-05-30/tmp_3dc14c991d414a6045c163dfe6afec8a.jpg', '87', '十号点', '73906', '董湘辉', null, null, '13', '1590806873914', '', '65', '', '2020-05-26/75ce5db0-15e0-4a17-b8db-92d6f5d94902_slice_0_0.jpg', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('775', '10', null, '1', null, null, '2020-05-30/tmp_675b422b8edc3a120f408ecaf3c918b0.jpg', '87', '十号点', '73905', '王倩Kaylee', null, null, '13', '1590806905676', '', '65', '', '2020-05-26/75ce5db0-15e0-4a17-b8db-92d6f5d94902_slice_0_0.jpg', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('776', '10', null, '1', null, null, '', '78', '一号点', '73904', 'thomas', null, null, '13', '1590807009548', '行歌荒野中', '62', 'YM04', '2020-05-26/c7bfe905-f7e2-4285-8343-3e79dc44a35a_YM04.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('777', '0', null, '0', null, null, '', '108', 'cp9', '73898', '饶晨曦', null, null, '14', '1590807042154', '', '81', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('778', '10', null, '1', null, null, '', '108', 'cp9', '73897', 'Pu妈', null, null, '14', '1590807064829', 'D', '81', '', '2020-05-28/42a6c012-30eb-402d-874f-c26e63d6d06d_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('779', '0', null, '0', null, null, '', '109', 'cp10', '73897', 'Pu妈', null, null, '14', '1590807431319', '', '82', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('780', '10', null, '1', null, null, '', '109', 'cp10', '73898', '饶晨曦', null, null, '14', '1590807469708', '黄花菜', '82', 'A02', '2020-05-28/d284c16c-eeb0-421f-876a-e6bd395507a5_slice_0_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('781', '10', null, '1', null, null, '', '110', 'cp11', '73891', '文静', null, null, '14', '1590807741665', '2', '83', '', '2020-05-28/c730a0e5-647b-4065-a7f6-e521ee1e70c5_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('782', '0', null, '0', null, null, '', '110', 'cp11', '73897', 'Pu妈', null, null, '14', '1590807845909', '', '83', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('783', '10', null, '1', null, null, '', '110', 'cp11', '73898', '饶晨曦', null, null, '14', '1590807861174', '2', '83', '', '2020-05-28/c730a0e5-647b-4065-a7f6-e521ee1e70c5_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('784', '0', null, '0', null, null, '', '106', 'cp7', '73912', '汤傈傈', null, null, '14', '1590807865477', '', '79', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('785', '10', null, '1', null, null, '', '100', 'cp1', '73911', 'kittytang', null, null, '14', '1590807888878', '是', '73', '', '2020-05-28/e2ae7706-9dcd-4596-9a88-ccf5ce4c856e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('786', '0', null, '0', null, null, '', '119', 'cp20', '73911', 'kittytang', null, null, '14', '1590808009946', '', '93', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('787', '10', null, '1', null, null, '', '101', 'cp2', '73911', 'kittytang', null, null, '14', '1590808166820', 'B', '74', 'A01', '2020-05-28/9f1a26ca-c095-4bef-b6c8-4876c69a9634_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('788', '0', null, '0', null, null, '', '111', 'cp13', '73898', '饶晨曦', null, null, '14', '1590808178212', '', '86', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('789', '10', null, '1', null, null, '', '111', 'cp13', '73897', 'Pu妈', null, null, '14', '1590808211376', '卵圆形', '86', '', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('790', '0', null, '0', null, null, '', '109', 'cp10', '73891', '文静', null, null, '14', '1590808361964', '', '82', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('791', '10', null, '1', null, null, '', '102', 'cp3', '73911', 'kittytang', null, null, '14', '1590808444568', 'A', '75', '', '2020-05-28/85ea01c4-3c88-4d15-a740-bdc8001df224_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('792', '10', null, '1', null, null, '', '112', 'cp12', '73897', 'Pu妈', null, null, '14', '1590808494491', '否', '85', 'A04', '2020-05-28/a3277489-86e7-4fb9-b285-6f51390f5df4_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('793', '10', null, '1', null, null, '', '112', 'cp12', '73898', '饶晨曦', null, null, '14', '1590808495025', '否', '85', 'A04', '2020-05-28/a3277489-86e7-4fb9-b285-6f51390f5df4_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('794', '10', null, '1', null, null, '', '103', 'cp4', '73911', 'kittytang', null, null, '14', '1590808758499', 'A', '76', 'A05', '2020-05-28/c68e5a0a-ac03-4792-8bf4-e8cf7eff680b_slice_1_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('795', '0', null, '0', null, null, '', '108', 'cp9', '73891', '文静', null, null, '14', '1590808943984', '', '81', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('796', '0', null, '0', null, null, '', '113', 'cp14', '73897', 'Pu妈', null, null, '14', '1590809105262', '', '87', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('797', '0', null, '0', null, null, '', '104', 'cp5', '73911', 'kittytang', null, null, '14', '1590809112214', '', '77', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('798', '10', null, '1', null, null, '', '86', '九号点', '73923', '张伟', null, null, '13', '1590809119044', '13米', '71', 'YM06', '2020-05-26/94eb9b04-0684-47c8-af41-b6fbf96f9c39_YM06.jpg', '1', '2', null);
INSERT INTO `PointUserinfo` VALUES ('799', '10', null, '1', null, null, '', '113', 'cp14', '73898', '饶晨曦', null, null, '14', '1590809141958', '有', '87', 'A04', '2020-05-28/b722c622-4223-4672-b01a-d7ac837e5164_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('800', '10', null, '1', null, null, '', '86', '九号点', '73921', '张医生', null, null, '13', '1590809148988', '', '71', 'YM06', '2020-05-26/94eb9b04-0684-47c8-af41-b6fbf96f9c39_YM06.jpg', '1', '1', null);
INSERT INTO `PointUserinfo` VALUES ('801', '0', null, '0', null, null, '', '105', 'cp6', '73911', 'kittytang', null, null, '14', '1590809326008', '', '78', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('802', '10', null, '1', null, null, '', '85', '八号点', '73921', '张医生', null, null, '13', '1590809384471', 'D', '72', 'YM05', '2020-05-26/5266ccb6-53c8-4f15-bac7-5af3761ab919_YM05.jpg', '1', '1', null);
INSERT INTO `PointUserinfo` VALUES ('803', '10', null, '1', null, null, '', '85', '八号点', '73923', '张伟', null, null, '13', '1590809439880', 'D', '72', 'YM05', '2020-05-26/5266ccb6-53c8-4f15-bac7-5af3761ab919_YM05.jpg', '1', '1', null);
INSERT INTO `PointUserinfo` VALUES ('804', '10', null, '1', null, null, '2020-05-30/tmp_8879b1044bb445ec41b9120c20338f3277a6af1ce174a2c0.jpg', '84', '七号点', '73923', '张伟', null, null, '13', '1590809535464', '', '70', 'YM02', '2020-05-26/5bac7338-ace7-429c-9c00-a2db871ff5e7_YM02.jpg', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('805', '0', null, '0', null, null, '', '114', 'cp15', '73897', 'Pu妈', null, null, '14', '1590809552981', '', '88', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('806', '0', null, '0', null, null, '', '106', 'cp7', '73911', 'kittytang', null, null, '14', '1590809560523', '', '79', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('807', '10', null, '1', null, null, '', '114', 'cp15', '73898', '饶晨曦', null, null, '14', '1590809569973', 'B', '88', '', '2020-05-28/3bf704b8-86d3-40e0-b4c2-9f8a3317bc1e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('808', '10', null, '1', null, null, '2020-05-30/tmp_52ff34d9e9413308333df97080058daf.jpg', '84', '七号点', '73921', '张医生', null, null, '13', '1590809585005', '', '70', 'YM02', '2020-05-26/5bac7338-ace7-429c-9c00-a2db871ff5e7_YM02.jpg', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('809', '10', null, '1', null, null, '', '115', 'cp16', '73897', 'Pu妈', null, null, '14', '1590809772695', 'C', '89', 'A02', '2020-05-28/b15f6730-6c9e-4785-93cf-12e1249d4056_slice_0_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('810', '10', null, '1', null, null, '', '115', 'cp16', '73898', '饶晨曦', null, null, '14', '1590809810773', 'C', '89', 'A02', '2020-05-28/b15f6730-6c9e-4785-93cf-12e1249d4056_slice_0_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('811', '0', null, '0', null, null, '', '107', 'cp8', '73911', 'kittytang', null, null, '14', '1590809826280', '', '80', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('812', '10', null, '1', null, null, '2020-05-30/tmp_f887fa532970f8dd1df2a3f59af515269c03720bc5db4b32.jpg', '84', '七号点', '73919', '马宁', null, null, '13', '1590809868729', '', '70', 'YM02', '2020-05-26/5bac7338-ace7-429c-9c00-a2db871ff5e7_YM02.jpg', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('813', '10', null, '1', null, null, '2020-05-30/tmp_ce879637a01d2774fc6406045c94bb90.jpg', '84', '七号点', '73915', 'Gao', null, null, '13', '1590809899249', '', '70', 'YM02', '2020-05-26/5bac7338-ace7-429c-9c00-a2db871ff5e7_YM02.jpg', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('814', '10', null, '1', null, null, '2020-05-30/tmp_cb783ad2bd2a029e4683b59ca63752d2.jpg', '84', '七号点', '73922', '玫', null, null, '13', '1590809989733', '', '70', 'YM02', '2020-05-26/5bac7338-ace7-429c-9c00-a2db871ff5e7_YM02.jpg', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('815', '10', null, '1', null, null, '2020-05-30/tmp_20ecdb7da0b083a3606ea368b43138ad.jpg', '87', '十号点', '73921', '张医生', null, null, '13', '1590809999215', '', '65', '', '2020-05-26/75ce5db0-15e0-4a17-b8db-92d6f5d94902_slice_0_0.jpg', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('816', '10', null, '1', null, null, '', '85', '八号点', '73915', 'Gao', null, null, '13', '1590810073613', 'D', '72', 'YM05', '2020-05-26/5266ccb6-53c8-4f15-bac7-5af3761ab919_YM05.jpg', '1', '1', null);
INSERT INTO `PointUserinfo` VALUES ('817', '0', null, '0', null, null, '', '108', 'cp9', '73911', 'kittytang', null, null, '14', '1590810077652', '', '81', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('818', '10', null, '1', null, null, '2020-05-30/tmp_9f78e9e413a879a7c85f17891442fd344e1e3e3b31584ce0.jpg', '87', '十号点', '73920', '小白杨', null, null, '13', '1590810103482', '', '65', '', '2020-05-26/75ce5db0-15e0-4a17-b8db-92d6f5d94902_slice_0_0.jpg', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('819', '10', null, '1', null, null, '', '85', '八号点', '73919', '马宁', null, null, '13', '1590810141412', 'd', '72', 'YM05', '2020-05-26/5266ccb6-53c8-4f15-bac7-5af3761ab919_YM05.jpg', '1', '1', null);
INSERT INTO `PointUserinfo` VALUES ('820', '10', null, '1', null, null, '2020-05-30/tmp_7ccf4df106d90ad021ad3463c9db9e4a4d06f8e41342addb.jpg', '87', '十号点', '73923', '张伟', null, null, '13', '1590810144613', '', '65', '', '2020-05-26/75ce5db0-15e0-4a17-b8db-92d6f5d94902_slice_0_0.jpg', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('821', '10', null, '1', null, null, '', '116', 'cp17', '73898', '饶晨曦', null, null, '14', '1590810196058', 'B', '90', '', '2020-05-28/29607a89-697b-4bd2-bfaa-2617c02c5688_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('822', '0', null, '0', null, null, '', '81', '四号点', '73916', '丫头楚', null, null, '13', '1590810211316', '', '68', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('823', '10', null, '1', null, null, '', '109', 'cp10', '73911', 'kittytang', null, null, '14', '1590810216407', '黄花菜', '82', 'A02', '2020-05-28/d284c16c-eeb0-421f-876a-e6bd395507a5_slice_0_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('824', '10', null, '1', null, null, '', '112', 'cp12', '73891', '文静', null, null, '14', '1590810270878', '否', '85', 'A04', '2020-05-28/a3277489-86e7-4fb9-b285-6f51390f5df4_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('825', '10', null, '1', null, null, '', '85', '八号点', '73922', '玫', null, null, '13', '1590810407372', 'D', '72', 'YM05', '2020-05-26/5266ccb6-53c8-4f15-bac7-5af3761ab919_YM05.jpg', '1', '1', null);
INSERT INTO `PointUserinfo` VALUES ('826', '10', null, '1', null, null, '', '116', 'cp17', '73897', 'Pu妈', null, null, '14', '1590810420543', 'B', '90', '', '2020-05-28/29607a89-697b-4bd2-bfaa-2617c02c5688_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('827', '0', null, '0', null, null, '', '83', '六号点', '73919', '马宁', null, null, '13', '1590810420807', '', '69', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('828', '0', null, '0', null, null, '', '83', '六号点', '73915', 'Gao', null, null, '13', '1590810430852', '', '69', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('829', '0', null, '0', null, null, '', '83', '六号点', '73921', '张医生', null, null, '13', '1590810510850', '', '69', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('830', '10', null, '1', null, null, '', '110', 'cp11', '73911', 'kittytang', null, null, '14', '1590810574774', '2', '83', '', '2020-05-28/c730a0e5-647b-4065-a7f6-e521ee1e70c5_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('831', '0', null, '0', null, null, '', '78', '一号点', '73906', '董湘辉', null, null, '13', '1590810716622', '', '62', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('832', '0', null, '0', null, null, '', '117', 'cp18', '73898', '饶晨曦', null, null, '14', '1590810785796', '', '91', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('833', '0', null, '0', null, null, '', '83', '六号点', '73923', '张伟', null, null, '13', '1590810788498', '', '69', '答案错误', '', '1', '1', null);
INSERT INTO `PointUserinfo` VALUES ('834', '10', null, '1', null, null, '', '117', 'cp18', '73897', 'Pu妈', null, null, '14', '1590810803461', '聚伞花序', '91', 'A03', '2020-05-28/2fa8a38a-6b4b-4e85-a825-348e0b8f4935_slice_0_2.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('835', '0', null, '0', null, null, '', '78', '一号点', '73916', '丫头楚', null, null, '13', '1590810949499', '', '62', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('836', '0', null, '0', null, null, '', '111', 'cp13', '73891', '文静', null, null, '14', '1590810951258', '', '86', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('837', '10', null, '1', null, null, '', '118', 'cp19', '73898', '饶晨曦', null, null, '14', '1590811056003', '', '92', 'A06', '2020-05-28/41306da9-16b2-49ea-887a-2541f3ee1af8_slice_1_2.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('838', '10', null, '1', null, null, '', '118', 'cp19', '73897', 'Pu妈', null, null, '14', '1590811070324', '', '92', 'A06', '2020-05-28/41306da9-16b2-49ea-887a-2541f3ee1af8_slice_1_2.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('839', '10', null, '1', null, null, '', '82', '五号点', '73921', '张医生', null, null, '13', '1590811071793', '', '67', 'YM03', '2020-05-26/34c7344c-b20f-41e4-87d4-86ea78f57e66_YM03.jpg', '1', '1', null);
INSERT INTO `PointUserinfo` VALUES ('840', '10', null, '1', null, null, '2020-05-30/tmp_bf9c4b59db92479f0e935702f185f247.jpg', '87', '十号点', '73922', '玫', null, null, '13', '1590811090369', '', '65', '', '2020-05-26/75ce5db0-15e0-4a17-b8db-92d6f5d94902_slice_0_0.jpg', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('841', '0', null, '0', null, null, '', '86', '九号点', '73915', 'Gao', null, null, '13', '1590811163257', '', '71', '答案错误', '', '1', '1', null);
INSERT INTO `PointUserinfo` VALUES ('842', '0', null, '0', null, null, '', '111', 'cp13', '73911', 'kittytang', null, null, '14', '1590811333699', '', '86', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('843', '10', null, '1', null, null, '', '78', '一号点', '73922', '玫', null, null, '13', '1590811402209', '行歌荒野中', '62', 'YM04', '2020-05-26/c7bfe905-f7e2-4285-8343-3e79dc44a35a_YM04.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('844', '10', null, '1', null, null, '', '78', '一号点', '73915', 'Gao', null, null, '13', '1590811430668', '行歌荒野中', '62', 'YM04', '2020-05-26/c7bfe905-f7e2-4285-8343-3e79dc44a35a_YM04.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('845', '10', null, '1', null, null, '', '78', '一号点', '73919', '马宁', null, null, '13', '1590811442183', '行歌荒野中', '62', 'YM04', '2020-05-26/c7bfe905-f7e2-4285-8343-3e79dc44a35a_YM04.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('846', '0', null, '0', null, null, '', '83', '六号点', '73920', '小白杨', null, null, '13', '1590811527881', '', '69', '答案错误', '', '1', '1', null);
INSERT INTO `PointUserinfo` VALUES ('847', '10', null, '1', null, null, '', '112', 'cp12', '73911', 'kittytang', null, null, '14', '1590811556824', '否', '85', 'A04', '2020-05-28/a3277489-86e7-4fb9-b285-6f51390f5df4_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('848', '10', null, '1', null, null, '', '113', 'cp14', '73891', '文静', null, null, '14', '1590811611201', '有', '87', 'A04', '2020-05-28/b722c622-4223-4672-b01a-d7ac837e5164_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('849', '10', null, '1', null, null, '2020-05-30/tmp_fe4fd2e5fa403f9563ab4234d3d68ca117f18a049ba128a1.jpg', '84', '七号点', '73920', '小白杨', null, null, '13', '1590811778365', '', '70', 'YM02', '2020-05-26/5bac7338-ace7-429c-9c00-a2db871ff5e7_YM02.jpg', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('850', '0', null, '0', null, null, '', '113', 'cp14', '73911', 'kittytang', null, null, '14', '1590812225090', '', '87', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('851', '10', null, '1', null, null, '', '114', 'cp15', '73911', 'kittytang', null, null, '14', '1590812599541', 'B', '88', '', '2020-05-28/3bf704b8-86d3-40e0-b4c2-9f8a3317bc1e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('852', '10', null, '1', null, null, '', '114', 'cp15', '73891', '文静', null, null, '14', '1590812630059', 'B', '88', '', '2020-05-28/3bf704b8-86d3-40e0-b4c2-9f8a3317bc1e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('853', '0', null, '0', null, null, '', '115', 'cp16', '73911', 'kittytang', null, null, '14', '1590812820526', '', '89', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('854', '10', null, '1', null, null, '', '115', 'cp16', '73891', '文静', null, null, '14', '1590812904136', 'C', '89', 'A02', '2020-05-28/b15f6730-6c9e-4785-93cf-12e1249d4056_slice_0_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('855', '0', null, '0', null, null, '', '116', 'cp17', '73911', 'kittytang', null, null, '14', '1590813311227', '', '90', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('856', '0', null, '0', null, null, '', '116', 'cp17', '73891', '文静', null, null, '14', '1590813411576', '', '90', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('857', '0', null, '0', null, null, '', '117', 'cp18', '73911', 'kittytang', null, null, '14', '1590813767976', '', '91', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('858', '10', null, '1', null, null, '', '118', 'cp19', '73911', 'kittytang', null, null, '14', '1590813931135', '', '92', 'A06', '2020-05-28/41306da9-16b2-49ea-887a-2541f3ee1af8_slice_1_2.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('859', '10', null, '1', null, null, '', '101', 'cp2', '73891', '文静', null, null, '14', '1590814527178', 'B', '74', 'A01', '2020-05-28/9f1a26ca-c095-4bef-b6c8-4876c69a9634_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('860', '10', null, '1', null, null, '', '102', 'cp3', '73891', '文静', null, null, '14', '1590814827250', 'A', '75', '', '2020-05-28/85ea01c4-3c88-4d15-a740-bdc8001df224_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('861', '0', null, '0', null, null, '', '116', 'cp17', '73924', 'Samuel ', null, null, '14', '1590816136660', '', '90', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('862', '10', null, '1', null, null, '', '116', 'cp17', '73925', '苗苗', null, null, '14', '1590816169512', 'B', '90', '', '2020-05-28/29607a89-697b-4bd2-bfaa-2617c02c5688_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('863', '0', null, '0', null, null, '', '100', 'cp1', '73924', 'Samuel ', null, null, '14', '1590816183873', '', '73', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('864', '0', null, '0', null, null, '', '115', 'cp16', '73924', 'Samuel ', null, null, '14', '1590817191204', '', '89', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('865', '0', null, '0', null, null, '', '115', 'cp16', '73925', '苗苗', null, null, '14', '1590817204791', '', '89', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('866', '0', null, '0', null, null, '', '114', 'cp15', '73925', '苗苗', null, null, '14', '1590817819015', '', '88', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('867', '10', null, '1', null, null, '', '114', 'cp15', '73924', 'Samuel ', null, null, '14', '1590817842252', 'b', '88', '', '2020-05-28/3bf704b8-86d3-40e0-b4c2-9f8a3317bc1e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('868', '0', null, '0', null, null, '', '78', '一号点', '73931', 'AIA?Carolineʚ?ྀིɞ', null, null, '13', '1590818105185', '', '62', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('869', '0', null, '0', null, null, '', '86', '九号点', '73927', null, null, null, '13', '1590818538869', '', '71', '答案错误', '', '1', '2', null);
INSERT INTO `PointUserinfo` VALUES ('870', '10', null, '1', null, null, '', '78', '一号点', '73933', '石嘉林', null, null, '13', '1590818765042', '行歌荒野中', '62', 'YM04', '2020-05-26/c7bfe905-f7e2-4285-8343-3e79dc44a35a_YM04.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('871', '0', null, '0', null, null, '', '86', '九号点', '73930', '郭允', null, null, '13', '1590818767600', '', '71', '答案错误', '', '1', '2', null);
INSERT INTO `PointUserinfo` VALUES ('872', '10', null, '1', null, null, '', '83', '六号点', '73926', 'James 開', null, null, '13', '1590818783835', '300米', '69', '', '', '1', '1', null);
INSERT INTO `PointUserinfo` VALUES ('873', '10', null, '1', null, null, '', '113', 'cp14', '73925', '苗苗', null, null, '14', '1590818795116', '有', '87', 'A04', '2020-05-28/b722c622-4223-4672-b01a-d7ac837e5164_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('874', '10', null, '1', null, null, '', '113', 'cp14', '73924', 'Samuel ', null, null, '14', '1590818811281', '有', '87', 'A04', '2020-05-28/b722c622-4223-4672-b01a-d7ac837e5164_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('875', '10', null, '1', null, null, '', '80', '三号点', '73931', 'AIA?Carolineʚ?ྀིɞ', null, null, '13', '1590818817645', 'SOS', '64', 'YM01', '2020-05-26/91b543c5-07f7-4a37-a3e4-b71d4961fbfd_YM01.jpg', '1', '1', null);
INSERT INTO `PointUserinfo` VALUES ('876', '10', null, '1', null, null, '', '80', '三号点', '73920', '小白杨', null, null, '13', '1590818835219', 'SOS', '64', 'YM01', '2020-05-26/91b543c5-07f7-4a37-a3e4-b71d4961fbfd_YM01.jpg', '1', '1', null);
INSERT INTO `PointUserinfo` VALUES ('877', '10', null, '1', null, null, '', '80', '三号点', '73932', '雪梅', null, null, '13', '1590818849042', 'sos', '64', 'YM01', '2020-05-26/91b543c5-07f7-4a37-a3e4-b71d4961fbfd_YM01.jpg', '1', '1', null);
INSERT INTO `PointUserinfo` VALUES ('878', '10', null, '1', null, null, '', '81', '四号点', '73931', 'AIA?Carolineʚ?ྀིɞ', null, null, '13', '1590819149453', 'C', '68', '', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('879', '0', null, '0', null, null, '', '81', '四号点', '73932', '雪梅', null, null, '13', '1590819162401', '', '68', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('880', '10', null, '1', null, null, '2020-05-30/tmp_944102450cb736bdadc7474bac81f3b7715c4cf0ab306e66.jpg', '84', '七号点', '73926', 'James 開', null, null, '13', '1590819196640', '', '70', 'YM02', '2020-05-26/5bac7338-ace7-429c-9c00-a2db871ff5e7_YM02.jpg', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('881', '10', null, '1', null, null, '2020-05-30/tmp_4e5f2e1b094841d4ad128be4c2f06209.jpg', '84', '七号点', '73929', '小十', null, null, '13', '1590819199457', '', '70', 'YM02', '2020-05-26/5bac7338-ace7-429c-9c00-a2db871ff5e7_YM02.jpg', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('882', '0', null, '0', null, null, '', '78', '一号点', '73928', '王启勇', null, null, '13', '1590819260988', '', '62', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('883', '10', null, '1', null, null, '', '82', '五号点', '73931', 'AIA?Carolineʚ?ྀིɞ', null, null, '13', '1590819407969', '', '67', 'YM03', '2020-05-26/34c7344c-b20f-41e4-87d4-86ea78f57e66_YM03.jpg', '1', '1', null);
INSERT INTO `PointUserinfo` VALUES ('884', '10', null, '1', null, null, '2020-05-30/tmp_8da6ac59e5614dc260937719ab377598.jpg', '87', '十号点', '73933', '石嘉林', null, null, '13', '1590819475489', '', '65', '', '2020-05-26/75ce5db0-15e0-4a17-b8db-92d6f5d94902_slice_0_0.jpg', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('885', '10', null, '1', null, null, '', '85', '八号点', '73929', '小十', null, null, '13', '1590819498386', '', '72', 'YM05', '2020-05-26/5266ccb6-53c8-4f15-bac7-5af3761ab919_YM05.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('886', '10', null, '1', null, null, '2020-05-30/tmp_fe86da82f003244faf70a84cd9e0ef9f7f90d2135f69da3b.jpg', '87', '十号点', '73930', '郭允', null, null, '13', '1590819501590', '', '65', '', '2020-05-26/75ce5db0-15e0-4a17-b8db-92d6f5d94902_slice_0_0.jpg', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('887', '10', null, '1', null, null, '', '82', '五号点', '73932', '雪梅', null, null, '13', '1590819510204', 'DBCAE', '67', 'YM03', '2020-05-26/34c7344c-b20f-41e4-87d4-86ea78f57e66_YM03.jpg', '1', '2', null);
INSERT INTO `PointUserinfo` VALUES ('888', '10', null, '1', null, null, '', '85', '八号点', '73926', 'James 開', null, null, '13', '1590819564056', 'D', '72', 'YM05', '2020-05-26/5266ccb6-53c8-4f15-bac7-5af3761ab919_YM05.jpg', '1', '1', null);
INSERT INTO `PointUserinfo` VALUES ('889', '0', null, '0', null, null, '', '86', '九号点', '73929', '小十', null, null, '13', '1590819991415', '', '71', '答案错误', '', '1', '1', null);
INSERT INTO `PointUserinfo` VALUES ('890', '10', null, '1', null, null, '', '86', '九号点', '73933', '石嘉林', null, null, '13', '1590820017284', '13米', '71', 'YM06', '2020-05-26/94eb9b04-0684-47c8-af41-b6fbf96f9c39_YM06.jpg', '1', '2', null);
INSERT INTO `PointUserinfo` VALUES ('891', '0', null, '0', null, null, '', '83', '六号点', '73931', 'AIA?Carolineʚ?ྀིɞ', null, null, '13', '1590820026944', '', '69', '答案错误', '', '1', '1', null);
INSERT INTO `PointUserinfo` VALUES ('892', '10', null, '1', null, null, '', '86', '九号点', '73926', 'James 開', null, null, '13', '1590820136309', '13米', '71', 'YM06', '2020-05-26/94eb9b04-0684-47c8-af41-b6fbf96f9c39_YM06.jpg', '1', '2', null);
INSERT INTO `PointUserinfo` VALUES ('893', '10', null, '1', null, null, '', '85', '八号点', '73931', 'AIA?Carolineʚ?ྀིɞ', null, null, '13', '1590820157950', 'D', '72', 'YM05', '2020-05-26/5266ccb6-53c8-4f15-bac7-5af3761ab919_YM05.jpg', '1', '1', null);
INSERT INTO `PointUserinfo` VALUES ('894', '0', null, '0', null, null, '', '85', '八号点', '73932', '雪梅', null, null, '13', '1590820198103', '', '72', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('895', '10', null, '1', null, null, '2020-05-30/tmp_09a0418f6bbba4ecc0b7134e5dc021355e64ba826eaafe59.jpg', '79', '二号点', '73920', '小白杨', null, null, '13', '1590820237588', '', '63', '', '2020-05-25/70313be5-b27f-4fa4-a4eb-8617ee0c333f_slice_1_1.jpg', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('896', '0', null, '0', null, null, '', '85', '八号点', '73933', '石嘉林', null, null, '13', '1590820263961', '', '72', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('897', '10', null, '1', null, null, '2020-05-30/tmp_0d75c87e9a85638d9fcc426bd770759d.jpg', '84', '七号点', '73931', 'AIA?Carolineʚ?ྀིɞ', null, null, '13', '1590820272093', '', '70', 'YM02', '2020-05-26/5bac7338-ace7-429c-9c00-a2db871ff5e7_YM02.jpg', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('898', '10', null, '1', null, null, '2020-05-30/tmp_e69166328d018d2b7c0e3e166e680aad.jpg', '84', '七号点', '73932', '雪梅', null, null, '13', '1590820337432', '', '70', 'YM02', '2020-05-26/5bac7338-ace7-429c-9c00-a2db871ff5e7_YM02.jpg', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('899', '10', null, '1', null, null, '2020-05-30/tmp_e610ef98d22d3af5a10358b38df898490277466e8bd61d03.jpg', '84', '七号点', '73930', '郭允', null, null, '13', '1590820473447', '', '70', 'YM02', '2020-05-26/5bac7338-ace7-429c-9c00-a2db871ff5e7_YM02.jpg', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('900', '10', null, '1', null, null, '2020-05-30/tmp_ca53635a05d5044663ab6c6a64db5268.jpg', '84', '七号点', '73933', '石嘉林', null, null, '13', '1590820485105', '', '70', 'YM02', '2020-05-26/5bac7338-ace7-429c-9c00-a2db871ff5e7_YM02.jpg', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('901', '10', null, '1', null, null, '2020-05-30/tmp_e390f00649811ba004ebfe76a05f1300.jpg', '87', '十号点', '73931', 'AIA?Carolineʚ?ྀིɞ', null, null, '13', '1590820564949', '', '65', '', '2020-05-26/75ce5db0-15e0-4a17-b8db-92d6f5d94902_slice_0_0.jpg', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('902', '10', null, '1', null, null, '2020-05-30/tmp_e9a09d77f96e4d786fa75025123376a2.jpg', '87', '十号点', '73932', '雪梅', null, null, '13', '1590820607565', '', '65', '', '2020-05-26/75ce5db0-15e0-4a17-b8db-92d6f5d94902_slice_0_0.jpg', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('903', '0', null, '0', null, null, '', '112', 'cp12', '73924', 'Samuel ', null, null, '14', '1590820776122', '', '85', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('904', '10', null, '1', null, null, '', '112', 'cp12', '73935', '肖宇', null, null, '14', '1590820845815', '否', '85', 'A04', '2020-05-28/a3277489-86e7-4fb9-b285-6f51390f5df4_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('905', '10', null, '1', null, null, '', '82', '五号点', '73920', '小白杨', null, null, '13', '1590820866419', 'DBCAE', '67', 'YM03', '2020-05-26/34c7344c-b20f-41e4-87d4-86ea78f57e66_YM03.jpg', '1', '2', null);
INSERT INTO `PointUserinfo` VALUES ('906', '10', null, '1', null, null, '', '112', 'cp12', '73925', '苗苗', null, null, '14', '1590820902134', '否', '85', 'A04', '2020-05-28/a3277489-86e7-4fb9-b285-6f51390f5df4_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('907', '10', null, '1', null, null, '', '86', '九号点', '73931', 'AIA?Carolineʚ?ྀིɞ', null, null, '13', '1590820986469', '', '71', 'YM06', '2020-05-26/94eb9b04-0684-47c8-af41-b6fbf96f9c39_YM06.jpg', '1', '1', null);
INSERT INTO `PointUserinfo` VALUES ('908', '10', null, '1', null, null, '', '86', '九号点', '73932', '雪梅', null, null, '13', '1590821107730', '13米', '71', 'YM06', '2020-05-26/94eb9b04-0684-47c8-af41-b6fbf96f9c39_YM06.jpg', '1', '2', null);
INSERT INTO `PointUserinfo` VALUES ('909', '10', null, '1', null, null, '', '81', '四号点', '73920', '小白杨', null, null, '13', '1590821285569', 'C', '68', '', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('910', '0', null, '0', null, null, '', '105', 'cp6', '73935', '肖宇', null, null, '14', '1590821328193', '', '78', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('911', '10', null, '1', null, null, '2020-05-30/tmp_7a3447177eaafe78bcc9f6e9803e5aa4.jpg', '79', '二号点', '73931', 'AIA?Carolineʚ?ྀིɞ', null, null, '13', '1590821359028', '', '63', '', '2020-05-25/70313be5-b27f-4fa4-a4eb-8617ee0c333f_slice_1_1.jpg', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('912', '10', null, '1', null, null, '', '101', 'cp2', '73924', 'Samuel ', null, null, '14', '1590821418069', '挺水植物', '78', 'A01', '2020-05-28/eeb09651-57e4-406c-86c9-1e62943b3fa6_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('913', '10', null, '1', null, null, '2020-05-30/tmp_fa1953ebf1a7d0afedf8435b39bbb094.jpg', '79', '二号点', '73932', '雪梅', null, null, '13', '1590821455430', '', '63', '', '2020-05-25/70313be5-b27f-4fa4-a4eb-8617ee0c333f_slice_1_1.jpg', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('914', '10', null, '1', null, null, '', '105', 'cp6', '73925', '苗苗', null, null, '14', '1590821473222', '挺水植物', '78', 'A01', '2020-05-28/eeb09651-57e4-406c-86c9-1e62943b3fa6_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('915', '0', null, '0', null, null, '', '86', '九号点', '73920', '小白杨', null, null, '13', '1590821477645', '', '71', '答案错误', '', '1', '2', null);
INSERT INTO `PointUserinfo` VALUES ('916', '10', null, '1', null, null, '', '85', '八号点', '73920', '小白杨', null, null, '13', '1590821548790', 'D', '72', 'YM05', '2020-05-26/5266ccb6-53c8-4f15-bac7-5af3761ab919_YM05.jpg', '1', '1', null);
INSERT INTO `PointUserinfo` VALUES ('917', '10', null, '1', null, null, '', '104', 'cp5', '73935', '肖宇', null, null, '14', '1590821884035', 'C', '77', '', '2020-05-28/e8b3572f-5545-4b99-9b70-a1e49fb026a7_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('918', '0', null, '0', null, null, '', '104', 'cp5', '73925', '苗苗', null, null, '14', '1590821957072', '', '77', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('919', '10', null, '1', null, null, '', '78', '一号点', '73920', '小白杨', null, null, '13', '1590822221229', '行歌荒野中', '62', 'YM04', '2020-05-26/c7bfe905-f7e2-4285-8343-3e79dc44a35a_YM04.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('920', '0', null, '0', null, null, '', '103', 'cp4', '73935', '肖宇', null, null, '14', '1590822302677', '', '76', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('921', '0', null, '0', null, null, '', '102', 'cp3', '73935', '肖宇', null, null, '14', '1590822787567', '', '75', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('922', '0', null, '0', null, null, '', '119', 'cp20', '73935', '肖宇', null, null, '14', '1590824355587', '', '93', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('923', '10', null, '1', null, null, '', '101', 'cp2', '73935', '肖宇', null, null, '14', '1590824437069', 'B', '74', 'A01', '2020-05-28/9f1a26ca-c095-4bef-b6c8-4876c69a9634_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('924', '0', null, '0', null, null, '', '100', 'cp1', '73935', '肖宇', null, null, '14', '1590824564115', '', '73', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('925', '10', null, '1', null, null, '2020-05-30/tmp_f7fcc38d88a2d5d4cbb116d54d02e24b6489fe5117c20c31.jpg', '87', '十号点', '73830', '法治（龙马）', null, null, '13', '1590826776114', '', '65', '', '2020-05-26/75ce5db0-15e0-4a17-b8db-92d6f5d94902_slice_0_0.jpg', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('926', '0', null, '0', null, null, '', '103', 'cp4', '73937', '稻稻', null, null, '14', '1590826908021', '', '76', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('927', '10', null, '1', null, null, '', '102', 'cp3', '73874', '?温柔的刘鑫?', null, null, '14', '1590830371363', 'A', '75', '', '2020-05-28/85ea01c4-3c88-4d15-a740-bdc8001df224_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('928', '0', null, '0', null, null, '', '106', 'cp7', '73939', 'Hannah', null, null, '14', '1590832640553', '', '79', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('929', '10', null, '1', null, null, '', '106', 'cp7', '73938', 'Angelina', null, null, '14', '1590832675510', '钟形', '79', '', '2020-05-28/ea0fd11e-0e04-403f-9450-c91b3bda7ac4_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('930', '0', null, '0', null, null, '', '107', 'cp8', '73939', 'Hannah', null, null, '14', '1590833247764', '', '80', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('931', '10', null, '1', null, null, '', '107', 'cp8', '73938', 'Angelina', null, null, '14', '1590833613542', '果', '80', 'A05', '2020-05-28/30b9cefb-f8c0-42ac-bf05-1cd89d101082_slice_1_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('932', '0', null, '0', null, null, '', '108', 'cp9', '73938', 'Angelina', null, null, '14', '1590834100444', '', '81', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('933', '0', null, '0', null, null, '', '108', 'cp9', '73939', 'Hannah', null, null, '14', '1590834101274', '', '81', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('934', '10', null, '1', null, null, '', '109', 'cp10', '73938', 'Angelina', null, null, '14', '1590834679824', '黄花菜', '82', 'A02', '2020-05-28/d284c16c-eeb0-421f-876a-e6bd395507a5_slice_0_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('935', '0', null, '0', null, null, '', '109', 'cp10', '73939', 'Hannah', null, null, '14', '1590834693979', '', '82', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('936', '0', null, '0', null, null, '', '110', 'cp11', '73938', 'Angelina', null, null, '14', '1590835738392', '', '83', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('937', '10', null, '1', null, null, '', '110', 'cp11', '73939', 'Hannah', null, null, '14', '1590835750411', '两针一束', '83', '', '2020-05-28/c730a0e5-647b-4065-a7f6-e521ee1e70c5_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('938', '10', null, '1', null, null, '', '112', 'cp12', '73939', 'Hannah', null, null, '14', '1590836030026', '否', '85', 'A04', '2020-05-28/a3277489-86e7-4fb9-b285-6f51390f5df4_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('939', '10', null, '1', null, null, '', '112', 'cp12', '73938', 'Angelina', null, null, '14', '1590836061080', '否', '85', 'A04', '2020-05-28/a3277489-86e7-4fb9-b285-6f51390f5df4_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('940', '10', null, '1', null, null, '', '111', 'cp13', '73938', 'Angelina', null, null, '14', '1590836978726', '卵圆形', '86', '', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('941', '10', null, '1', null, null, '', '111', 'cp13', '73939', 'Hannah', null, null, '14', '1590836999179', '卵圆形', '86', '', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('942', '0', null, '0', null, null, '', '113', 'cp14', '73938', 'Angelina', null, null, '14', '1590837792083', '', '87', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('943', '10', null, '1', null, null, '', '113', 'cp14', '73939', 'Hannah', null, null, '14', '1590837802819', '有', '87', 'A04', '2020-05-28/b722c622-4223-4672-b01a-d7ac837e5164_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('944', '0', null, '0', null, null, '', '114', 'cp15', '73938', 'Angelina', null, null, '14', '1590838252622', '', '88', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('945', '10', null, '1', null, null, '', '114', 'cp15', '73939', 'Hannah', null, null, '14', '1590838296373', 'B', '88', '', '2020-05-28/3bf704b8-86d3-40e0-b4c2-9f8a3317bc1e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('946', '10', null, '1', null, null, '', '115', 'cp16', '73938', 'Angelina', null, null, '14', '1590838479869', 'C', '89', 'A02', '2020-05-28/b15f6730-6c9e-4785-93cf-12e1249d4056_slice_0_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('947', '0', null, '0', null, null, '', '116', 'cp17', '73938', 'Angelina', null, null, '14', '1590838805607', '', '90', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('948', '0', null, '0', null, null, '', '104', 'cp5', '73938', 'Angelina', null, null, '14', '1590839045983', '', '77', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('949', '10', null, '1', null, null, '', '119', 'cp20', '73940', 'Tracy', null, null, '14', '1590890101581', 'B', '93', '', '2020-05-28/a257c3c4-9ba2-4406-9e5c-ac62c6dd5b2e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('950', '10', null, '1', null, null, '', '100', 'cp1', '73940', 'Tracy', null, null, '14', '1590890214242', '是', '73', '', '2020-05-28/e2ae7706-9dcd-4596-9a88-ccf5ce4c856e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('951', '10', null, '1', null, null, '', '101', 'cp2', '73940', 'Tracy', null, null, '14', '1590890569432', 'B', '74', 'A01', '2020-05-28/9f1a26ca-c095-4bef-b6c8-4876c69a9634_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('952', '10', null, '1', null, null, '', '102', 'cp3', '73940', 'Tracy', null, null, '14', '1590891035577', 'A', '75', '', '2020-05-28/85ea01c4-3c88-4d15-a740-bdc8001df224_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('953', '0', null, '0', null, null, '', '111', 'cp13', '73863', '情绪，认知-代松', null, null, '14', '1590891343007', '', '86', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('954', '10', null, '1', null, null, '', '103', 'cp4', '73940', 'Tracy', null, null, '14', '1590891566195', 'A', '76', 'A05', '2020-05-28/c68e5a0a-ac03-4792-8bf4-e8cf7eff680b_slice_1_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('955', '10', null, '1', null, null, '', '104', 'cp5', '73940', 'Tracy', null, null, '14', '1590891810396', 'C', '77', '', '2020-05-28/e8b3572f-5545-4b99-9b70-a1e49fb026a7_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('956', '10', null, '1', null, null, '', '105', 'cp6', '73940', 'Tracy', null, null, '14', '1590892393348', '挺水植物', '78', 'A01', '2020-05-28/eeb09651-57e4-406c-86c9-1e62943b3fa6_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('957', '0', null, '0', null, null, '', '106', 'cp7', '73940', 'Tracy', null, null, '14', '1590894392077', '', '79', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('958', '10', null, '1', null, null, '', '112', 'cp12', '73863', '情绪，认知-代松', null, null, '14', '1590895800459', '否', '85', 'A04', '2020-05-28/a3277489-86e7-4fb9-b285-6f51390f5df4_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('959', '0', null, '0', null, null, '', '107', 'cp8', '73940', 'Tracy', null, null, '14', '1590895806432', '', '80', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('960', '10', null, '1', null, null, '', '100', 'cp1', '73832', 'HH', null, null, '14', '1590896521757', '是', '73', '', '2020-05-28/e2ae7706-9dcd-4596-9a88-ccf5ce4c856e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('961', '10', null, '1', null, null, '', '108', 'cp9', '73940', 'Tracy', null, null, '14', '1590896611782', 'D', '81', '', '2020-05-28/42a6c012-30eb-402d-874f-c26e63d6d06d_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('962', '10', null, '1', null, null, '', '113', 'cp14', '73863', '情绪，认知-代松', null, null, '14', '1590896630036', '有', '87', 'A04', '2020-05-28/b722c622-4223-4672-b01a-d7ac837e5164_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('963', '0', null, '0', null, null, '', '109', 'cp10', '73940', 'Tracy', null, null, '14', '1590897000117', '', '82', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('964', '10', null, '1', null, null, '', '119', 'cp20', '73832', 'HH', null, null, '14', '1590897142901', 'B', '93', '', '2020-05-28/a257c3c4-9ba2-4406-9e5c-ac62c6dd5b2e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('965', '10', null, '1', null, null, '', '114', 'cp15', '73863', '情绪，认知-代松', null, null, '14', '1590897213127', 'B', '88', '', '2020-05-28/3bf704b8-86d3-40e0-b4c2-9f8a3317bc1e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('966', '10', null, '1', null, null, '', '115', 'cp16', '73863', '情绪，认知-代松', null, null, '14', '1590897396287', 'C', '89', 'A02', '2020-05-28/b15f6730-6c9e-4785-93cf-12e1249d4056_slice_0_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('967', '10', null, '1', null, null, '', '101', 'cp2', '73832', 'HH', null, null, '14', '1590897673500', 'B', '74', 'A01', '2020-05-28/9f1a26ca-c095-4bef-b6c8-4876c69a9634_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('968', '10', null, '1', null, null, '', '110', 'cp11', '73940', 'Tracy', null, null, '14', '1590897975141', '2', '83', '', '2020-05-28/c730a0e5-647b-4065-a7f6-e521ee1e70c5_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('969', '0', null, '0', null, null, '', '116', 'cp17', '73863', '情绪，认知-代松', null, null, '14', '1590897987364', '', '90', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('970', '10', null, '1', null, null, '', '102', 'cp3', '73832', 'HH', null, null, '14', '1590898017060', 'A', '75', '', '2020-05-28/85ea01c4-3c88-4d15-a740-bdc8001df224_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('971', '0', null, '0', null, null, '', '111', 'cp13', '73940', 'Tracy', null, null, '14', '1590898262494', '', '86', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('972', '10', null, '1', null, null, '', '103', 'cp4', '73832', 'HH', null, null, '14', '1590898497891', 'A', '76', 'A05', '2020-05-28/c68e5a0a-ac03-4792-8bf4-e8cf7eff680b_slice_1_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('973', '0', null, '0', null, null, '', '117', 'cp18', '73863', '情绪，认知-代松', null, null, '14', '1590898570373', '', '91', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('974', '10', null, '1', null, null, '', '118', 'cp19', '73863', '情绪，认知-代松', null, null, '14', '1590898773418', '', '92', 'A06', '2020-05-28/41306da9-16b2-49ea-887a-2541f3ee1af8_slice_1_2.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('975', '0', null, '0', null, null, '', '104', 'cp5', '73832', 'HH', null, null, '14', '1590898923658', '', '77', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('976', '10', null, '1', null, null, '', '119', 'cp20', '73863', '情绪，认知-代松', null, null, '14', '1590899236035', 'B', '93', '', '2020-05-28/a257c3c4-9ba2-4406-9e5c-ac62c6dd5b2e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('977', '10', null, '1', null, null, '', '105', 'cp6', '73832', 'HH', null, null, '14', '1590899315912', '挺水植物', '78', 'A01', '2020-05-28/eeb09651-57e4-406c-86c9-1e62943b3fa6_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('978', '0', null, '0', null, null, '', '106', 'cp7', '73832', 'HH', null, null, '14', '1590899647360', '', '79', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('979', '0', null, '0', null, null, '', '107', 'cp8', '73832', 'HH', null, null, '14', '1590900244196', '', '80', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('980', '10', null, '1', null, null, '', '108', 'cp9', '73832', 'HH', null, null, '14', '1590900817327', '花瓣', '81', '', '2020-05-28/42a6c012-30eb-402d-874f-c26e63d6d06d_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('981', '10', null, '1', null, null, '', '109', 'cp10', '73832', 'HH', null, null, '14', '1590901073264', '黄花菜', '82', 'A02', '2020-05-28/d284c16c-eeb0-421f-876a-e6bd395507a5_slice_0_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('982', '10', null, '1', null, null, '', '110', 'cp11', '73832', 'HH', null, null, '14', '1590901829814', '两针一束', '83', '', '2020-05-28/c730a0e5-647b-4065-a7f6-e521ee1e70c5_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('983', '10', null, '1', null, null, '', '113', 'cp14', '73832', 'HH', null, null, '14', '1590903596403', '有', '87', 'A04', '2020-05-28/b722c622-4223-4672-b01a-d7ac837e5164_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('984', '10', null, '1', null, null, '', '100', 'cp1', '73943', '冯', null, null, '14', '1590904419170', '是', '73', '', '2020-05-28/e2ae7706-9dcd-4596-9a88-ccf5ce4c856e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('985', '10', null, '1', null, null, '', '101', 'cp2', '73943', '冯', null, null, '14', '1590904801983', 'B', '74', 'A01', '2020-05-28/9f1a26ca-c095-4bef-b6c8-4876c69a9634_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('986', '0', null, '0', null, null, '', '102', 'cp3', '73943', '冯', null, null, '14', '1590905370073', '', '75', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('987', '10', null, '1', null, null, '', '103', 'cp4', '73943', '冯', null, null, '14', '1590906098012', 'A', '76', 'A05', '2020-05-28/c68e5a0a-ac03-4792-8bf4-e8cf7eff680b_slice_1_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('988', '10', null, '1', null, null, '', '118', 'cp19', '73832', 'HH', null, null, '14', '1590906329407', '', '92', 'A06', '2020-05-28/41306da9-16b2-49ea-887a-2541f3ee1af8_slice_1_2.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('989', '0', null, '0', null, null, '', '104', 'cp5', '73943', '冯', null, null, '14', '1590906426856', '', '77', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('990', '0', null, '0', null, null, '', '105', 'cp6', '73943', '冯', null, null, '14', '1590906726728', '', '78', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('991', '0', null, '0', null, null, '', '117', 'cp18', '73832', 'HH', null, null, '14', '1590906758859', '', '91', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('992', '0', null, '0', null, null, '', '106', 'cp7', '73943', '冯', null, null, '14', '1590907185268', '', '79', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('993', '10', null, '1', null, null, '', '107', 'cp8', '73943', '冯', null, null, '14', '1590907990510', '果序', '80', 'A05', '2020-05-28/30b9cefb-f8c0-42ac-bf05-1cd89d101082_slice_1_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('994', '0', null, '0', null, null, '', '108', 'cp9', '73943', '冯', null, null, '14', '1590908450825', '', '81', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('995', '10', null, '1', null, null, '', '109', 'cp10', '73943', '冯', null, null, '14', '1590908732002', '黄花菜', '82', 'A02', '2020-05-28/d284c16c-eeb0-421f-876a-e6bd395507a5_slice_0_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('996', '10', null, '1', null, null, '', '110', 'cp11', '73943', '冯', null, null, '14', '1590909338022', '2', '83', '', '2020-05-28/c730a0e5-647b-4065-a7f6-e521ee1e70c5_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('997', '10', null, '1', null, null, '', '111', 'cp13', '73943', '冯', null, null, '14', '1590910150362', '卵圆形', '86', '', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('998', '10', null, '1', null, null, '', '112', 'cp12', '73943', '冯', null, null, '14', '1590910488490', '否', '85', 'A04', '2020-05-28/a3277489-86e7-4fb9-b285-6f51390f5df4_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('999', '10', null, '1', null, null, '', '113', 'cp14', '73943', '冯', null, null, '14', '1590911295642', '有', '87', 'A04', '2020-05-28/b722c622-4223-4672-b01a-d7ac837e5164_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1000', '0', null, '0', null, null, '', '114', 'cp15', '73943', '冯', null, null, '14', '1590911606963', '', '88', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1001', '0', null, '0', null, null, '', '115', 'cp16', '73943', '冯', null, null, '14', '1590911905048', '', '89', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1002', '0', null, '0', null, null, '', '116', 'cp17', '73943', '冯', null, null, '14', '1590912395555', '', '90', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1003', '10', null, '1', null, null, '', '101', 'cp2', '73870', 'Mary', null, null, '14', '1590912513939', 'B', '74', 'A01', '2020-05-28/9f1a26ca-c095-4bef-b6c8-4876c69a9634_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1004', '10', null, '1', null, null, '', '101', 'cp2', '73865', '奉新明～中信保诚', null, null, '14', '1590912519738', 'B', '74', 'A01', '2020-05-28/9f1a26ca-c095-4bef-b6c8-4876c69a9634_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1005', '10', null, '1', null, null, '', '100', 'cp1', '73944', '刘嬿', null, null, '14', '1590912609703', '是', '73', '', '2020-05-28/e2ae7706-9dcd-4596-9a88-ccf5ce4c856e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1006', '0', null, '0', null, null, '', '119', 'cp20', '73944', '刘嬿', null, null, '14', '1590912799213', '', '93', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1007', '10', null, '1', null, null, '', '102', 'cp3', '73870', 'Mary', null, null, '14', '1590912880294', 'A', '75', '', '2020-05-28/85ea01c4-3c88-4d15-a740-bdc8001df224_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1008', '10', null, '1', null, null, '', '102', 'cp3', '73865', '奉新明～中信保诚', null, null, '14', '1590912882343', 'A', '75', '', '2020-05-28/85ea01c4-3c88-4d15-a740-bdc8001df224_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1009', '0', null, '0', null, null, '', '117', 'cp18', '73943', '冯', null, null, '14', '1590913079358', '', '91', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1010', '10', null, '1', null, null, '', '101', 'cp2', '73944', '刘嬿', null, null, '14', '1590913133273', 'B', '74', 'A01', '2020-05-28/9f1a26ca-c095-4bef-b6c8-4876c69a9634_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1011', '10', null, '1', null, null, '', '103', 'cp4', '73865', '奉新明～中信保诚', null, null, '14', '1590913347201', 'A', '76', 'A05', '2020-05-28/c68e5a0a-ac03-4792-8bf4-e8cf7eff680b_slice_1_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1012', '10', null, '1', null, null, '', '103', 'cp4', '73870', 'Mary', null, null, '14', '1590913349477', 'A', '76', 'A05', '2020-05-28/c68e5a0a-ac03-4792-8bf4-e8cf7eff680b_slice_1_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1013', '10', null, '1', null, null, '', '118', 'cp19', '73943', '冯', null, null, '14', '1590913424200', '', '92', 'A06', '2020-05-28/41306da9-16b2-49ea-887a-2541f3ee1af8_slice_1_2.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1014', '0', null, '0', null, null, '', '100', 'cp1', '73938', 'Angelina', null, null, '14', '1590913434983', '', '73', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1015', '10', null, '1', null, null, '', '118', 'cp19', '73944', '刘嬿', null, null, '14', '1590913563248', '', '92', 'A06', '2020-05-28/41306da9-16b2-49ea-887a-2541f3ee1af8_slice_1_2.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1016', '10', null, '1', null, null, '', '104', 'cp5', '73870', 'Mary', null, null, '14', '1590913620317', 'C', '77', '', '2020-05-28/e8b3572f-5545-4b99-9b70-a1e49fb026a7_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1017', '10', null, '1', null, null, '', '119', 'cp20', '73943', '冯', null, null, '14', '1590913691286', 'B', '93', '', '2020-05-28/a257c3c4-9ba2-4406-9e5c-ac62c6dd5b2e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1018', '0', null, '0', null, null, '', '117', 'cp18', '73944', '刘嬿', null, null, '14', '1590913718417', '', '91', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1019', '0', null, '0', null, null, '', '101', 'cp2', '73938', 'Angelina', null, null, '14', '1590913725960', '', '74', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1020', '10', null, '1', null, null, '', '105', 'cp6', '73870', 'Mary', null, null, '14', '1590913812512', '挺水植物', '78', 'A01', '2020-05-28/eeb09651-57e4-406c-86c9-1e62943b3fa6_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1021', '10', null, '1', null, null, '', '106', 'cp7', '73870', 'Mary', null, null, '14', '1590914076217', '钟形', '79', '', '2020-05-28/ea0fd11e-0e04-403f-9450-c91b3bda7ac4_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1022', '10', null, '1', null, null, '', '116', 'cp17', '73944', '刘嬿', null, null, '14', '1590914205983', 'B', '90', '', '2020-05-28/29607a89-697b-4bd2-bfaa-2617c02c5688_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1023', '10', null, '1', null, null, '', '107', 'cp8', '73870', 'Mary', null, null, '14', '1590914413473', '果序', '80', 'A05', '2020-05-28/30b9cefb-f8c0-42ac-bf05-1cd89d101082_slice_1_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1024', '0', null, '0', null, null, '', '102', 'cp3', '73938', 'Angelina', null, null, '14', '1590914464328', '', '75', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1025', '0', null, '0', null, null, '', '115', 'cp16', '73944', '刘嬿', null, null, '14', '1590914477857', '', '89', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1026', '10', null, '1', null, null, '', '114', 'cp15', '73944', '刘嬿', null, null, '14', '1590914767464', 'B', '88', '', '2020-05-28/3bf704b8-86d3-40e0-b4c2-9f8a3317bc1e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1027', '0', null, '0', null, null, '', '103', 'cp4', '73938', 'Angelina', null, null, '14', '1590914881533', '', '76', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1028', '0', null, '0', null, null, '', '108', 'cp9', '73870', 'Mary', null, null, '14', '1590914991185', '', '81', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1029', '0', null, '0', null, null, '', '109', 'cp10', '73870', 'Mary', null, null, '14', '1590915185359', '', '82', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1030', '10', null, '1', null, null, '', '113', 'cp14', '73944', '刘嬿', null, null, '14', '1590915196474', '有', '87', 'A04', '2020-05-28/b722c622-4223-4672-b01a-d7ac837e5164_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1031', '10', null, '1', null, null, '', '105', 'cp6', '73938', 'Angelina', null, null, '14', '1590915377013', '挺水植物', '78', 'A01', '2020-05-28/eeb09651-57e4-406c-86c9-1e62943b3fa6_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1032', '10', null, '1', null, null, '', '110', 'cp11', '73870', 'Mary', null, null, '14', '1590915465360', '两针', '83', '', '2020-05-28/c730a0e5-647b-4065-a7f6-e521ee1e70c5_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1033', '10', null, '1', null, null, '', '111', 'cp13', '73870', 'Mary', null, null, '14', '1590915789116', '卵圆形', '86', '', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1034', '10', null, '1', null, null, '', '112', 'cp12', '73870', 'Mary', null, null, '14', '1590916024144', '否', '85', 'A04', '2020-05-28/a3277489-86e7-4fb9-b285-6f51390f5df4_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1035', '0', null, '0', null, null, '', '117', 'cp18', '73938', 'Angelina', null, null, '14', '1590916173047', '', '91', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1036', '0', null, '0', null, null, '', '111', 'cp13', '73944', '刘嬿', null, null, '14', '1590916177714', '', '86', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1037', '10', null, '1', null, null, '', '118', 'cp19', '73938', 'Angelina', null, null, '14', '1590916399004', '', '92', 'A06', '2020-05-28/41306da9-16b2-49ea-887a-2541f3ee1af8_slice_1_2.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1038', '10', null, '1', null, null, '', '119', 'cp20', '73938', 'Angelina', null, null, '14', '1590916565928', 'B', '93', '', '2020-05-28/a257c3c4-9ba2-4406-9e5c-ac62c6dd5b2e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1039', '0', null, '0', null, null, '', '113', 'cp14', '73870', 'Mary', null, null, '14', '1590916717347', '', '87', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1040', '10', null, '1', null, null, '', '112', 'cp12', '73944', '刘嬿', null, null, '14', '1590917029261', '否', '85', 'A04', '2020-05-28/a3277489-86e7-4fb9-b285-6f51390f5df4_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1041', '10', null, '1', null, null, '', '114', 'cp15', '73870', 'Mary', null, null, '14', '1590917426954', 'B', '88', '', '2020-05-28/3bf704b8-86d3-40e0-b4c2-9f8a3317bc1e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1042', '10', null, '1', null, null, '', '110', 'cp11', '73944', '刘嬿', null, null, '14', '1590917555899', '2', '83', '', '2020-05-28/c730a0e5-647b-4065-a7f6-e521ee1e70c5_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1043', '0', null, '0', null, null, '', '115', 'cp16', '73870', 'Mary', null, null, '14', '1590917598640', '', '89', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1044', '10', null, '1', null, null, '', '109', 'cp10', '73944', '刘嬿', null, null, '14', '1590917911001', '黄花菜', '82', 'A02', '2020-05-28/d284c16c-eeb0-421f-876a-e6bd395507a5_slice_0_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1045', '10', null, '1', null, null, '', '116', 'cp17', '73860', '天恩', null, null, '14', '1590918055935', 'B', '90', '', '2020-05-28/29607a89-697b-4bd2-bfaa-2617c02c5688_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1046', '10', null, '1', null, null, '', '116', 'cp17', '73870', 'Mary', null, null, '14', '1590918060307', 'B', '90', '', '2020-05-28/29607a89-697b-4bd2-bfaa-2617c02c5688_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1047', '0', null, '0', null, null, '', '108', 'cp9', '73944', '刘嬿', null, null, '14', '1590918203029', '', '81', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1048', '10', null, '1', null, null, '', '107', 'cp8', '73944', '刘嬿', null, null, '14', '1590918732136', '果序', '80', 'A05', '2020-05-28/30b9cefb-f8c0-42ac-bf05-1cd89d101082_slice_1_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1049', '10', null, '1', null, null, '', '117', 'cp18', '73860', '天恩', null, null, '14', '1590919176469', '聚伞花序', '91', 'A03', '2020-05-28/2fa8a38a-6b4b-4e85-a825-348e0b8f4935_slice_0_2.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1050', '0', null, '0', null, null, '', '106', 'cp7', '73944', '刘嬿', null, null, '14', '1590919179619', '', '79', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1051', '10', null, '1', null, null, '', '117', 'cp18', '73870', 'Mary', null, null, '14', '1590919190895', '聚伞花序', '91', 'A03', '2020-05-28/2fa8a38a-6b4b-4e85-a825-348e0b8f4935_slice_0_2.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1052', '10', null, '1', null, null, '', '118', 'cp19', '73860', '天恩', null, null, '14', '1590919304424', '', '92', 'A06', '2020-05-28/41306da9-16b2-49ea-887a-2541f3ee1af8_slice_1_2.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1053', '10', null, '1', null, null, '', '118', 'cp19', '73870', 'Mary', null, null, '14', '1590919311019', '', '92', 'A06', '2020-05-28/41306da9-16b2-49ea-887a-2541f3ee1af8_slice_1_2.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1054', '10', null, '1', null, null, '', '119', 'cp20', '73860', '天恩', null, null, '14', '1590919476825', 'b', '93', '', '2020-05-28/a257c3c4-9ba2-4406-9e5c-ac62c6dd5b2e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1055', '10', null, '1', null, null, '', '119', 'cp20', '73870', 'Mary', null, null, '14', '1590919485524', 'B', '93', '', '2020-05-28/a257c3c4-9ba2-4406-9e5c-ac62c6dd5b2e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1056', '0', null, '0', null, null, '', '100', 'cp1', '73860', '天恩', null, null, '14', '1590919604665', '', '73', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1057', '10', null, '1', null, null, '', '100', 'cp1', '73870', 'Mary', null, null, '14', '1590919608117', '是', '73', '', '2020-05-28/e2ae7706-9dcd-4596-9a88-ccf5ce4c856e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1058', '10', null, '1', null, null, '', '105', 'cp6', '73944', '刘嬿', null, null, '14', '1590919697397', '挺水', '78', 'A01', '2020-05-28/eeb09651-57e4-406c-86c9-1e62943b3fa6_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1059', '0', null, '0', null, null, '', '101', 'cp2', '73946', '对方正在输入...', null, null, '14', '1590919790066', '', '74', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1060', '10', null, '1', null, null, '', '119', 'cp20', '73946', '对方正在输入...', null, null, '14', '1590919882776', 'b', '93', '', '2020-05-28/a257c3c4-9ba2-4406-9e5c-ac62c6dd5b2e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1061', '10', null, '1', null, null, '', '100', 'cp1', '73946', '对方正在输入...', null, null, '14', '1590920013568', '是', '73', '', '2020-05-28/e2ae7706-9dcd-4596-9a88-ccf5ce4c856e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1062', '0', null, '0', null, null, '', '104', 'cp5', '73944', '刘嬿', null, null, '14', '1590920081563', '', '77', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1063', '0', null, '0', null, null, '', '102', 'cp3', '73946', '对方正在输入...', null, null, '14', '1590920397696', '', '75', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1064', '10', null, '1', null, null, '', '103', 'cp4', '73946', '对方正在输入...', null, null, '14', '1590920698285', 'a', '76', 'A05', '2020-05-28/c68e5a0a-ac03-4792-8bf4-e8cf7eff680b_slice_1_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1065', '10', null, '1', null, null, '', '103', 'cp4', '73944', '刘嬿', null, null, '14', '1590920767041', 'A', '76', 'A05', '2020-05-28/c68e5a0a-ac03-4792-8bf4-e8cf7eff680b_slice_1_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1066', '10', null, '1', null, null, '', '104', 'cp5', '73946', '对方正在输入...', null, null, '14', '1590921093136', 'c', '77', '', '2020-05-28/e8b3572f-5545-4b99-9b70-a1e49fb026a7_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1067', '10', null, '1', null, null, '', '105', 'cp6', '73946', '对方正在输入...', null, null, '14', '1590921194324', '挺水植物', '78', 'A01', '2020-05-28/eeb09651-57e4-406c-86c9-1e62943b3fa6_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1068', '10', null, '1', null, null, '', '102', 'cp3', '73944', '刘嬿', null, null, '14', '1590921292152', 'A', '75', '', '2020-05-28/85ea01c4-3c88-4d15-a740-bdc8001df224_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1069', '0', null, '0', null, null, '', '106', 'cp7', '73946', '对方正在输入...', null, null, '14', '1590921413458', '', '79', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1070', '10', null, '1', null, null, '', '118', 'cp19', '73945', '豆爸', null, null, '14', '1590921521498', '', '92', 'A06', '2020-05-28/41306da9-16b2-49ea-887a-2541f3ee1af8_slice_1_2.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1071', '10', null, '1', null, null, '', '107', 'cp8', '73946', '对方正在输入...', null, null, '14', '1590921617430', '果序', '80', 'A05', '2020-05-28/30b9cefb-f8c0-42ac-bf05-1cd89d101082_slice_1_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1072', '0', null, '0', null, null, '', '108', 'cp9', '73946', '对方正在输入...', null, null, '14', '1590921711023', '', '81', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1073', '0', null, '0', null, null, '', '117', 'cp18', '73945', '豆爸', null, null, '14', '1590921755801', '', '91', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1074', '0', null, '0', null, null, '', '109', 'cp10', '73946', '对方正在输入...', null, null, '14', '1590921831928', '', '82', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1075', '10', null, '1', null, null, '', '110', 'cp11', '73946', '对方正在输入...', null, null, '14', '1590922132407', '2', '83', '', '2020-05-28/c730a0e5-647b-4065-a7f6-e521ee1e70c5_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1076', '10', null, '1', null, null, '', '112', 'cp12', '73946', '对方正在输入...', null, null, '14', '1590922269017', '否', '85', 'A04', '2020-05-28/a3277489-86e7-4fb9-b285-6f51390f5df4_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1077', '0', null, '0', null, null, '', '111', 'cp13', '73946', '对方正在输入...', null, null, '14', '1590922527576', '', '86', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1078', '10', null, '1', null, null, '', '113', 'cp14', '73946', '对方正在输入...', null, null, '14', '1590922750869', '有', '87', 'A04', '2020-05-28/b722c622-4223-4672-b01a-d7ac837e5164_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1079', '0', null, '0', null, null, '', '101', 'cp2', '73948', '贾东兴', null, null, '14', '1590922885435', '', '74', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1080', '0', null, '0', null, null, '', '114', 'cp15', '73946', '对方正在输入...', null, null, '14', '1590922970063', '', '88', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1081', '10', null, '1', null, null, '', '115', 'cp16', '73946', '对方正在输入...', null, null, '14', '1590923038322', 'c', '89', 'A02', '2020-05-28/b15f6730-6c9e-4785-93cf-12e1249d4056_slice_0_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1082', '10', null, '1', null, null, '', '116', 'cp17', '73946', '对方正在输入...', null, null, '14', '1590923216387', 'b', '90', '', '2020-05-28/29607a89-697b-4bd2-bfaa-2617c02c5688_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1083', '10', null, '1', null, null, '', '119', 'cp20', '73948', '贾东兴', null, null, '14', '1590923227406', 'B', '93', '', '2020-05-28/a257c3c4-9ba2-4406-9e5c-ac62c6dd5b2e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1084', '10', null, '1', null, null, '', '100', 'cp1', '73948', '贾东兴', null, null, '14', '1590923444662', '是', '73', '', '2020-05-28/e2ae7706-9dcd-4596-9a88-ccf5ce4c856e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1085', '0', null, '0', null, null, '', '117', 'cp18', '73946', '对方正在输入...', null, null, '14', '1590923561092', '', '91', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1086', '10', null, '1', null, null, '', '118', 'cp19', '73946', '对方正在输入...', null, null, '14', '1590923598568', '', '92', 'A06', '2020-05-28/41306da9-16b2-49ea-887a-2541f3ee1af8_slice_1_2.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1087', '10', null, '1', null, null, '', '102', 'cp3', '73948', '贾东兴', null, null, '14', '1590924006189', 'A', '75', '', '2020-05-28/85ea01c4-3c88-4d15-a740-bdc8001df224_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1088', '0', null, '0', null, null, '', '103', 'cp4', '73948', '贾东兴', null, null, '14', '1590924507179', '', '76', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1089', '0', null, '0', null, null, '', '104', 'cp5', '73948', '贾东兴', null, null, '14', '1590925147580', '', '77', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1090', '10', null, '1', null, null, '', '105', 'cp6', '73948', '贾东兴', null, null, '14', '1590925456679', '挺水植物', '78', 'A01', '2020-05-28/eeb09651-57e4-406c-86c9-1e62943b3fa6_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1091', '10', null, '1', null, null, '', '106', 'cp7', '73948', '贾东兴', null, null, '14', '1590926041939', '钟', '79', '', '2020-05-28/ea0fd11e-0e04-403f-9450-c91b3bda7ac4_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1092', '0', null, '0', null, null, '', '107', 'cp8', '73948', '贾东兴', null, null, '14', '1590927125685', '', '80', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1093', '0', null, '0', null, null, '', '108', 'cp9', '73948', '贾东兴', null, null, '14', '1590927590343', '', '81', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1094', '0', null, '0', null, null, '', '109', 'cp10', '73948', '贾东兴', null, null, '14', '1590927863637', '', '82', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1095', '0', null, '0', null, null, '', '110', 'cp11', '73948', '贾东兴', null, null, '14', '1590928345418', '', '83', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1096', '0', null, '0', null, null, '', '111', 'cp13', '73948', '贾东兴', null, null, '14', '1590928732060', '', '86', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1097', '10', null, '1', null, null, '', '112', 'cp12', '73948', '贾东兴', null, null, '14', '1590928843223', '否', '85', 'A04', '2020-05-28/a3277489-86e7-4fb9-b285-6f51390f5df4_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1098', '10', null, '1', null, null, '', '113', 'cp14', '73948', '贾东兴', null, null, '14', '1590929177003', '有', '87', 'A04', '2020-05-28/b722c622-4223-4672-b01a-d7ac837e5164_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1099', '0', null, '0', null, null, '', '114', 'cp15', '73948', '贾东兴', null, null, '14', '1590929495358', '', '88', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1100', '0', null, '0', null, null, '', '115', 'cp16', '73948', '贾东兴', null, null, '14', '1590929696260', '', '89', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1101', '0', null, '0', null, null, '', '116', 'cp17', '73948', '贾东兴', null, null, '14', '1590929878911', '', '90', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1102', '0', null, '0', null, null, '', '117', 'cp18', '73948', '贾东兴', null, null, '14', '1590930278483', '', '91', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1103', '10', null, '1', null, null, '', '118', 'cp19', '73948', '贾东兴', null, null, '14', '1590930402065', '', '92', 'A06', '2020-05-28/41306da9-16b2-49ea-887a-2541f3ee1af8_slice_1_2.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1104', '0', null, '0', null, null, '', '104', 'cp5', '73881', 'LucyLi', null, null, '14', '1590996535878', '', '77', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1105', '10', null, '1', null, null, '', '105', 'cp6', '73881', 'LucyLi', null, null, '14', '1590996854463', '挺水植物', '78', 'A01', '2020-05-28/eeb09651-57e4-406c-86c9-1e62943b3fa6_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1106', '10', null, '1', null, null, '', '100', 'cp1', '73950', '李大芳', null, null, '14', '1590996910938', '是', '73', '', '2020-05-28/e2ae7706-9dcd-4596-9a88-ccf5ce4c856e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1107', '0', null, '0', null, null, '', '100', 'cp1', '73862', '朱金丹 Dany', null, null, '14', '1590997234585', '', '73', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1108', '10', null, '1', null, null, '', '100', 'cp1', '73842', '0。圈圈O°', null, null, '14', '1590997238364', '是', '73', '', '2020-05-28/e2ae7706-9dcd-4596-9a88-ccf5ce4c856e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1109', '10', null, '1', null, null, '', '101', 'cp2', '73950', '李大芳', null, null, '14', '1590997390813', 'B', '74', 'A01', '2020-05-28/9f1a26ca-c095-4bef-b6c8-4876c69a9634_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1110', '0', null, '0', null, null, '', '106', 'cp7', '73881', 'LucyLi', null, null, '14', '1590997492883', '', '79', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1111', '0', null, '0', null, null, '', '101', 'cp2', '73862', '朱金丹 Dany', null, null, '14', '1590997583483', '', '74', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1112', '0', null, '0', null, null, '', '101', 'cp2', '73842', '0。圈圈O°', null, null, '14', '1590997585808', '', '74', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1113', '10', null, '1', null, null, '', '102', 'cp3', '73950', '李大芳', null, null, '14', '1590997647127', 'A', '75', '', '2020-05-28/85ea01c4-3c88-4d15-a740-bdc8001df224_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1114', '0', null, '0', null, null, '', '102', 'cp3', '73862', '朱金丹 Dany', null, null, '14', '1590998015215', '', '75', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1115', '10', null, '1', null, null, '', '102', 'cp3', '73842', '0。圈圈O°', null, null, '14', '1590998033095', 'A', '75', '', '2020-05-28/85ea01c4-3c88-4d15-a740-bdc8001df224_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1116', '10', null, '1', null, null, '', '107', 'cp8', '73881', 'LucyLi', null, null, '14', '1590998077422', '果序', '80', 'A05', '2020-05-28/30b9cefb-f8c0-42ac-bf05-1cd89d101082_slice_1_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1117', '0', null, '0', null, null, '', '103', 'cp4', '73842', '0。圈圈O°', null, null, '14', '1590998285972', '', '76', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1118', '10', null, '1', null, null, '', '103', 'cp4', '73950', '李大芳', null, null, '14', '1590998302969', 'A', '76', 'A05', '2020-05-28/c68e5a0a-ac03-4792-8bf4-e8cf7eff680b_slice_1_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1119', '10', null, '1', null, null, '', '103', 'cp4', '73862', '朱金丹 Dany', null, null, '14', '1590998303525', 'A', '76', 'A05', '2020-05-28/c68e5a0a-ac03-4792-8bf4-e8cf7eff680b_slice_1_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1120', '0', null, '0', null, null, '', '104', 'cp5', '73842', '0。圈圈O°', null, null, '14', '1590998601740', '', '77', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1121', '10', null, '1', null, null, '', '104', 'cp5', '73862', '朱金丹 Dany', null, null, '14', '1590998623042', 'C', '77', '', '2020-05-28/e8b3572f-5545-4b99-9b70-a1e49fb026a7_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1122', '0', null, '0', null, null, '', '104', 'cp5', '73950', '李大芳', null, null, '14', '1590998642554', '', '77', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1123', '0', null, '0', null, null, '', '105', 'cp6', '73842', '0。圈圈O°', null, null, '14', '1590998878462', '', '78', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1124', '10', null, '1', null, null, '', '105', 'cp6', '73950', '李大芳', null, null, '14', '1590998890328', '挺水植物', '78', 'A01', '2020-05-28/eeb09651-57e4-406c-86c9-1e62943b3fa6_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1125', '10', null, '1', null, null, '', '105', 'cp6', '73862', '朱金丹 Dany', null, null, '14', '1590998955736', '挺水植物', '78', 'A01', '2020-05-28/eeb09651-57e4-406c-86c9-1e62943b3fa6_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1126', '0', null, '0', null, null, '', '108', 'cp9', '73881', 'LucyLi', null, null, '14', '1590999023376', '', '81', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1127', '10', null, '1', null, null, '', '106', 'cp7', '73950', '李大芳', null, null, '14', '1590999164456', '钟形', '79', '', '2020-05-28/ea0fd11e-0e04-403f-9450-c91b3bda7ac4_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1128', '10', null, '1', null, null, '', '106', 'cp7', '73842', '0。圈圈O°', null, null, '14', '1590999167727', '钟形', '79', '', '2020-05-28/ea0fd11e-0e04-403f-9450-c91b3bda7ac4_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1129', '10', null, '1', null, null, '', '106', 'cp7', '73862', '朱金丹 Dany', null, null, '14', '1590999223611', '钟形', '79', '', '2020-05-28/ea0fd11e-0e04-403f-9450-c91b3bda7ac4_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1130', '10', null, '1', null, null, '', '109', 'cp10', '73881', 'LucyLi', null, null, '14', '1590999352269', '黄花菜', '82', 'A02', '2020-05-28/d284c16c-eeb0-421f-876a-e6bd395507a5_slice_0_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1131', '10', null, '1', null, null, '', '107', 'cp8', '73950', '李大芳', null, null, '14', '1590999503347', '果', '80', 'A05', '2020-05-28/30b9cefb-f8c0-42ac-bf05-1cd89d101082_slice_1_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1132', '0', null, '0', null, null, '', '107', 'cp8', '73842', '0。圈圈O°', null, null, '14', '1590999506832', '', '80', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1133', '10', null, '1', null, null, '', '107', 'cp8', '73862', '朱金丹 Dany', null, null, '14', '1590999534155', '果序', '80', 'A05', '2020-05-28/30b9cefb-f8c0-42ac-bf05-1cd89d101082_slice_1_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1134', '0', null, '0', null, null, '', '108', 'cp9', '73950', '李大芳', null, null, '14', '1590999772389', '', '81', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1135', '10', null, '1', null, null, '', '108', 'cp9', '73862', '朱金丹 Dany', null, null, '14', '1590999832564', '花瓣', '81', '', '2020-05-28/42a6c012-30eb-402d-874f-c26e63d6d06d_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1136', '10', null, '1', null, null, '', '108', 'cp9', '73842', '0。圈圈O°', null, null, '14', '1590999966677', 'D', '81', '', '2020-05-28/42a6c012-30eb-402d-874f-c26e63d6d06d_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1137', '10', null, '1', null, null, '', '110', 'cp11', '73881', 'LucyLi', null, null, '14', '1591000061224', '2', '83', '', '2020-05-28/c730a0e5-647b-4065-a7f6-e521ee1e70c5_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1138', '10', null, '1', null, null, '', '109', 'cp10', '73842', '0。圈圈O°', null, null, '14', '1591000081307', '黄花菜', '82', 'A02', '2020-05-28/d284c16c-eeb0-421f-876a-e6bd395507a5_slice_0_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1139', '10', null, '1', null, null, '', '109', 'cp10', '73950', '李大芳', null, null, '14', '1591000084059', '黄花菜', '82', 'A02', '2020-05-28/d284c16c-eeb0-421f-876a-e6bd395507a5_slice_0_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1140', '10', null, '1', null, null, '', '109', 'cp10', '73862', '朱金丹 Dany', null, null, '14', '1591000132651', '黄花菜', '82', 'A02', '2020-05-28/d284c16c-eeb0-421f-876a-e6bd395507a5_slice_0_1.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1141', '10', null, '1', null, null, '', '110', 'cp11', '73950', '李大芳', null, null, '14', '1591000439729', '2', '83', '', '2020-05-28/c730a0e5-647b-4065-a7f6-e521ee1e70c5_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1142', '10', null, '1', null, null, '', '110', 'cp11', '73842', '0。圈圈O°', null, null, '14', '1591000450148', '2', '83', '', '2020-05-28/c730a0e5-647b-4065-a7f6-e521ee1e70c5_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1143', '10', null, '1', null, null, '', '110', 'cp11', '73862', '朱金丹 Dany', null, null, '14', '1591000502486', '2', '83', '', '2020-05-28/c730a0e5-647b-4065-a7f6-e521ee1e70c5_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1144', '10', null, '1', null, null, '', '112', 'cp12', '73881', 'LucyLi', null, null, '14', '1591000746472', '否', '85', 'A04', '2020-05-28/a3277489-86e7-4fb9-b285-6f51390f5df4_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1145', '10', null, '1', null, null, '', '111', 'cp13', '73950', '李大芳', null, null, '14', '1591000860538', '卵圆形', '86', '', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1146', '10', null, '1', null, null, '', '111', 'cp13', '73842', '0。圈圈O°', null, null, '14', '1591000874917', '卵圆形', '86', '', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1147', '0', null, '0', null, null, '', '112', 'cp12', '73950', '李大芳', null, null, '14', '1591000912226', '', '85', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1148', '10', null, '1', null, null, '', '112', 'cp12', '73842', '0。圈圈O°', null, null, '14', '1591000923759', '否', '85', 'A04', '2020-05-28/a3277489-86e7-4fb9-b285-6f51390f5df4_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1149', '0', null, '0', null, null, '', '111', 'cp13', '73862', '朱金丹 Dany', null, null, '14', '1591000964864', '', '86', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1150', '10', null, '1', null, null, '', '112', 'cp12', '73862', '朱金丹 Dany', null, null, '14', '1591001041290', '否', '85', 'A04', '2020-05-28/a3277489-86e7-4fb9-b285-6f51390f5df4_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1151', '10', null, '1', null, null, '', '113', 'cp14', '73862', '朱金丹 Dany', null, null, '14', '1591001414881', '有', '87', 'A04', '2020-05-28/b722c622-4223-4672-b01a-d7ac837e5164_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1152', '10', null, '1', null, null, '', '113', 'cp14', '73950', '李大芳', null, null, '14', '1591001417179', '有', '87', 'A04', '2020-05-28/b722c622-4223-4672-b01a-d7ac837e5164_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1153', '10', null, '1', null, null, '', '113', 'cp14', '73842', '0。圈圈O°', null, null, '14', '1591001462098', '有', '87', 'A04', '2020-05-28/b722c622-4223-4672-b01a-d7ac837e5164_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1154', '10', null, '1', null, null, '', '114', 'cp15', '73950', '李大芳', null, null, '14', '1591001710776', 'B', '88', '', '2020-05-28/3bf704b8-86d3-40e0-b4c2-9f8a3317bc1e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1155', '10', null, '1', null, null, '', '114', 'cp15', '73842', '0。圈圈O°', null, null, '14', '1591001725396', 'B', '88', '', '2020-05-28/3bf704b8-86d3-40e0-b4c2-9f8a3317bc1e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1156', '10', null, '1', null, null, '', '114', 'cp15', '73862', '朱金丹 Dany', null, null, '14', '1591001738216', 'B', '88', '', '2020-05-28/3bf704b8-86d3-40e0-b4c2-9f8a3317bc1e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1157', '0', null, '0', null, null, '', '115', 'cp16', '73862', '朱金丹 Dany', null, null, '14', '1591001932457', '', '89', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1158', '0', null, '0', null, null, '', '115', 'cp16', '73950', '李大芳', null, null, '14', '1591002039928', '', '89', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1159', '0', null, '0', null, null, '', '115', 'cp16', '73842', '0。圈圈O°', null, null, '14', '1591002058222', '', '89', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1160', '10', null, '1', null, null, '', '116', 'cp17', '73842', '0。圈圈O°', null, null, '14', '1591002344654', 'B', '90', '', '2020-05-28/29607a89-697b-4bd2-bfaa-2617c02c5688_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1161', '0', null, '0', null, null, '', '116', 'cp17', '73950', '李大芳', null, null, '14', '1591002352392', '', '90', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1162', '10', null, '1', null, null, '', '116', 'cp17', '73862', '朱金丹 Dany', null, null, '14', '1591002386640', 'B', '90', '', '2020-05-28/29607a89-697b-4bd2-bfaa-2617c02c5688_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1163', '10', null, '1', null, null, '', '113', 'cp14', '73881', 'LucyLi', null, null, '14', '1591002662337', '有', '87', 'A04', '2020-05-28/b722c622-4223-4672-b01a-d7ac837e5164_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1164', '0', null, '0', null, null, '', '117', 'cp18', '73862', '朱金丹 Dany', null, null, '14', '1591002800161', '', '91', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1165', '0', null, '0', null, null, '', '117', 'cp18', '73842', '0。圈圈O°', null, null, '14', '1591002857414', '', '91', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1166', '10', null, '1', null, null, '', '117', 'cp18', '73950', '李大芳', null, null, '14', '1591002895206', '聚伞花序', '91', 'A03', '2020-05-28/2fa8a38a-6b4b-4e85-a825-348e0b8f4935_slice_0_2.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1167', '10', null, '1', null, null, '', '118', 'cp19', '73950', '李大芳', null, null, '14', '1591002955830', '', '92', 'A06', '2020-05-28/41306da9-16b2-49ea-887a-2541f3ee1af8_slice_1_2.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1168', '10', null, '1', null, null, '', '118', 'cp19', '73842', '0。圈圈O°', null, null, '14', '1591002955833', '', '92', 'A06', '2020-05-28/41306da9-16b2-49ea-887a-2541f3ee1af8_slice_1_2.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1169', '10', null, '1', null, null, '', '100', 'cp1', '73945', '豆爸', null, null, '14', '1591003162172', '是', '73', '', '2020-05-28/e2ae7706-9dcd-4596-9a88-ccf5ce4c856e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1170', '10', null, '1', null, null, '', '118', 'cp19', '73862', '朱金丹 Dany', null, null, '14', '1591003175760', '', '92', 'A06', '2020-05-28/41306da9-16b2-49ea-887a-2541f3ee1af8_slice_1_2.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1171', '10', null, '1', null, null, '', '119', 'cp20', '73945', '豆爸', null, null, '14', '1591003273557', 'b', '93', '', '2020-05-28/a257c3c4-9ba2-4406-9e5c-ac62c6dd5b2e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1172', '0', null, '0', null, null, '', '119', 'cp20', '73950', '李大芳', null, null, '14', '1591003369792', '', '93', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1173', '10', null, '1', null, null, '', '119', 'cp20', '73842', '0。圈圈O°', null, null, '14', '1591003371352', 'B', '93', '', '2020-05-28/a257c3c4-9ba2-4406-9e5c-ac62c6dd5b2e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1174', '10', null, '1', null, null, '', '119', 'cp20', '73862', '朱金丹 Dany', null, null, '14', '1591003384641', 'B', '93', '', '2020-05-28/a257c3c4-9ba2-4406-9e5c-ac62c6dd5b2e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1175', '10', null, '1', null, null, '', '101', 'cp2', '73945', '豆爸', null, null, '14', '1591003459833', 'b', '74', 'A01', '2020-05-28/9f1a26ca-c095-4bef-b6c8-4876c69a9634_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1176', '10', null, '1', null, null, '', '102', 'cp3', '73945', '豆爸', null, null, '14', '1591004119283', 'A', '75', '', '2020-05-28/85ea01c4-3c88-4d15-a740-bdc8001df224_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1177', '0', null, '0', null, null, '', '103', 'cp4', '73945', '豆爸', null, null, '14', '1591004638853', '', '76', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1178', '10', null, '1', null, null, '', '104', 'cp5', '73945', '豆爸', null, null, '14', '1591005080949', 'c', '77', '', '2020-05-28/e8b3572f-5545-4b99-9b70-a1e49fb026a7_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1179', '0', null, '0', null, null, '', '105', 'cp6', '73945', '豆爸', null, null, '14', '1591005369479', '', '78', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1180', '0', null, '0', null, null, '', '106', 'cp7', '73945', '豆爸', null, null, '14', '1591005758973', '', '79', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1181', '10', null, '1', null, null, '', '110', 'cp11', '73945', '豆爸', null, null, '14', '1591006537218', '2', '83', '', '2020-05-28/c730a0e5-647b-4065-a7f6-e521ee1e70c5_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1182', '10', null, '1', null, null, '', '111', 'cp13', '73945', '豆爸', null, null, '14', '1591006760532', '卵圆', '86', '', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1183', '0', null, '0', null, null, '', '112', 'cp12', '73945', '豆爸', null, null, '14', '1591006897261', '', '85', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1184', '10', null, '1', null, null, '', '113', 'cp14', '73945', '豆爸', null, null, '14', '1591007579917', '有', '87', 'A04', '2020-05-28/b722c622-4223-4672-b01a-d7ac837e5164_slice_1_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1185', '0', null, '0', null, null, '', '114', 'cp15', '73945', '豆爸', null, null, '14', '1591007852555', '', '88', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1186', '0', null, '0', null, null, '', '115', 'cp16', '73945', '豆爸', null, null, '14', '1591008042199', '', '89', '答案错误', '', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1192', '10', null, '1', null, null, '2020-06-09/wxa8e0a9a2f65066a5.o6zAJs8wWUB39rzuCg8Nk1v_2OP4.VkFL78uzidxg1ca42512fce332322a823077cc72532e.jpg', '6', '1号点', '73768', '早起的小闹钟', null, null, '7', '1591710895359', '', '40', '', '', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1193', '10', null, '1', null, null, '2020-06-09/wxa8e0a9a2f65066a5.o6zAJs8wWUB39rzuCg8Nk1v_2OP4.v03yc9W4ghQm1ca42512fce332322a823077cc72532e.jpg', '16', '2号点', '73768', '早起的小闹钟', null, null, '7', '1591710912669', '', '30', '', '', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1194', '10', null, '1', null, null, '2020-06-09/wxa8e0a9a2f65066a5.o6zAJs8wWUB39rzuCg8Nk1v_2OP4.A5WopArWRWCD1ca42512fce332322a823077cc72532e.jpg', '23', '3号点', '73768', '早起的小闹钟', null, null, '7', '1591710926806', '', '23', '', '', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1195', '10', null, '1', null, null, '2020-06-09/wxa8e0a9a2f65066a5.o6zAJs8wWUB39rzuCg8Nk1v_2OP4.p747pFGRkLtJ1ca42512fce332322a823077cc72532e.jpg', '22', '4号点', '73768', '早起的小闹钟', null, null, '7', '1591710943091', '', '24', '', '', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1196', '10', null, '1', null, null, '2020-06-09/wxa8e0a9a2f65066a5.o6zAJs8wWUB39rzuCg8Nk1v_2OP4.vSor19JhWtib1ca42512fce332322a823077cc72532e.jpg', '7', '5号点', '73768', '早起的小闹钟', null, null, '7', '1591710961076', '', '39', '', '', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1203', '10', null, '1', null, null, '2020-06-20/tmp_abada034c0294d96c7a52368a4c631cf2e4ed7f6b896a81b.jpg', '6', '1号点', '73760', '华南虎', null, null, '7', '1592620152823', '', '40', '', '', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1204', '10', null, '1', null, null, '2020-06-20/tmp_bfa83ea494249d4548d40844b6a4d8c0467fa090c60623ef.jpg', '16', '2号点', '73760', '华南虎', null, null, '7', '1592620776584', '', '30', '', '', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1209', '10', null, '1', null, null, '2020-06-20/tmp_e9656b9ca1fdb0b0df90c92cac3ac429b882665121b948aa.jpg', '9', '13号点', '73760', '华南虎', null, null, '7', '1592628559871', '', '37', '', '', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1213', '10', null, '1', null, null, '2020-06-20/tmp_b719a9ac47a5bae0b34302f5317273239a01211edfd994a3.jpg', '19', '15号点', '73760', '华南虎', null, null, '7', '1592629872116', '', '27', '', '', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1218', '10', null, '1', null, null, '2020-06-20/tmp_65f2540754dcfc23b643dbcd5e030953.jpg', '6', '1号点', '73765', '涂涂', null, null, '7', '1592640506928', '', '40', '', '', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1219', '10', null, '1', null, null, '2020-06-30/tmp_b273b122a6ee534a25a8a47b3a1fb137da5dfc50cb0727c6.jpg', '6', '1号点', '73761', '李春波', null, null, '7', '1593504264930', '', '40', '', '', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1220', '10', null, '1', null, null, '', '100', 'cp1', '73761', '李春波', null, null, '14', '1595908909896', '是', '73', '', '2020-05-28/e2ae7706-9dcd-4596-9a88-ccf5ce4c856e_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1221', '10', null, '1', null, null, '2020-08-03/tmp_fcbca6055e9c3e4aadea6edb8877ecb5a72a1639e4547c14.jpg', '16', '2号点', '73761', '李春波', null, null, '7', '1596445980556', '', '30', '', '', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1222', '10', null, '1', null, null, '', '101', 'cp2', '73761', '李春波', null, null, '14', '1596446247051', 'B', '74', 'A01', '2020-05-28/9f1a26ca-c095-4bef-b6c8-4876c69a9634_slice_0_0.gif', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1223', '10', null, '1', null, null, '', '102', 'cp3', '73761', '李春波', null, null, '14', '1596686032116', 'A', '75', '', '2020-05-28/85ea01c4-3c88-4d15-a740-bdc8001df224_20200528014516.jpg', '1', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1224', '10', null, '1', null, null, '2020-08-06/tmp_83d769789bbd4e50a4f6e01f0e2de65c629ff90cc4004d21.jpg', '23', '3号点', '73761', '李春波', null, null, '7', '1596702782648', '', '23', '', '', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1225', '10', null, '1', null, null, '2020-08-11/tmp_lx3FEcKU2vbxdJsrP3pvRguUNPqg4Lan.jpg', '6', '1号点', '73766', '超_越梦想', null, null, '7', '1597158490999', '', '40', '', '', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1226', '10', null, '1', null, null, '2020-08-14/tmp_7e8ddb64ed8d50f4a6c7431fd49d379f70f58447df4bd55c.jpg', '22', '4号点', '73761', '李春波', null, null, '7', '1597402597172', '', '24', '', '', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1227', '10', null, '1', null, null, '2020-08-14/tmp_6e5b7ee749d9c76818aa5954fbdba5f84d580a3267a64fbd.jpg', '7', '5号点', '73761', '李春波', null, null, '7', '1597402604627', '', '39', '', '', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1228', '10', null, '1', null, null, '2020-08-14/tmp_25d706b5f76e42e2aabbeaad7d002e18c63e6997b692997c.jpg', '15', '6号点', '73761', '李春波', null, null, '7', '1597402610093', '', '31', '', '', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1229', '10', null, '1', null, null, '2020-08-14/tmp_425e7979c42352951c480b3dffc9de059250d9abecb4821d.jpg', '17', '7号点', '73761', '李春波', null, null, '7', '1597402616515', '', '29', '', '', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1230', '10', null, '1', null, null, '2020-08-14/tmp_2c831742050e3de7b2a48a0ace6302cab5facf4afb2fc403.jpg', '10', '8号点', '73761', '李春波', null, null, '7', '1597402629934', '', '36', '', '', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1231', '10', null, '1', null, null, '2020-08-15/wxa8e0a9a2f65066a5.o6zAJs4IiS-NsK1sWekdd5-XbG_Q.B9pIP9P8xd3Ydf93a81d7845553efdeb3dca39d0f4b2.jpg', '11', '9号点', '73761', '李春波', null, null, '7', '1597466069126', '', '35', '', '', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1232', '10', null, '1', null, null, '2020-08-18/wxa8e0a9a2f65066a5.o6zAJs4IiS-NsK1sWekdd5-XbG_Q.Clw6wxL1E6pF15cc8b83444e0feb7271992fde3de703.jpg', '12', '10号点', '73761', '李春波', null, null, '7', '1597728478060', '', '34', '', '', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1233', '10', null, '1', null, null, '2020-08-18/wxa8e0a9a2f65066a5.o6zAJs4IiS-NsK1sWekdd5-XbG_Q.S4NIbvsp2pHR489171e8721b85d6e8597688560b7203.jpg', '13', '11号点', '73761', '李春波', null, null, '7', '1597728486509', '', '33', '', '', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1234', '10', null, '1', null, null, '2020-08-18/wxa8e0a9a2f65066a5.o6zAJs4IiS-NsK1sWekdd5-XbG_Q.6mZXqx7g01A632ec988580b981db9d32ce55f629b664.jpg', '14', '12号点', '73761', '李春波', null, null, '7', '1597728502474', '', '32', '', '', '2', '0', null);
INSERT INTO `PointUserinfo` VALUES ('1235', '0', null, '1', null, null, '', '103', 'cp4', '73761', '李春波', null, null, '14', '1597731213989', 'J', '76', '答案错误', '', '1', '0', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of Suipian
-- ----------------------------
INSERT INTO `Suipian` VALUES ('1', '3', '水符藏宝图', '1', 's101', null, '11');
INSERT INTO `Suipian` VALUES ('2', '3', '水符藏宝图', '2', 's102', null, '11');
INSERT INTO `Suipian` VALUES ('3', '3', '水符藏宝图', '3', 's103', null, '11');
INSERT INTO `Suipian` VALUES ('4', '3', '水符藏宝图', '4', 's104', null, '11');
INSERT INTO `Suipian` VALUES ('5', '3', '水符藏宝图', '5', 's105', null, '11');
INSERT INTO `Suipian` VALUES ('6', '3', '水符藏宝图', '6', 's106', null, '11');
INSERT INTO `Suipian` VALUES ('7', '2', '木符藏宝图', '1', 'm101', null, '11');
INSERT INTO `Suipian` VALUES ('8', '2', '木符藏宝图', '2', 'm102', null, '11');
INSERT INTO `Suipian` VALUES ('9', '2', '木符藏宝图', '3', 'm103', null, '11');
INSERT INTO `Suipian` VALUES ('10', '2', '木符藏宝图', '4', 'm104', null, '11');
INSERT INTO `Suipian` VALUES ('11', '2', '木符藏宝图', '5', 'm105', null, '11');
INSERT INTO `Suipian` VALUES ('12', '2', '木符藏宝图', '6', 'm106', null, '11');
INSERT INTO `Suipian` VALUES ('13', '1', '金符藏宝图', '1', 'j101', null, '11');
INSERT INTO `Suipian` VALUES ('14', '1', '金符藏宝图', '2', 'j102', null, '11');
INSERT INTO `Suipian` VALUES ('15', '1', '金符藏宝图', '3', 'j103', null, '11');
INSERT INTO `Suipian` VALUES ('16', '1', '金符藏宝图', '4', 'j104', null, '11');
INSERT INTO `Suipian` VALUES ('17', '1', '金符藏宝图', '5', 'j105', null, '11');
INSERT INTO `Suipian` VALUES ('18', '1', '金符藏宝图', '6', 'j106', null, '11');
INSERT INTO `Suipian` VALUES ('21', '5', '金符藏宝图', '1', 'J01', null, '12');
INSERT INTO `Suipian` VALUES ('22', '5', '金符藏宝图', '2', 'J02', null, '12');
INSERT INTO `Suipian` VALUES ('23', '5', '金符藏宝图', '3', 'J03', null, '12');
INSERT INTO `Suipian` VALUES ('24', '5', '金符藏宝图', '4', 'J04', null, '12');
INSERT INTO `Suipian` VALUES ('25', '5', '金符藏宝图', '5', 'J05', null, '12');
INSERT INTO `Suipian` VALUES ('26', '5', '金符藏宝图', '6', 'J06', null, '12');
INSERT INTO `Suipian` VALUES ('27', '6', '木符藏宝图', '1', 'M01', null, '12');
INSERT INTO `Suipian` VALUES ('28', '6', '木符藏宝图', '2', 'M02', null, '12');
INSERT INTO `Suipian` VALUES ('29', '6', '木符藏宝图', '3', 'M03', null, '12');
INSERT INTO `Suipian` VALUES ('30', '6', '木符藏宝图', '4', 'M04', null, '12');
INSERT INTO `Suipian` VALUES ('31', '6', '木符藏宝图', '5', 'M05', null, '12');
INSERT INTO `Suipian` VALUES ('32', '6', '木符藏宝图', '6', 'M06', null, '12');
INSERT INTO `Suipian` VALUES ('33', '7', '水符藏宝图', '1', 'S01', null, '12');
INSERT INTO `Suipian` VALUES ('34', '7', '水符藏宝图', '2', 'S02', null, '12');
INSERT INTO `Suipian` VALUES ('35', '7', '水符藏宝图', '3', 'S03', null, '12');
INSERT INTO `Suipian` VALUES ('36', '7', '水符藏宝图', '4', 'S04', null, '12');
INSERT INTO `Suipian` VALUES ('37', '7', '水符藏宝图', '5', 'S05', null, '12');
INSERT INTO `Suipian` VALUES ('38', '7', '水符藏宝图', '6', 'S06', null, '12');
INSERT INTO `Suipian` VALUES ('40', '10', '宝盒', '1', 'BH01', null, '12');
INSERT INTO `Suipian` VALUES ('41', '11', '游美环球探索', '1', 'YM01', null, '13');
INSERT INTO `Suipian` VALUES ('42', '11', '游美环球探索', '2', 'YM02', null, '13');
INSERT INTO `Suipian` VALUES ('43', '11', '游美环球探索', '3', 'YM03', null, '13');
INSERT INTO `Suipian` VALUES ('44', '11', '游美环球探索', '4', 'YM04', null, '13');
INSERT INTO `Suipian` VALUES ('45', '11', '游美环球探索', '5', 'YM05', null, '13');
INSERT INTO `Suipian` VALUES ('46', '11', '游美环球探索', '6', 'YM06', null, '13');
INSERT INTO `Suipian` VALUES ('47', '4', '平日免房券', '1', 'p1', null, '10');
INSERT INTO `Suipian` VALUES ('48', '4', '平日免房券', '2', 'p2', null, '10');
INSERT INTO `Suipian` VALUES ('49', '4', '平日免房券', '3', 'p3', null, '10');
INSERT INTO `Suipian` VALUES ('50', '4', '平日免房券', '4', 'p4', null, '10');
INSERT INTO `Suipian` VALUES ('51', '4', '平日免房券', '5', 'p5', null, '10');
INSERT INTO `Suipian` VALUES ('52', '4', '平日免房券', '6', 'p6', null, '10');
INSERT INTO `Suipian` VALUES ('53', '13', '神秘小礼物', '1', 'AS01', null, '7');
INSERT INTO `Suipian` VALUES ('54', '13', '神秘小礼物', '2', 'AS02', null, '7');
INSERT INTO `Suipian` VALUES ('55', '13', '神秘小礼物', '3', 'AS03', null, '7');
INSERT INTO `Suipian` VALUES ('56', '13', '神秘小礼物', '4', 'AS04', null, '7');
INSERT INTO `Suipian` VALUES ('57', '13', '神秘小礼物', '5', 'AS05', null, '7');
INSERT INTO `Suipian` VALUES ('58', '13', '神秘小礼物', '6', 'AS06', null, '7');
INSERT INTO `Suipian` VALUES ('59', '14', '到店礼物', '1', 'ZJ01', null, '9');
INSERT INTO `Suipian` VALUES ('60', '14', '到店礼物', '2', 'ZJ02', null, '9');
INSERT INTO `Suipian` VALUES ('61', '14', '到店礼物', '3', 'ZJ03', null, '9');
INSERT INTO `Suipian` VALUES ('62', '14', '到店礼物', '4', 'ZJ04', null, '9');
INSERT INTO `Suipian` VALUES ('63', '14', '到店礼物', '5', 'ZJ05', null, '9');
INSERT INTO `Suipian` VALUES ('64', '14', '到店礼物', '6', 'ZJ06', null, '9');
INSERT INTO `Suipian` VALUES ('65', '15', '藏宝图', '1', 'CSCBT01', null, '10');
INSERT INTO `Suipian` VALUES ('66', '15', '藏宝图', '2', 'CSCBT02', null, '10');
INSERT INTO `Suipian` VALUES ('67', '15', '藏宝图', '3', 'CSCBT03', null, '10');
INSERT INTO `Suipian` VALUES ('68', '15', '藏宝图', '4', 'CSCBT04', null, '10');
INSERT INTO `Suipian` VALUES ('69', '15', '藏宝图', '5', 'CSCBT05', null, '10');
INSERT INTO `Suipian` VALUES ('70', '15', '藏宝图', '6', 'CSCBT06', null, '10');
INSERT INTO `Suipian` VALUES ('71', '16', '火符', '1', 'H01', null, '12');
INSERT INTO `Suipian` VALUES ('72', '16', '火符', '2', 'H02', null, '12');
INSERT INTO `Suipian` VALUES ('73', '16', '火符', '3', 'H03', null, '12');
INSERT INTO `Suipian` VALUES ('74', '16', '火符', '4', 'H04', null, '12');
INSERT INTO `Suipian` VALUES ('75', '16', '火符', '5', 'H05', null, '12');
INSERT INTO `Suipian` VALUES ('76', '16', '火符', '6', 'H06', null, '12');
INSERT INTO `Suipian` VALUES ('77', '17', '土符', '1', 'T01', null, '12');
INSERT INTO `Suipian` VALUES ('78', '17', '土符', '2', 'T02', null, '12');
INSERT INTO `Suipian` VALUES ('79', '17', '土符', '3', 'T03', null, '12');
INSERT INTO `Suipian` VALUES ('80', '17', '土符', '4', 'T04', null, '12');
INSERT INTO `Suipian` VALUES ('81', '17', '土符', '5', 'T05', null, '12');
INSERT INTO `Suipian` VALUES ('82', '17', '土符', '6', 'T06', null, '12');
INSERT INTO `Suipian` VALUES ('83', '18', 'A+', '1', ' j101', null, '14');
INSERT INTO `Suipian` VALUES ('84', '18', 'A+', '2', 'j102', null, '14');
INSERT INTO `Suipian` VALUES ('85', '19', 'A+', '1', 'A01', null, '14');
INSERT INTO `Suipian` VALUES ('86', '19', 'A+', '2', 'A02', null, '14');
INSERT INTO `Suipian` VALUES ('87', '19', 'A+', '3', 'A03', null, '14');
INSERT INTO `Suipian` VALUES ('88', '19', 'A+', '4', 'A04', null, '14');
INSERT INTO `Suipian` VALUES ('89', '19', 'A+', '5', 'A05', null, '14');
INSERT INTO `Suipian` VALUES ('90', '19', 'A+', '6', 'A06', null, '14');

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
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of Tip
-- ----------------------------
INSERT INTO `Tip` VALUES ('1', '提示1打卡，并等待验证', '10', '0', '提示1', '1', '签到点１', '1', '');
INSERT INTO `Tip` VALUES ('2', '提示2打卡，并等待验证', '10', '1', '提示2', '1', '签到点１', '1', '');
INSERT INTO `Tip` VALUES ('3', '提示3打卡，并等待验证', '10', '1', '提示3', '1', '签到点１', '3', '');
INSERT INTO `Tip` VALUES ('4', '这里打卡并待验证', '0', '1', '点击解锁提示1', '3', '奥林匹克森林北园', '1', '');
INSERT INTO `Tip` VALUES ('5', '提示点2描述，在这里打卡', '30', '1', '提示点2', '3', '奥林匹克森林北园', '2', '');
INSERT INTO `Tip` VALUES ('6', '奥林匹克森林南园淡淡的淡淡的淡淡的', '15', '0', '奥林匹克森林南园签到1', '2', '奥林匹克森林南园', '1', null);
INSERT INTO `Tip` VALUES ('7', '3333333333333333333333333333333333', '40', '1', '奥林匹克森林南园333', '2', '奥林匹克森林南园', '3', null);
INSERT INTO `Tip` VALUES ('9', 'abcde', '0', '1', '点击解锁提示1', '5', '2号点', '1', '2020-04-17/f631ab79-25e0-48ce-ada2-bcdd19de66b0_ww_20200313085149.jpg');
INSERT INTO `Tip` VALUES ('10', '这附近有一棵树的树干上有个“洞”哦', '0', '1', '提示1', '6', '1号点', '1', '');
INSERT INTO `Tip` VALUES ('11', '', '5', '1', '提示2', '6', '1号点', '2', '2020-04-20/fe3fe35e-cc1e-4c57-848a-54691ddcc86c_IMG_20200312_144714_1.jpg');
INSERT INTO `Tip` VALUES ('12', '', '10', '1', '提示3', '6', '1号点', '3', '2020-04-20/a273385e-0cd0-4a43-bc4f-3db2c8dc44a0_IMG_20200312_143628.jpg');
INSERT INTO `Tip` VALUES ('13', '观察一下你周围，在一个桥头最好藏东西的地方会是哪里呢？', '0', '1', '提示1', '7', '2号点', '1', '');
INSERT INTO `Tip` VALUES ('14', '手指的地方看看吧', '10', '1', '提示2', '7', '2号点', '2', '2020-04-18/bdf6191e-681a-4e03-9e6a-e019375ac7cb_IMG_20200312_151116.jpg');
INSERT INTO `Tip` VALUES ('15', '这里有一棵形状与众不同的树，去那棵树下看看吧！', '0', '1', '提示1', '8', '3号点', '1', '');
INSERT INTO `Tip` VALUES ('16', '手指的那棵树哦', '10', '1', '提示2', '8', '3号点', '2', '2020-04-18/5229cc05-e413-4184-985b-c057ed9b657c_IMG_20200312_153221.jpg');
INSERT INTO `Tip` VALUES ('17', '在路边那一簇迎春花里面哦！', '0', '1', '提示1', '9', '4号点', '1', '');
INSERT INTO `Tip` VALUES ('18', '在正对着一根铁棍子的地方找找吧', '10', '1', '提示2', '9', '4号点', '2', '2020-04-18/38c379b7-098d-467c-a79e-e6ca841e4670_IMG_20200312_154947.jpg');
INSERT INTO `Tip` VALUES ('19', '在雨燕塔西北方向的小灌木树上找找看吧！', '0', '1', '提示1', '10', '5号点', '1', '');
INSERT INTO `Tip` VALUES ('20', '通过照片能够看出来是哪棵吗？照片里面左边这个哦', '10', '1', '提示2', '10', '5号点', '2', '2020-04-20/0ce85af2-deee-4599-b46a-3d13dc70374b_IMG_20200312_160359.jpg');
INSERT INTO `Tip` VALUES ('21', '这里横在岸边的那棵枯木很有趣吧，有很多动物生活在里面，我们的小杯子是不是也躲进去了呢？', '0', '1', '提示1', '11', '6号点', '1', '');
INSERT INTO `Tip` VALUES ('22', '看到那一点点红色了吗？', '10', '1', '提示2', '11', '6号点', '2', '2020-04-18/497f9bf8-1ba2-49bf-b2df-9ec7ee7a4855_IMG_20200312_162325.jpg');
INSERT INTO `Tip` VALUES ('23', '小朋友们在大石头上玩的好开心。', '0', '1', '提示1', '12', '7号点', '1', '2020-04-18/b5633e39-a845-4068-bece-9e19d483070e_IMG_20200312_163613.jpg');
INSERT INTO `Tip` VALUES ('24', '石头缝里蹦出来的不是猴子，会是什么呢？', '10', '1', '提示2', '12', '7号点', '2', '2020-04-18/e4c406ff-1a4e-4bca-99da-06105303820f_IMG_20200312_163316.jpg');
INSERT INTO `Tip` VALUES ('25', '这个地方需要你蹲下来才更容易看到哦', '0', '1', '提示1', '13', '8号点', '1', '');
INSERT INTO `Tip` VALUES ('26', '没错，就在手指的地方了！', '10', '1', '提示2', '13', '8号点', '2', '2020-04-18/58bc7ce5-e665-4413-ac35-8d0700ec494f_IMG_20200312_165801.jpg');
INSERT INTO `Tip` VALUES ('27', '这里的风景很好吧，有没有坐下来观赏一下呢？旁边的那个枯树庄能坐吗？', '0', '1', '提示1', '14', '9号点', '1', '');
INSERT INTO `Tip` VALUES ('28', '试试手指的那个地方吧！', '10', '1', '提示2', '14', '9号点', '2', '2020-04-18/a68b4015-3d95-4283-bd3e-3ac4bfdb9c6a_IMG_20200312_171338.jpg');
INSERT INTO `Tip` VALUES ('29', '翻开那个枯树庄看看吧，只能帮到这里了！', '5', '1', '提示3', '14', '9号点', '3', '');
INSERT INTO `Tip` VALUES ('30', '这里有一片白皮松的树林，走进树林里去吧，小杯子藏在其中的一棵树上哦！', '0', '1', '提示1', '15', '10号点', '1', '');
INSERT INTO `Tip` VALUES ('31', '\r\n', '10', '1', '提示2', '15', '10号点', '2', '2020-04-20/7ef99e57-e60a-4275-b793-8a4b90c83606_IMG_20200312_172847.jpg');
INSERT INTO `Tip` VALUES ('32', '你有没有发现这里的树排列还挺整齐的，小杯子所在的树是从西向东的第二列，从北向南的第二排哦！', '5', '1', '提示3', '15', '10号点', '3', '');
INSERT INTO `Tip` VALUES ('33', '它在一棵树上，距离旁边那个变电站大概10米左右吧！', '0', '1', '提示1', '16', '11号点', '1', '');
INSERT INTO `Tip` VALUES ('34', '', '10', '1', '提示2', '16', '11号点', '2', '2020-04-18/3a640ea5-d887-49ee-a457-a4039c8262d1_IMG_20200317_135115.jpg');
INSERT INTO `Tip` VALUES ('35', '这棵树！', '5', '1', '提示1', '17', '12号点', '1', '2020-04-18/abc75aeb-7200-4647-9903-a3f7f3555729_IMG_20200317_150324.jpg');
INSERT INTO `Tip` VALUES ('36', '有点保护色呢，哈哈！', '5', '1', '提示2', '17', '12号点', '2', '2020-04-18/bfb2ce47-e4ff-41b6-83d0-6b030159eaa8_IMG_20200317_150330.jpg');
INSERT INTO `Tip` VALUES ('37', '可以找到这棵树吗？', '5', '1', '提示1', '18', '13号点', '1', '2020-04-18/491df1ac-d04d-47a6-a793-50228229250f_IMG_20200317_160529.jpg');
INSERT INTO `Tip` VALUES ('38', '它被卡在树上的哦！', '5', '1', '提示2', '18', '13号点', '2', '2020-04-18/7c508644-f98f-40a6-8721-60f8b58c10f4_IMG_20200317_160551.jpg');
INSERT INTO `Tip` VALUES ('39', '它在丁字路口的一颗大树上！', '0', '1', '提示1', '19', '14号点', '1', '');
INSERT INTO `Tip` VALUES ('40', '', '5', '1', '提示2', '19', '14号点', '2', '2020-04-18/6be4c228-8788-4169-a192-9ccce7c4b1e0_IMG_20200317_161724.jpg');
INSERT INTO `Tip` VALUES ('41', '', '5', '1', '提示3', '19', '14号点', '3', '2020-04-18/89b78694-fac5-4594-ac26-a4ba94625a4a_IMG_20200317_161636.jpg');
INSERT INTO `Tip` VALUES ('42', '不在那棵钉了木板的树上哦', '0', '1', '提示1', '20', '15号点', '1', '');
INSERT INTO `Tip` VALUES ('43', '', '5', '1', '提示2', '20', '15号点', '2', '2020-04-18/3724a80b-5917-4550-b38b-339863e9c587_IMG_20200317_162807.jpg');
INSERT INTO `Tip` VALUES ('44', '在这个照片里，你会选择藏在哪里呢？', '0', '1', '提示1', '21', '16号点', '1', '2020-04-18/5b7a188c-38fe-4361-885a-f131a7150264_IMG_20200317_170632.jpg');
INSERT INTO `Tip` VALUES ('45', '', '5', '1', '提示2', '21', '16号点', '2', '2020-04-18/110d5e82-52e8-4672-a934-6988b5dcd9a6_IMG_20200317_170644.jpg');
INSERT INTO `Tip` VALUES ('46', '它跟枯树叶躲在一起！', '0', '1', '提示1', '22', '17号点', '1', '');
INSERT INTO `Tip` VALUES ('47', '', '5', '1', '提示2', '22', '17号点', '1', '2020-04-18/1c784a16-26e7-4094-8303-11c671477f0d_IMG_20200317_171842_1.jpg');
INSERT INTO `Tip` VALUES ('48', '在这棵树的旁边哦', '5', '1', '提示3', '22', '17号点', '3', '2020-04-18/2acdaeb0-7cde-4688-8854-22b6ee3b535e_IMG_20200317_171828.jpg');
INSERT INTO `Tip` VALUES ('49', '给张图吧，你能从这张图得到多少线索呢？', '5', '1', '提示1', '23', '18号点', '1', '2020-04-18/886e6857-7feb-43c5-a442-d0f09a5414c4_IMG_20200317_172437.jpg');
INSERT INTO `Tip` VALUES ('50', '右边这棵树靠近树根的地方怎么了？', '5', '1', '提示2', '23', '18号点', '2', '2020-04-18/f6fb474d-1cef-40bb-83a2-10960a80bee2_IMG_20200317_172454.jpg');
INSERT INTO `Tip` VALUES ('51', '', '0', '1', '提示1', '25', '1号点', '1', '2020-04-20/bc51c810-0b55-4543-ac32-dc8d29a745e4_IMG_20200420_131443.jpg');
INSERT INTO `Tip` VALUES ('52', '就在你们常玩的大石头那哦', '5', '1', '提示2', '25', '1号点', '2', '');
INSERT INTO `Tip` VALUES ('53', '', '0', '1', '提示1', '26', '2号点', '1', '2020-04-20/72032f92-bc14-4938-a1bf-4b20a418bdbc_IMG_20200420_130500.jpg');
INSERT INTO `Tip` VALUES ('54', '它在树上', '5', '1', '提示2', '26', '2号点', '2', '');
INSERT INTO `Tip` VALUES ('55', '', '0', '1', '提示1', '27', '3号点', '1', '2020-04-20/18e46ba5-bca3-43ef-a652-37527a43a9d5_IMG_20200420_130624.jpg');
INSERT INTO `Tip` VALUES ('56', '从南向北的第2块汀步石旁边。', '5', '1', '提示2', '27', '3号点', '2', '');
INSERT INTO `Tip` VALUES ('57', '', '0', '1', '提示1', '28', '4号点', '1', '2020-04-20/add19110-2278-4209-b68f-9c32c1fd80c5_IMG_20200420_131624.jpg');
INSERT INTO `Tip` VALUES ('58', '不在地上', '5', '1', '提示2', '28', '4号点', '1', '');
INSERT INTO `Tip` VALUES ('59', '', '0', '1', '提示1', '29', '5号点', '1', '2020-04-20/bebf4a07-a765-4886-95af-33f5422a57b4_IMG_20200420_130902.jpg');
INSERT INTO `Tip` VALUES ('60', '在座椅下面', '5', '1', '提示2', '29', '5号点', '2', '');
INSERT INTO `Tip` VALUES ('61', '最北侧', '10', '1', '提示3', '29', '5号点', '3', '');
INSERT INTO `Tip` VALUES ('62', '十七孔桥始建于清朝乾隆年间，是颐和园内最大的桥，由17个桥孔组成，长150米，飞跨于东堤和南湖岛，由于桥孔大小不一，所以桥面有一定的坡度，像一张弓。\r\n它为什么是十七个桥孔呢？难道以桥孔的数目命名，就只是为了告诉人们此桥有十七孔这么简单吗？当然并非如此。十七以“九”中分，即从桥东西两端算起，第九孔是中央的大桥孔。而按照古时候的礼制文化，“9”被称为极阳数，是过去封建帝王最喜欢的吉利数字，象征天、天子或帝王，常常被应用于礼制及皇家建筑之中。', '', '0', '介绍', '4', '1号点', '1', '');
INSERT INTO `Tip` VALUES ('63', '它躲在东堤的石岸里哦', '0', '1', '位置提示', '4', '1号点', '2', '2020-04-21/63900c53-4b46-4586-9018-e069a2dc48d6__20200421090047.jpg');
INSERT INTO `Tip` VALUES ('64', '那块巨大的石头知道答案', '5', '1', '位置提示', '4', '1号点', '3', '2020-04-21/bd2ff2e4-9151-416f-a1ab-f7ec4bbe1f31__20200421090035.jpg');
INSERT INTO `Tip` VALUES ('65', '这个位置点靠近颐和园的南如意门绣漪桥\r\n清代的乾隆皇帝为了游玩，将这里天然湖泊瓮山泊进行改造，并把它命名为“昆明湖”。昆明湖的水由南端的绣漪桥流出，从长河流经今紫竹院、动物园，在高梁桥下往东部分汇入护城河，部分流向积水潭。\r\n绣漪桥是连接颐和园东堤与西堤、长河与昆明湖的水陆交通要道，素有昆明湖第一桥之称。它是当年帝后们从长河水路来颐和园进入昆明湖必经的“大门”桥，清代帝后来颐和园时，经常从西直门外倚虹堂或乐善园（今北京动物园）上船，经长河从绣漪桥下进入昆明湖。', '', '0', '介绍', '30', '2号点', '1', '');
INSERT INTO `Tip` VALUES ('66', '绣漪桥头有两个孩子在桃树下玩耍', '5', '1', '位置提示', '30', '2号点', '2', '2020-04-21/26aedfc5-1bfd-46c2-b011-351f03a91bd9__20200421090054.jpg');
INSERT INTO `Tip` VALUES ('67', '西堤是颐和园昆明湖中一道自西北逶迤向东南的长堤，公元1749年乾隆十四年对西湖进行改造时建造而成。颐和园的规划设计是以杭州的西湖为蓝本，并模仿西湖的苏堤，建造了以长堤六桥、桃红柳绿为主体的跨湖古堤景观。如今这条古堤上还种植着19株当年的柳树，这个位置点也与这些古树有关。', '0', '0', '介绍', '31', '3号点', '1', '');
INSERT INTO `Tip` VALUES ('68', '时至今日，还有十九株当年的柳树生长在西堤', '5', '1', '位置提示', '31', '3号点', '2', '2020-04-21/f5ad4652-8633-4499-98eb-f0d29a410d17__20200421090107.jpg');
INSERT INTO `Tip` VALUES ('69', '“苏堤春晓”名列西湖十景之首，颐和园西堤在修建时也延用了这种桃柳相间植物景观，可谓桃红柳绿。“一株杨柳一株桃”是中国传统的植物搭配模式，在中国文化视野中“桃柳”不可分，诗句中桃、柳也常常一起出现。所以这个任务点也与这两种植物有关哦', '0', '0', '介绍', '32', '4号点', '1', '');
INSERT INTO `Tip` VALUES ('70', '这株分叉的桃树也许知道答案', '5', '1', '位置介绍', '32', '4号点', '2', '2020-04-21/48a292a1-81f4-4acb-9bf1-9d0f333d4a5b__20200421090136.jpg');
INSERT INTO `Tip` VALUES ('71', '团城湖是北京城的水源地，属一级水源保护区。上世纪60年代京密引水渠建成后，将密云水库的水引入团城湖，然后分流到城区，其日供水约120万立方米，占据全市城区日供水量的一半以上，也就是说北京城区约65%的居民都在饮用团城湖的水。南水北调（中线）工程终点最终也选在了这里，它连接密云水库和江水两大水源，采取联合调蓄的方式，由此成为京城的最大供水枢纽，故有京城“大水缸”之称。\r\n因为是水源地，所以团城湖被围了起来。', '0', '0', '介绍', '33', '5号点', '1', '');
INSERT INTO `Tip` VALUES ('72', '这棵倾向团城湖的大树也许知道答案', '5', '1', '位置提示', '33', '5号点', '2', '2020-04-21/a26a9c24-fd3b-4cda-bf5b-4b88d2067049__20200421090132.jpg');
INSERT INTO `Tip` VALUES ('73', '历史上中国是个农业大国，中国是世界上最早养蚕和织丝绸的国家，并在一个相当长的时期内，保持着这种先进的地位。在男耕女织的时代蚕桑占有重要地位，因此祭祀蚕神成了民间甚至皇家不可或缺的一项祭祀内容，祈求“桑多，蚕不病”。我们去蚕神庙看看吧', '0', '0', '介绍', '34', '6号点', '1', '');
INSERT INTO `Tip` VALUES ('74', '走到蚕神庙看看吧', '5', '1', '位置提示', '34', '6号点', '2', '2020-04-21/d0767426-1c99-4015-a646-8799f2d4a148__20200421090139.jpg');
INSERT INTO `Tip` VALUES ('75', '味闲斋位于颐和园后山，始建于乾隆十七年(1752)，咸丰十年(1860)被英法联军焚毁。它与赅春园组成了一组前临丘壑、背靠石崖的院落，体现了中国传统园林“因山构室”的造园手法。这里原本是乾隆的书斋之一，他在这里留下了很多诗词，看得出他很喜欢这里呢。如今这组建筑只留下了些许基址。', '0', '0', '介绍', '35', '7号点', '1', '2020-04-21/bc6cbc51-33ac-4754-bb58-d703c6520d92__20200421090151.jpg');
INSERT INTO `Tip` VALUES ('76', '余味斋基址遗址', '5', '1', '位置提示', '35', '7号点', '2', '2020-04-21/9fb8fb4a-772a-4b8b-9703-2e5191426324__20200421090143.jpg');
INSERT INTO `Tip` VALUES ('77', '1860年和1900年外国侵略者两次放火，颐和园的许多建筑都被烧毁，唯众香界、智慧海两度幸存。原来众香界是用砖石结构和琉璃瓦件装饰而成的，智慧海是用砖石发券砌成，俗称无梁殿,四壁皆用五色琉璃构件镶贴，这些都是耐火材料。但它们依旧没有躲过厄运，建筑上的佛头大多被“斩首”，建国后才对佛首进行了修复。', '0', '0', '介绍', '36', '8号点', '1', '');
INSERT INTO `Tip` VALUES ('78', '智慧海周围有着大量的山石，这栋建筑就像从石头中长出来一样。', '5', '1', '位置提示', '36', '8号点', '2', '2020-04-21/d39c9d6e-3b2e-4526-b94f-466089958d4d__20200421090157.jpg');
INSERT INTO `Tip` VALUES ('79', '昆明湖畔的长廊，是世界上最长的画廊，全长782米，有273间，共上万幅故事画卷。长廊中间穿过排云门，两侧对称点缀着留佳、寄澜、秋水、清遥四座重檐八角攒尖亭。象征春夏秋冬四季。', '0', '0', '介绍', '37', '9号点', '1', '');
INSERT INTO `Tip` VALUES ('80', '“留佳亭”象征哪个季节呢？', '0', '1', '位置提示', '37', '9号点', '2', '2020-04-21/978a1fa9-decc-46b9-959d-b2e0b704c3ac__20200421090210.jpg');
INSERT INTO `Tip` VALUES ('81', '靠近水边，注意危险', '5', '1', '位置提示', '37', '9号点', '3', '2020-04-21/9980b7d7-18c6-475b-8254-4e2f02de64a6__20200421090201.jpg');
INSERT INTO `Tip` VALUES ('82', '知春亭建在一座人工小岛上，这里北有山屏，南有朝阳，每年昆明湖的冰面这里最先消融。这里也是饱览万寿山昆明湖全景和玉泉山西山借景最好的观景点。“我们从昆明湖东岸的知春亭西望群峰，更觉得全园的布置很像把本来不在园内的西山也吸收进来了，作为整体景象的一个组成部分。”（钱学森）', '0', '0', '', '38', '10号点', '1', '');
INSERT INTO `Tip` VALUES ('83', '在小岛上找一个石凳坐一会欣赏一下西山吧', '5', '1', '位置提示', '38', '10号点', '2', '2020-04-21/1e69666a-5d20-40f4-954d-4682b02bdf0f__20200421161732.jpg');
INSERT INTO `Tip` VALUES ('84', 'sdfddddddddddddddd', '10', '1', '提示1', '40', '签到1', '1', '');
INSERT INTO `Tip` VALUES ('85', '11111111111', '1', '1', '提示2', '40', '签到1', '2', '');
INSERT INTO `Tip` VALUES ('86', '红色的小杯子在树上！', '5', '1', '位置提示', '42', '一号点', '1', '2020-04-29/fdc5e16f-4d8c-4554-9d5d-c9b657b05e64_IMG_20200429_125428.jpg');
INSERT INTO `Tip` VALUES ('87', '在滑梯和棋盘中间的地方', '5', '1', '位置提示2', '42', '一号点', '2', '');
INSERT INTO `Tip` VALUES ('88', '', '5', '1', '位置提示', '43', '二号点', '1', '2020-04-29/97be2f26-b8fd-493c-8312-f905a66dfd78_IMG_20200429_125627.jpg');
INSERT INTO `Tip` VALUES ('89', '它在一棵大树下面！', '5', '1', '位置提示2', '43', '二号点', '2', '');
INSERT INTO `Tip` VALUES ('90', '', '5', '1', '位置提示', '44', '三号点', '1', '2020-04-29/3c0784ac-5a57-44da-9805-324cea69c8ff_IMG_20200429_125923.jpg');
INSERT INTO `Tip` VALUES ('91', '', '5', '1', '位置提示', '45', '四号点', '1', '2020-04-29/274971f0-248c-42bd-acf6-92cbf5548ff2_IMG_20200429_130238.jpg');
INSERT INTO `Tip` VALUES ('92', '', '5', '1', '位置提示', '46', '五号点', '1', '2020-04-29/a09850ba-d87b-4c2c-8b57-b98c8f46a9e1_IMG_20200429_130610.jpg');
INSERT INTO `Tip` VALUES ('93', '', '5', '1', '位置提示', '47', '六号点', '1', '2020-04-29/04940dd1-cbc3-4727-9c70-ef71fa114e4d_IMG_20200429_130755.jpg');
INSERT INTO `Tip` VALUES ('94', '从入口进来后有一片模纹花坛，通常你可能会绕着走，现在请你走进去看看吧！', '0', '1', '位置提示1', '48', 'CP1', '1', '2020-05-06/254ece5c-44a5-4447-932e-ebed96da7afd_叶型.webp');
INSERT INTO `Tip` VALUES ('95', '如果你像鸟儿一样飞上天空，能够看到它的位置在这里！', '5', '1', '位置提示2', '48', 'CP1', '2', '');
INSERT INTO `Tip` VALUES ('96', '看看树下', '1', '1', '位置提示', '78', '一号点', '1', '');
INSERT INTO `Tip` VALUES ('97', '在这张图片的范围内哦，用眼睛发现不了的话就动动手试试吧，不过要注意安全哦！', '5', '1', '位置提示', '79', '二号点', '1', '2020-05-26/bd374d4d-6fa7-4106-b2e2-b1bd82d735d6_IMG_20200526_150031.jpg');
INSERT INTO `Tip` VALUES ('98', '考察一下你的观察力哦！这个图片能看出来是哪里吗？', '5', '1', '位置提示', '80', '三号点', '1', '2020-05-26/ae690e00-5a8a-4b0e-8f99-552d7ae7f15a_IMG_20200526_150841.jpg');
INSERT INTO `Tip` VALUES ('99', '照片这个范围，换个角度试试看！', '5', '1', '位置提示', '81', '四号点', '1', '2020-05-26/67fe3dfd-7270-4541-91de-07f2b70a46aa_IMG_20200526_151544.jpg');
INSERT INTO `Tip` VALUES ('100', '你能从这个照片推测出来位置吗？', '5', '1', '位置提示', '82', '五号点', '1', '2020-05-26/7b60ad43-ac11-4775-9d8e-510f35d9e39a_IMG_20200526_151223.jpg');
INSERT INTO `Tip` VALUES ('101', '照片里这从小草，你能判断出来是哪里吗？', '5', '1', '位置提示', '83', '六号点', '1', '2020-05-26/f811ee08-d4f0-4691-b37e-05f6f93a088c_IMG_20200526_152117.jpg');
INSERT INTO `Tip` VALUES ('102', '照片里的某个位置，找找看吧！', '5', '1', '位置提示', '84', '七号点', '1', '2020-05-26/cb78aee4-dbc7-4179-8439-5caea0c2ebfb_IMG_20200526_152732.jpg');
INSERT INTO `Tip` VALUES ('103', '这个小人是啥意思呢？你在别的地方见过这个小人吗？', '5', '1', '位置提示', '85', '八号点', '1', '2020-05-26/f393b3ca-90b1-4cb3-af46-b9874f59e1ae_timg.jpeg');
INSERT INTO `Tip` VALUES ('104', '宝盒被盖起来了，这是哪里呢？', '5', '1', '位置提示', '86', '九号点', '1', '2020-05-30/6f38e222-3b25-4a46-a9c5-7ac025b76c96_cp09.jpg');
INSERT INTO `Tip` VALUES ('105', '在照片范围里面找找吧！', '5', '1', '位置提示', '87', '十号点', '1', '2020-05-26/0ca90c1f-d02b-4e90-9c28-7f049e67f32e_IMG_20200526_155147.jpg');
INSERT INTO `Tip` VALUES ('106', '', '5', '1', '小蜜蜂飞到了杨树林中', '100', 'cp1', '1', '2020-05-30/d0d6dead-b5d9-454f-ae2b-adacc293b0b2__20200528004050.jpg');
INSERT INTO `Tip` VALUES ('107', '', '5', '1', '树洞可是蜜蜂很喜欢的地方呢', '100', 'cp1', '2', '2020-05-28/753e20bb-f812-4159-9d1d-bd8ea6c6c32c__20200528004059.jpg');
INSERT INTO `Tip` VALUES ('108', '', '5', '1', '小蜜蜂口渴了，它飞到了池塘边', '101', 'cp2', '1', '2020-05-30/11c9062c-a041-480f-ad35-db21b4d13691__20200530054213.jpg');
INSERT INTO `Tip` VALUES ('109', '', '5', '1', '蜜蜂采水不仅仅是为了解渴，稀释采集的蜂蜜、筑巢、调节巢穴的温度都离不开水', '102', 'cp3', '1', '2020-05-30/c63cdfc2-5f97-4a84-a524-100e912a3a41_20200528010224.jpg');
INSERT INTO `Tip` VALUES ('110', '', '5', '1', '如果水源地距离蜂巢太远，许多蜜蜂会因为喝不到水而死去', '102', 'cp3', '2', '2020-05-28/9cbc3ffe-85ff-48ce-bee9-cd48f766d2fb_20200528010234.jpg');
INSERT INTO `Tip` VALUES ('111', '', '5', '1', '小蜜蜂落在一棵树上休息', '103', 'cp4', '1', '2020-05-30/e44ee64f-1203-440a-9884-2ce8cd440573_20200528012622.jpg');
INSERT INTO `Tip` VALUES ('112', '', '5', '1', '走近一点找找', '103', 'cp4', '2', '2020-05-28/baeea50e-be9c-46a0-b534-02dd22f4e8a5_20200528012639.jpg');
INSERT INTO `Tip` VALUES ('113', '', '5', '1', '有一棵树上好像长着许多飞虫', '104', 'cp5', '1', '2020-05-30/5713b702-33a5-4e15-9aed-257dd26832d6_20200528014456.jpg');
INSERT INTO `Tip` VALUES ('114', '', '5', '1', '小蜜蜂决定靠近它看个究竟', '104', 'cp5', '2', '2020-05-28/7e8a42c7-df1c-430a-9d23-602197f8323d_20200528014444.jpg');
INSERT INTO `Tip` VALUES ('115', '', '5', '1', '小蜜蜂又飞到了一片芦苇丛中，落在了平台边的一株芦苇上', '105', 'cp6', '1', '2020-05-30/3414a91b-85c2-4fbe-8590-91aeff6aa68c_20200528014503.jpg');
INSERT INTO `Tip` VALUES ('116', '', '5', '1', '花丛是小蜜蜂最喜爱的地方啦', '106', 'cp7', '1', '2020-05-30/751e43df-e0bb-40e7-a127-14d4411587ea_20200528014525.jpg');
INSERT INTO `Tip` VALUES ('117', '', '5', '1', '小蜜蜂落在了一枝盛开的锦带花中', '106', 'cp7', '2', '2020-05-28/80a31a1d-bc20-451e-a90c-637b2bb8e216_20200528014516.jpg');
INSERT INTO `Tip` VALUES ('118', '', '5', '1', '黄栌又称为“smoke tree”，因为它好像笼罩了一层烟雾，小蜜蜂飞到雾里去了', '107', 'cp8', '1', '2020-05-30/68817eee-2d20-42b3-b3f7-bb71cef1da62_20200528014541.jpg');
INSERT INTO `Tip` VALUES ('119', '', '5', '1', '走近看一看', '107', 'cp8', '2', '2020-05-28/7c9fb5cf-bcb1-4e76-b05c-25f296ea20e0_20200528014535.jpg');
INSERT INTO `Tip` VALUES ('120', '', '5', '1', '花丛是小蜜蜂最喜爱的地方啦', '108', 'cp9', '1', '2020-05-30/e869ec6e-18fd-4fce-a41b-a77624953162_2020052801455.jpg');
INSERT INTO `Tip` VALUES ('121', '', '5', '1', '小蜜蜂正在采花蜜', '108', 'cp9', '2', '2020-05-28/29957384-9e23-4c20-aa12-3b4eeb568a6e_20200528014604.jpg');
INSERT INTO `Tip` VALUES ('122', '', '5', '1', '花丛是小蜜蜂最喜爱的地方啦', '109', 'cp10', '1', '2020-05-30/72ec1b5f-024e-435f-b206-5e80133c517c_20200528014625.jpg');
INSERT INTO `Tip` VALUES ('123', '', '5', '1', '小蜜蜂正在采花蜜', '109', 'cp10', '2', '2020-05-28/c11728f7-a054-427b-baaa-5413ce7e449c_20200528014617.jpg');
INSERT INTO `Tip` VALUES ('124', '', '5', '1', '松树虽然会产生很多花粉，但是蜜蜂并不喜欢它们，一只小蜜蜂不小心飞到一棵松树上了', '110', 'cp11', '1', '2020-05-30/9558d571-84e6-4dc4-81b9-0d662357575e_20200528014638.jpg');
INSERT INTO `Tip` VALUES ('125', '', '5', '1', '小蜜蜂在一颗绿色的松果上', '110', 'cp11', '2', '2020-05-28/837d3125-ac63-4ef5-b068-1df96cb2ee1d_20200528014632.jpg');
INSERT INTO `Tip` VALUES ('126', '', '5', '1', '花丛是小蜜蜂最喜爱的地方啦', '112', 'cp12', '1', '2020-05-30/1af5c404-1a3c-4400-9125-7f5f9c6b677e_20200528014704.jpg');
INSERT INTO `Tip` VALUES ('127', '', '5', '1', '小蜜蜂正在采花蜜', '112', 'cp12', '2', '2020-05-29/7d353fd4-4788-45ac-bfaf-675ec91d475f_20200528014657.jpg');
INSERT INTO `Tip` VALUES ('128', '', '5', '0', '丁香花已经谢了，小蜜蜂想去看看它曾经采过蜜的花变成了什么', '111', 'cp13', '1', '2020-05-30/a9dd2666-2f97-41be-8f34-84460222cab0_20200528014645.jpg');
INSERT INTO `Tip` VALUES ('129', '', '5', '0', '小蜜蜂躲在了叶子下', '111', 'cp13', '2', '2020-05-28/dc8c5c9a-c92f-49a1-bdbc-b45172f9a812_20200528014651.jpg');
INSERT INTO `Tip` VALUES ('130', '', '5', '0', '小蜜蜂找到了一棵“怪”柳树，似柳不是柳，它的名字叫“柽（chen）柳”', '113', 'cp14', '1', '2020-05-30/d7369c0c-2279-4e5e-b6ab-3853005f43dc_20200528014718.jpg');
INSERT INTO `Tip` VALUES ('131', '', '5', '0', '小蜜蜂决定靠近它看个究竟', '113', 'cp14', '2', '2020-05-28/1469ac85-4658-4c27-bd19-31a814a40ed3_20200528014711.jpg');
INSERT INTO `Tip` VALUES ('132', '', '5', '0', '硕苞蔷薇的果实已经长出来了，小蜜蜂想去看看它曾采过蜜的花变成什么样了', '114', 'cp15', '1', '2020-05-30/f868d251-70a4-43d4-8ce5-991bcd409eda_20200528014726.jpg');
INSERT INTO `Tip` VALUES ('133', '树洞哦', '5', '0', '小蜜蜂找到了一棵大柳树，它打算在树洞里休息一会', '115', 'cp16', '1', '2020-05-30/763780ab-949c-40a2-ab42-08e7eb295682_20200528014741.jpg');
INSERT INTO `Tip` VALUES ('134', '', '5', '0', '小蜜蜂飞到了海棠林中', '116', 'cp17', '1', '2020-05-30/81352b4a-1629-4a0a-b9d6-bc897dbb807d_20200528014755.jpg');
INSERT INTO `Tip` VALUES ('135', '', '5', '1', '海棠果已经开始成熟了', '116', 'cp17', '2', '2020-05-28/9991a23f-96d3-41f9-a334-df466ec6e802_20200528014747.jpg');
INSERT INTO `Tip` VALUES ('136', '', '5', '0', '小蜜蜂飞到了一种枝干是红色的小灌木上', '117', 'cp18', '1', '2020-05-30/48352b01-a21e-41a9-bc56-ea564cc37642_20200528014809.jpg');
INSERT INTO `Tip` VALUES ('137', '', '5', '0', '这种红色枝干的植物叫做红瑞木，白色的果实正在成熟', '117', 'cp18', '2', '2020-05-28/8e32d363-4349-4988-90b1-d5ec95b15e9e_20200528014803.jpg');
INSERT INTO `Tip` VALUES ('138', '', '5', '0', '花丛是小蜜蜂最喜爱的地方啦', '118', 'cp19', '1', '2020-05-30/ee1ac3b0-952a-4d59-b6cc-4a22cde8fc33__20200530065201.jpg');
INSERT INTO `Tip` VALUES ('139', '', '5', '0', '小蜜蜂最喜欢黄色的花', '118', 'cp19', '2', '2020-05-28/f24500d2-6ae3-46e3-80d9-c02b9e01e38b_20200528014816.jpg');
INSERT INTO `Tip` VALUES ('140', '', '5', '0', '花丛是小蜜蜂最喜爱的地方啦', '119', 'cp20', '1', '2020-05-30/582a58d9-ae1a-4c20-a413-b8707e70c841_20200528014829.jpg');
INSERT INTO `Tip` VALUES ('141', '', '5', '0', '花坛里混入了一株野花，但那正是小蜜蜂需要的', '119', 'cp20', '2', '2020-05-28/92e973cf-007b-427b-a035-cb21489a60a7_20200528014836.jpg');
INSERT INTO `Tip` VALUES ('142', '在这个范围里面翻开枯树叶看看吧', '5', '1', '位置提示', '78', '一号点', '2', '2020-05-30/654519c8-c11c-4015-b5a9-9135eee4c9cf_cp01.jpg');
INSERT INTO `Tip` VALUES ('143', '宝盒被灯柱旁边地面的叶子盖住了', '5', '1', '位置提示', '79', '二号点', '2', '');
INSERT INTO `Tip` VALUES ('144', '就在红圈里了！', '5', '1', '位置提示（剧透级提示，你确定要点开吗？）', '80', '三号点', '2', '2020-05-30/5f624c06-7d1b-430e-952d-dd0a5e014297_cp03.jpg');
INSERT INTO `Tip` VALUES ('145', '', '5', '1', '位置提示（剧透级提示，你确定要点开吗？）', '81', '四号点', '2', '2020-05-30/8454ce2d-c6f0-48a8-8713-b0158827b6dd_cp04.jpg');
INSERT INTO `Tip` VALUES ('146', '这棵树在场地东北角最东侧靠近路的地方哦，你能分辨出来东是哪个方向了吗？\r\n（此处没有图）', '5', '1', '位置提示（剧透级提示，你确定要点开吗？）', '82', '五号点', '2', '');
INSERT INTO `Tip` VALUES ('147', '照片中的草丛的位置：最南侧的柱子的东边。\r\n（这里有两个方向哦，南、东，你分清楚了吗？', '5', '1', '位置提示（剧透级提示，你确定要点开吗？）', '83', '六号点', '2', '');
INSERT INTO `Tip` VALUES ('148', '注意观察一下，照片中可以看到那个白色的柱子，你能分析出来小树苗在什么方位了吗？', '5', '1', '位置提示（剧透级提示，你确定要点开吗？）', '84', '七号点', '2', '');
INSERT INTO `Tip` VALUES ('149', '也许你已经知道了，宝盒就藏在废旧轮胎里！带有那个小人标志的轮胎哦！', '5', '1', '位置提示（剧透级提示，你确定要点开吗？）', '85', '八号点', '2', '2020-05-30/4ddbf583-ec3d-4202-a1dd-8bf91a9ced12_cp08.jpg');
INSERT INTO `Tip` VALUES ('150', '这棵树很有特点吗？你留意到地上有很多“小球球”了吗？你知道那是什么吗？', '5', '1', '位置提示（剧透级提示，你确定要点开吗？）', '86', '九号点', '2', '2020-05-30/a016e221-7ca8-4f47-90c3-9d8e53686369_cp09-2.jpg');
INSERT INTO `Tip` VALUES ('151', '看图吧！', '5', '1', '位置提示（剧透级提示，你确定要点开吗？）', '87', '十号点', '2', '2020-05-30/4da3e83f-39e4-427a-8353-856d80fb2823_cp10.jpg');

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
) ENGINE=InnoDB AUTO_INCREMENT=486 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of TipUser
-- ----------------------------
INSERT INTO `TipUser` VALUES ('19', '30', '1587050410853', '5', '提示点2', '73757', '华南虎', '7');
INSERT INTO `TipUser` VALUES ('20', '10', '1587050434055', '2', '提示2', '73757', '华南虎', '7');
INSERT INTO `TipUser` VALUES ('21', '10', '1587050437972', '3', '提示3', '73757', '华南虎', '7');
INSERT INTO `TipUser` VALUES ('22', '40', '1587082777327', '7', '奥林匹克森林南园333', '73758', '李春波', '7');
INSERT INTO `TipUser` VALUES ('23', '10', '1587082790943', '2', '提示2', '73758', '李春波', '7');
INSERT INTO `TipUser` VALUES ('24', '10', '1587082796091', '3', '提示3', '73758', '李春波', '7');
INSERT INTO `TipUser` VALUES ('25', '30', '1587082823848', '5', '提示点2', '73758', '李春波', '7');
INSERT INTO `TipUser` VALUES ('26', '30', '1587086482865', '5', '提示点2', '73759', ':pete', '7');
INSERT INTO `TipUser` VALUES ('27', '0', '1587094209253', '4', '点击解锁提示1', '73758', '李春波', '7');
INSERT INTO `TipUser` VALUES ('28', '0', '1587104327130', '9', '点击解锁提示1', '73758', '李春波', '8');
INSERT INTO `TipUser` VALUES ('29', '0', '1587185317586', '10', '点击解锁提示1', '73761', '李春波', '7');
INSERT INTO `TipUser` VALUES ('30', '5', '1587187698200', '11', '提示2', '73761', '李春波', '7');
INSERT INTO `TipUser` VALUES ('31', '10', '1587187703254', '12', '提示3', '73761', '李春波', '7');
INSERT INTO `TipUser` VALUES ('32', '0', '1587198266611', '10', '提示1', '73765', '涂涂', '7');
INSERT INTO `TipUser` VALUES ('33', '5', '1587198269903', '11', '提示2', '73765', '涂涂', '7');
INSERT INTO `TipUser` VALUES ('34', '10', '1587198275067', '12', '提示3', '73765', '涂涂', '7');
INSERT INTO `TipUser` VALUES ('35', '0', '1587198811704', '10', '提示1', '73764', '彭文洁', '7');
INSERT INTO `TipUser` VALUES ('36', '5', '1587198816138', '11', '提示2', '73764', '彭文洁', '7');
INSERT INTO `TipUser` VALUES ('37', '10', '1587198820238', '12', '提示3', '73764', '彭文洁', '7');
INSERT INTO `TipUser` VALUES ('38', '0', '1587198982742', '10', '提示1', '73768', '早起的小闹钟', '7');
INSERT INTO `TipUser` VALUES ('39', '0', '1587199048633', '9', '点击解锁提示1', '73761', '李春波', '8');
INSERT INTO `TipUser` VALUES ('40', '0', '1587212823051', '13', '提示1', '73761', '李春波', '7');
INSERT INTO `TipUser` VALUES ('41', '10', '1587212832131', '14', '提示2', '73761', '李春波', '7');
INSERT INTO `TipUser` VALUES ('42', '0', '1587213291167', '17', '提示1', '73761', '李春波', '7');
INSERT INTO `TipUser` VALUES ('43', '10', '1587213297392', '18', '提示2', '73761', '李春波', '7');
INSERT INTO `TipUser` VALUES ('44', '0', '1587220761130', '39', '提示1', '73761', '李春波', '7');
INSERT INTO `TipUser` VALUES ('45', '5', '1587292852712', '40', '提示2', '73761', '李春波', '7');
INSERT INTO `TipUser` VALUES ('46', '5', '1587292855325', '41', '提示3', '73761', '李春波', '7');
INSERT INTO `TipUser` VALUES ('47', '0', '1587294318744', '30', '提示1', '73761', '李春波', '7');
INSERT INTO `TipUser` VALUES ('48', '10', '1587294322450', '31', '提示2', '73761', '李春波', '7');
INSERT INTO `TipUser` VALUES ('49', '5', '1587294328987', '32', '提示3', '73761', '李春波', '7');
INSERT INTO `TipUser` VALUES ('50', '0', '1587294352325', '46', '提示1', '73761', '李春波', '7');
INSERT INTO `TipUser` VALUES ('51', '5', '1587294353936', '47', '提示2', '73761', '李春波', '7');
INSERT INTO `TipUser` VALUES ('52', '5', '1587294356412', '48', '提示3', '73761', '李春波', '7');
INSERT INTO `TipUser` VALUES ('53', '0', '1587294687245', '15', '提示1', '73761', '李春波', '7');
INSERT INTO `TipUser` VALUES ('54', '10', '1587294688961', '16', '提示2', '73761', '李春波', '7');
INSERT INTO `TipUser` VALUES ('55', '5', '1587295964282', '35', '提示1', '73761', '李春波', '7');
INSERT INTO `TipUser` VALUES ('56', '5', '1587295966810', '36', '提示2', '73761', '李春波', '7');
INSERT INTO `TipUser` VALUES ('57', '0', '1587304407548', '19', '提示1', '73761', '李春波', '7');
INSERT INTO `TipUser` VALUES ('58', '10', '1587304411247', '20', '提示2', '73761', '李春波', '7');
INSERT INTO `TipUser` VALUES ('59', '5', '1587311876072', '11', '提示2', '73768', '早起的小闹钟', '7');
INSERT INTO `TipUser` VALUES ('60', '10', '1587311882206', '12', '提示3', '73768', '早起的小闹钟', '7');
INSERT INTO `TipUser` VALUES ('61', '0', '1587341676582', '44', '提示1', '73761', '李春波', '7');
INSERT INTO `TipUser` VALUES ('62', '0', '1587351782587', '10', '提示1', '73762', ':pete', '7');
INSERT INTO `TipUser` VALUES ('63', '0', '1587370004990', '59', '提示1', '73773', '李罗马', '10');
INSERT INTO `TipUser` VALUES ('64', '0', '1587370417442', '51', '提示1', '73773', '李罗马', '10');
INSERT INTO `TipUser` VALUES ('65', '0', '1587370422028', '57', '提示1', '73773', '李罗马', '10');
INSERT INTO `TipUser` VALUES ('66', '0', '1587370442729', '55', '提示1', '73773', '李罗马', '10');
INSERT INTO `TipUser` VALUES ('67', '0', '1587370454664', '53', '提示1', '73773', '李罗马', '10');
INSERT INTO `TipUser` VALUES ('68', '5', '1587371421607', '60', '提示2', '73773', '李罗马', '10');
INSERT INTO `TipUser` VALUES ('69', '10', '1587371436956', '61', '提示3', '73773', '李罗马', '10');
INSERT INTO `TipUser` VALUES ('70', '5', '1587371549572', '58', '提示2', '73773', '李罗马', '10');
INSERT INTO `TipUser` VALUES ('71', '5', '1587371678245', '56', '提示2', '73773', '李罗马', '10');
INSERT INTO `TipUser` VALUES ('72', '5', '1587371899530', '52', '提示2', '73773', '李罗马', '10');
INSERT INTO `TipUser` VALUES ('73', '5', '1587372292508', '54', '提示2', '73773', '李罗马', '10');
INSERT INTO `TipUser` VALUES ('74', '0', '1587372850831', '55', '提示1', '73761', '李春波', '10');
INSERT INTO `TipUser` VALUES ('75', '5', '1587372856053', '56', '提示2', '73761', '李春波', '10');
INSERT INTO `TipUser` VALUES ('76', '10', '1587432285052', '63', '位置提示', '73765', '涂涂', '8');
INSERT INTO `TipUser` VALUES ('77', '10', '1587433250783', '64', '位置提示', '73765', '涂涂', '8');
INSERT INTO `TipUser` VALUES ('78', '0', '1587433807434', '23', '提示1', '73765', '涂涂', '7');
INSERT INTO `TipUser` VALUES ('79', '10', '1587433810575', '24', '提示2', '73765', '涂涂', '7');
INSERT INTO `TipUser` VALUES ('80', '5', '1587433823866', '37', '提示1', '73765', '涂涂', '7');
INSERT INTO `TipUser` VALUES ('81', '5', '1587433829205', '38', '提示2', '73765', '涂涂', '7');
INSERT INTO `TipUser` VALUES ('82', '0', '1587434428556', '63', '位置提示', '73761', '李春波', '8');
INSERT INTO `TipUser` VALUES ('83', '5', '1587434431591', '64', '位置提示', '73761', '李春波', '8');
INSERT INTO `TipUser` VALUES ('84', '5', '1587441907561', '66', '位置提示', '73765', '涂涂', '8');
INSERT INTO `TipUser` VALUES ('85', '5', '1587457897956', '66', '位置提示', '73761', '李春波', '8');
INSERT INTO `TipUser` VALUES ('86', '5', '1587457923192', '72', '位置提示', '73761', '李春波', '8');
INSERT INTO `TipUser` VALUES ('87', '5', '1587457931633', '74', '位置提示', '73761', '李春波', '8');
INSERT INTO `TipUser` VALUES ('88', '5', '1587457944833', '76', '位置提示', '73761', '李春波', '8');
INSERT INTO `TipUser` VALUES ('89', '5', '1587457948713', '70', '位置介绍', '73765', '涂涂', '8');
INSERT INTO `TipUser` VALUES ('90', '5', '1587457952163', '78', '位置提示', '73761', '李春波', '8');
INSERT INTO `TipUser` VALUES ('91', '5', '1587458042461', '68', '位置提示', '73765', '涂涂', '8');
INSERT INTO `TipUser` VALUES ('92', '5', '1587458166772', '72', '位置提示', '73765', '涂涂', '8');
INSERT INTO `TipUser` VALUES ('93', '5', '1587458206365', '74', '位置提示', '73765', '涂涂', '8');
INSERT INTO `TipUser` VALUES ('94', '5', '1587458344159', '76', '位置提示', '73765', '涂涂', '8');
INSERT INTO `TipUser` VALUES ('95', '5', '1587458838187', '78', '位置提示', '73765', '涂涂', '8');
INSERT INTO `TipUser` VALUES ('96', '0', '1587458957470', '80', '位置提示', '73765', '涂涂', '8');
INSERT INTO `TipUser` VALUES ('97', '5', '1587458965445', '81', '位置提示', '73765', '涂涂', '8');
INSERT INTO `TipUser` VALUES ('98', '5', '1587458984904', '83', '位置提示', '73765', '涂涂', '8');
INSERT INTO `TipUser` VALUES ('99', '0', '1587459969972', '10', '提示1', '73772', '伟丶恋岁浓更比寒﹏゛', '7');
INSERT INTO `TipUser` VALUES ('100', '0', '1587460426251', '63', '位置提示', '73777', '小琴', '8');
INSERT INTO `TipUser` VALUES ('101', '0', '1587460574030', '63', '位置提示', '73776', '曹小媛', '8');
INSERT INTO `TipUser` VALUES ('102', '0', '1587726198850', '63', '位置提示', '73787', 'Wpy', '8');
INSERT INTO `TipUser` VALUES ('103', '5', '1587726278401', '64', '位置提示', '73787', 'Wpy', '8');
INSERT INTO `TipUser` VALUES ('104', '0', '1587727134394', '10', '提示1', '73775', '王小尖儿', '7');
INSERT INTO `TipUser` VALUES ('105', '5', '1587727136455', '11', '提示2', '73775', '王小尖儿', '7');
INSERT INTO `TipUser` VALUES ('106', '5', '1587733623120', '70', '位置介绍', '73776', '曹小媛', '8');
INSERT INTO `TipUser` VALUES ('107', '5', '1587733674296', '72', '位置提示', '73776', '曹小媛', '8');
INSERT INTO `TipUser` VALUES ('108', '0', '1587736249566', '63', '位置提示', '73793', '潘红', '8');
INSERT INTO `TipUser` VALUES ('109', '5', '1587789559218', '83', '位置提示', '73787', 'Wpy', '8');
INSERT INTO `TipUser` VALUES ('110', '0', '1587790773325', '63', '位置提示', '73794', '小微子', '8');
INSERT INTO `TipUser` VALUES ('111', '5', '1587792611134', '66', '位置提示', '73788', 'liza', '8');
INSERT INTO `TipUser` VALUES ('112', '5', '1587792736895', '68', '位置提示', '73788', 'liza', '8');
INSERT INTO `TipUser` VALUES ('113', '0', '1587793200415', '10', '提示1', '73787', 'Wpy', '7');
INSERT INTO `TipUser` VALUES ('114', '0', '1587793230223', '80', '位置提示', '73788', 'liza', '8');
INSERT INTO `TipUser` VALUES ('115', '5', '1587793233827', '81', '位置提示', '73788', 'liza', '8');
INSERT INTO `TipUser` VALUES ('116', '5', '1587793341820', '78', '位置提示', '73788', 'liza', '8');
INSERT INTO `TipUser` VALUES ('117', '5', '1587796158877', '83', '位置提示', '73761', '李春波', '8');
INSERT INTO `TipUser` VALUES ('118', '0', '1587796168003', '80', '位置提示', '73761', '李春波', '8');
INSERT INTO `TipUser` VALUES ('119', '5', '1587796180834', '81', '位置提示', '73761', '李春波', '8');
INSERT INTO `TipUser` VALUES ('120', '0', '1587826809348', '63', '位置提示', '73768', '早起的小闹钟', '8');
INSERT INTO `TipUser` VALUES ('121', '0', '1587827787351', '57', '提示1', '73761', '李春波', '10');
INSERT INTO `TipUser` VALUES ('122', '0', '1587828002478', '63', '位置提示', '73760', '华南虎', '8');
INSERT INTO `TipUser` VALUES ('123', '5', '1587828008895', '64', '位置提示', '73760', '华南虎', '8');
INSERT INTO `TipUser` VALUES ('124', '0', '1587829505047', '59', '提示1', '73761', '罗马探秘', '10');
INSERT INTO `TipUser` VALUES ('125', '0', '1587862567677', '51', '提示1', '73765', '涂涂', '10');
INSERT INTO `TipUser` VALUES ('126', '5', '1587862571116', '52', '提示2', '73765', '涂涂', '10');
INSERT INTO `TipUser` VALUES ('127', '0', '1587862668227', '59', '提示1', '73765', '涂涂', '10');
INSERT INTO `TipUser` VALUES ('128', '5', '1587862670516', '60', '提示2', '73765', '涂涂', '10');
INSERT INTO `TipUser` VALUES ('129', '10', '1587862673858', '61', '提示3', '73765', '涂涂', '10');
INSERT INTO `TipUser` VALUES ('130', '0', '1587862724016', '53', '提示1', '73765', '涂涂', '10');
INSERT INTO `TipUser` VALUES ('131', '5', '1587862726676', '54', '提示2', '73765', '涂涂', '10');
INSERT INTO `TipUser` VALUES ('132', '0', '1587862751288', '55', '提示1', '73765', '涂涂', '10');
INSERT INTO `TipUser` VALUES ('133', '5', '1587862753858', '56', '提示2', '73765', '涂涂', '10');
INSERT INTO `TipUser` VALUES ('134', '0', '1587862794770', '57', '提示1', '73765', '涂涂', '10');
INSERT INTO `TipUser` VALUES ('135', '5', '1587862797504', '58', '提示2', '73765', '涂涂', '10');
INSERT INTO `TipUser` VALUES ('136', '0', '1587866131818', '63', '位置提示', '73799', '李铭', '8');
INSERT INTO `TipUser` VALUES ('137', '5', '1587866141916', '64', '位置提示', '73799', '李铭', '8');
INSERT INTO `TipUser` VALUES ('138', '5', '1587867709086', '83', '位置提示', '73799', '李铭', '8');
INSERT INTO `TipUser` VALUES ('139', '0', '1587869605250', '80', '位置提示', '73799', '李铭', '8');
INSERT INTO `TipUser` VALUES ('140', '5', '1587869693386', '81', '位置提示', '73799', '李铭', '8');
INSERT INTO `TipUser` VALUES ('141', '5', '1587870481474', '78', '位置提示', '73799', '李铭', '8');
INSERT INTO `TipUser` VALUES ('142', '0', '1587898509978', '51', '提示1', '73761', '罗马探秘', '10');
INSERT INTO `TipUser` VALUES ('143', '5', '1587898515282', '52', '提示2', '73761', '罗马探秘', '10');
INSERT INTO `TipUser` VALUES ('144', '0', '1587899022911', '53', '提示1', '73761', '罗马探秘', '10');
INSERT INTO `TipUser` VALUES ('145', '5', '1587899046564', '54', '提示2', '73761', '罗马探秘', '10');
INSERT INTO `TipUser` VALUES ('146', '5', '1587899268121', '60', '提示2', '73761', '罗马探秘', '10');
INSERT INTO `TipUser` VALUES ('147', '10', '1587899269920', '61', '提示3', '73761', '罗马探秘', '10');
INSERT INTO `TipUser` VALUES ('148', '0', '1587905848534', '55', '提示1', '73768', '早起的小闹钟', '10');
INSERT INTO `TipUser` VALUES ('149', '5', '1587905853402', '56', '提示2', '73768', '早起的小闹钟', '10');
INSERT INTO `TipUser` VALUES ('150', '5', '1587905882526', '64', '位置提示', '73768', '早起的小闹钟', '8');
INSERT INTO `TipUser` VALUES ('151', '0', '1587906895990', '19', '提示1', '73768', '早起的小闹钟', '7');
INSERT INTO `TipUser` VALUES ('152', '10', '1587906898227', '20', '提示2', '73768', '早起的小闹钟', '7');
INSERT INTO `TipUser` VALUES ('153', '5', '1587907087425', '49', '提示1', '73761', '罗马探秘', '7');
INSERT INTO `TipUser` VALUES ('154', '5', '1587907089810', '50', '提示2', '73761', '罗马探秘', '7');
INSERT INTO `TipUser` VALUES ('155', '0', '1587950353734', '25', '提示1', '73800', 'X', '7');
INSERT INTO `TipUser` VALUES ('156', '5', '1588037448823', '66', '位置提示', '73799', '李铭', '8');
INSERT INTO `TipUser` VALUES ('157', '5', '1588037717621', '68', '位置提示', '73799', '李铭', '8');
INSERT INTO `TipUser` VALUES ('158', '5', '1588039101268', '70', '位置介绍', '73799', '李铭', '8');
INSERT INTO `TipUser` VALUES ('159', '5', '1588040576889', '72', '位置提示', '73799', '李铭', '8');
INSERT INTO `TipUser` VALUES ('160', '5', '1588042179386', '74', '位置提示', '73799', '李铭', '8');
INSERT INTO `TipUser` VALUES ('161', '5', '1588044952883', '76', '位置提示', '73799', '李铭', '8');
INSERT INTO `TipUser` VALUES ('162', '5', '1588138539013', '11', '提示2', '73762', ':pete', '7');
INSERT INTO `TipUser` VALUES ('163', '5', '1588149504342', '86', '位置提示', '73773', '李罗马', '10');
INSERT INTO `TipUser` VALUES ('164', '5', '1588150022519', '87', '位置提示2', '73773', '李罗马', '10');
INSERT INTO `TipUser` VALUES ('165', '5', '1588150130799', '90', '位置提示', '73761', '罗马探秘', '10');
INSERT INTO `TipUser` VALUES ('166', '5', '1588150597613', '88', '位置提示', '73761', '罗马探秘', '10');
INSERT INTO `TipUser` VALUES ('167', '5', '1588150601794', '89', '位置提示2', '73761', '罗马探秘', '10');
INSERT INTO `TipUser` VALUES ('168', '5', '1588151790998', '92', '位置提示', '73761', '罗马探秘', '10');
INSERT INTO `TipUser` VALUES ('169', '5', '1588152397541', '93', '位置提示', '73761', '罗马探秘', '10');
INSERT INTO `TipUser` VALUES ('170', '5', '1588172748667', '86', '位置提示', '73764', '彭文洁', '10');
INSERT INTO `TipUser` VALUES ('171', '0', '1588233303037', '94', '位置提示1', '73761', '罗马探秘', '12');
INSERT INTO `TipUser` VALUES ('172', '5', '1588233312858', '95', '位置提示2', '73761', '罗马探秘', '12');
INSERT INTO `TipUser` VALUES ('173', '5', '1588399216929', '66', '位置提示', '73760', '华南虎', '8');
INSERT INTO `TipUser` VALUES ('174', '0', '1588648869785', '94', '位置提示1', '73765', '涂涂', '12');
INSERT INTO `TipUser` VALUES ('175', '5', '1588648873324', '95', '位置提示2', '73765', '涂涂', '12');
INSERT INTO `TipUser` VALUES ('176', '5', '1589030789616', '83', '位置提示', '73776', '曹小媛', '8');
INSERT INTO `TipUser` VALUES ('177', '5', '1589087689515', '74', '位置提示', '73776', '曹小媛', '8');
INSERT INTO `TipUser` VALUES ('178', '5', '1589094043739', '68', '位置提示', '73776', '曹小媛', '8');
INSERT INTO `TipUser` VALUES ('179', '5', '1589095165785', '66', '位置提示', '73776', '曹小媛', '8');
INSERT INTO `TipUser` VALUES ('180', '0', '1589097159644', '80', '位置提示', '73776', '曹小媛', '8');
INSERT INTO `TipUser` VALUES ('181', '5', '1589097171307', '81', '位置提示', '73776', '曹小媛', '8');
INSERT INTO `TipUser` VALUES ('182', '5', '1589097189392', '78', '位置提示', '73776', '曹小媛', '8');
INSERT INTO `TipUser` VALUES ('183', '5', '1589097209176', '76', '位置提示', '73776', '曹小媛', '8');
INSERT INTO `TipUser` VALUES ('184', '0', '1590395877196', '10', '提示1', '73827', '遇见柏拉图.Archi', '7');
INSERT INTO `TipUser` VALUES ('185', '5', '1590395887525', '11', '提示2', '73827', '遇见柏拉图.Archi', '7');
INSERT INTO `TipUser` VALUES ('186', '10', '1590395903939', '12', '提示3', '73827', '遇见柏拉图.Archi', '7');
INSERT INTO `TipUser` VALUES ('187', '0', '1590396032019', '94', '位置提示1', '73827', '遇见柏拉图.Archi', '12');
INSERT INTO `TipUser` VALUES ('188', '1', '1590488102858', '96', '', '73761', '李春波', '13');
INSERT INTO `TipUser` VALUES ('189', '5', '1590500006255', '98', '位置提示', '73761', '李春波', '13');
INSERT INTO `TipUser` VALUES ('190', '5', '1590538284655', '105', '位置提示', '73761', '李春波', '13');
INSERT INTO `TipUser` VALUES ('191', '5', '1590538296605', '103', '位置提示', '73761', '李春波', '13');
INSERT INTO `TipUser` VALUES ('192', '5', '1590538310926', '104', '位置提示', '73761', '李春波', '13');
INSERT INTO `TipUser` VALUES ('193', '1', '1590561220974', '96', '位置提示', '73765', '涂涂', '13');
INSERT INTO `TipUser` VALUES ('194', '5', '1590597817245', '106', '小蜜蜂飞到了杨树林中', '73765', '涂涂', '14');
INSERT INTO `TipUser` VALUES ('195', '5', '1590597824875', '107', '树洞可是蜜蜂很喜欢的地方呢', '73765', '涂涂', '14');
INSERT INTO `TipUser` VALUES ('196', '5', '1590598732334', '108', '小蜜蜂口渴了，它飞到了池塘边', '73765', '涂涂', '14');
INSERT INTO `TipUser` VALUES ('197', '5', '1590599838564', '109', '蜜蜂采水不仅仅是为了解渴，稀释采集的蜂蜜、筑巢、调节巢穴的温度都离不开水', '73765', '涂涂', '14');
INSERT INTO `TipUser` VALUES ('198', '5', '1590599846773', '110', '如果水源地距离蜂巢太远，许多蜜蜂会因为喝不到水而死去', '73765', '涂涂', '14');
INSERT INTO `TipUser` VALUES ('199', '5', '1590625434082', '111', '小蜜蜂落在一棵树上休息', '73765', '涂涂', '14');
INSERT INTO `TipUser` VALUES ('200', '5', '1590636809119', '106', '小蜜蜂飞到了杨树林中', '73761', '李春波', '14');
INSERT INTO `TipUser` VALUES ('201', '5', '1590636821168', '107', '树洞可是蜜蜂很喜欢的地方呢', '73761', '李春波', '14');
INSERT INTO `TipUser` VALUES ('202', '5', '1590637081255', '118', '黄栌又称为“smoke tree”，因为它好像笼罩了一层烟雾，小蜜蜂飞到雾里去了', '73761', '李春波', '14');
INSERT INTO `TipUser` VALUES ('203', '5', '1590645019530', '120', '花丛是小蜜蜂最喜爱的地方啦', '73761', '李春波', '14');
INSERT INTO `TipUser` VALUES ('204', '5', '1590645971869', '102', '位置提示', '73760', '华南虎', '13');
INSERT INTO `TipUser` VALUES ('205', '5', '1590667625890', '99', '位置提示', '73760', '华南虎', '13');
INSERT INTO `TipUser` VALUES ('206', '5', '1590667657339', '103', '位置提示', '73760', '华南虎', '13');
INSERT INTO `TipUser` VALUES ('207', '5', '1590669929898', '108', '小蜜蜂口渴了，它飞到了池塘边', '73761', '李春波', '14');
INSERT INTO `TipUser` VALUES ('208', '5', '1590720740949', '106', '小蜜蜂飞到了杨树林中', '73864', 'Steve', '14');
INSERT INTO `TipUser` VALUES ('209', '5', '1590720880475', '107', '树洞可是蜜蜂很喜欢的地方呢', '73864', 'Steve', '14');
INSERT INTO `TipUser` VALUES ('210', '5', '1590721849554', '106', '小蜜蜂飞到了杨树林中', '73851', 'Yvonne', '14');
INSERT INTO `TipUser` VALUES ('211', '5', '1590722190217', '107', '树洞可是蜜蜂很喜欢的地方呢', '73851', 'Yvonne', '14');
INSERT INTO `TipUser` VALUES ('212', '5', '1590722493656', '113', '有一棵树上好像长着许多飞虫', '73863', '情绪，认知-代松', '14');
INSERT INTO `TipUser` VALUES ('213', '5', '1590722496067', '114', '小蜜蜂决定靠近它看个究竟', '73863', '情绪，认知-代松', '14');
INSERT INTO `TipUser` VALUES ('214', '5', '1590723573559', '134', '小蜜蜂飞到了海棠林中', '73761', '李春波', '14');
INSERT INTO `TipUser` VALUES ('215', '5', '1590723623252', '140', '花丛是小蜜蜂最喜爱的地方啦', '73765', '涂涂', '14');
INSERT INTO `TipUser` VALUES ('216', '5', '1590723653672', '138', '花丛是小蜜蜂最喜爱的地方啦', '73765', '涂涂', '14');
INSERT INTO `TipUser` VALUES ('217', '5', '1590723655084', '133', '小蜜蜂找到了一棵大柳树，它打算在树洞里休息一会', '73761', '李春波', '14');
INSERT INTO `TipUser` VALUES ('218', '5', '1590723671569', '134', '小蜜蜂飞到了海棠林中', '73765', '涂涂', '14');
INSERT INTO `TipUser` VALUES ('219', '5', '1590723685251', '133', '小蜜蜂找到了一棵大柳树，它打算在树洞里休息一会', '73765', '涂涂', '14');
INSERT INTO `TipUser` VALUES ('220', '5', '1590723697740', '135', '海棠果已经开始成熟了', '73761', '李春波', '14');
INSERT INTO `TipUser` VALUES ('221', '5', '1590723717160', '101', '位置提示', '73761', '李春波', '13');
INSERT INTO `TipUser` VALUES ('222', '0', '1590723745873', '21', '提示1', '73765', '涂涂', '7');
INSERT INTO `TipUser` VALUES ('223', '5', '1590723746037', '45', '提示2', '73761', '李春波', '7');
INSERT INTO `TipUser` VALUES ('224', '10', '1590723749063', '22', '提示2', '73765', '涂涂', '7');
INSERT INTO `TipUser` VALUES ('225', '5', '1590723759076', '128', '丁香花已经谢了，小蜜蜂想去看看它曾经采过蜜的花变成了什么', '73761', '李春波', '14');
INSERT INTO `TipUser` VALUES ('226', '5', '1590723765068', '122', '花丛是小蜜蜂最喜爱的地方啦', '73761', '李春波', '14');
INSERT INTO `TipUser` VALUES ('227', '5', '1590723771025', '123', '小蜜蜂正在采花蜜', '73761', '李春波', '14');
INSERT INTO `TipUser` VALUES ('228', '5', '1590723787795', '119', '走近看一看', '73761', '李春波', '14');
INSERT INTO `TipUser` VALUES ('229', '5', '1590723998064', '136', '小蜜蜂飞到了一种枝干是红色的小灌木上', '73761', '李春波', '14');
INSERT INTO `TipUser` VALUES ('230', '5', '1590724039979', '109', '蜜蜂采水不仅仅是为了解渴，稀释采集的蜂蜜、筑巢、调节巢穴的温度都离不开水', '73761', '李春波', '14');
INSERT INTO `TipUser` VALUES ('231', '5', '1590724048255', '106', '小蜜蜂飞到了杨树林中', '73880', '瑜·Hermin', '14');
INSERT INTO `TipUser` VALUES ('232', '5', '1590724056616', '107', '树洞可是蜜蜂很喜欢的地方呢', '73880', '瑜·Hermin', '14');
INSERT INTO `TipUser` VALUES ('233', '5', '1590724056804', '135', '海棠果已经开始成熟了', '73760', '华南虎', '14');
INSERT INTO `TipUser` VALUES ('234', '5', '1590724057232', '111', '小蜜蜂落在一棵树上休息', '73761', '李春波', '14');
INSERT INTO `TipUser` VALUES ('235', '5', '1590724063975', '113', '有一棵树上好像长着许多飞虫', '73761', '李春波', '14');
INSERT INTO `TipUser` VALUES ('236', '5', '1590724068601', '115', '小蜜蜂又飞到了一片芦苇丛中，落在了平台边的一株芦苇上', '73761', '李春波', '14');
INSERT INTO `TipUser` VALUES ('237', '5', '1590724073001', '116', '花丛是小蜜蜂最喜爱的地方啦', '73761', '李春波', '14');
INSERT INTO `TipUser` VALUES ('238', '5', '1590724084615', '140', '花丛是小蜜蜂最喜爱的地方啦', '73880', '瑜·Hermin', '14');
INSERT INTO `TipUser` VALUES ('239', '5', '1590724099231', '124', '松树虽然会产生很多花粉，但是蜜蜂并不喜欢它们，一只小蜜蜂不小心飞到一棵松树上了', '73761', '李春波', '14');
INSERT INTO `TipUser` VALUES ('240', '5', '1590724102688', '126', '花丛是小蜜蜂最喜爱的地方啦', '73761', '李春波', '14');
INSERT INTO `TipUser` VALUES ('241', '5', '1590724138147', '133', '小蜜蜂找到了一棵大柳树，它打算在树洞里休息一会', '73760', '华南虎', '14');
INSERT INTO `TipUser` VALUES ('242', '5', '1590724140929', '108', '小蜜蜂口渴了，它飞到了池塘边', '73880', '瑜·Hermin', '14');
INSERT INTO `TipUser` VALUES ('243', '5', '1590724145241', '132', '硕苞蔷薇的果实已经长出来了，小蜜蜂想去看看它曾采过蜜的花变成什么样了', '73760', '华南虎', '14');
INSERT INTO `TipUser` VALUES ('244', '5', '1590724152451', '138', '花丛是小蜜蜂最喜爱的地方啦', '73880', '瑜·Hermin', '14');
INSERT INTO `TipUser` VALUES ('245', '5', '1590724155260', '109', '蜜蜂采水不仅仅是为了解渴，稀释采集的蜂蜜、筑巢、调节巢穴的温度都离不开水', '73764', '彭文洁', '14');
INSERT INTO `TipUser` VALUES ('246', '5', '1590724173299', '136', '小蜜蜂飞到了一种枝干是红色的小灌木上', '73880', '瑜·Hermin', '14');
INSERT INTO `TipUser` VALUES ('247', '5', '1590724178373', '140', '花丛是小蜜蜂最喜爱的地方啦', '73761', '李春波', '14');
INSERT INTO `TipUser` VALUES ('248', '5', '1590724211077', '140', '花丛是小蜜蜂最喜爱的地方啦', '73764', '彭文洁', '14');
INSERT INTO `TipUser` VALUES ('249', '5', '1590724217460', '109', '蜜蜂采水不仅仅是为了解渴，稀释采集的蜂蜜、筑巢、调节巢穴的温度都离不开水', '73880', '瑜·Hermin', '14');
INSERT INTO `TipUser` VALUES ('250', '5', '1590724231030', '111', '小蜜蜂落在一棵树上休息', '73880', '瑜·Hermin', '14');
INSERT INTO `TipUser` VALUES ('251', '5', '1590724234128', '138', '花丛是小蜜蜂最喜爱的地方啦', '73764', '彭文洁', '14');
INSERT INTO `TipUser` VALUES ('252', '5', '1590724249531', '113', '有一棵树上好像长着许多飞虫', '73880', '瑜·Hermin', '14');
INSERT INTO `TipUser` VALUES ('253', '5', '1590724257324', '136', '小蜜蜂飞到了一种枝干是红色的小灌木上', '73764', '彭文洁', '14');
INSERT INTO `TipUser` VALUES ('254', '5', '1590724268335', '133', '小蜜蜂找到了一棵大柳树，它打算在树洞里休息一会', '73880', '瑜·Hermin', '14');
INSERT INTO `TipUser` VALUES ('255', '5', '1590724273664', '133', '小蜜蜂找到了一棵大柳树，它打算在树洞里休息一会', '73764', '彭文洁', '14');
INSERT INTO `TipUser` VALUES ('256', '5', '1590724281483', '126', '花丛是小蜜蜂最喜爱的地方啦', '73760', '华南虎', '14');
INSERT INTO `TipUser` VALUES ('257', '5', '1590724282698', '132', '硕苞蔷薇的果实已经长出来了，小蜜蜂想去看看它曾采过蜜的花变成什么样了', '73764', '彭文洁', '14');
INSERT INTO `TipUser` VALUES ('258', '5', '1590724284880', '132', '硕苞蔷薇的果实已经长出来了，小蜜蜂想去看看它曾采过蜜的花变成什么样了', '73880', '瑜·Hermin', '14');
INSERT INTO `TipUser` VALUES ('259', '5', '1590724291238', '130', '小蜜蜂找到了一棵“怪”柳树，似柳不是柳，它的名字叫“柽（chen）柳”', '73764', '彭文洁', '14');
INSERT INTO `TipUser` VALUES ('260', '5', '1590724299324', '128', '丁香花已经谢了，小蜜蜂想去看看它曾经采过蜜的花变成了什么', '73764', '彭文洁', '14');
INSERT INTO `TipUser` VALUES ('261', '5', '1590724306342', '130', '小蜜蜂找到了一棵“怪”柳树，似柳不是柳，它的名字叫“柽（chen）柳”', '73880', '瑜·Hermin', '14');
INSERT INTO `TipUser` VALUES ('262', '5', '1590724311738', '126', '花丛是小蜜蜂最喜爱的地方啦', '73764', '彭文洁', '14');
INSERT INTO `TipUser` VALUES ('263', '5', '1590724320921', '128', '丁香花已经谢了，小蜜蜂想去看看它曾经采过蜜的花变成了什么', '73880', '瑜·Hermin', '14');
INSERT INTO `TipUser` VALUES ('264', '5', '1590724322277', '124', '松树虽然会产生很多花粉，但是蜜蜂并不喜欢它们，一只小蜜蜂不小心飞到一棵松树上了', '73764', '彭文洁', '14');
INSERT INTO `TipUser` VALUES ('265', '5', '1590724326777', '126', '花丛是小蜜蜂最喜爱的地方啦', '73880', '瑜·Hermin', '14');
INSERT INTO `TipUser` VALUES ('266', '5', '1590724331079', '118', '黄栌又称为“smoke tree”，因为它好像笼罩了一层烟雾，小蜜蜂飞到雾里去了', '73764', '彭文洁', '14');
INSERT INTO `TipUser` VALUES ('267', '5', '1590724335018', '124', '松树虽然会产生很多花粉，但是蜜蜂并不喜欢它们，一只小蜜蜂不小心飞到一棵松树上了', '73880', '瑜·Hermin', '14');
INSERT INTO `TipUser` VALUES ('268', '5', '1590724338520', '119', '走近看一看', '73764', '彭文洁', '14');
INSERT INTO `TipUser` VALUES ('269', '5', '1590724349925', '120', '花丛是小蜜蜂最喜爱的地方啦', '73880', '瑜·Hermin', '14');
INSERT INTO `TipUser` VALUES ('270', '5', '1590724370116', '118', '黄栌又称为“smoke tree”，因为它好像笼罩了一层烟雾，小蜜蜂飞到雾里去了', '73880', '瑜·Hermin', '14');
INSERT INTO `TipUser` VALUES ('271', '5', '1590724374639', '111', '小蜜蜂落在一棵树上休息', '73764', '彭文洁', '14');
INSERT INTO `TipUser` VALUES ('272', '5', '1590724382831', '119', '走近看一看', '73880', '瑜·Hermin', '14');
INSERT INTO `TipUser` VALUES ('273', '5', '1590724391751', '132', '硕苞蔷薇的果实已经长出来了，小蜜蜂想去看看它曾采过蜜的花变成什么样了', '73761', '李春波', '14');
INSERT INTO `TipUser` VALUES ('276', '5', '1590724702867', '130', '小蜜蜂找到了一棵“怪”柳树，似柳不是柳，它的名字叫“柽（chen）柳”', '73761', '李春波', '14');
INSERT INTO `TipUser` VALUES ('277', '5', '1590724762282', '141', '花坛里混入了一株野花，但那正是小蜜蜂需要的', '73761', '李春波', '14');
INSERT INTO `TipUser` VALUES ('278', '5', '1590724898363', '106', '小蜜蜂飞到了杨树林中', '73768', '早起的小闹钟', '14');
INSERT INTO `TipUser` VALUES ('279', '5', '1590724903847', '107', '树洞可是蜜蜂很喜欢的地方呢', '73768', '早起的小闹钟', '14');
INSERT INTO `TipUser` VALUES ('280', '5', '1590724916840', '135', '海棠果已经开始成熟了', '73768', '早起的小闹钟', '14');
INSERT INTO `TipUser` VALUES ('281', '5', '1590724991327', '125', '小蜜蜂在一颗绿色的松果上', '73761', '李春波', '14');
INSERT INTO `TipUser` VALUES ('282', '5', '1590725052336', '141', '花坛里混入了一株野花，但那正是小蜜蜂需要的', '73765', '涂涂', '14');
INSERT INTO `TipUser` VALUES ('283', '5', '1590725112687', '112', '走近一点找找', '73765', '涂涂', '14');
INSERT INTO `TipUser` VALUES ('284', '5', '1590725122921', '110', '如果水源地距离蜂巢太远，许多蜜蜂会因为喝不到水而死去', '73761', '李春波', '14');
INSERT INTO `TipUser` VALUES ('285', '5', '1590725133096', '112', '走近一点找找', '73761', '李春波', '14');
INSERT INTO `TipUser` VALUES ('286', '5', '1590725147754', '117', '小蜜蜂落在了一枝盛开的锦带花中', '73761', '李春波', '14');
INSERT INTO `TipUser` VALUES ('287', '5', '1590725158491', '121', '小蜜蜂正在采花蜜', '73761', '李春波', '14');
INSERT INTO `TipUser` VALUES ('288', '5', '1590725171652', '127', '小蜜蜂正在采花蜜', '73761', '李春波', '14');
INSERT INTO `TipUser` VALUES ('289', '0', '1590725454029', '25', '提示1', '73761', '李春波', '7');
INSERT INTO `TipUser` VALUES ('290', '10', '1590725461271', '26', '提示2', '73761', '李春波', '7');
INSERT INTO `TipUser` VALUES ('291', '0', '1590725472797', '27', '提示1', '73761', '李春波', '7');
INSERT INTO `TipUser` VALUES ('292', '10', '1590725474156', '28', '提示2', '73761', '李春波', '7');
INSERT INTO `TipUser` VALUES ('293', '5', '1590725477069', '29', '提示3', '73761', '李春波', '7');
INSERT INTO `TipUser` VALUES ('294', '0', '1590725489435', '23', '提示1', '73761', '李春波', '7');
INSERT INTO `TipUser` VALUES ('295', '10', '1590725491641', '24', '提示2', '73761', '李春波', '7');
INSERT INTO `TipUser` VALUES ('296', '0', '1590725513102', '42', '提示1', '73761', '李春波', '7');
INSERT INTO `TipUser` VALUES ('297', '5', '1590725514963', '43', '提示2', '73761', '李春波', '7');
INSERT INTO `TipUser` VALUES ('298', '5', '1590725521157', '37', '提示1', '73761', '李春波', '7');
INSERT INTO `TipUser` VALUES ('299', '5', '1590725523761', '38', '提示2', '73761', '李春波', '7');
INSERT INTO `TipUser` VALUES ('300', '5', '1590726417843', '106', '小蜜蜂飞到了杨树林中', '73764', '彭文洁', '14');
INSERT INTO `TipUser` VALUES ('301', '5', '1590726424122', '108', '小蜜蜂口渴了，它飞到了池塘边', '73764', '彭文洁', '14');
INSERT INTO `TipUser` VALUES ('302', '5', '1590726441443', '113', '有一棵树上好像长着许多飞虫', '73764', '彭文洁', '14');
INSERT INTO `TipUser` VALUES ('303', '5', '1590726446229', '115', '小蜜蜂又飞到了一片芦苇丛中，落在了平台边的一株芦苇上', '73764', '彭文洁', '14');
INSERT INTO `TipUser` VALUES ('304', '5', '1590726452265', '116', '花丛是小蜜蜂最喜爱的地方啦', '73764', '彭文洁', '14');
INSERT INTO `TipUser` VALUES ('305', '5', '1590727725820', '135', '海棠果已经开始成熟了', '73882', '空间探秘', '14');
INSERT INTO `TipUser` VALUES ('306', '5', '1590727900828', '127', '小蜜蜂正在采花蜜', '73760', '华南虎', '14');
INSERT INTO `TipUser` VALUES ('307', '5', '1590727919039', '124', '松树虽然会产生很多花粉，但是蜜蜂并不喜欢它们，一只小蜜蜂不小心飞到一棵松树上了', '73760', '华南虎', '14');
INSERT INTO `TipUser` VALUES ('308', '5', '1590727931079', '125', '小蜜蜂在一颗绿色的松果上', '73760', '华南虎', '14');
INSERT INTO `TipUser` VALUES ('309', '5', '1590727947831', '116', '花丛是小蜜蜂最喜爱的地方啦', '73760', '华南虎', '14');
INSERT INTO `TipUser` VALUES ('310', '5', '1590727957185', '117', '小蜜蜂落在了一枝盛开的锦带花中', '73760', '华南虎', '14');
INSERT INTO `TipUser` VALUES ('311', '5', '1590729272608', '106', '小蜜蜂飞到了杨树林中', '73878', '小莉', '14');
INSERT INTO `TipUser` VALUES ('312', '5', '1590731336979', '108', '小蜜蜂口渴了，它飞到了池塘边', '73845', '焦南威', '14');
INSERT INTO `TipUser` VALUES ('313', '0', '1590732656805', '10', '提示1', '73760', '华南虎', '7');
INSERT INTO `TipUser` VALUES ('314', '5', '1590732658689', '11', '提示2', '73760', '华南虎', '7');
INSERT INTO `TipUser` VALUES ('315', '10', '1590732661295', '12', '提示3', '73760', '华南虎', '7');
INSERT INTO `TipUser` VALUES ('316', '5', '1590733203289', '99', '位置提示', '73761', '李春波', '13');
INSERT INTO `TipUser` VALUES ('317', '5', '1590733456525', '118', '黄栌又称为“smoke tree”，因为它好像笼罩了一层烟雾，小蜜蜂飞到雾里去了', '73765', '涂涂', '14');
INSERT INTO `TipUser` VALUES ('318', '5', '1590734960993', '108', '小蜜蜂口渴了，它飞到了池塘边', '73853', '? Erin程艳', '14');
INSERT INTO `TipUser` VALUES ('319', '5', '1590736377556', '106', '小蜜蜂飞到了杨树林中', '73890', '陈明群', '14');
INSERT INTO `TipUser` VALUES ('320', '5', '1590736382775', '107', '树洞可是蜜蜂很喜欢的地方呢', '73890', '陈明群', '14');
INSERT INTO `TipUser` VALUES ('321', '5', '1590738321392', '111', '小蜜蜂落在一棵树上休息', '73890', '陈明群', '14');
INSERT INTO `TipUser` VALUES ('322', '5', '1590739640578', '106', '小蜜蜂飞到了杨树林中', '73883', '陈福祥', '14');
INSERT INTO `TipUser` VALUES ('323', '5', '1590740400146', '111', '小蜜蜂落在一棵树上休息', '73891', '文静', '14');
INSERT INTO `TipUser` VALUES ('324', '5', '1590740493127', '126', '花丛是小蜜蜂最喜爱的地方啦', '73765', '涂涂', '14');
INSERT INTO `TipUser` VALUES ('325', '5', '1590740496374', '127', '小蜜蜂正在采花蜜', '73765', '涂涂', '14');
INSERT INTO `TipUser` VALUES ('326', '5', '1590741733764', '113', '有一棵树上好像长着许多飞虫', '73891', '文静', '14');
INSERT INTO `TipUser` VALUES ('327', '5', '1590741905837', '114', '小蜜蜂决定靠近它看个究竟', '73891', '文静', '14');
INSERT INTO `TipUser` VALUES ('328', '5', '1590742511595', '115', '小蜜蜂又飞到了一片芦苇丛中，落在了平台边的一株芦苇上', '73891', '文静', '14');
INSERT INTO `TipUser` VALUES ('329', '5', '1590748664927', '104', '位置提示', '73760', '华南虎', '13');
INSERT INTO `TipUser` VALUES ('330', '1', '1590748672814', '96', '位置提示', '73760', '华南虎', '13');
INSERT INTO `TipUser` VALUES ('331', '5', '1590748679627', '97', '位置提示', '73760', '华南虎', '13');
INSERT INTO `TipUser` VALUES ('332', '5', '1590748699798', '105', '位置提示', '73760', '华南虎', '13');
INSERT INTO `TipUser` VALUES ('333', '5', '1590749344031', '135', '海棠果已经开始成熟了', '73892', '晓静', '14');
INSERT INTO `TipUser` VALUES ('334', '5', '1590800063609', '144', '位置提示（剧透级提示，你确定要点开吗？）', '73761', '李春波', '13');
INSERT INTO `TipUser` VALUES ('335', '5', '1590805169657', '101', '位置提示', '73904', 'thomas', '13');
INSERT INTO `TipUser` VALUES ('336', '1', '1590805381937', '96', '位置提示', '73843', 'Sasha', '13');
INSERT INTO `TipUser` VALUES ('337', '1', '1590805466111', '96', '位置提示', '73909', '白又白', '13');
INSERT INTO `TipUser` VALUES ('338', '5', '1590805703521', '100', '位置提示', '73904', 'thomas', '13');
INSERT INTO `TipUser` VALUES ('339', '5', '1590805786516', '142', '位置提示', '73909', '白又白', '13');
INSERT INTO `TipUser` VALUES ('340', '5', '1590805822988', '101', '位置提示', '73901', 'momo', '13');
INSERT INTO `TipUser` VALUES ('341', '5', '1590805851010', '97', '位置提示', '73902', 'XD', '13');
INSERT INTO `TipUser` VALUES ('342', '5', '1590805869491', '104', '位置提示', '73902', 'XD', '13');
INSERT INTO `TipUser` VALUES ('343', '5', '1590805878864', '97', '位置提示', '73899', '波波', '13');
INSERT INTO `TipUser` VALUES ('344', '5', '1590805900800', '99', '位置提示', '73904', 'thomas', '13');
INSERT INTO `TipUser` VALUES ('345', '1', '1590806154202', '96', '位置提示', '73899', '波波', '13');
INSERT INTO `TipUser` VALUES ('346', '5', '1590806174271', '98', '位置提示', '73904', 'thomas', '13');
INSERT INTO `TipUser` VALUES ('347', '5', '1590806230663', '104', '位置提示', '73829', '纳之   luke', '13');
INSERT INTO `TipUser` VALUES ('348', '5', '1590806234503', '150', '位置提示（剧透级提示，你确定要点开吗？）', '73829', '纳之   luke', '13');
INSERT INTO `TipUser` VALUES ('349', '5', '1590806367707', '105', '位置提示', '73906', '董湘辉', '13');
INSERT INTO `TipUser` VALUES ('350', '5', '1590806479652', '144', '位置提示（剧透级提示，你确定要点开吗？）', '73904', 'thomas', '13');
INSERT INTO `TipUser` VALUES ('351', '5', '1590806483096', '99', '位置提示', '73899', '波波', '13');
INSERT INTO `TipUser` VALUES ('352', '5', '1590806488632', '100', '位置提示', '73901', 'momo', '13');
INSERT INTO `TipUser` VALUES ('353', '5', '1590806564112', '100', '位置提示', '73899', '波波', '13');
INSERT INTO `TipUser` VALUES ('354', '5', '1590806652511', '97', '位置提示', '73904', 'thomas', '13');
INSERT INTO `TipUser` VALUES ('355', '5', '1590806763221', '99', '位置提示', '73900', '崔岩', '13');
INSERT INTO `TipUser` VALUES ('356', '1', '1590808340039', '96', '位置提示', '73914', '琵琶语', '13');
INSERT INTO `TipUser` VALUES ('357', '1', '1590808345830', '96', '位置提示', '73917', '晓红', '13');
INSERT INTO `TipUser` VALUES ('358', '1', '1590808647062', '96', '位置提示', '73919', '马宁', '13');
INSERT INTO `TipUser` VALUES ('359', '5', '1590808649048', '104', '位置提示', '73921', '张医生', '13');
INSERT INTO `TipUser` VALUES ('360', '1', '1590808658241', '96', '位置提示', '73920', '小白杨', '13');
INSERT INTO `TipUser` VALUES ('361', '5', '1590808750686', '142', '位置提示', '73919', '马宁', '13');
INSERT INTO `TipUser` VALUES ('362', '1', '1590808846035', '96', '位置提示', '73922', '玫', '13');
INSERT INTO `TipUser` VALUES ('363', '5', '1590808945316', '103', '位置提示', '73920', '小白杨', '13');
INSERT INTO `TipUser` VALUES ('364', '1', '1590809129799', '96', '位置提示', '73916', '丫头楚', '13');
INSERT INTO `TipUser` VALUES ('365', '5', '1590809162697', '104', '位置提示', '73918', '大脸熊猫', '13');
INSERT INTO `TipUser` VALUES ('366', '5', '1590809213346', '142', '位置提示', '73916', '丫头楚', '13');
INSERT INTO `TipUser` VALUES ('367', '5', '1590809254902', '103', '位置提示', '73921', '张医生', '13');
INSERT INTO `TipUser` VALUES ('368', '5', '1590809418867', '102', '位置提示', '73921', '张医生', '13');
INSERT INTO `TipUser` VALUES ('369', '5', '1590809736488', '142', '位置提示', '73914', '琵琶语', '13');
INSERT INTO `TipUser` VALUES ('370', '1', '1590809757617', '96', '位置提示', '73921', '张医生', '13');
INSERT INTO `TipUser` VALUES ('371', '1', '1590809785362', '96', '位置提示', '73918', '大脸熊猫', '13');
INSERT INTO `TipUser` VALUES ('372', '5', '1590809801012', '142', '位置提示', '73918', '大脸熊猫', '13');
INSERT INTO `TipUser` VALUES ('373', '5', '1590810059160', '99', '位置提示', '73916', '丫头楚', '13');
INSERT INTO `TipUser` VALUES ('374', '5', '1590810258952', '142', '位置提示', '73921', '张医生', '13');
INSERT INTO `TipUser` VALUES ('375', '5', '1590810290151', '103', '位置提示', '73918', '大脸熊猫', '13');
INSERT INTO `TipUser` VALUES ('376', '5', '1590810297391', '149', '位置提示（剧透级提示，你确定要点开吗？）', '73918', '大脸熊猫', '13');
INSERT INTO `TipUser` VALUES ('377', '5', '1590810329841', '100', '位置提示', '73916', '丫头楚', '13');
INSERT INTO `TipUser` VALUES ('378', '5', '1590810395793', '101', '位置提示', '73921', '张医生', '13');
INSERT INTO `TipUser` VALUES ('379', '1', '1590810445786', '96', '位置提示', '73906', '董湘辉', '13');
INSERT INTO `TipUser` VALUES ('380', '5', '1590810592332', '102', '位置提示', '73918', '大脸熊猫', '13');
INSERT INTO `TipUser` VALUES ('381', '5', '1590810610482', '105', '位置提示', '73922', '玫', '13');
INSERT INTO `TipUser` VALUES ('382', '5', '1590810657045', '101', '位置提示', '73916', '丫头楚', '13');
INSERT INTO `TipUser` VALUES ('383', '5', '1590810703026', '97', '位置提示', '73916', '丫头楚', '13');
INSERT INTO `TipUser` VALUES ('384', '5', '1590810739804', '98', '位置提示', '73916', '丫头楚', '13');
INSERT INTO `TipUser` VALUES ('385', '5', '1590810761955', '144', '位置提示（剧透级提示，你确定要点开吗？）', '73916', '丫头楚', '13');
INSERT INTO `TipUser` VALUES ('386', '5', '1590810776024', '100', '位置提示', '73921', '张医生', '13');
INSERT INTO `TipUser` VALUES ('387', '5', '1590810840546', '146', '位置提示（剧透级提示，你确定要点开吗？）', '73921', '张医生', '13');
INSERT INTO `TipUser` VALUES ('388', '5', '1590810889790', '104', '位置提示', '73914', '琵琶语', '13');
INSERT INTO `TipUser` VALUES ('389', '5', '1590810975591', '101', '位置提示', '73918', '大脸熊猫', '13');
INSERT INTO `TipUser` VALUES ('390', '5', '1590811006075', '147', '位置提示（剧透级提示，你确定要点开吗？）', '73918', '大脸熊猫', '13');
INSERT INTO `TipUser` VALUES ('391', '5', '1590811126256', '142', '位置提示', '73920', '小白杨', '13');
INSERT INTO `TipUser` VALUES ('392', '5', '1590811188506', '101', '位置提示', '73920', '小白杨', '13');
INSERT INTO `TipUser` VALUES ('393', '5', '1590811191717', '99', '位置提示', '73921', '张医生', '13');
INSERT INTO `TipUser` VALUES ('394', '5', '1590811205346', '145', '位置提示（剧透级提示，你确定要点开吗？）', '73921', '张医生', '13');
INSERT INTO `TipUser` VALUES ('395', '1', '1590811254328', '96', '位置提示', '73923', '张伟', '13');
INSERT INTO `TipUser` VALUES ('396', '5', '1590811268535', '147', '位置提示（剧透级提示，你确定要点开吗？）', '73920', '小白杨', '13');
INSERT INTO `TipUser` VALUES ('397', '5', '1590811479103', '142', '位置提示', '73923', '张伟', '13');
INSERT INTO `TipUser` VALUES ('398', '1', '1590817860306', '96', '位置提示', '73933', '石嘉林', '13');
INSERT INTO `TipUser` VALUES ('399', '1', '1590817869786', '96', '位置提示', '73929', '小十', '13');
INSERT INTO `TipUser` VALUES ('400', '1', '1590817998577', '96', '位置提示', '73931', 'AIA?Carolineʚ?ྀིɞ', '13');
INSERT INTO `TipUser` VALUES ('401', '1', '1590818019614', '96', '位置提示', '73928', '王启勇', '13');
INSERT INTO `TipUser` VALUES ('402', '5', '1590818121688', '104', '位置提示', '73930', '郭允', '13');
INSERT INTO `TipUser` VALUES ('403', '5', '1590818155281', '97', '位置提示', '73931', 'AIA?Carolineʚ?ྀིɞ', '13');
INSERT INTO `TipUser` VALUES ('404', '5', '1590818175120', '97', '位置提示', '73843', 'Sasha', '13');
INSERT INTO `TipUser` VALUES ('405', '5', '1590818279483', '142', '位置提示', '73929', '小十', '13');
INSERT INTO `TipUser` VALUES ('406', '1', '1590818548636', '96', '位置提示', '73934', 'Cherry', '13');
INSERT INTO `TipUser` VALUES ('407', '5', '1590818565740', '143', '位置提示', '73931', 'AIA?Carolineʚ?ྀིɞ', '13');
INSERT INTO `TipUser` VALUES ('408', '5', '1590818662822', '98', '位置提示', '73932', '雪梅', '13');
INSERT INTO `TipUser` VALUES ('409', '5', '1590818681385', '144', '位置提示（剧透级提示，你确定要点开吗？）', '73932', '雪梅', '13');
INSERT INTO `TipUser` VALUES ('410', '5', '1590818784145', '97', '位置提示', '73932', '雪梅', '13');
INSERT INTO `TipUser` VALUES ('411', '5', '1590818799431', '143', '位置提示', '73932', '雪梅', '13');
INSERT INTO `TipUser` VALUES ('412', '5', '1590818885518', '99', '位置提示', '73931', 'AIA?Carolineʚ?ྀིɞ', '13');
INSERT INTO `TipUser` VALUES ('413', '5', '1590818929546', '145', '位置提示（剧透级提示，你确定要点开吗？）', '73931', 'AIA?Carolineʚ?ྀིɞ', '13');
INSERT INTO `TipUser` VALUES ('414', '5', '1590818937351', '99', '位置提示', '73932', '雪梅', '13');
INSERT INTO `TipUser` VALUES ('415', '1', '1590818965557', '96', '位置提示', '73926', 'James 開', '13');
INSERT INTO `TipUser` VALUES ('416', '1', '1590818967005', '96', '位置提示', '73930', '郭允', '13');
INSERT INTO `TipUser` VALUES ('417', '5', '1590818982089', '105', '位置提示', '73930', '郭允', '13');
INSERT INTO `TipUser` VALUES ('418', '5', '1590818991150', '105', '位置提示', '73933', '石嘉林', '13');
INSERT INTO `TipUser` VALUES ('419', '5', '1590819222801', '100', '位置提示', '73931', 'AIA?Carolineʚ?ྀིɞ', '13');
INSERT INTO `TipUser` VALUES ('420', '5', '1590819273966', '100', '位置提示', '73932', '雪梅', '13');
INSERT INTO `TipUser` VALUES ('421', '5', '1590819274127', '146', '位置提示（剧透级提示，你确定要点开吗？）', '73931', 'AIA?Carolineʚ?ྀིɞ', '13');
INSERT INTO `TipUser` VALUES ('422', '5', '1590819279266', '146', '位置提示（剧透级提示，你确定要点开吗？）', '73932', '雪梅', '13');
INSERT INTO `TipUser` VALUES ('423', '5', '1590819360330', '103', '位置提示', '73926', 'James 開', '13');
INSERT INTO `TipUser` VALUES ('424', '5', '1590819363199', '103', '位置提示', '73929', '小十', '13');
INSERT INTO `TipUser` VALUES ('425', '5', '1590819519345', '104', '位置提示', '73933', '石嘉林', '13');
INSERT INTO `TipUser` VALUES ('426', '5', '1590819533107', '101', '位置提示', '73931', 'AIA?Carolineʚ?ྀིɞ', '13');
INSERT INTO `TipUser` VALUES ('427', '5', '1590819555928', '147', '位置提示（剧透级提示，你确定要点开吗？）', '73931', 'AIA?Carolineʚ?ྀིɞ', '13');
INSERT INTO `TipUser` VALUES ('428', '5', '1590819559285', '101', '位置提示', '73932', '雪梅', '13');
INSERT INTO `TipUser` VALUES ('429', '5', '1590819565555', '147', '位置提示（剧透级提示，你确定要点开吗？）', '73932', '雪梅', '13');
INSERT INTO `TipUser` VALUES ('430', '5', '1590819662507', '104', '位置提示', '73929', '小十', '13');
INSERT INTO `TipUser` VALUES ('431', '5', '1590819770967', '103', '位置提示', '73930', '郭允', '13');
INSERT INTO `TipUser` VALUES ('432', '5', '1590819778186', '142', '位置提示', '73934', 'Cherry', '13');
INSERT INTO `TipUser` VALUES ('433', '5', '1590820048381', '103', '位置提示', '73931', 'AIA?Carolineʚ?ྀིɞ', '13');
INSERT INTO `TipUser` VALUES ('434', '5', '1590820051966', '102', '位置提示', '73932', '雪梅', '13');
INSERT INTO `TipUser` VALUES ('435', '5', '1590820057447', '148', '位置提示（剧透级提示，你确定要点开吗？）', '73932', '雪梅', '13');
INSERT INTO `TipUser` VALUES ('436', '5', '1590820085697', '97', '位置提示', '73928', '王启勇', '13');
INSERT INTO `TipUser` VALUES ('437', '5', '1590820138486', '103', '位置提示', '73933', '石嘉林', '13');
INSERT INTO `TipUser` VALUES ('438', '5', '1590820179043', '102', '位置提示', '73931', 'AIA?Carolineʚ?ྀིɞ', '13');
INSERT INTO `TipUser` VALUES ('439', '5', '1590820257311', '102', '位置提示', '73930', '郭允', '13');
INSERT INTO `TipUser` VALUES ('440', '5', '1590820262162', '103', '位置提示', '73932', '雪梅', '13');
INSERT INTO `TipUser` VALUES ('441', '5', '1590820265789', '149', '位置提示（剧透级提示，你确定要点开吗？）', '73932', '雪梅', '13');
INSERT INTO `TipUser` VALUES ('442', '5', '1590820325784', '104', '位置提示', '73931', 'AIA?Carolineʚ?ྀིɞ', '13');
INSERT INTO `TipUser` VALUES ('443', '5', '1590820340024', '105', '位置提示', '73929', '小十', '13');
INSERT INTO `TipUser` VALUES ('444', '5', '1590820363253', '105', '位置提示', '73931', 'AIA?Carolineʚ?ྀིɞ', '13');
INSERT INTO `TipUser` VALUES ('445', '5', '1590820392305', '102', '位置提示', '73933', '石嘉林', '13');
INSERT INTO `TipUser` VALUES ('446', '5', '1590820504251', '101', '位置提示', '73933', '石嘉林', '13');
INSERT INTO `TipUser` VALUES ('447', '5', '1590820664018', '143', '位置提示', '73928', '王启勇', '13');
INSERT INTO `TipUser` VALUES ('448', '5', '1590820685762', '150', '位置提示（剧透级提示，你确定要点开吗？）', '73931', 'AIA?Carolineʚ?ྀིɞ', '13');
INSERT INTO `TipUser` VALUES ('449', '5', '1590820713015', '98', '位置提示', '73928', '王启勇', '13');
INSERT INTO `TipUser` VALUES ('450', '5', '1590820720306', '104', '位置提示', '73932', '雪梅', '13');
INSERT INTO `TipUser` VALUES ('451', '5', '1590820723425', '150', '位置提示（剧透级提示，你确定要点开吗？）', '73932', '雪梅', '13');
INSERT INTO `TipUser` VALUES ('452', '5', '1590820748852', '100', '位置提示', '73920', '小白杨', '13');
INSERT INTO `TipUser` VALUES ('453', '5', '1590820750638', '142', '位置提示', '73930', '郭允', '13');
INSERT INTO `TipUser` VALUES ('454', '5', '1590820799458', '101', '位置提示', '73930', '郭允', '13');
INSERT INTO `TipUser` VALUES ('455', '5', '1590821048218', '99', '位置提示', '73920', '小白杨', '13');
INSERT INTO `TipUser` VALUES ('456', '5', '1590822347741', '105', '位置提示', '73920', '小白杨', '13');
INSERT INTO `TipUser` VALUES ('457', '5', '1590825486359', '113', '有一棵树上好像长着许多飞虫', '73765', '涂涂', '14');
INSERT INTO `TipUser` VALUES ('458', '5', '1590920411415', '111', '小蜜蜂落在一棵树上休息', '73946', '对方正在输入...', '14');
INSERT INTO `TipUser` VALUES ('459', '5', '1590920507447', '112', '走近一点找找', '73946', '对方正在输入...', '14');
INSERT INTO `TipUser` VALUES ('460', '5', '1590921322056', '116', '花丛是小蜜蜂最喜爱的地方啦', '73946', '对方正在输入...', '14');
INSERT INTO `TipUser` VALUES ('461', '5', '1590921324478', '117', '小蜜蜂落在了一枝盛开的锦带花中', '73946', '对方正在输入...', '14');
INSERT INTO `TipUser` VALUES ('462', '5', '1590921795378', '122', '花丛是小蜜蜂最喜爱的地方啦', '73946', '对方正在输入...', '14');
INSERT INTO `TipUser` VALUES ('463', '5', '1590921797463', '123', '小蜜蜂正在采花蜜', '73946', '对方正在输入...', '14');
INSERT INTO `TipUser` VALUES ('464', '5', '1591088546118', '151', '位置提示（剧透级提示，你确定要点开吗？）', '73761', '李春波', '13');
INSERT INTO `TipUser` VALUES ('465', '0', '1591852001083', '42', '提示1', '73956', '愚者', '7');
INSERT INTO `TipUser` VALUES ('466', '5', '1591852007327', '43', '提示2', '73956', '愚者', '7');
INSERT INTO `TipUser` VALUES ('467', '0', '1591852019193', '10', '提示1', '73956', '愚者', '7');
INSERT INTO `TipUser` VALUES ('468', '5', '1591852021264', '11', '提示2', '73956', '愚者', '7');
INSERT INTO `TipUser` VALUES ('469', '10', '1591852029793', '12', '提示3', '73956', '愚者', '7');
INSERT INTO `TipUser` VALUES ('470', '0', '1592306179921', '33', '提示1', '73761', '李春波', '7');
INSERT INTO `TipUser` VALUES ('471', '10', '1592306184317', '34', '提示2', '73761', '李春波', '7');
INSERT INTO `TipUser` VALUES ('472', '0', '1592383935571', '10', '提示1', '73861', 'Frank', '7');
INSERT INTO `TipUser` VALUES ('473', '5', '1592623160385', '49', '提示1', '73760', '华南虎', '7');
INSERT INTO `TipUser` VALUES ('474', '5', '1592984135055', '37', '提示1', '73760', '华南虎', '7');
INSERT INTO `TipUser` VALUES ('475', '5', '1593489595561', '86', '位置提示', '73761', '李春波', '10');
INSERT INTO `TipUser` VALUES ('476', '5', '1593489597806', '87', '位置提示2', '73761', '李春波', '10');
INSERT INTO `TipUser` VALUES ('477', '5', '1594207328885', '50', '提示2', '73760', '华南虎', '7');
INSERT INTO `TipUser` VALUES ('478', '5', '1595753090427', '142', '位置提示', '73761', '李春波', '13');
INSERT INTO `TipUser` VALUES ('479', '0', '1596517100059', '33', '提示1', '73765', '涂涂', '7');
INSERT INTO `TipUser` VALUES ('480', '10', '1596517103750', '34', '提示2', '73765', '涂涂', '7');
INSERT INTO `TipUser` VALUES ('481', '0', '1596970229366', '10', '提示1', '73953', '王宁', '7');
INSERT INTO `TipUser` VALUES ('482', '5', '1596970231724', '11', '提示2', '73953', '王宁', '7');
INSERT INTO `TipUser` VALUES ('483', '10', '1596970236518', '12', '提示3', '73953', '王宁', '7');
INSERT INTO `TipUser` VALUES ('484', '0', '1597453109980', '21', '提示1', '73761', '李春波', '7');
INSERT INTO `TipUser` VALUES ('485', '10', '1597453116183', '22', '提示2', '73761', '李春波', '7');

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
) ENGINE=InnoDB AUTO_INCREMENT=73973 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of User
-- ----------------------------
INSERT INTO `User` VALUES ('1', null, null, null, null, null, null, null, null, 'admin', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '100', null, null, 'xgty6789');
INSERT INTO `User` VALUES ('73757', null, null, null, null, null, null, null, null, '华南虎', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLXwuPzS8pT4ppzc0uvuia385tSJYcbGmILowia7CpIxDDZtoGPZGbR5YDa8EYEthBTPrZjibiaJQIVicA/132', 'ogWSG5M9wFafOuRXnfJeCQ8l47Pc', '40', null, null, null);
INSERT INTO `User` VALUES ('73758', null, null, null, null, null, null, null, null, '李春波', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erysrH0OaUqYicGsH16GogD1ibRsRQQR5CfMvnFvCFV1naGRenicQqPU315UNkCstwQ0vQPKyhicGeD3w/132', 'ogWSG5Adbm5GZEGAUmWZxrVFGk40', '-140', null, null, null);
INSERT INTO `User` VALUES ('73759', null, null, null, null, null, null, null, null, ':pete', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEJD7GKVqIXAuoHAKntHMx15etaYqVU3hM4lswsoFuCIgsXkiaPv9vok4n2EEGVHuJvFmfpP319xK0A/132', 'ogWSG5BoZTH5M4vYQIOP5_jZKzmQ', '70', null, null, null);
INSERT INTO `User` VALUES ('73760', null, null, null, null, null, null, null, null, '华南虎', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIIUH3BGFGtkU9mmndUno1ofsfFAiazBFo4RRQ7wDIlnAibKs20jPSbLAkaDvv8TRfR5D47VgC2Lj6g/132', 'obwPJ5fWCJNU3FgkSElkMUMX0eHo', '164', null, null, null);
INSERT INTO `User` VALUES ('73761', null, null, null, null, null, null, null, null, '李春波', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqibpsEeWiafrVN25rmQ4ibHg0CUSqRGQgCWoSoBM2NwS32b2mW66xv7tPXebFzejAJiaiaL5icx28yI7Wg/132', 'obwPJ5TQJ_IHPCbvAx2cxzx32uL0', '1339', null, null, null);
INSERT INTO `User` VALUES ('73762', null, null, null, null, null, null, null, null, ':pete', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEJ7yzPeZnps9AE8FAZRFFvHibTnicubFEnc0BQqhamkByliaFbabia5v0JX1OM3D70O5iczvSIib4XCibFTA/132', 'obwPJ5SyKGNP9wbisPNPPAP81nqM', '95', null, null, null);
INSERT INTO `User` VALUES ('73763', null, null, null, null, null, null, null, null, '田翼飞', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKeVnpqP0MpPiaUHIo8TO04kVfhhA1mmRURy6By0a132vQREIy3RufibSaicJJnHyjg4C5OtX0vvOthw/132', 'obwPJ5bUOpHT6eXkt-3ez0bL_YNk', '100', null, null, null);
INSERT INTO `User` VALUES ('73764', null, null, null, null, null, null, null, null, '彭文洁', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoDtOOL5Tc4m7a5SsZFDn24TcOP4duXzF9kgBqcSuJ4gS471XAMMzXU5vZV01DsKqiaibLJPicGhopmQ/132', 'obwPJ5YnwlJSozThSguIalApAaws', '-10', null, null, null);
INSERT INTO `User` VALUES ('73765', null, null, null, null, null, null, null, null, '涂涂', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEIsPEgQcQgAFdickOQnFJBe3oiaRRlMJMqhtzia3VHNFdjNpWPDAk24buCfv6oKybm7bD1Nic8Q4MJ0JA/132', 'obwPJ5WZaDOROECjmjIXjc07Vyeg', '219', null, null, null);
INSERT INTO `User` VALUES ('73766', null, null, null, null, null, null, null, null, '超_越梦想', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/WpuliadwRAJEvd0TySyibdGDOTKQBged0tGvtEAyOSw7HIkLwBxo7eJuc5z2hw7tWmOSh8icp82X94buI7Z6AiboMQ/132', 'obwPJ5WHUQdC1ePuAoU6RCezLhJM', '110', null, null, null);
INSERT INTO `User` VALUES ('73767', null, null, null, null, null, null, null, null, '福星高照', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/sz7nSDb1CybDgHS5SbBHm1MaFtVL7lYibhrQyvQBUHuwFmIias3DXl0owkZqtia9H0dMf5z0FmUlPKwuicN2iawmj7Q/132', 'obwPJ5c_lfVhMRuPc97A3sfUxs8Y', '100', null, null, null);
INSERT INTO `User` VALUES ('73768', null, null, null, null, null, null, null, null, '早起的小闹钟', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/HSmxgfxziaUYvsXeUEaricQyDTUzWUl9Do53lTFOa91ib7rPQ5Lq924e9J94p7pCPHPlicUVOJD2H7ILUGC72tutlw/132', 'obwPJ5dGuh0r1nLnDFYsZ3J6ajL4', '450', null, null, null);
INSERT INTO `User` VALUES ('73769', null, null, null, null, null, null, null, null, '林冠强', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmhead/opZOGNdqEfbIicqlqNr5oR5dI3kJQDicYMVxgu0adSFD4/132', 'obwPJ5cWvQZUvDufTg0Byu17I2YU', '100', null, null, null);
INSERT INTO `User` VALUES ('73770', null, null, null, null, null, null, null, null, '许静雯', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmhead/QMqrBDJ7Jzc8RNlfPNaN2gGvt17zKI9b228MHIeTpNs/132', 'obwPJ5cLV2PCM0RnXU3kJcY2eF-U', '100', null, null, null);
INSERT INTO `User` VALUES ('73771', null, null, null, null, null, null, null, null, '清新', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEJ3Jyjy8YPVqXTJl9Aiav5IPYaB6dEPvjOswjsfIKRXL1CbOWwskZDZPEMgVmL0niag2U4JuMYic13gA/132', 'obwPJ5ZTcAOJza1ZAptEVLpRuVJQ', '100', null, null, null);
INSERT INTO `User` VALUES ('73772', null, null, null, null, null, null, null, null, '伟丶恋岁浓更比寒﹏゛', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaELt2QVOXuy7ewPal12l3h4icLpPH7JnkgY6oL7OmB6zw3mFx5LVakbeLv1enMriakecAyoLR101ibUOw/132', 'obwPJ5cvTDjuRJwcTui3P653gz3k', '100', null, null, null);
INSERT INTO `User` VALUES ('73773', null, null, null, null, null, null, null, null, '李罗马', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/k8g3JxSJcA4Mer1ytb3OicN1UFbdjP8aWeMRXotxMwLNsXmf20oIhDPhsDnP92XvFxLSohsNQdrAQ2r6ZCsDAkg/132', 'obwPJ5bOQwQF2SMsQTpK8E1_3IoY', '55', null, null, null);
INSERT INTO `User` VALUES ('73774', null, null, null, null, null, null, null, null, '蔡怡君', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmhead/HpqvLmh1Gnf2v03sUfwzNbczPvdFKh5RoE5qZ6KlibIs/132', 'obwPJ5Zj5H35Asxawv0Ju2q2BKq8', '100', null, null, null);
INSERT INTO `User` VALUES ('73775', null, null, null, null, null, null, null, null, '王小尖儿', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKnctCtj6hz1aR3I0fcf13Gjhia5qt2GLsfBFb6RWoPJJoM0x9dKiaFoofdW1YGu2oB3smZTqFtvRwQ/132', 'obwPJ5aWFCLYvKU1U9Kg4y_1_DGA', '95', null, null, null);
INSERT INTO `User` VALUES ('73776', null, null, null, null, null, null, null, null, '曹小媛', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJLg6o4tkvX4sBoN5ViajBwm8S5uNJQWsaAjXKvaC83tiaic1a7t8k1Uo0u4VSy5BHbBwrGRta8yRq7A/132', 'obwPJ5eNAABNtkWVgH-6ew6NMgYI', '55', null, null, null);
INSERT INTO `User` VALUES ('73777', null, null, null, null, null, null, null, null, '小琴', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJ747Uxrz5yvgtBwhyxwdLFjdNe0mHRRUmQTkXEWEDBsPwo7AaQApklq2asQgTtPUBhm17CY3zDAQ/132', 'obwPJ5Ued-Iijw3pfaJinukx4D-0', '100', null, null, null);
INSERT INTO `User` VALUES ('73778', null, null, null, null, null, null, null, null, '钟炜', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJMByJvGle7HtdLWUHpuXhUm1hZZHNbzddkicmP2MOV0yytvDGaLMqNxVZAXGFq8bQzRNQywmNsicvA/132', 'obwPJ5bA-OfcMXY9ztFpIqQkdc2E', '100', null, null, null);
INSERT INTO `User` VALUES ('73779', null, null, null, null, null, null, null, null, '张清振', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q3auHgzwzM5QNFWsra4mb32ib8UJ4Uffa0hFPPgtMgs6KXOxPpNiaXTLdhdX8ickMqQcjha0EJ2Uiaxsoymt5Rf1ZQ/132', 'obwPJ5XfhH8nD6lLQsq8n76HpPmY', '100', null, null, null);
INSERT INTO `User` VALUES ('73780', null, null, null, null, null, null, null, null, '李海龙', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLMSiclhB8Z4VonWJBAicjibkjoiasqVPg8pPVoJlflYGricFcalMVARqrOs8RyOND6iaxnz4QGFXFzRQVQ/132', 'obwPJ5fR1-L1lTwjAk_51EJmvdPU', '100', null, null, null);
INSERT INTO `User` VALUES ('73781', null, null, null, null, null, null, null, null, 'sོnoopy', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJ9PZBR1HmmC7TBpoOrR0iclVndHa5FGhr2ZMdibVU5siauQELhlibKUNt9QW75VJicArK5rpWmPFjLN8g/132', 'obwPJ5ZJ1HKyzX2eDtz_edKUD8q8', '100', null, null, null);
INSERT INTO `User` VALUES ('73782', null, null, null, null, null, null, null, null, '惠惠', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJyG2ZfEMSLw0iaxHtkgSHvpkIbHnwgw0IAI4SIGhBQTTLUdVam6ok195wibOsKicLyCUPO3ErZL2iaLQ/132', 'obwPJ5TrBj0Yy0uEruXoKksNAQQM', '100', null, null, null);
INSERT INTO `User` VALUES ('73783', null, null, null, null, null, null, null, null, '马宁', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLhicDSmL4vicPAZoAicnaGJVUoxsZp6WOysqZic80pM5Kn9hicjKlJClQPj2rXZNicNw7IJyMiac39GmQ7A/132', 'obwPJ5akpzLG7-FLvERxcZ6knTME', '100', null, null, null);
INSERT INTO `User` VALUES ('73784', null, null, null, null, null, null, null, null, '菠菠', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eojJT01AB4JhpNDxyIJiaIWic4HIRE9eHUOMk77EVBe97RntroGcY2Tb8icFEawnFQAsTiadT5nWnyWibA/132', 'obwPJ5cRpX-ki68DvAZnD8vBW7fw', '100', null, null, null);
INSERT INTO `User` VALUES ('73785', null, null, null, null, null, null, null, null, '刘皓', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83ergNK1vI32HjoswKvVQ0LLZlzux1DWHYhz6iahSY0WaTiayH00XjOnBqU3iaqvhYBbBtIYwDwPaxLh9w/132', 'obwPJ5T8GyXtkN5qbWPHJ_35cUb0', '100', null, null, null);
INSERT INTO `User` VALUES ('73786', null, null, null, null, null, null, null, null, 'zོ', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJoxGT4myibvqQOLDYiakoUcyjlJ9YHyIMm92L6rNt45jkM3zf9CiaqkbiacIMGwXRypJ1BzAyvTiay4rQ/132', 'obwPJ5elrDDtapl-0rfGBN7slV0g', '100', null, null, null);
INSERT INTO `User` VALUES ('73787', null, null, null, null, null, null, null, null, 'Wpy', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJLg6o4tkvX4qYsCVpOUsibr5XavcAIibicg0Dgm6dwPWen0piaS6kkG8po35jXuhbhgwbbfwRg2iberjA/132', 'obwPJ5elddrcfvswtnjAa-x64jCg', '90', null, null, null);
INSERT INTO `User` VALUES ('73788', null, null, null, null, null, null, null, null, 'liza', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKGh1MbMsusUUWiaQiaUX05bbgU8rEA76OEJMUTUTr3iaJuM8W0PjsA14tSHEGbufNib5nNozzTGE6ysQ/132', 'obwPJ5YA3P13dhn04e-81sDNDjnI', '80', null, null, null);
INSERT INTO `User` VALUES ('73789', null, null, null, null, null, null, null, null, '梅贞', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTL8bkxdc5LXXS7Xuxa5Q1jxoR8v2X4gwP6wdaCq8P5vGUbxmETmXkyR1WaAcIEa5HwzUJ5pvoNSCg/132', 'obwPJ5f5Egbv8g9_QLI_iwBCbzQk', '100', null, null, null);
INSERT INTO `User` VALUES ('73790', null, null, null, null, null, null, null, null, '石文琦', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTL0dFbFPuuIJdt3jJP56HcnpKzIlFys1eJLkAw6a0nNWKMCtUWic2FrnNqVdAR5xdibP8PibddAnW2kA/132', 'obwPJ5THPhNDtr57BNae3Yg-BGxY', '100', null, null, null);
INSERT INTO `User` VALUES ('73791', null, null, null, null, null, null, null, null, '木目', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eovY5YhcicuuhQTabzGOJnnCJI7gNYpNfiaN8icspyzSJWPykrAtI22QxjnFFVTEiazkHOfAULqYZtu4Q/132', 'obwPJ5XBNlLe5cRqXZk3S4ZL4AFM', '100', null, null, null);
INSERT INTO `User` VALUES ('73792', null, null, null, null, null, null, null, null, '一修', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIdLb8NKicjSXrRwcbBpnGqc6ufj7r8ExZBewwwGIHDtNssXzyJ0IqYOTiaLPth05x18iaiafIJoekn3Q/132', 'obwPJ5QPJmUxrGs8aVMVeehqf0QQ', '100', null, null, null);
INSERT INTO `User` VALUES ('73793', null, null, null, null, null, null, null, null, '潘红', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIln5OtavXADlrN4nxWP0l81ia02NicVRJDbbYaP0iaONib73lz83pyxOcficicsst6husXn5wIakmSD30A/132', 'obwPJ5Vu6E-Epc6cyqZ-qW8jcgbo', '100', null, null, null);
INSERT INTO `User` VALUES ('73794', null, null, null, null, null, null, null, null, '小微子', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/wdK2icrgILDicU2ofuEtkG3oqB9zE0wz8FxHpBd0ibRh1CmVS9xd2LeNs7WcictbOB1SqNuwyNQeJfGP2cptKwUvaQ/132', 'obwPJ5Ql8RM_X9gqHRkf9Wd8BWqQ', '100', null, null, null);
INSERT INTO `User` VALUES ('73795', null, null, null, null, null, null, null, null, 'hanhan', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaELGKuic2icxphXeURI10EQtaibF2Bru6MSVCoa6CaAOabJvmycSQviayKSbFqe6XLZ7an88kqwPBsicSgQ/132', 'obwPJ5aAz-P3fQPwIGE9P8wN2WPo', '100', null, null, null);
INSERT INTO `User` VALUES ('73796', null, null, null, null, null, null, null, null, '陈伟孝', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmhead/1g0iax6wubUmYibpETSa5W8YqxaV0CnNKEic9aib2dJOCJo/132', 'obwPJ5XpktuIi9bhdPufR4FYAfTs', '100', null, null, null);
INSERT INTO `User` VALUES ('73797', null, null, null, null, null, null, null, null, '唐盛人', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmhead/YLTIDXqxdHuByeFRFjxrvrJHKX1icMvxNAaKiaIQuDWAs/132', 'obwPJ5Vnfxx0qgkBGoeRQ5vyh1iE', '100', null, null, null);
INSERT INTO `User` VALUES ('73798', null, null, null, null, null, null, null, null, '蔡雅惠', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmhead/jCDUmhZFaticrLX8gZpPHna5NKETjCicD9o53qsvhSZb8/132', 'obwPJ5a_vVSc3Z_hol9HzKCiivO4', '100', null, null, null);
INSERT INTO `User` VALUES ('73799', null, null, null, null, null, null, null, null, '李铭', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJROwzRqp5JG7kZRzeN5SdX4uUGFrPadPlw3MPRuibh8C46exzp4Tv5qsibgib4lN0VpPwVqlNLtTa1Q/132', 'obwPJ5fJmTJj3JaLNX2JXncQkT0s', '50', null, null, null);
INSERT INTO `User` VALUES ('73800', null, null, null, null, null, null, null, null, 'X', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epVtTjz8saNKBjob1ia8KBz5hiarqMJoonhnRpUJuucDrjpk3Ulp9eXUl8gQIPwuwtibEN0fIUd2gjMg/132', 'obwPJ5Vm3v0xepGL48ErNaF9J_X4', '100', null, null, null);
INSERT INTO `User` VALUES ('73801', null, null, null, null, null, null, null, null, '张文娟', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLHnGMCzRlZsicI4osH6Jcf5qQsd3aRmoMNVVHDbe4LnKN2RF55LV6FyC2PCtdCbRq0crXG8Gz9ibtA/132', 'obwPJ5fDk5o4O5YsaMXJGCCXR0-M', '100', null, null, null);
INSERT INTO `User` VALUES ('73803', null, null, null, null, null, null, null, null, '李秀慧', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmhead/XyTrCa2ASJibZic6ZHU5aEpVTNvP4H9dCO59rzib0crHgg/132', 'obwPJ5SyPsLKgmhPgL9Mh9-WQegk', '100', null, null, null);
INSERT INTO `User` VALUES ('73804', null, null, null, null, null, null, null, null, '潘嘉玲', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmhead/hxZ0yTicB8p8jgwKt2RVuGriaqX68m17nTdVicolWxT3NA/132', 'obwPJ5TrrxGMY2rOVeFa2i-GtWJQ', '100', null, null, null);
INSERT INTO `User` VALUES ('73805', null, null, null, null, null, null, null, null, '邱健江', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmhead/DSqwErSlwibicWYFluf5xj6JyRugkEuY9T0LHR3F4Bialk/132', 'obwPJ5fRJNnrTcyJz_nX2yxKb0XI', '100', null, null, null);
INSERT INTO `User` VALUES ('73806', null, null, null, null, null, null, null, null, '刘萱俐', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmhead/uFHhyUXlL5Xibf5rrtBbjAVicowichC5icyQicRfQaBEkUwk/132', 'obwPJ5Tr_y56aYHRsQBFiLt-45HI', '100', null, null, null);
INSERT INTO `User` VALUES ('73807', null, null, null, null, null, null, null, null, '林凯翔', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmhead/r6UlBX94vTTia1j3RTe3MSDusb6NVrFiaCOo5guRGcLT0/132', 'obwPJ5fCUb2UmtX8Mjtef3EOdjpw', '100', null, null, null);
INSERT INTO `User` VALUES ('73808', null, null, null, null, null, null, null, null, '林立强', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmhead/KPeNcgqzYU2Fib7cPz0qy1dRs4HKLTvdm9Kgw16HKbX8/132', 'obwPJ5eb6x-cNDyFaaQ2-JX7D0Uc', '100', null, null, null);
INSERT INTO `User` VALUES ('73809', null, null, null, null, null, null, null, null, '王嘉豪', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmhead/pEybdxLsgFATahEbNqib1p0EcX8bY4R21MrtaZZ0BUYM/132', 'obwPJ5XFUQXE9VSuK7MEFr5bgYMA', '100', null, null, null);
INSERT INTO `User` VALUES ('73810', null, null, null, null, null, null, null, null, '许文菱', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmhead/F26ZCeFJ7Og4wnKn9eUgAe5AIDlsjHIGgyjn6cHDcdA/132', 'obwPJ5QRZhETTFOFps30t1v14Fh4', '100', null, null, null);
INSERT INTO `User` VALUES ('73811', null, null, null, null, null, null, null, null, '刘丽颖', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmhead/g9NGeASbVQ5p9hFIWIicicL6t1ACSrdbGibN4Trw5VBL8Q/132', 'obwPJ5YSstC3vUXOSDC8OruhgtY8', '100', null, null, null);
INSERT INTO `User` VALUES ('73812', null, null, null, null, null, null, null, null, '母笑阳', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEL4QH3jCCAcU4Twj4mgCNEsYzv9D472ZVib5DhMsj7iczCiaHJgWiaxgqJ9xOFLzGfm9Ur4svoRdiaJGfA/132', 'obwPJ5Z-vzZ04oUJ4JeTc1eA6Gjs', '100', null, null, null);
INSERT INTO `User` VALUES ('73813', null, null, null, null, null, null, null, null, '林诗雅', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmhead/VqoFnIczXESs0ko1g45ETz3YP9vGTmfLloLh6qqibfa8/132', 'obwPJ5YoF_ugOcy-2GCixglRM1RM', '100', null, null, null);
INSERT INTO `User` VALUES ('73814', null, null, null, null, null, null, null, null, '林惠婷', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmhead/b9yyXYENSe2N1Kf3e9PYeFibkp7829I0S5cBXrt2mYRw/132', 'obwPJ5a3nsC8wSsG_4UffLk-hHM8', '100', null, null, null);
INSERT INTO `User` VALUES ('73815', null, null, null, null, null, null, null, null, '林秋谦', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmhead/omicpG7EWflL4viaaGaicPicNEBkJDdc975b6yCX7zrKSfU/132', 'obwPJ5b87xs3oeokWmDFpgyfxKIA', '100', null, null, null);
INSERT INTO `User` VALUES ('73816', null, null, null, null, null, null, null, null, '曾惠雯', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmhead/MdOQmLIdYPFMYjkM2Vge0CuicGauh8DibSavydBoXw2Po/132', 'obwPJ5fuG0x4hd1thQyR1pYinjlU', '100', null, null, null);
INSERT INTO `User` VALUES ('73817', null, null, null, null, null, null, null, null, '黄沛杰', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmhead/EgQz4hfDj7c4CqMIaoMcvWysQkRYiaFY5ib6fDEvJsE8o/132', 'obwPJ5d7cb9hi_EudPPzPyXNmco8', '100', null, null, null);
INSERT INTO `User` VALUES ('73818', null, null, null, null, null, null, null, null, '黄明韦', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmhead/GcCicpspEP1XeoCeX2s1NmHkRX8v1AMM3nTP5Ud7hCCM/132', 'obwPJ5UfZYZ5jBUUVJ0foHfpxfhY', '100', null, null, null);
INSERT INTO `User` VALUES ('73819', null, null, null, null, null, null, null, null, '林瑞惠', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmhead/mC2uWafZOBcyCmhDf5MHmmE0Rup8JnxAAMA7j4gPXrg/132', 'obwPJ5QuhNqvEhzIvmGvRuh5H-x0', '100', null, null, null);
INSERT INTO `User` VALUES ('73820', null, null, null, null, null, null, null, null, '陈立绮', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmhead/XYUDB2GRSYWeMsCl22nPalhtE5iaLHV5e2w3PXbicSsZI/132', 'obwPJ5dDmHAmXT7v1Y6g2YimjlPY', '100', null, null, null);
INSERT INTO `User` VALUES ('73821', null, null, null, null, null, null, null, null, '徐真宜', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmhead/7zNhzibE5ylWpa4cz15yLKhLVFd1lfZ8vLYicKNL3CxFM/132', 'obwPJ5RGRroXJ0I0-QkjTonwfCLc', '100', null, null, null);
INSERT INTO `User` VALUES ('73822', null, null, null, null, null, null, null, null, '刘亭宝', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmhead/ibjKK8ALRQzByGmlJhRFhuRhXp6ImwicJibcN1bzesFibicY/132', 'obwPJ5fdzmvkyzCdeOgJGQchCJNo', '100', null, null, null);
INSERT INTO `User` VALUES ('73823', null, null, null, null, null, null, null, null, '林平琴', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmhead/teCC2ju9Vyiar9jjnib03t74IvHicicaicHmRj53IrlY4rO4/132', 'obwPJ5d-Ov-lfCFVuIj_E19vwlPc', '100', null, null, null);
INSERT INTO `User` VALUES ('73824', null, null, null, null, null, null, null, null, '辛福', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEIJuxIM0wZXbaic0NEj5hAyalys4G0WgE5IzjZutbGshjPgZMYd9Z2qZuYzUPAB8HibPzMbNOWykfBw/132', 'obwPJ5XInh_YgekMdWYmv7wL61zY', '100', null, null, null);
INSERT INTO `User` VALUES ('73825', null, null, null, null, null, null, null, null, '荆彦璋', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmhead/W49vcDExaMibicDQ52vSUQI80yeicRjcOdFCdoace96YYI/132', 'obwPJ5YOWt2eTnTK7HDXaGkYuClI', '100', null, null, null);
INSERT INTO `User` VALUES ('73826', null, null, null, null, null, null, null, null, '陈美慧', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmhead/TNoNRuDmoGuGCibZQV9BAXaHAhsmUSicI4icu9dJlwFdoU/132', 'obwPJ5TYSBB8opYccOTDudHn-1B8', '100', null, null, null);
INSERT INTO `User` VALUES ('73827', null, null, null, null, null, null, null, null, '遇见柏拉图.Archi', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/ofoBNyS72rB2PAarjlDn2oh35KsneqFeialyudaINhic3ZBKBTuUnhLa97ZF89LdYNQRhrchL0PHd2ZAMfYQVfQQ/132', 'obwPJ5Rs2AkcGBm814COAsnu7pBk', '85', null, null, null);
INSERT INTO `User` VALUES ('73828', null, null, null, null, null, null, null, null, '方方', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIz7rUmS9KibXqxghJLeFXGlGUgzKRbjwuGHlUGlMTQU96E4s4bfH98ocOcoficB0LlPb3kM6ibX73Ow/132', 'obwPJ5cqn1ggdLpvG9vHZZzv6p2M', '100', null, null, null);
INSERT INTO `User` VALUES ('73829', null, null, null, null, null, null, null, null, '纳之   luke', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/icXowsOdKyDJ5RC5u86exvwNzaa0dWZRmlfa8Wj5MkYicDvFT4yOt4WW5OJv9zxgO9bVts2rwhca7j0icWHicwTtoQ/132', 'obwPJ5UJcR41RVkbgw7DCntJWbB4', '140', null, null, null);
INSERT INTO `User` VALUES ('73830', null, null, null, null, null, null, null, null, '法治（龙马）', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/kw7t39qFKz5AuOo8gD1D5opDWuGgzQibibIDNdU2smbM3Cv3KT5wgdIbFFG4KP1Q9JLvhlib5bIHf0JhuXROHjvhA/132', 'obwPJ5W6662ygfoto5S6ZvlNzkiI', '180', null, null, null);
INSERT INTO `User` VALUES ('73831', null, null, null, null, null, null, null, null, '游美营地教育 | 爱笑?', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEJIjZ92wDKSbpQriapSI4cmtf0NtqEobSY9dUUsOpvLcavf93u3PFsWibBRGCN2eq1q9IxSZeKiaCkeQ/132', 'obwPJ5Ue2FhMlqRPA3lbyG-Jnw9g', '100', null, null, null);
INSERT INTO `User` VALUES ('73832', null, null, null, null, null, null, null, null, 'HH', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTK6KBwbL9ib95Jl9FLH5X9YichuooYce0yX95VGnaibibR8B9woogtTXl6Ncd0dEYjOia9uRib8VpicyxQOA/132', 'obwPJ5bPPS7u-eceRfV-CMGDB41c', '210', null, null, null);
INSERT INTO `User` VALUES ('73833', null, null, null, null, null, null, null, null, '林慧齐', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmhead/0PficMg2FogXRvHibk2kflUuwwNKfWa3dPW4XyvEhx4I4/132', 'obwPJ5ftrOs2uhVtqNJB8YNbOyLY', '100', null, null, null);
INSERT INTO `User` VALUES ('73834', null, null, null, null, null, null, null, null, '赖家欣', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmhead/9KcZ4M66Hic729jA7FzF6ibfdEh9ZsV6EzTgchXT5za2A/132', 'obwPJ5Wgfg-myee2yLLlCJ8URNl4', '100', null, null, null);
INSERT INTO `User` VALUES ('73835', null, null, null, null, null, null, null, null, '狗蛋', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKIMTKCP4Cz1ic41ue0y1F2Bcnxp17CGYCqBlsDdDAia4JC2V7CHhJRaWK7nVv78ejxKqkRvOseC5iaQ/132', 'obwPJ5diG6iwHRIFXtVAeLwBeQZw', '100', null, null, null);
INSERT INTO `User` VALUES ('73836', null, null, null, null, null, null, null, null, '晓华', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIib27EgrVEHuZXVhSxPqiazGTvVZLBRMCLicRVzLdV9CL8U7PRwtCHib9zfWiaNY2HewGSJkNqKhY63yQ/132', 'obwPJ5Vvykcy3WFR4ONspmF_hJ70', '100', null, null, null);
INSERT INTO `User` VALUES ('73837', null, null, null, null, null, null, null, null, '李文芳', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTL78Noj3VYbPVxOnqxkHgRDHQxfboUMJMGWy1oFRIGmeo7JtwlDpwVvIUAtfy9ApaGFMN7zd0OhkQ/132', 'obwPJ5ZhlmNCcr33qzNcld7ZFc7M', '120', null, null, null);
INSERT INTO `User` VALUES ('73838', null, null, null, null, null, null, null, null, '王立言', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://thirdwx.qlogo.cn/mmopen/vi_32/DssanbDibLbCrZCEyWFBwicia3Z9lzxia0Pa9ib45OSDEZMXqqkwuT5iaTyZwclWfqOGjUGDtTleToyuwSO2bELbwdEw/132', 'obwPJ5eGHdXb_kt8MmFviV_utnfo', '100', null, null, null);
INSERT INTO `User` VALUES ('73839', null, null, null, null, null, null, null, null, '清风', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/YEQ8PA64TQVALCTHrg22n38JlCymaOSA8NIT1cIEbmIOMZ4C4gq8JsmA3JAsrmXK0ZWzqQgtFqZfwKQt6UnMtA/132', 'obwPJ5eYu9-A9pUBzJ-GHw0zFIbQ', '160', null, null, null);
INSERT INTO `User` VALUES ('73840', null, null, null, null, null, null, null, null, '木木', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/W6nHicp48aS07iaOGVaDWT5pXycUWDXoP2IibKJ38bnu1FiaNCT6pjBoPSO8jbic3Rvoh4mG0pEViaplf8nxzFXlunqQ/132', 'obwPJ5Yy_iXwXeRlWcRbPOxDadZo', '100', null, null, null);
INSERT INTO `User` VALUES ('73841', null, null, null, null, null, null, null, null, '林承翰', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmhead/5K0hfA5Hg2ib5fBcvlbz9fPEIUW6A6gAp3cN5QLjSu6k/132', 'obwPJ5azImyfA8WvcbD3aqIvsL9A', '100', null, null, null);
INSERT INTO `User` VALUES ('73842', null, null, null, null, null, null, null, null, '0。圈圈O°', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKjYOibrQgzemvx9LwzZIH4Xm3u9YyKfsTibpEGM9CBPJJ1BXYgRnvnjrU6cmru79x3jxQwX8OzCVbQ/132', 'obwPJ5dIlKFzjHiV4BBQv85hHCx8', '230', null, null, null);
INSERT INTO `User` VALUES ('73843', null, null, null, null, null, null, null, null, 'Sasha', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTICGLtkeUz1lYISGusiaoL2I5ngmDIe8tCKCc4pA0o4TszlMKt84O2eiacfkchIv08xtQiaC9EtfC6rw/132', 'obwPJ5TmvGfSlF6m2TGyHBfbkfbM', '94', null, null, null);
INSERT INTO `User` VALUES ('73844', null, null, null, null, null, null, null, null, '张先森', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erGV565I6kCL5lHGfzDEE8yb2ciap5y4eF4IGh7aFjXv9GQuzzp5jhvvmunBX1WaTnQOAJhcKUA7fw/132', 'obwPJ5aH-CDXmwFc5Dxhw9CPJZJ0', '110', null, null, null);
INSERT INTO `User` VALUES ('73845', null, null, null, null, null, null, null, null, '焦南威', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqhf9NQyvibXhAckVrY0G4AXWL6BgU9iaAQ3vicsPlJwfRx3AzudOMNIVkgK2WGr0N3z4RNiceLQVO5EA/132', 'obwPJ5Tjaijk_gSLb8rm4S14wzDw', '225', null, null, null);
INSERT INTO `User` VALUES ('73846', null, null, null, null, null, null, null, null, '黛 晴', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJrtgnAy0CJa8TraPK77je2nHge7P3Yjalq9SWLmKuFWiaAfJbPZv0rUN41Gy0JAt1ITmrefZLbvrA/132', 'obwPJ5WDaOrhARjA2MxrD82wN0is', '100', null, null, null);
INSERT INTO `User` VALUES ('73847', null, null, null, null, null, null, null, null, '宽宽', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/nf3TibTkts6I3KKLxNhONibicd1WMUvEtc79l4Py2p3GMicYBuo0Y8vcvwW2GSiciaxUscYPx3EeoweNsFAMJjQ3ibdeA/132', 'obwPJ5QDkEXkAES7406b-smP43GQ', '100', null, null, null);
INSERT INTO `User` VALUES ('73848', null, null, null, null, null, null, null, null, '灵果Laura', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIaMn4tGY24tJ0Aad3jSuySLLic91VBS31K9ZIKYOqK1wtFeRmIheJjibIIKaicdyMS0NpQROiaKdDkpQ/132', 'obwPJ5VTYAsBKe2ZLpVEhMA0yzOY', '290', null, null, null);
INSERT INTO `User` VALUES ('73849', null, null, null, null, null, null, null, null, 'Sam', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/eBicObx4oYda2xhxI98OiayFDqUCkpuHGvogrhZabAShdUVITHfzHyfhYBTVAvM4D2SLSTgz6xHl5rUWgbKjTRkg/132', 'obwPJ5Ukc_vuwqoQ3AUhq4dxsUD0', '100', null, null, null);
INSERT INTO `User` VALUES ('73850', null, null, null, null, null, null, null, null, '吴昊@SaaS', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJLeQNZl4ta4XeBtIlibgmQibJyk6E3WQez7RwbBbZqOWt0eicUrlhicGDpOCfHHtPLrOfVOiahvF4bmkw/132', 'obwPJ5UzOHsxZfCgbGgV44HVhxME', '280', null, null, null);
INSERT INTO `User` VALUES ('73851', null, null, null, null, null, null, null, null, 'Yvonne', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://thirdwx.qlogo.cn/mmopen/vi_32/YZtusxLajX5sSsPjG4Wic8aMSEibSynROicObfPeh4Wun6jsHJJbSb2ceH1JHgOvsqPzoWDaib3ibAMBt1AxSpjsPCQ/132', 'obwPJ5dCttyEkcQHpB3XsrV4wpVE', '90', null, null, null);
INSERT INTO `User` VALUES ('73852', null, null, null, null, null, null, null, null, 'Lucy四年级刘若瑶', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/FFbxnvmKPicC1MbdgnFbuaTUiauTjh9cZ87RBtodfjqpezHJlRLB7z424ogibs6uCD5Okq2RFWvunZia8QCRUeA4zQ/132', 'obwPJ5TtKmwdD8wEFsyM_lkZ45nc', '100', null, null, null);
INSERT INTO `User` VALUES ('73853', null, null, null, null, null, null, null, null, '? Erin程艳', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq4K1xOtO1cAK9INicLib4NIIIGd6DibpT1ddz6pTaq1ibT2SqGFibt6Gg6eyibhPhgMNxsJMpBcdnT1Geg/132', 'obwPJ5ZBIPTGNdkiuE1meOH7OgpM', '105', null, null, null);
INSERT INTO `User` VALUES ('73854', null, null, null, null, null, null, null, null, '灿米爸', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/CPZicSicia7wSlfic2qwv2iagtH5YFBHd1PAiat5joESYokNT4SibgV8bEiccia8vJJrQ0tfJk4icDtHSicRmVGkicQODHgs6Q/132', 'obwPJ5eD5hLrJ_9egagixiX8GjgA', '220', null, null, null);
INSERT INTO `User` VALUES ('73855', null, null, null, null, null, null, null, null, 'Thomas', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/UcE28IXeph9vFfmiajYcZa0mUUnxxveZZBwo4HaSAhVWuSqHGDDp6zXLibhIoD6puDGsgqERQt9RWjQiczGmVZCmw/132', 'obwPJ5RqkPS_8TlRDfnUwGb9nl_8', '100', null, null, null);
INSERT INTO `User` VALUES ('73856', null, null, null, null, null, null, null, null, '昨日重现', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/6w1s4kI1ofaCY5aKp0BvKFh4ADFLxolcvNJvDgojWUsoRr7aaqzjMkoibeqO0uvRpX3MK770DyYmXflpZHqxMMQ/132', 'obwPJ5eKZuBBGYZIYY-2fVmPrVCE', '230', null, null, null);
INSERT INTO `User` VALUES ('73857', null, null, null, null, null, null, null, null, '王蕾', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eohLYZBUtr4eobSGic2CLrz6lBGTmPrL8qib4sB7TnTHH8agmqG31JG01kPj2Vg7kDticaCu3sOickdibA/132', 'obwPJ5ZH9VZIrFdmhmz19CkAemHE', '110', null, null, null);
INSERT INTO `User` VALUES ('73858', null, null, null, null, null, null, null, null, '邓超人001号。', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/8xgFvh6XlSnh4k6DktlWMBlLYZGgNsibxjN8yWuicOGCPG2bpgUUPKwib7cZRsfQqIVZiaQDLibz5K6XAx3k6iaASNQw/132', 'obwPJ5ZT8ajWbyrTsUs0J0a1TCCQ', '200', null, null, null);
INSERT INTO `User` VALUES ('73859', null, null, null, null, null, null, null, null, '过站不停', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eo6z0P1sicrvdWnFFYVNpYc6ia5aeKsz1vDwbuARyNy8MA7G8yy6xAXwV7iaprLF8xNkIbTIYf4nLibyQ/132', 'obwPJ5d5Vt2ko3nWb_ludcIqi-FM', '240', null, null, null);
INSERT INTO `User` VALUES ('73860', null, null, null, null, null, null, null, null, '天恩', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83ep1iajiaW7dGHHuxJg4gs0TdiadO4lN4Q3FMPoBElyDOPJHKciaQ1AEWQDBn7SylCBHYOhJo1RRvEhPfA/132', 'obwPJ5dxbXRg_6VjDg9_r8PHcLUo', '150', null, null, null);
INSERT INTO `User` VALUES ('73861', null, null, null, null, null, null, null, null, 'Frank', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/GLEv0e3T9JL9VQEJ6Wj39sIEUnT4SZ2DZWa4QPShEMKeBOSpmG17xIrBVsn5ToGTl6VUibbJZabAMk39yxnhu5w/132', 'obwPJ5bAazudo7zuuzmpwhHQOzdA', '250', null, null, null);
INSERT INTO `User` VALUES ('73862', null, null, null, null, null, null, null, null, '朱金丹 Dany', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/O5BVJdsM5OmUQzpznJHGpKTR6ONYdPVPcntE5Rsoicw6ic8nI6VLficb987S0zgfb0q9IQ9JAFtQHpxHmXPNCdwEA/132', 'obwPJ5QitcFpVeBCr1nGjZT5AXVE', '240', null, null, null);
INSERT INTO `User` VALUES ('73863', null, null, null, null, null, null, null, null, '情绪，认知-代松', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqN9vygQeAHDjDaHXKDCBB9Squj6tDzPBKwLAvMepaniaVVVj8KHSiaH5bwyc2icgHJibQQ1ZyvEkvCXw/132', 'obwPJ5SaS3ZxOV0U8mmU1sj1cjY8', '240', null, null, null);
INSERT INTO `User` VALUES ('73864', null, null, null, null, null, null, null, null, 'Steve', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/UXibTWWwhQuicO0QIIucNndSR4DiaeLwpd1wSSbS2zqFDLIZib4P5iauiap4ic9FW9ic3z2ibujTfsw8iaibaM78TmNP3M8Aw/132', 'obwPJ5VVQyiWvhUSWSiEG0qB63_U', '90', null, null, null);
INSERT INTO `User` VALUES ('73865', null, null, null, null, null, null, null, null, '奉新明～中信保诚', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/ktJks5vWWxSAWEOWeFico9VmqABIr4H1oUfZI7a7a9mVKGwoVXhp32nNqAJmiaLOGOTdAW1oNfia8icKRna5JHKibHw/132', 'obwPJ5bEAR5Z3L3-9Q9vUdYj6WpE', '300', null, null, null);
INSERT INTO `User` VALUES ('73866', null, null, null, null, null, null, null, null, '有所思', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLWEyTWn04lR4as8nIFTYFrPSmia7MzVHpb6UofVpmUWr6lZ40KLBj45PrBkL7Onc0picQJGErzXn7Q/132', 'obwPJ5Y0uDwgklDkgVQnjQjzTobU', '100', null, null, null);
INSERT INTO `User` VALUES ('73867', null, null, null, null, null, null, null, null, 'Rich. W.', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/MF49AcIcn5aVuribQESUwYBDoRian6iafY62hSBOuECoF3LbC4XwQXHWfjmfq1mJFuxKdlyjnGyicw6f8Nqp9pa9JQ/132', 'obwPJ5dYyFHHF6veJHvle-pKCGAg', '270', null, null, null);
INSERT INTO `User` VALUES ('73868', null, null, null, null, null, null, null, null, '楚门', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKA9dmHe7ppichdHYDu1hicldXjx9vylQZgbn2ScYd2BWu3ULgCDm0lkC0TGUUrraubXEIMz3L6Ur8Q/132', 'obwPJ5bgqfeFsn0prTqd72E3Kxhw', '220', null, null, null);
INSERT INTO `User` VALUES ('73869', null, null, null, null, null, null, null, null, 'a_nnie', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/ywsg7bem7MnibnV1dwgia2uJgxleEIPjmyHanVTW4bF9KGaibf4r4IAZiarV6XVcNccicLJdkD35aJ1lekbBbhfEiaEw/132', 'obwPJ5T5XrvWvkLdh7KYbPZrXk3Y', '180', null, null, null);
INSERT INTO `User` VALUES ('73870', null, null, null, null, null, null, null, null, 'Mary', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/3dibbbwZBbFt7u4cndrGpeCaJ5DJKT67UWOjLiacW8rnefqLicUicfPtKTeCnKZosibGolH9UnMZ5yTJquUeEQgicHtA/132', 'obwPJ5cggCKbXy5mOFl5P4ZkRk6Q', '260', null, null, null);
INSERT INTO `User` VALUES ('73871', null, null, null, null, null, null, null, null, '王蕾', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKvSdI408ibZbAFzWSlDlMia27MNsNowgl9gLAicAkJiaicMRuprHJtohKe1rPgh7SicicxuLfNCFS0DTPiaw/132', 'obwPJ5RlPdIpEdC8oNRJg32OsNSY', '220', null, null, null);
INSERT INTO `User` VALUES ('73872', null, null, null, null, null, null, null, null, '王迪', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/mJoS5KRExfETDyhX52tkDxZoT8w4VdfITY0ZO0ibSP3Zr7Wickr9icNguAgS4QibZpmiaJERXmpDsiakNfazSeSzDEYQ/132', 'obwPJ5f5T32tGhztfwFbtyPftiok', '100', null, null, null);
INSERT INTO `User` VALUES ('73873', null, null, null, null, null, null, null, null, '菜花', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/GsXtibauPWlrpzOjcrV1PHq4wupZXfpf3YEh1umqaQa5H445RUrkw0UxL0sM7w0ODyk4GdGwJM3USEV9piawvsdg/132', 'obwPJ5SYyGbX92JWTjFj313j8BHA', '100', null, null, null);
INSERT INTO `User` VALUES ('73874', null, null, null, null, null, null, null, null, '?温柔的刘鑫?', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIuibvF9CvYg40O3187URvkzCCqPeadQen9oFDUxbWkR2pFGZVRya0S4lkBW9aj4ODIDtkP1twaMSg/132', 'obwPJ5aQ76yGwkz1pHl4P0wF0F_k', '290', null, null, null);
INSERT INTO `User` VALUES ('73875', null, null, null, null, null, null, null, null, '积雪爬上门前的台阶', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/DZOxhydGo03Dy42kH54E8uJv4icMRh1tCxLqQeTTdUq6T54ahcicspMgHkpr35OdPnNu7rHxJsHnadRyFDfRpsKg/132', 'obwPJ5dbz8duAKOKG-w95OtdvF8c', '250', null, null, null);
INSERT INTO `User` VALUES ('73877', null, null, null, null, null, null, null, null, '阿郎', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqO2VWKMMUQfMPNFL5OeNeSwftR3ia7uBDAzuSy8EGd13ujaickicaRBAp9YvibllCiawXd9eDUggN26wg/132', 'obwPJ5UAvbEeDub1bo9QBE4pCgfQ', '100', null, null, null);
INSERT INTO `User` VALUES ('73878', null, null, null, null, null, null, null, null, '小莉', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLY4qujSbJxHWkuia5z5ycEdljwPp4SY9RibFKjSZia1ahU6iaauT0I6ibHlvOjH1K9ugIbVSG5ZbMxBwg/132', 'obwPJ5bmQ6mF-K2eXyvz_OLZo_lg', '185', null, null, null);
INSERT INTO `User` VALUES ('73879', null, null, null, null, null, null, null, null, '王芳', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTL1rwBs0o10XhtH0H3CYibnTLcaIoHSYG6PQWnZdusria9o8MJmA8xT7cIf994PsicmGtKGIz6pJ3EdA/132', 'obwPJ5VRJ76I0CZkht0MdsLxoYAo', '150', null, null, null);
INSERT INTO `User` VALUES ('73880', null, null, null, null, null, null, null, null, '瑜·Hermin', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/uaoWJ1rmlpTRic5eEBeKXrkvay9cicnjpD3NaUK7hyibr6CLmNEfPmicnTdClWwnxia9SjzichtAfQZS9r7fjNCnb2Pw/132', 'obwPJ5dYgtzdDF7M5afcGWC44VTA', '10', null, null, null);
INSERT INTO `User` VALUES ('73881', null, null, null, null, null, null, null, null, 'LucyLi', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erx6JB6rQed1ATnUIFGS1qWVk2tre2TqEQwFibU5ic865x8iaw41nMSpacMapjdPuGXNoDKSmibDk7C6Q/132', 'obwPJ5fwBoz3m6hzTbft7PBrN_fk', '210', null, null, null);
INSERT INTO `User` VALUES ('73882', null, null, null, null, null, null, null, null, '空间探秘', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/YIrc1Zheze1Sx8L7vHB4HHicJZxuFHUN1oicElcrdyCLjaLSmNoBVQiaxD921PdtV0eokQQWhgH8a6JQhhA2y9NIQ/132', 'obwPJ5RfOROKgb7b7qhI1k2J6ibE', '95', null, null, null);
INSERT INTO `User` VALUES ('73883', null, null, null, null, null, null, null, null, '陈福祥', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqB5ibWEBNhv6NCFQicXDDyxQjY5CmkhRBmHkEtujtO9icsFZZsWzg9VdFxxE4kibdjGDoicpeOibyz8YpQ/132', 'obwPJ5UJtJzBY2oYQD5I3EBslnGo', '205', null, null, null);
INSERT INTO `User` VALUES ('73884', null, null, null, null, null, null, null, null, '懒蜗牛', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIiat5pphWuKcC5RQgBic5bCfiatqsypRP6F5OjB7xUicAyicicbjNtxYCJg4cvsCANpDHiarpOmveCsialLg/132', 'obwPJ5c9ekTtmsVeywicV-IfGLUg', '120', null, null, null);
INSERT INTO `User` VALUES ('73885', null, null, null, null, null, null, null, null, 'Nina', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/RC66AgmvL5DmcANicyWfhH6Xxrs0Iyg5rAmRj4GX4XBEkgicfwibtFiahMiaVrx5dnMrEmR5cXpabA1pU1gZSbz5W9Q/132', 'obwPJ5crAPBBR1dZcwEXillsMAD4', '100', null, null, null);
INSERT INTO `User` VALUES ('73886', null, null, null, null, null, null, null, null, '康庄大道', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/XT5Ta0c24PcM9tCUbEpEicFAUCLUs8j2Rs6eIqWKvwibsDQ8B4muQo9ZgEfsl12skGax9f6G6teINhB7EZCHmcJA/132', 'obwPJ5UID4kUaZMT3plHYfWK7Bx8', '110', null, null, null);
INSERT INTO `User` VALUES ('73887', null, null, null, null, null, null, null, null, '柏蘭', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83er6QN8fpg540RaFTPzUkAzLyQxGmFFswj0NqdFiblrF5R1RS2bxp1HMKwAJK9EKPFmoiaXupB1UX5mQ/132', 'obwPJ5dgWKvyXNWDcHmnslQc_19Y', '110', null, null, null);
INSERT INTO `User` VALUES ('73888', null, null, null, null, null, null, null, null, '杜昇', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIMt4tPFA5HicAQiaianJEDJUfOonpgu3DEfGcYBcYUr5cFk1nickOUBAGWAqTKvqAZyBQKTzYqeBibClw/132', 'obwPJ5UHHFDwB6bI4fp80C45mwww', '100', null, null, null);
INSERT INTO `User` VALUES ('73889', null, null, null, null, null, null, null, null, '金媛祥珠宝 王岩', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epB7USY8XLuDHgfiaecnwzoKtRg1Bicpjxohut0ofjQFFhCuaMPdL4IPPF0otgmDHuD31Gvfu82xD2Q/132', 'obwPJ5S5_aQMv_vOm1pa1pToUKQc', '110', null, null, null);
INSERT INTO `User` VALUES ('73890', null, null, null, null, null, null, null, null, '陈明群', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKgA8bMuSpADjxbNoEErSsEx7omaEJGyEXuPLYjuLdUuYladpu6t8NA0IKiaudMspf3uzmuJveMb5A/132', 'obwPJ5RRijM8UXObVaIqWe8Oxmdg', '95', null, null, null);
INSERT INTO `User` VALUES ('73891', null, null, null, null, null, null, null, null, '文静', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIKyDhW3CyWUj5CXDnibLicgZRyrnnuiaeoQMh7GbyibrBA4tDQXyMDXDxViaqHicuIqiazeRqvC41TE0lyw/132', 'obwPJ5eyfJ5suCW6vcP_jzqi3h8I', '210', null, null, null);
INSERT INTO `User` VALUES ('73892', null, null, null, null, null, null, null, null, '晓静', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Oqm03gDMcGv8ppFpHMSCDTZOhO0fiaBdKGibdp9I4eP6gKasKia1KEB2ogqJQpAHLp1HovVabkoHFf90jhJDIjdOA/132', 'obwPJ5YOHdqAZGX88VIzayQz-cI8', '95', null, null, null);
INSERT INTO `User` VALUES ('73893', null, null, null, null, null, null, null, null, '郭晓云', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erUc7t3ef7ayiaqc2EyrOeuKy7j2KPjWXXfVg1icAKl9CFnLPOh1eNnyehEHeHqiccxBfnoe8dCRZEwA/132', 'obwPJ5TBBFSh2XA8vP4xlzoiIbng', '100', null, null, null);
INSERT INTO `User` VALUES ('73894', null, null, null, null, null, null, null, null, '乡水肴', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/cEPQLMV2d4VIW8VI5ibpBxib1mTQncJBmtnPYDTc87Y6jFwVUgPvfAvmILdHSMhiaMVL4NuibL2dPtg1CiawDZM2HoQ/132', 'obwPJ5WsbEG-fQ5Mr1T1PskKQh_Y', '100', null, null, null);
INSERT INTO `User` VALUES ('73895', null, null, null, null, null, null, null, null, 'Leah 利亚', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIHKTU4ZzqhEssTGia3gkmwsqXqWmVVHgPdEBXAJOOyOxbvlicnJxukRPAuZ5r4Q2Gichzh94WBl9e8Q/132', 'obwPJ5bSt2mDPu5xiwZw6JHb3qT4', '110', null, null, null);
INSERT INTO `User` VALUES ('73896', null, null, null, null, null, null, null, null, '高博（Sophia）', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKsOMgdJQdnOFe7z78rc6iaD0PLcE4XHPFr86LpSMkuOSwfIDpnZpPCJ1YW1DfDCXvNRficM8uexQ2A/132', 'obwPJ5XddUOHsKYItbN_qTXIA_aY', '100', null, null, null);
INSERT INTO `User` VALUES ('73897', null, null, null, null, null, null, null, null, 'Pu妈', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqFFiaiaRVbOa8WDYrN3X4dpf9DEMNrwCveCebTsNTZU2F8SPuJHtF0kfRiaAciaWNyg8YD2QK7MickOMw/132', 'obwPJ5dEf-0s9dyvQ_OF5eY5tS40', '240', null, null, null);
INSERT INTO `User` VALUES ('73898', null, null, null, null, null, null, null, null, '饶晨曦', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83er460Z6LEP2x2ic6XCoiayt41F0wWHvmqKcibkn6fCSricXRBsJ4zhjQT6z9tHKx7tTk3uzVjZUa2hGsw/132', 'obwPJ5c3ore2dfJEk8d_Wt3VNJT8', '260', null, null, null);
INSERT INTO `User` VALUES ('73899', null, null, null, null, null, null, null, null, '波波', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTINzRd2KN1pA9YZGA6kfk6NNjbaJs2JCztUaFvz6gqcMcbPuPyWfo2U9QljQUxnDc7fGJcX7zYu8A/132', 'obwPJ5fla7gXW82eLjNK9uGEdS2U', '114', null, null, null);
INSERT INTO `User` VALUES ('73900', null, null, null, null, null, null, null, null, '崔岩', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTITTjY3ncJE48vd6o2oThJTXS9zw7d94oKTvNiciaKLZNK4ye3lrygV8aibk2wxoUtjhmVYenQNK7GeA/132', 'obwPJ5ewXvnSyATnT0qjvjbsPP3U', '135', null, null, null);
INSERT INTO `User` VALUES ('73901', null, null, null, null, null, null, null, null, 'momo', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q3auHgzwzM6K5689PXqmp2QrFZTvzIw9EJGrLO4CX9S9vJhPDOye95Lxbbt0l1WfLcXf49hnNYAvSgvZ2aZhTw/132', 'obwPJ5XqvwcHnmWchPIbO5oYYFrw', '120', null, null, null);
INSERT INTO `User` VALUES ('73902', null, null, null, null, null, null, null, null, 'XD', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/SSQ4Zwib85knq7M3TiaCnLAOib9C8VsSbnIibAufz8smYKGeXKx9YNxVID6OVkW63cQyxF9hXlxaQL36foQwqx3tnA/132', 'obwPJ5Tnt6VteBkoiYrX7IcrTrpM', '90', null, null, null);
INSERT INTO `User` VALUES ('73903', null, null, null, null, null, null, null, null, '杨丹', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJ2icQzMrqxHxem9vSZjriclKQKF7IS9CokLwAnQJNmqCpPDO5icmQvzRIic83ibM6vBEImCy6LxuLz2IA/132', 'obwPJ5dumjfkeuOswqHephALLKOM', '110', null, null, null);
INSERT INTO `User` VALUES ('73904', null, null, null, null, null, null, null, null, 'thomas', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqGIzGUV698faoXzNzylia8Nqg6oibribqVECtldzHATicWYTW6lfPZcSK6F5h4a2h6oKfD39OfqEGxFg/132', 'obwPJ5YfykTZSIut8MpO3E2UdiR0', '120', null, null, null);
INSERT INTO `User` VALUES ('73905', null, null, null, null, null, null, null, null, '王倩Kaylee', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/BGJoR0VD9E5KXrq0OibcDE1vLNc19Z8AokfKum0teO1sz0KNpFGG6iaJ6gSPnibeUEEEZgGoHtWV4TK7bCOCzeJgg/132', 'obwPJ5cs2OrBQ8iRkW2F17oT8IAc', '130', null, null, null);
INSERT INTO `User` VALUES ('73906', null, null, null, null, null, null, null, null, '董湘辉', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLltwHV2jd0MzeUSYjflkNT5jWF6iaYMwOAJrMmnobcHl6Q1tR8Bp9pk0VZoB0ELKaxgSxibjTxASBA/132', 'obwPJ5YzLj5SKJwOJuF4lNoau4z0', '114', null, null, null);
INSERT INTO `User` VALUES ('73907', null, null, null, null, null, null, null, null, 'Cindy歌', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoaZ1RtANMn0T9n5E7oKwz70ZiaTN4MSEbeqtXic3o9JtDsicwHdbOfnd0b03SkXHrEh6yM4sKr0QwsA/132', 'obwPJ5QwFpcSS2pC9CZe46B6WL6E', '110', null, null, null);
INSERT INTO `User` VALUES ('73908', null, null, null, null, null, null, null, null, 'steven', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLYhaJBgHGhSXMjlMf9wSpSZSqWjwqPh3nrovKFVKkOIpvJu7cBial7BjnjgE8xJyP626qwU8UIXhg/132', 'obwPJ5Sc26APIfhTyHrKTWRV734I', '100', null, null, null);
INSERT INTO `User` VALUES ('73909', null, null, null, null, null, null, null, null, '白又白', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKrQN0jcqB3RbIkmyuCscYMF3Xcu2fjW7a3F1paDHeSeMvQQ4R4VKk3icrN01UQJ2FA2ia3icGicHEZqg/132', 'obwPJ5eBiE3D0lHwHbocc5Dhbe7c', '124', null, null, null);
INSERT INTO `User` VALUES ('73910', null, null, null, null, null, null, null, null, 'Tina', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJ6LK3OVOLWDXtCAxrZaQBfpUpNSfd8VBaHiaibeib4goJEwYLIqc6tm56KK0uwFZZ6SphRfaX4rjoVA/132', 'obwPJ5TLZ6OwcP9CxqJNQeUqH0bQ', '100', null, null, null);
INSERT INTO `User` VALUES ('73911', null, null, null, null, null, null, null, null, 'kittytang', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIBtzficN8xtZ6vxjLaAfemvRnyMtGUKkqaqRJMf3ffPYLibDFxKjp3ldus5YiaDDhOTRLB9EqEB4URw/132', 'obwPJ5YZ4X9WsQFN3-yCNSuF5O2s', '190', null, null, null);
INSERT INTO `User` VALUES ('73912', null, null, null, null, null, null, null, null, '汤傈傈', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJOgB1ID7Vp3JlMNbsBt1caPMBMtb1Libnrl6gD9NoymY70IUuD1G0yrSHibIbQia3oKLqZXlTsFBqibA/132', 'obwPJ5YHSza4Op9LlEGWFblo8UYE', '100', null, null, null);
INSERT INTO `User` VALUES ('73913', null, null, null, null, null, null, null, null, '兰青Joy', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLT5FkFKWJpNBE9z4pGbftXy22gvqwE8ANHyzknsNwgwiayzKqYCOdibX04tU21fuZkwicRyEI4FFyLQ/132', 'obwPJ5d0rQM-wquNYnaY_Wyvk8Gg', '100', null, null, null);
INSERT INTO `User` VALUES ('73914', null, null, null, null, null, null, null, null, '琵琶语', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJ3nFqjBKdgKkibrXeJbQKYkMJuEUJZUu0qUn1lOwXAKXhDKM5gW1T8IvH7uRY1obdKlSMPJMWmNnw/132', 'obwPJ5d4KBNMFpoSyG3VnssnmHuI', '89', null, null, null);
INSERT INTO `User` VALUES ('73915', null, null, null, null, null, null, null, null, 'Gao', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/ajNVdqHZLLBQEsuJlc2wlRibhU6AgDhemdjcbUdchXcgWNHPQP5icXkUrW6JDF18S8dBiaILf8J00nJbSco3LvLzA/132', 'obwPJ5c9BjHG2G5gv4eD0nbGG-7I', '130', null, null, null);
INSERT INTO `User` VALUES ('73916', null, null, null, null, null, null, null, null, '丫头楚', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEKuXIAn9YicIib155dh805RZ7aDZ5avX8Wx6HXxvFEMPdA0TtI9sic5ybdcqQF4howicH04I4bnP85fXw/132', 'obwPJ5Z5Cj7TKS93FapggJqfMkjI', '64', null, null, null);
INSERT INTO `User` VALUES ('73917', null, null, null, null, null, null, null, null, '晓红', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKlgjrU4epTRaj1NQbmkvLx4ufxPolIzH4tvkVzGoicUQXNicLdPUkUnkd8ycr6ukE9ddVEerbYeWrw/132', 'obwPJ5fMRhLiFV7taeUP1AqmktAI', '99', null, null, null);
INSERT INTO `User` VALUES ('73918', null, null, null, null, null, null, null, null, '大脸熊猫', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTICGLtkeUz1lU7siaqyOicXAMVfZLMHhPibUhIQVpopO3xY8bQHTTO05egHCOPZXgM17rIzmsC3libtjw/132', 'obwPJ5Ybkfhrn-2zfbUcODEFfUAA', '64', null, null, null);
INSERT INTO `User` VALUES ('73919', null, null, null, null, null, null, null, null, '马宁', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIQ9ic3YZNqQJ9TytiaDOYibQL1hwGGQ2mGDILIjWSB2uX7TAUFFfkKyD0ibEcLXkFia5mq3fOoia7vFQNg/132', 'obwPJ5ShaWF_izzqslqIhfn5JuJg', '124', null, null, null);
INSERT INTO `User` VALUES ('73920', null, null, null, null, null, null, null, null, '小白杨', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTK3ofK3cib5dG1cY8U3iatAOpMwLR4O7BbzeUovJRcOjLVMPRkSAztB0r8Kic5NPORwUrt7EhMbxNZsQ/132', 'obwPJ5Y2kXvwYXjCChw0sIRsUfRc', '144', null, null, null);
INSERT INTO `User` VALUES ('73921', null, null, null, null, null, null, null, null, '张医生', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/ccB6flTBVLJeSY4gicwHjKk7GFZ6ZUicia4u1UmzZlmQxSxjPYxKwr3cwCXovQhcXWBt8QqEZtjPz09gvIQkiaBjvg/132', 'obwPJ5V3gQ1r3YpHcp0S2-u8-U6M', '104', null, null, null);
INSERT INTO `User` VALUES ('73922', null, null, null, null, null, null, null, null, '玫', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJWjVR2avuzgYVCyq5FpJwb6lII5vcZVJicAm3ia6s61aNDibWZtT0ZgXa2ricLVNmBUhLsRbsV3IvnCg/132', 'obwPJ5YAbtO8vxG5opHWQTnuMXpg', '134', null, null, null);
INSERT INTO `User` VALUES ('73923', null, null, null, null, null, null, null, null, '张伟', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqwK8ewIRibGsx2W6edbF1MWiaN0aY33aQribrnB0WDxM2JNfDBsJg2sFxPjTplvavcpl25ia8xnBEvnQ/132', 'obwPJ5VmM9_4hNDSth5uTMkanQ_g', '134', null, null, null);
INSERT INTO `User` VALUES ('73924', null, null, null, null, null, null, null, null, 'Samuel ', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/UTK9sVNWhfAdiclmV3Saic2ricTCRh7GkfcyqnVO9LMwVWHdga6kjiaX7HKNGnML9JnAZsTks4SLpvkRvz3oovLd6w/132', 'obwPJ5Zt_9Hhn8siL0cyfhN7ojHI', '130', null, null, null);
INSERT INTO `User` VALUES ('73925', null, null, null, null, null, null, null, null, '苗苗', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/UNoSnLO6nO3dSwuhDnT1aFxNZLGXJqd8XTXv8m3icgRWkqFvkPplZZcDZzkaasHd2KGgQTCKIibcVKzabnibt65rg/132', 'obwPJ5Th77ybnN13kgDhWBrGn3Es', '140', null, null, null);
INSERT INTO `User` VALUES ('73926', null, null, null, null, null, null, null, null, 'James 開', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI4F6PsgtJ0nXT8ZQg9L18wmZQCE9kibibS0PUrBg2aEwKopbu0Wwhbek1J1cWFNbE3NxU2Xvkh3LPA/132', 'obwPJ5Y8WNn2HSdXxl8JR1ruYsCQ', '134', null, null, null);
INSERT INTO `User` VALUES ('73927', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'obwPJ5R-cLG5NXfTBSZH584JlGuU', '100', null, null, null);
INSERT INTO `User` VALUES ('73928', null, null, null, null, null, null, null, null, '王启勇', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEKPSe8v4iaZ5JVzwpcFia0sq8mgxWL8l4pq45XHSowsdibzbWgGFeMQR8QKJmdIvHhvDyBVXDQWRIPkA/132', 'obwPJ5bkcW5phjDxbFNY3n84ftZg', '84', null, null, null);
INSERT INTO `User` VALUES ('73929', null, null, null, null, null, null, null, null, '小十', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erEFRVSSdY9Y5fibFRLGCWOZACFINVn1ju14iczp5ttGYR1AVWvmbQe61kmsvqOMoNZpefibjeVtrKjQ/132', 'obwPJ5ZQBgBYE49k-bLtIf-gbdKU', '99', null, null, null);
INSERT INTO `User` VALUES ('73930', null, null, null, null, null, null, null, null, '郭允', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eo2uPQDJKKXxqPS68Hd2GKYsgT6UgIrVmAFboyDhx6Xg5mHBjGmvSH05Z2hPet9GRibj11Xe2Yb1Mw/132', 'obwPJ5WTvc_yHSykPtbMFrgtpPp8', '89', null, null, null);
INSERT INTO `User` VALUES ('73931', null, null, null, null, null, null, null, null, 'AIA?Carolineʚ?ྀིɞ', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqZ8GUN4xgJpep2BR3506W01PZEeDDN855gADib9R1W9VCwSCqa8mgtgkTNKO7KK7v25dN1BXFibnCw/132', 'obwPJ5YKXHHWZCSCf1mz3wY0JhBY', '114', null, null, null);
INSERT INTO `User` VALUES ('73932', null, null, null, null, null, null, null, null, '雪梅', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJ9QADRIcql4qgN9CLsTibunzcYic5PovgFK7Eic0UiahArGluCtM43ncS9QiaqnCDvWsd1ovgsYPsU3Ug/132', 'obwPJ5TQL0cXl8tvT0KDJDe_vvdU', '85', null, null, null);
INSERT INTO `User` VALUES ('73933', null, null, null, null, null, null, null, null, '石嘉林', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erdHB2SC99Ml3j2VHcbrdz5QdH1Lz6CHlpflVbHtSv6F11rRa6Uoe8rw2ibS6VIHBKGJpcdUyLmB3Q/132', 'obwPJ5bUypX9xJMVTGD9FqsvbfTI', '114', null, null, null);
INSERT INTO `User` VALUES ('73934', null, null, null, null, null, null, null, null, 'Cherry', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIiceMVjrl3wLAmG8yxicUGrUtD8FHLJnk5xuOySMpQFTQvlOxM3FQlNkjXwK5agtNAvsDuiaGV8RdMw/132', 'obwPJ5XCAwiXCZuYEpyk7DOR3nYk', '94', null, null, null);
INSERT INTO `User` VALUES ('73935', null, null, null, null, null, null, null, null, '肖宇', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eopqQrvUp3vEPtbo8K8GbX9siczfmQ7MMvHoL7JtNlEu8196ao75RZPaibEu7iczmibvbHnicASPxibPz5A/132', 'obwPJ5XXmg2ox1PNAJaVBdT9SYVM', '130', null, null, null);
INSERT INTO `User` VALUES ('73936', null, null, null, null, null, null, null, null, '孙小美', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEKEZvcMHzj4iaa3iacurPUqGMdDwByUkhVMJF2IHd5R2ibztPpoSCSWXMzYV0QBBsudoxTrILAwGzNTA/132', 'obwPJ5frn4q4AUGb1ksTCEQIV3zM', '100', null, null, null);
INSERT INTO `User` VALUES ('73937', null, null, null, null, null, null, null, null, '稻稻', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLhwn0mP8ibR4NbjZAnOlgwazBvk70ssViaTGGBE3YXxicvz12PXVymp7nUdkHd7k3Ywg2InxGq11Nsw/132', 'obwPJ5aUKbw7rD16ZLDvpg01Y-3U', '100', null, null, null);
INSERT INTO `User` VALUES ('73938', null, null, null, null, null, null, null, null, 'Angelina', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/dibicwibCEDTn6kic6tFGSFsNo2IaMrHWRauiaic8ewuu0640ibCGBcwJFJbXc93zYZCB4UxOzjEuxbGI7RdnOyaOXuaA/132', 'obwPJ5X6vg7fRre7umOE4b2zB6ZU', '190', null, null, null);
INSERT INTO `User` VALUES ('73939', null, null, null, null, null, null, null, null, 'Hannah', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/mUPPRQgl36y7HjNCAIVFbaLvM4jfRdQV2zyjGP4ONSDUzicVjf4xQLWYMyU0OflcsCkISQ8Tn6smysaUAavJrWw/132', 'obwPJ5QoPdToTI7Nk6d1z0M7XqNk', '150', null, null, null);
INSERT INTO `User` VALUES ('73940', null, null, null, null, null, null, null, null, 'Tracy', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q3auHgzwzM7SM0frLCsZ48NJl8ibswzZcr1wyx8mDrFpYm498RbKN6qiaybbJP1brIWIl8JBckQ901MdNISCs33g/132', 'obwPJ5a1-QTHlKC7RWCxE_3hALts', '190', null, null, null);
INSERT INTO `User` VALUES ('73941', null, null, null, null, null, null, null, null, '桃爸', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q3auHgzwzM7QiceWmJibdnGD5lmXlILdxJx4fQY00Zl7xM7q6DjjZIhIZNPMGHrkCa7sc5PP7ODLtCDO8qjHk9gA/132', 'obwPJ5TmeDf8MSatKKtMACld7aNI', '100', null, null, null);
INSERT INTO `User` VALUES ('73942', null, null, null, null, null, null, null, null, 'emmmm', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqBKRC7x7sibYibUvZRzmjvDzHCHz7sJ5E7xGjmSic8AXkI6pTXoDWIkOibKX4jkFkd6dCpm12w2GRWMQ/132', 'obwPJ5YbPRk1Sq1l0MmHodF-4q-4', '100', null, null, null);
INSERT INTO `User` VALUES ('73943', null, null, null, null, null, null, null, null, '冯', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/XcWCT8wyHXouabKyF77XL7wBw8b09keXBl39LNxeyAXolqvib5gqvlmu2rYiciaYWDA9DXQQLcnNtExw1eYocpg0A/132', 'obwPJ5aTf9zhJm0Z58PV4ArNFsvs', '210', null, null, null);
INSERT INTO `User` VALUES ('73944', null, null, null, null, null, null, null, null, '刘嬿', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJ8Ad7icqzbDQ3ZAwrFDBlJqTiadMsshd91tibIv4X8NKUy2OibeLzXcyGbx9OeOwsMKibPmcB7W5Ix9BA/132', 'obwPJ5f2NAtyTwGz2hGjvXrdPEME', '230', null, null, null);
INSERT INTO `User` VALUES ('73945', null, null, null, null, null, null, null, null, '豆爸', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTK5yrKoSQ0CjUHIPVRmD2ncCeTELAtL3XyRz43aRPKx1gjvpVVpGTshYXxlTh7x8fhfIuUBlCPicHA/132', 'obwPJ5bPuR7K9EuZIObsOJTKn9sA', '190', null, null, null);
INSERT INTO `User` VALUES ('73946', null, null, null, null, null, null, null, null, '对方正在输入...', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/YttxNADyLJia1dxUV1MLINMrCRFibjXVbj9HJ8icHwlMOOG1h0bFRoxQbzyjneMLn7sP4cJmfkfOichfvGbjGLDAtA/132', 'obwPJ5Z6ryJr3_mnFHZBqJZbaFoY', '190', null, null, null);
INSERT INTO `User` VALUES ('73947', null, null, null, null, null, null, null, null, '李丹', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTL70L2rIwicQib6tLqYqs1o4Wq1f7m3GhBQ1ARWNFicO0WPmtZ9k9GZGvGpl7NpfD3hPPsiaYy1Foorjg/132', 'obwPJ5cU5wZ2dIDCOIjUAPI71f-U', '100', null, null, null);
INSERT INTO `User` VALUES ('73948', null, null, null, null, null, null, null, null, '贾东兴', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqZVFibiabQAo4ogaBiazRECPdCiaXib1iawnCUMBHibicicgZaa9HPiaspmMKSLlqjWoRiaSn42NmRa1xIkArEA/132', 'obwPJ5U1TTgDQ00O5c4aZIVyT4h8', '180', null, null, null);
INSERT INTO `User` VALUES ('73949', null, null, null, null, null, null, null, null, '陈雯欢', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmhead/ztycfTLzS5kOmwlsF4IHE5gVOgCnsx6kRGicp57YVahI/132', 'obwPJ5c-uK4wJ3BOx0xSWaTLmBSo', '100', null, null, null);
INSERT INTO `User` VALUES ('73950', null, null, null, null, null, null, null, null, '李大芳', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIH2Pw9RakBemnqyCdCxQLMI0TszMC9iaoxg6ibMTP7FBzIUW2p1ibtMNbZCufy36DtoXeYC52PuPlkA/132', 'obwPJ5Y7oQ_4qgy2Gd0cn19O9lzI', '240', null, null, null);
INSERT INTO `User` VALUES ('73951', null, null, null, null, null, null, null, null, '曾庆娜', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/PiajxSqBRaELnrAkD9SKzItYdrRG7ibuNYibjkU8y7lTw9L6S3cfwkO8Pheb4bf1a6gevobicTJxaqhw9ynauOqw6g/132', 'obwPJ5YPwdJlmEkb5ioi2NrwvkEI', '100', null, null, null);
INSERT INTO `User` VALUES ('73952', null, null, null, null, null, null, null, null, '徐小白', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/126SQPsNQMy7Wlf242Yb36cJhx8I71Y58a7vtjPHHjsYM4vl4Ja6uNBOAQ28t03M41NjIbdcWjhuEfcx6TyXicg/132', 'obwPJ5ZChdivN46JMrb5GZd5T-AM', '100', null, null, null);
INSERT INTO `User` VALUES ('73953', null, null, null, null, null, null, null, null, '王宁', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/zjjBlWLujJO20HTNEk75icuvS0znkphMRFhuwJqiaEsSPaibhSQGbLSAPASbYFZAPx60qJKwsQ4S0lUoBIiaOiblw5w/132', 'obwPJ5bE5dCd7pIfZ2y-_EH6Vl9s', '85', null, null, null);
INSERT INTO `User` VALUES ('73954', null, null, null, null, null, null, null, null, 'Meld', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLg2vgKPQCKenXcNbU0mcO9dpsZVexPiaqlBibeyKnicZO28FCHGCQFEnZRnk2qF60sHEErwQyLrEk9Q/132', 'obwPJ5X1w9FgzfC3aXVKoCSuE-L4', '100', null, null, null);
INSERT INTO `User` VALUES ('73955', null, null, null, null, null, null, null, null, '一粒麦子-乐乐妈', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqpupqOe8eCmUs2rZTSNqhsaxsGXFVPlTqYzxg2HolfuDMwojoZY2gt1gTAKqZQLCLibxYy4aXdBMw/132', 'obwPJ5T_J8N37wi_oNkC-hdogUGM', '100', null, null, null);
INSERT INTO `User` VALUES ('73956', null, null, null, null, null, null, null, null, '愚者', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/UHlfJguqYFuV79bPlT1DXcdGFEc3iaIshHLorqh539xUe2ahicbSKrrbDJzAxgicvqT4UwyNpw9pvaxSicZqPQ2flw/132', 'obwPJ5bDf4oINji-SgLnFf3iQFsQ', '80', null, null, null);
INSERT INTO `User` VALUES ('73957', null, null, null, null, null, null, null, null, '蔡茜贵', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmhead/Y6fskH5kgUYKxNRhhsyhBTUSXXIynYPPwunAqSPicYV4/132', 'obwPJ5V3mhdRCaa-TFGs3lRMEV9Q', '100', null, null, null);
INSERT INTO `User` VALUES ('73958', null, null, null, null, null, null, null, null, '噗噗', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLVfAcql0S17LH5B8hG5mYTJkmbXSdhPhqQI4e4NeApIeX0EKunKicrRrHoRPJUmOxlC0yTyQUCp5Q/132', 'obwPJ5a01TVem-5sxm2Q-kPIRa-k', '100', null, null, null);
INSERT INTO `User` VALUES ('73959', null, null, null, null, null, null, null, null, '陈振豪', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmhead/MIiagMibsXUiargiazxUfBko8E6FzvvjmEHnULPt8uvAB7Y/132', 'obwPJ5fAa7dHwP5MDFYX96uGNF8w', '100', null, null, null);
INSERT INTO `User` VALUES ('73960', null, null, null, null, null, null, null, null, '刘俊修', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmhead/7TNibJvbnKV08YTjvvPLyTPQm1gXCxkOriaF1TPxPtNd4/132', 'obwPJ5cJyuKMSeMqMEVKkC-SNp0I', '100', null, null, null);
INSERT INTO `User` VALUES ('73961', null, null, null, null, null, null, null, null, '陈佳天', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmhead/zB34mkOxrkPSjKghibAX0ZPoQ93Z2ZRR7z6b3mVhB7O4/132', 'obwPJ5TiKYVe6SvxQOa7mggyGg58', '100', null, null, null);
INSERT INTO `User` VALUES ('73962', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'obwPJ5drFS9zx4n4QwYlD_ET_QO0', '100', null, null, null);
INSERT INTO `User` VALUES ('73963', null, null, null, null, null, null, null, null, '黄智瑶', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmhead/jMDZdZiciby47EibbV9ic8ic03LBkCQQ1Z7o1Nu24VkSbtVo/132', 'obwPJ5Qz9OOoHuU7yr_7HbOvvp2M', '100', null, null, null);
INSERT INTO `User` VALUES ('73964', null, null, null, null, null, null, null, null, '熊静怡', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmhead/9o7S7vaIicCJJQ8691cH0UVYWFmUjLFouLhnbdfxRRI4/132', 'obwPJ5QWv0HkgC6JlEwRiZGsPoJ0', '100', null, null, null);
INSERT INTO `User` VALUES ('73965', null, null, null, null, null, null, null, null, '李珮卿', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmhead/VqyHpPVvGia2pzp5iby7cFyvTx3phbYXZo9A3jONxb1gg/132', 'obwPJ5XtfauJQZVwlz7pvGfgDLK8', '100', null, null, null);
INSERT INTO `User` VALUES ('73966', null, null, null, null, null, null, null, null, '空间探秘', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/ImJzEwpB9u4nBo5GtDEVh9KANXvoSiaJaHISdhXmuFcv1MqPeQq5jvEcesoEzShkQI0Z6n6TvH0HnibJkqJbUeEg/132', 'obwPJ5ed8VXsd7V4nrLDXIHzSxwA', '100', null, null, null);
INSERT INTO `User` VALUES ('73967', null, null, null, null, null, null, null, null, '洪育蓁', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmhead/Yh2DkZXR1ky3Nbm1sLmcCCZdmUzypgJnXcF5I223Vd0/132', 'obwPJ5QfgdEAX-LgL_Ii8nrjb6dM', '100', null, null, null);
INSERT INTO `User` VALUES ('73968', null, null, null, null, null, null, null, null, 'xliu', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eqaDcOQIf0exMZqMibhgicShpM5VLNrcskx8cFyxUg8FfWTQKKUichPMvoc1IiaDvtsqBRC195y7WQ7Eg/132', 'obwPJ5VVe-CnD_Dzy3YwZASR4l6U', '100', null, null, null);
INSERT INTO `User` VALUES ('73969', null, null, null, null, null, null, null, null, 'QIU', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/k7UBfUJJxZsjV9KYBwdibyuXolAvibphk9WsdkormHR7HLZrtkiaTvdm6lpskfmsMyKT0CZRHjeicubjrQJicAFFA2Q/132', 'obwPJ5U1j-rO4qqcj2yNaW8tk10Q', '100', null, null, null);
INSERT INTO `User` VALUES ('73970', null, null, null, null, null, null, null, null, '刘青虹', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmhead/0TicUpQ4jCxeFicUUbY1BgCKGZYibbdR0VCoZjHvCBB20w/132', 'obwPJ5dJJdk8gG86gl9bFEzbxQok', '100', null, null, null);
INSERT INTO `User` VALUES ('73971', null, null, null, null, null, null, null, null, 'Liulw', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTL0cpBhPCh717hIjN1Jtmd96zPPWR3PYsZMsibhfFUqO21H70FXq5G6K93P48y3V8GfZwIHuZWs95g/132', 'obwPJ5axuPCtFNmzsL9KhJ-JrJbc', '100', null, null, null);
INSERT INTO `User` VALUES ('73972', null, null, null, null, null, null, null, null, '博', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLHRViaibj59H2GOwaKFW6FsCyUnERujwIhCp4AvHxqDibxF9NvPcH2ogvmJDtvnw0N87ibJTdwIOm0ng/132', 'obwPJ5a5BJm4V1-RINN7yXetDL6Y', '100', null, null, null);

-- ----------------------------
-- Table structure for WARNING
-- ----------------------------
DROP TABLE IF EXISTS `WARNING`;
CREATE TABLE `WARNING` (
  `id` int(11) NOT NULL,
  `warning` text COLLATE utf8_unicode_ci,
  `Bitcoin_Address` text COLLATE utf8_unicode_ci,
  `Email` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of WARNING
-- ----------------------------
INSERT INTO `WARNING` VALUES ('1', 'To recover your lost Database and avoid leaking it: Send us 0.06 Bitcoin (BTC) to our Bitcoin address 1BLYhUDmnmVPVjcTWgc6gFT6DCYwbVieUD and contact us by Email with your Server IP or Domain name and a Proof of Payment. If you are unsure if we have your data, contact us and we will send you a proof. Your Database is downloaded and backed up on our servers. Backups that we have right now: cms . If we dont receive your payment in the next 10 Days, we will make your database public or use them otherwise.', '1BLYhUDmnmVPVjcTWgc6gFT6DCYwbVieUD', 'contact@sqldb.to');

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
  `createtime` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture4` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture5` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture6` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture7` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture8` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture9` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `priceUnit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shunxu` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `stocknum` int(11) DEFAULT NULL,
  `updatetime` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  `weCateName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of WeItem
-- ----------------------------

-- ----------------------------
-- Table structure for WeItemUser
-- ----------------------------
DROP TABLE IF EXISTS `WeItemUser`;
CREATE TABLE `WeItemUser` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createtime` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quhuodate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `selected` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `totalPrice` double DEFAULT NULL,
  `updatetime` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  `weItemid` bigint(20) DEFAULT NULL,
  `yudingdate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `weItem_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_8hc369fjy9wo3abwvdpratooo` (`user_id`),
  KEY `FK_ffhux616u2eyr3lohymtr827e` (`weItem_id`),
  CONSTRAINT `FK_8hc369fjy9wo3abwvdpratooo` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`),
  CONSTRAINT `FK_ffhux616u2eyr3lohymtr827e` FOREIGN KEY (`weItem_id`) REFERENCES `WeItem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
