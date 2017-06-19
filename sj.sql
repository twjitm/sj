/*
Navicat MySQL Data Transfer

Source Server         : 本地数据库
Source Server Version : 50626
Source Host           : localhost:3306
Source Database       : sj

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2017-04-09 21:57:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `bk_name` varchar(255) DEFAULT NULL COMMENT '书名',
  `bk_author` varchar(255) DEFAULT NULL COMMENT '作者',
  `bk_press` varchar(255) DEFAULT NULL COMMENT '出版社',
  `bk_isbn` varchar(255) DEFAULT NULL COMMENT '国际标准书号',
  `bk_presstime` varchar(255) DEFAULT NULL COMMENT '出版时间',
  `bk_version` int(11) DEFAULT NULL COMMENT '版本号',
  `bk_theme` varchar(255) DEFAULT NULL,
  `bk_browsenum` int(11) DEFAULT NULL COMMENT '浏览次数',
  `bk_collection` varchar(255) DEFAULT NULL COMMENT '丛编主题名',
  `bk_pagenum` int(11) DEFAULT NULL COMMENT '页码',
  `bk_type` int(11) DEFAULT NULL COMMENT '图书类型',
  `bk_image` varchar(255) DEFAULT NULL COMMENT '图书图片',
  `bk_inlibtime` datetime DEFAULT NULL COMMENT '入馆时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES ('1', '算法导论', '王朗', '河北大学', 'EB102452', '2016', '1', '算法研究图书', '23', '1', '2', '1', null, '2017-04-05 11:04:41');
INSERT INTO `books` VALUES ('3', '计算机', '唐文江', '河北大学', '1', '2017', '1', '1', '19', '1', '1', '1', '11', '2017-04-02 09:20:23');

-- ----------------------------
-- Table structure for borrows
-- ----------------------------
DROP TABLE IF EXISTS `borrows`;
CREATE TABLE `borrows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bw_bwtime` varchar(255) DEFAULT NULL COMMENT '借阅日期',
  `bw_endtime` varchar(255) DEFAULT NULL COMMENT '结束日期',
  `bw_isreturn` int(11) DEFAULT NULL COMMENT '是否归还',
  `bk_id` int(11) DEFAULT NULL COMMENT '图书id',
  `pr_id` int(11) DEFAULT NULL COMMENT '论文id',
  `pl_id` int(11) DEFAULT NULL COMMENT '期刊id',
  `bw_iscontinue` int(11) DEFAULT NULL COMMENT '是否续借',
  `bw_continue` varchar(255) DEFAULT NULL COMMENT '续借日期',
  `bw_contreturntime` varchar(255) DEFAULT NULL COMMENT '续借归还日期',
  `u_id` int(11) DEFAULT NULL COMMENT '借阅人',
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of borrows
-- ----------------------------
INSERT INTO `borrows` VALUES ('12', '2017-04-08 21:19:43', '2017-04-08 21:19:32', null, null, null, '1', '1', '2017-04-29 21:19:36', '2017-04-29 21:19:40', '2', '2');
INSERT INTO `borrows` VALUES ('13', '2017-04-08 21:29:24', '2017-04-08 21:29:21', null, '1', null, null, '0', null, null, '2', '0');
INSERT INTO `borrows` VALUES ('15', '2017-04-09 18:41:05', '2017-04-15 18:40:58', null, null, '1', null, '0', null, null, '3', '1');

-- ----------------------------
-- Table structure for collections
-- ----------------------------
DROP TABLE IF EXISTS `collections`;
CREATE TABLE `collections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_id` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `u_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collections
-- ----------------------------
INSERT INTO `collections` VALUES ('1', '1', '2', '0');
INSERT INTO `collections` VALUES ('7', '2', '0', '0');
INSERT INTO `collections` VALUES ('8', '1', '0', '2');
INSERT INTO `collections` VALUES ('9', '1', '0', '1');
INSERT INTO `collections` VALUES ('10', '3', '0', '2');

-- ----------------------------
-- Table structure for commons
-- ----------------------------
DROP TABLE IF EXISTS `commons`;
CREATE TABLE `commons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_id` int(11) DEFAULT NULL COMMENT '评论实体id',
  `com_type` int(11) DEFAULT NULL COMMENT '评论类型',
  `com_context` varchar(255) DEFAULT NULL COMMENT '评论内容',
  `com_time` varchar(255) DEFAULT NULL COMMENT '评论时间',
  `user_account` varchar(255) DEFAULT NULL COMMENT '评论人账号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of commons
-- ----------------------------
INSERT INTO `commons` VALUES ('1', '3', '0', '不好看', '2017-04-02 17:54:35', 'default');
INSERT INTO `commons` VALUES ('2', '3', '0', '一般般', '2017-04-03 14:21:13', 'default');
INSERT INTO `commons` VALUES ('3', '1', '0', '好看', '2017-04-05 11:05:50', 'default');
INSERT INTO `commons` VALUES ('9', null, null, null, '2017-04-05 20:42:44', 'default');
INSERT INTO `commons` VALUES ('10', '1', '0', '哈哈', '2017-04-05 20:44:06', 'default');
INSERT INTO `commons` VALUES ('11', '1', '0', '什么书啊', '2017-04-05 20:46:14', 'default');
INSERT INTO `commons` VALUES ('12', '3', '0', '真的不好看吗？', '2017-04-05 20:48:47', 'default');
INSERT INTO `commons` VALUES ('13', null, '0', 'hehehe', '2017-04-05 23:41:08', 'default');
INSERT INTO `commons` VALUES ('14', '1', '0', '什么啊', '2017-04-05 23:43:58', 'default');
INSERT INTO `commons` VALUES ('15', '1', '2', '我去', '2017-04-05 23:45:02', 'default');
INSERT INTO `commons` VALUES ('16', '1', '2', '不好看吧', '2017-04-05 23:45:13', 'default');
INSERT INTO `commons` VALUES ('17', '1', '2', 'hehe', '2017-04-07 18:19:57', '唐文江');
INSERT INTO `commons` VALUES ('18', '1', '0', '好看吗这本书？', '2017-04-07 22:41:28', '唐文江');
INSERT INTO `commons` VALUES ('19', '1', '2', '呵呵', '2017-04-09 18:41:19', '2013');

-- ----------------------------
-- Table structure for leavemag
-- ----------------------------
DROP TABLE IF EXISTS `leavemag`;
CREATE TABLE `leavemag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msg_context` varchar(255) DEFAULT NULL COMMENT '留言内容',
  `msg_name` varchar(255) DEFAULT NULL COMMENT '留言人名字',
  `msg_date` varchar(255) DEFAULT NULL COMMENT '留言时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of leavemag
-- ----------------------------
INSERT INTO `leavemag` VALUES ('1', '系统不错', '唐文江', '2017.1.1');
INSERT INTO `leavemag` VALUES ('2', '可以得', '唐文江', '2017-04-08 00:14:26');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `have_child` int(11) DEFAULT NULL,
  `is_hidden` int(11) DEFAULT NULL,
  `menu_img` varchar(255) DEFAULT NULL,
  `menu_name` varchar(255) DEFAULT NULL,
  `menu_url` varchar(255) DEFAULT NULL,
  `order_num` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '1', '1', 'fa fa-dashboard', '新书推荐', '/books/newall.do', '1', '0');
INSERT INTO `menu` VALUES ('2', '1', '1', 'fa fa-desktop', '猜你喜欢', '/borrows/like.do', '3', '0');
INSERT INTO `menu` VALUES ('3', '1', '1', 'fa fa-qrcode', '借阅历史', '/borrows/list.do', '2', '0');

-- ----------------------------
-- Table structure for papers
-- ----------------------------
DROP TABLE IF EXISTS `papers`;
CREATE TABLE `papers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pr_name` varchar(255) DEFAULT NULL COMMENT '名称',
  `pr_degree` varchar(255) DEFAULT NULL COMMENT '学位名称',
  `pr_year` varchar(255) DEFAULT NULL COMMENT '论文年度',
  `pr_author` varchar(255) DEFAULT NULL COMMENT '论文作者',
  `pr_theme` varchar(500) DEFAULT NULL COMMENT '主题',
  `pr_summary` varchar(1000) DEFAULT NULL COMMENT '简介',
  `pr_classify` varchar(255) DEFAULT NULL COMMENT '论文学科分类',
  `pr_company` varchar(255) DEFAULT NULL COMMENT '学位授予单位',
  `pr_tutor` varchar(255) DEFAULT NULL COMMENT '导师',
  `pr_pagenum` int(11) DEFAULT NULL COMMENT '页码',
  `pr_language` varchar(255) DEFAULT NULL COMMENT '论文语言',
  `pr_borrownum` int(11) DEFAULT NULL COMMENT '借阅次数',
  `pr_collectionnum` int(11) DEFAULT NULL COMMENT '收藏次数',
  `pr_looknum` int(11) DEFAULT NULL COMMENT '查看次数',
  `pr_inlibtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of papers
-- ----------------------------
INSERT INTO `papers` VALUES ('1', '防火墙设计与安全研究', '本科', '2015', '小明', '研究防火墙系统', '研究防火墙系统研究防火墙系统研究防火墙系统', '安全类', '河北大学', '李继明', '20', '中文', '49', '1', '1', '2017-04-02 10:55:41');

-- ----------------------------
-- Table structure for periodicals
-- ----------------------------
DROP TABLE IF EXISTS `periodicals`;
CREATE TABLE `periodicals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pl_name` varchar(255) DEFAULT NULL COMMENT '期刊名',
  `pl_source` varchar(255) DEFAULT NULL COMMENT '出处',
  `pl_author` varchar(255) DEFAULT NULL COMMENT '作者',
  `pl_time` varchar(255) DEFAULT NULL COMMENT '出版时间',
  `pl_version` varchar(255) DEFAULT NULL COMMENT '版本号',
  `pl_theme` varchar(1000) DEFAULT NULL COMMENT '主题词',
  `pl_summary` varchar(1000) DEFAULT NULL COMMENT '摘要',
  `pl_issn` varchar(255) DEFAULT NULL COMMENT '国际期刊编号',
  `pl_image` varchar(255) DEFAULT NULL COMMENT '期刊图片',
  `pl_type` int(11) DEFAULT NULL COMMENT '类型',
  `pl_inlibtime` datetime DEFAULT NULL COMMENT '入馆事件',
  `pl_browsenum` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of periodicals
-- ----------------------------
INSERT INTO `periodicals` VALUES ('1', '电信宽带夜幕', '河北大学', '呵呵', '2016', '1', '建立中国电信宽带也无', '这个是建立中国宽带业务的东西这个是建立中国宽带业务的东西这个是建立中国宽带业务的东西', '111', '111', '11', '2017-04-09 10:35:50', '28');
INSERT INTO `periodicals` VALUES ('2', '国家图书馆建议', '河北大学计算机科学与技术需要', '河北大学', '2016', '1', '建立国家图书馆需要的东西', '建立国家图书馆需要的东西建立国家图书馆需要的东西建立国家图书馆需要的东西建立国家图书馆需要的东西', '00ff', '11212', '1212', '2017-04-09 10:44:40', '19');

-- ----------------------------
-- Table structure for power
-- ----------------------------
DROP TABLE IF EXISTS `power`;
CREATE TABLE `power` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) DEFAULT NULL,
  `user_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of power
-- ----------------------------
INSERT INTO `power` VALUES ('1', '1', '1');
INSERT INTO `power` VALUES ('2', '2', '2');
INSERT INTO `power` VALUES ('3', '3', '1');

-- ----------------------------
-- Table structure for querys
-- ----------------------------
DROP TABLE IF EXISTS `querys`;
CREATE TABLE `querys` (
  `id` int(11) NOT NULL,
  `qy_time` varchar(255) DEFAULT NULL COMMENT '查询日期',
  `qy_context` varchar(255) DEFAULT NULL COMMENT '查询内容',
  `u_id` int(11) DEFAULT NULL COMMENT '查询人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of querys
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ur_name` varchar(255) DEFAULT NULL COMMENT '用户名',
  `ur_barcode` varchar(255) DEFAULT NULL COMMENT '读者条码号',
  `ur_sex` varchar(255) DEFAULT NULL COMMENT '性别',
  `ur_psd` varchar(255) DEFAULT NULL,
  `ur_access` varchar(255) DEFAULT NULL COMMENT '账号',
  `ur_type` int(11) DEFAULT NULL COMMENT '用户类型',
  `stu_type` int(11) DEFAULT NULL COMMENT '学生类型',
  `sr_iphone` varchar(255) DEFAULT NULL COMMENT '手机号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'admin', '2013434154', '男', '123456', 'admin', '1', '1', '1');
INSERT INTO `users` VALUES ('2', '唐文江', '2013434154', '男', '123456', '唐文江', '1', '1', '15733280862');
INSERT INTO `users` VALUES ('3', 'twj', '2013', null, '123456', '2013', '1', '1', '111111');
