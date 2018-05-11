/*
Navicat MySQL Data Transfer

Source Server         : 本机数据库
Source Server Version : 50714
Source Host           : 127.0.0.1:3306
Source Database       : wechattp5

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2018-05-11 16:53:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for we_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `we_auth_group`;
CREATE TABLE `we_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` char(80) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户组的权限表';

-- ----------------------------
-- Records of we_auth_group
-- ----------------------------
INSERT INTO `we_auth_group` VALUES ('1', '超级管理员', '1', '1,2,3,4,5');
INSERT INTO `we_auth_group` VALUES ('2', '普通管理员', '1', '1,2,3,4,5');
INSERT INTO `we_auth_group` VALUES ('3', '普通用户', '1', '5');

-- ----------------------------
-- Table structure for we_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `we_auth_group_access`;
CREATE TABLE `we_auth_group_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='每个用户所属的权限组的表';

-- ----------------------------
-- Records of we_auth_group_access
-- ----------------------------
INSERT INTO `we_auth_group_access` VALUES ('1', '1', '1');
INSERT INTO `we_auth_group_access` VALUES ('2', '2', '2');
INSERT INTO `we_auth_group_access` VALUES ('3', '3', '3');

-- ----------------------------
-- Table structure for we_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `we_auth_rule`;
CREATE TABLE `we_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(80) NOT NULL DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `condition` char(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='权限规则表';

-- ----------------------------
-- Records of we_auth_rule
-- ----------------------------
INSERT INTO `we_auth_rule` VALUES ('1', 'index/User/addUser', '添加用户', '1', '1', '');
INSERT INTO `we_auth_rule` VALUES ('2', 'index-User', '用户管理', '1', '1', '');
INSERT INTO `we_auth_rule` VALUES ('3', 'index-Wechat', '微信接口', '1', '1', '');
INSERT INTO `we_auth_rule` VALUES ('4', 'index-WechatServer', '微信回调', '1', '1', '');
INSERT INTO `we_auth_rule` VALUES ('5', 'index-Index', '控制台首页', '1', '1', '');
INSERT INTO `we_auth_rule` VALUES ('6', 'index-AutoReply', '自动回复页面', '1', '1', '');
INSERT INTO `we_auth_rule` VALUES ('7', 'index-Config', '公众号配置界面', '1', '1', '');
INSERT INTO `we_auth_rule` VALUES ('8', '', '', '1', '1', '');

-- ----------------------------
-- Table structure for we_auto_reply
-- ----------------------------
DROP TABLE IF EXISTS `we_auto_reply`;
CREATE TABLE `we_auto_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scene` int(11) DEFAULT '1' COMMENT '回复场景',
  `keyword` varchar(255) DEFAULT NULL,
  `reply` varchar(255) DEFAULT NULL,
  `msgtype` varchar(255) DEFAULT '' COMMENT '消息类型',
  `eventtype` varchar(255) DEFAULT '',
  `appid` varchar(255) DEFAULT '' COMMENT '所属的公众号appid',
  `status` tinyint(2) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='自动回复配置表';

-- ----------------------------
-- Records of we_auto_reply
-- ----------------------------
INSERT INTO `we_auto_reply` VALUES ('4', '1', '后台管理', '<a href=\"http://www.songphper.top\">欢迎使用微信后台管理系统</a>', 'text', '1', 'wx7ad4ce9789a311ea', '1', '2018-04-15 21:56:21', '2018-04-15 22:15:26');
INSERT INTO `we_auto_reply` VALUES ('5', '1', '默认回复', '如需帮助，<a href=\"https://uat.zwmedia.com.cn/wxzspfse/index.php/Customer/index/index\">请点击咨询客服</a> [耶] \r\n如自助咨询内无您遇到的问题，可在客服链接内选择“提交工单”，进行反馈，客服会为您解答！[皱眉]', 'text', '1', 'wx7ad4ce9789a311ea', '0', '2018-04-15 22:03:23', '2018-04-19 23:44:31');
INSERT INTO `we_auto_reply` VALUES ('6', '1', '关键字', '目前可使用的关键字有:\r\n1.后台管理\r\n2.百度一下\r\n3.客服', 'text', '1', 'wx7ad4ce9789a311ea', '1', '2018-04-15 22:06:22', '2018-04-15 22:09:26');
INSERT INTO `we_auto_reply` VALUES ('7', '1', '百度一下', '<a href=\"www.baidu.com\">百度一下</a>', 'text', '1', 'wx7ad4ce9789a311ea', '1', '2018-04-15 22:06:55', '2018-04-15 22:06:55');
INSERT INTO `we_auto_reply` VALUES ('8', '1', '客服', '<a href=\"https://uat.zwmedia.com.cn/wxzspfse/index.php/Customer/index/index\">请点击咨询客服</a> ', 'text', '1', 'wx7ad4ce9789a311ea', '1', '2018-04-15 22:08:02', '2018-04-15 22:08:02');
INSERT INTO `we_auto_reply` VALUES ('11', '1', '关注回复', '欢迎关注', 'text', '', 'wx7ad4ce9789a311ea', '1', '2018-04-19 22:52:25', '2018-04-19 22:52:25');
INSERT INTO `we_auto_reply` VALUES ('12', '1', '默认回复2', '目前可使用的关键字有:\r\n1.后台管理 \r\n2.百度一下 \r\n3.客服', 'text', '', 'wx7ad4ce9789a311ea', '-1', '2018-04-19 23:44:26', '2018-04-19 23:44:26');

-- ----------------------------
-- Table structure for we_event
-- ----------------------------
DROP TABLE IF EXISTS `we_event`;
CREATE TABLE `we_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event` varchar(255) CHARACTER SET utf8 DEFAULT '',
  `remark` varchar(255) DEFAULT '',
  `status` tinyint(2) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COMMENT='微信事件表';

-- ----------------------------
-- Records of we_event
-- ----------------------------
INSERT INTO `we_event` VALUES ('1', 'text', '', '1');
INSERT INTO `we_event` VALUES ('2', 'image', '', '1');
INSERT INTO `we_event` VALUES ('3', 'location', '', '1');
INSERT INTO `we_event` VALUES ('4', 'link', '', '1');
INSERT INTO `we_event` VALUES ('5', 'event', '', '1');
INSERT INTO `we_event` VALUES ('6', 'music', '', '1');
INSERT INTO `we_event` VALUES ('7', 'news', '', '1');
INSERT INTO `we_event` VALUES ('8', 'voice', '', '1');
INSERT INTO `we_event` VALUES ('9', 'video', '', '1');
INSERT INTO `we_event` VALUES ('10', 'shortvideo', '', '1');
INSERT INTO `we_event` VALUES ('11', 'subscribe', '', '1');
INSERT INTO `we_event` VALUES ('12', 'unsubscribe', '', '1');
INSERT INTO `we_event` VALUES ('13', 'SCAN', '', '1');
INSERT INTO `we_event` VALUES ('14', 'LOCATION', '', '1');
INSERT INTO `we_event` VALUES ('15', 'VIEW', '', '1');
INSERT INTO `we_event` VALUES ('16', 'CLICK', '', '1');
INSERT INTO `we_event` VALUES ('17', 'scancode_push', '', '1');
INSERT INTO `we_event` VALUES ('18', 'scancode_waitmsg', '', '1');
INSERT INTO `we_event` VALUES ('19', 'pic_sysphoto', '', '1');
INSERT INTO `we_event` VALUES ('20', 'pic_photo_or_album', '', '1');
INSERT INTO `we_event` VALUES ('21', 'pic_weixin', '', '1');
INSERT INTO `we_event` VALUES ('22', 'location_select', '', '1');
INSERT INTO `we_event` VALUES ('23', 'MASSSENDJOBFINISH', '', '1');
INSERT INTO `we_event` VALUES ('24', 'TEMPLATESENDJOBFINISH', '', '1');
INSERT INTO `we_event` VALUES ('25', 'kfcreatesession', '', '1');
INSERT INTO `we_event` VALUES ('26', 'kfclosesession', '', '1');
INSERT INTO `we_event` VALUES ('27', 'kfswitchsession', '', '1');
INSERT INTO `we_event` VALUES ('28', 'card_pass_check', '', '1');
INSERT INTO `we_event` VALUES ('29', 'card_not_pass_check', '', '1');
INSERT INTO `we_event` VALUES ('30', 'user_get_card', '', '1');
INSERT INTO `we_event` VALUES ('31', 'user_del_card', '', '1');
INSERT INTO `we_event` VALUES ('32', 'merchant_order', '', '1');

-- ----------------------------
-- Table structure for we_log
-- ----------------------------
DROP TABLE IF EXISTS `we_log`;
CREATE TABLE `we_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appid` varchar(64) NOT NULL DEFAULT '',
  `remak` varchar(255) NOT NULL DEFAULT '',
  `action` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT '',
  `detail` text,
  `controller` varchar(255) DEFAULT NULL,
  `classname` varchar(255) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='平台日志表';

-- ----------------------------
-- Records of we_log
-- ----------------------------

-- ----------------------------
-- Table structure for we_material
-- ----------------------------
DROP TABLE IF EXISTS `we_material`;
CREATE TABLE `we_material` (
  `id` int(11) NOT NULL,
  `media_id` varchar(255) NOT NULL DEFAULT '' COMMENT '素材ID',
  `title` varchar(255) DEFAULT '' COMMENT '标题',
  `author` varchar(255) DEFAULT '' COMMENT '作者',
  `digest` varchar(255) DEFAULT '' COMMENT '简介',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信素材';

-- ----------------------------
-- Records of we_material
-- ----------------------------

-- ----------------------------
-- Table structure for we_menu
-- ----------------------------
DROP TABLE IF EXISTS `we_menu`;
CREATE TABLE `we_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0' COMMENT '所属的配置ID',
  `appid` varchar(64) DEFAULT '' COMMENT '所属的公众号',
  `buttonname` varchar(20) DEFAULT '' COMMENT '按钮名称',
  `type` varchar(30) DEFAULT '' COMMENT '类型',
  `key` varchar(30) DEFAULT '' COMMENT '关键字',
  `url` varchar(255) DEFAULT '' COMMENT '链接',
  `parentid` int(11) DEFAULT '0' COMMENT '父ID',
  `sort` int(20) DEFAULT '0' COMMENT '排序',
  `status` tinyint(2) DEFAULT '1' COMMENT '是否启用1表示启用0表示禁用',
  `createtime` datetime NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '创建时间',
  `updatetime` datetime NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COMMENT='自定义菜单表';

-- ----------------------------
-- Records of we_menu
-- ----------------------------
INSERT INTO `we_menu` VALUES ('53', '27', '1231', '123', 'show', '', '', '0', '0', '1', '2018-05-11 14:44:01', '2018-05-11 14:44:01');
INSERT INTO `we_menu` VALUES ('54', '27', '1231', '12443', 'show', '', '', '0', '0', '1', '2018-05-11 14:44:14', '2018-05-11 14:44:14');
INSERT INTO `we_menu` VALUES ('55', '0', 'wxf42302be9b7152f8', '案例赏test', 'view', '', '', '0', '0', '1', '2018-05-11 14:50:02', '2018-05-11 14:50:02');
INSERT INTO `we_menu` VALUES ('56', '0', 'wxf42302be9b7152f8', '互动H5', 'view', '', 'http://m.zwmedia.com.cn/highlander0321', '55', '0', '1', '2018-05-11 14:50:02', '2018-05-11 14:50:02');
INSERT INTO `we_menu` VALUES ('57', '0', 'wxf42302be9b7152f8', '奇妙H5', 'view', '', 'http://m.zwmedia.com.cn/zx150925', '55', '0', '1', '2018-05-11 14:50:02', '2018-05-11 14:50:02');
INSERT INTO `we_menu` VALUES ('58', '0', 'wxf42302be9b7152f8', '酷炫H5', 'view', '', 'http://landingpage.hdtmedia.com/youyiku', '55', '0', '1', '2018-05-11 14:50:02', '2018-05-11 14:50:02');
INSERT INTO `we_menu` VALUES ('59', '0', 'wxf42302be9b7152f8', '掌握案例秀', 'media_id', '', 'PVEYnlT-wOoTU7NC_kIafeM8maG31Dwpn1Qg8CcfA00', '55', '0', '1', '2018-05-11 14:50:02', '2018-05-11 14:50:02');
INSERT INTO `we_menu` VALUES ('60', '0', 'wxf42302be9b7152f8', '行业案例赏', 'view', '', 'http://m.zwmedia.com.cn/Levin0514', '55', '0', '1', '2018-05-11 14:50:02', '2018-05-11 14:50:02');
INSERT INTO `we_menu` VALUES ('61', '0', 'wxf42302be9b7152f8', '有奖活动', 'view', '', 'http://vurl.cn/NGZkM', '0', '0', '1', '2018-05-11 14:50:02', '2018-05-11 14:50:02');
INSERT INTO `we_menu` VALUES ('62', '0', 'wxf42302be9b7152f8', '掌握秀', 'view', '', 'http://vurl.cn/NGZkM', '0', '0', '1', '2018-05-11 14:50:02', '2018-05-11 14:50:02');
INSERT INTO `we_menu` VALUES ('63', '0', 'wxf42302be9b7152f8', '掌握简介', 'view', '', 'http://vurl.cn/OGMyN', '62', '0', '1', '2018-05-11 14:50:02', '2018-05-11 14:50:02');
INSERT INTO `we_menu` VALUES ('64', '0', 'wxf42302be9b7152f8', '了解更多', 'view', '', 'http://www.zwmedia.com.cn/', '62', '0', '1', '2018-05-11 14:50:02', '2018-05-11 14:50:02');
INSERT INTO `we_menu` VALUES ('65', '0', 'wxf42302be9b7152f8', '测试子菜单', 'view', '', 'http://www.baidu.com', '62', '0', '1', '2018-05-11 14:50:02', '2018-05-11 14:50:02');
INSERT INTO `we_menu` VALUES ('66', '12', 'wxf42302be9b7152f8', '123', 'show', '', '', '0', '0', '1', '2018-05-11 14:52:33', '2018-05-11 14:52:33');
INSERT INTO `we_menu` VALUES ('68', '12', 'wxf42302be9b7152f8', '玩儿', 'view', '', '玩儿', '66', '0', '1', '2018-05-11 14:55:12', '2018-05-11 14:55:12');
INSERT INTO `we_menu` VALUES ('69', '12', 'wxf42302be9b7152f8', '12', 'media_id', '', '', '66', '0', '1', '2018-05-11 14:55:21', '2018-05-11 14:55:21');
INSERT INTO `we_menu` VALUES ('71', '27', '1231', '测试子菜单', 'view', '', 'http://www.baidu.com', '53', '0', '1', '2018-05-11 15:03:30', '2018-05-11 15:03:30');
INSERT INTO `we_menu` VALUES ('72', '27', '1231', '图文消息', 'media_id', '', '', '53', '0', '1', '2018-05-11 15:03:53', '2018-05-11 15:03:53');
INSERT INTO `we_menu` VALUES ('73', '27', '1231', '小程序', 'miniprogram', 'fdsfads', 'fdsfsfs', '53', '0', '1', '2018-05-11 15:04:50', '2018-05-11 15:04:50');
INSERT INTO `we_menu` VALUES ('89', '0', 'wx7ad4ce9789a311ea', '消费攻略', 'show', '', '', '0', '0', '1', '2018-05-11 16:05:43', '2018-05-11 16:05:43');
INSERT INTO `we_menu` VALUES ('90', '0', 'wx7ad4ce9789a311ea', '信用卡攻略', 'view', '', 'https://mp.weixin.qq.com/mp/homepage?__biz=MzIwNTMzMDQyOQ==&hid=3&sn=aceac7d43b7fbacc9f59827ef749895e&scene=18&uin=&key=&devicetype=Windows+10&version=620502c8&lang=zh_CN&ascene=7&winzoom=1', '89', '0', '1', '2018-05-11 16:05:43', '2018-05-11 16:05:43');
INSERT INTO `we_menu` VALUES ('91', '0', 'wx7ad4ce9789a311ea', '消费避雷区', 'view', '', 'https://mp.weixin.qq.com/mp/homepage?__biz=MzIwNTMzMDQyOQ==&hid=4&sn=d1e7ff93317f3ec19ed2856b4bcc9261&scene=18&uin=&key=&devicetype=Windows+10&version=620502c8&lang=zh_CN&ascene=7&winzoom=1', '89', '0', '1', '2018-05-11 16:05:43', '2018-05-11 16:05:43');
INSERT INTO `we_menu` VALUES ('92', '0', 'wx7ad4ce9789a311ea', '会员卡权益', 'view', '', 'http://m.zwmedia.com.cn/vip/public/index.php', '89', '0', '1', '2018-05-11 16:05:43', '2018-05-11 16:05:43');
INSERT INTO `we_menu` VALUES ('93', '0', 'wx7ad4ce9789a311ea', '机场免税店折扣券', 'view', '', 'http://www.songphper.top', '89', '0', '1', '2018-05-11 16:05:43', '2018-05-11 16:05:43');
INSERT INTO `we_menu` VALUES ('94', '1', 'wx7ad4ce9789a311ea', '123', 'view', '', '123', '0', '0', '1', '2018-05-11 16:08:42', '2018-05-11 16:08:42');
INSERT INTO `we_menu` VALUES ('96', '1', 'wx7ad4ce9789a311ea', '123', 'view', '', '123', '0', '0', '1', '2018-05-11 16:22:43', '2018-05-11 16:22:43');
INSERT INTO `we_menu` VALUES ('98', '1', 'wx7ad4ce9789a311ea', '123', 'show', '', '', '0', '0', '1', '2018-05-11 16:36:30', '2018-05-11 16:36:30');
INSERT INTO `we_menu` VALUES ('100', '1', 'wx7ad4ce9789a311ea', '123', 'miniprogram', '123', '12323', '96', '0', '1', '2018-05-11 16:37:07', '2018-05-11 16:37:07');
INSERT INTO `we_menu` VALUES ('101', '1', 'wx7ad4ce9789a311ea', '123', 'miniprogram', '24', '124', '96', '0', '1', '2018-05-11 16:37:20', '2018-05-11 16:37:20');
INSERT INTO `we_menu` VALUES ('102', '1', 'wx7ad4ce9789a311ea', '123', 'miniprogram', '34', '343434', '96', '0', '1', '2018-05-11 16:37:42', '2018-05-11 16:37:42');
INSERT INTO `we_menu` VALUES ('103', '1', 'wx7ad4ce9789a311ea', '1', 'show', '', '', '0', '0', '1', '2018-05-11 16:43:36', '2018-05-11 16:43:36');
INSERT INTO `we_menu` VALUES ('105', '29', 'wx7ad4ce9789a311ea3', '顶级菜单', 'show', '', '', '0', '0', '1', '2018-05-11 16:46:37', '2018-05-11 16:46:37');
INSERT INTO `we_menu` VALUES ('106', '29', 'wx7ad4ce9789a311ea3', '百度一下', 'view', '', 'http://www.baidu.com', '105', '0', '1', '2018-05-11 16:46:53', '2018-05-11 16:46:53');
INSERT INTO `we_menu` VALUES ('107', '29', 'wx7ad4ce9789a311ea3', '百度两下', 'view', '', 'http://www.baidu.com', '105', '0', '1', '2018-05-11 16:47:33', '2018-05-11 16:47:33');
INSERT INTO `we_menu` VALUES ('108', '1', 'wx7ad4ce9789a311ea', '1', 'show', '', '', '0', '0', '1', '2018-05-11 16:53:16', '2018-05-11 16:53:16');
INSERT INTO `we_menu` VALUES ('109', '1', 'wx7ad4ce9789a311ea', '2', 'view', '', '2', '108', '2', '1', '2018-05-11 16:53:29', '2018-05-11 16:53:29');

-- ----------------------------
-- Table structure for we_server_log
-- ----------------------------
DROP TABLE IF EXISTS `we_server_log`;
CREATE TABLE `we_server_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) DEFAULT '',
  `to_user_name` varchar(255) DEFAULT '' COMMENT '对哪个公众号的产生的事件',
  `msgtype` varchar(255) DEFAULT NULL,
  `event` varchar(255) DEFAULT NULL,
  `eventkey` varchar(255) DEFAULT '',
  `detail` text,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='接收微信服务器返回的消息';

-- ----------------------------
-- Records of we_server_log
-- ----------------------------

-- ----------------------------
-- Table structure for we_template
-- ----------------------------
DROP TABLE IF EXISTS `we_template`;
CREATE TABLE `we_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appid` varchar(64) NOT NULL DEFAULT '0' COMMENT '所属公众号appid',
  `template_id` varchar(64) NOT NULL DEFAULT '' COMMENT '模板ID',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '模板标题',
  `primary_industry` varchar(64) NOT NULL DEFAULT '' COMMENT '模板所属行业的一级行业',
  `deputy_industry` varchar(64) NOT NULL DEFAULT '' COMMENT '模板所属行业的二级行业',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '模板内容',
  `example` varchar(255) NOT NULL DEFAULT '' COMMENT '模板示例',
  `createtime` datetime NOT NULL DEFAULT '1900-01-01 00:00:00',
  `updatetime` datetime NOT NULL DEFAULT '1900-01-01 00:00:00',
  `status` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8 COMMENT='模板消息';

-- ----------------------------
-- Records of we_template
-- ----------------------------
INSERT INTO `we_template` VALUES ('94', 'wx7ad4ce9789a311ea', 'M-hMkkXEjBBhZ6l59wRpr6-qDJrfc6Abm3Cy9UQCZGc', '优惠券使用提醒', '', '', '{{first.DATA}} \n优惠券名称：{{keyword1.DATA}} \n领取平台：{{keyword2.DATA}}\n过期时间：{{keyword3.DATA}} \n{{remark.DATA}}', '', '2018-04-28 15:41:51', '2018-04-28 15:41:51', '1');
INSERT INTO `we_template` VALUES ('95', 'wx7ad4ce9789a311ea', 'vsJn3kwFtbjn2yhDuY6v28Ec7x-ffMyv-K9ac52uOaU', '服务到期提醒', '', '', '{{first.DATA}}\n品牌名称：{{keyword1.DATA}}\n服务类型：{{keyword2.DATA}}\n到期时间：{{keyword3.DATA}}\n{{remark.DATA}}', '', '2018-04-28 15:41:51', '2018-04-28 15:41:51', '1');
INSERT INTO `we_template` VALUES ('96', 'wx7ad4ce9789a311ea', '0jykVKG9bFMolD5WFbeQOjznORUaG3Ddq2DRgH2iPj4', '中奖结果', '', '', '{{first.DATA}} \n奖品名称：{{keyword1.DATA}} \n中奖时间：{{keyword2.DATA}}\n{{remark.DATA}}', '', '2018-04-28 15:41:51', '2018-04-28 15:41:51', '1');
INSERT INTO `we_template` VALUES ('97', 'wx7ad4ce9789a311ea', '1xMfxtI_uN3ykPH_JFszRoheIEMz8mXnV3NCYDel3Ns', '红包提醒', '', '', '{{first.DATA}}\n 发放时间：{{keyword1.DATA}}\n 红包金额：{{keyword2.DATA}} \n{{remark.DATA}}', '', '2018-04-28 15:41:51', '2018-04-28 15:41:51', '1');
INSERT INTO `we_template` VALUES ('98', 'wx7ad4ce9789a311ea', 'Nl6e8w_Q7tEJz9mYec707e3KV_M3MMG5_oIWSaSfh2I', '签到提醒', '', '', '{{first.DATA}}\n 游戏名称：{{keyword1.DATA}}\n 签到时间：{{keyword2.DATA}} {{remark.DATA}}', '', '2018-04-28 15:41:51', '2018-04-28 15:41:51', '1');
INSERT INTO `we_template` VALUES ('99', 'wx7ad4ce9789a311ea', 'ANEhKtAUbY1GRozEAz_t3r7gCd9zcLbnJDDYSFfYYNQ', '活动结果通知', '', '', '{{first.DATA}} \n活动名称：{{keyword1.DATA}}\n活动结果：{{keyword2.DATA}}\n活动时间：{{keyword3.DATA}}\n会员名称：{{keyword4.DATA}}\n{{remark.DATA}}', '', '2018-04-28 15:41:51', '2018-04-28 15:41:51', '1');
INSERT INTO `we_template` VALUES ('100', 'wx7ad4ce9789a311ea', 'GIe3tUdXGtRTaNtynq9XE8aK5NDJldSJ6T5iuCIxojU', '未签到提醒', '', '', '{{first.DATA}} \n学生姓名：{{keyword1.DATA}}\n机构名称：{{keyword2.DATA}}\n签到状态：{{keyword3.DATA}}\n机构电话：{{keyword4.DATA}} {{remark.DATA}}', '', '2018-04-28 15:41:52', '2018-04-28 15:41:52', '1');
INSERT INTO `we_template` VALUES ('101', 'wx7ad4ce9789a311ea', 'cMhk8cWVam1pLkgU85-8_bK1ZwrlJdjWk26rowTt8V0', '未签到提醒2', '', '', '{{first.DATA}} \n学生姓名：{{keyword1.DATA}}\n机构名称：{{keyword2.DATA}}\n签到状态：{{keyword3.DATA}} \n机构电话：{{keyword4.DATA}}\n{{remark.DATA}}', '', '2018-04-28 15:41:52', '2018-04-28 15:41:52', '1');
INSERT INTO `we_template` VALUES ('103', 'wxf42302be9b7152f8', 'tVted9snXhtLTXDcpUWTm9cbkbmJU-6I_g6tcdXMSNU', '问题咨询处理通知', 'IT科技', '互联网|电子商务', '问题咨询处理进度提醒\n\n{{serviceInfo.DATA}}\n服务类型：{{serviceType.DATA}}\n处理状态：{{serviceStatus.DATA}}\n提交时间：{{time.DATA}}\n{{remark.DATA}}', '问题咨询处理进度提醒\n\n您好，您的服务单123456789有新的客服回复。\n服务类型：问题谘询\n处理状态：已解决\n提交时间：2013-12-16 13:30:22\n详细处理结果请点击\"详情\"查看。', '2018-05-02 10:51:11', '2018-05-02 10:51:11', '1');
INSERT INTO `we_template` VALUES ('104', 'wxf42302be9b7152f8', 's7D67zlqet88odLa9gsAp9ihRe8d8rJ12fY7IfBmP_M', '工单进度通知', 'IT科技', '互联网|电子商务', '{{first.DATA}}\n工单号：{{keyword1.DATA}}\n工单进度：{{keyword2.DATA}}\n工单处理人：{{keyword3.DATA}}\n{{remark.DATA}}', '工单解决通知\r\n工单号：INC000002699980\r\n工单进度：已解决\r\n工单处理人：宋青书\r\n您好，您上报的问题已经解决，解决方案为：请清空缓存后重新安装APK即可。', '2018-05-02 10:51:11', '2018-05-02 10:51:11', '1');
INSERT INTO `we_template` VALUES ('105', 'wxf42302be9b7152f8', 'LkDE0ySDz-mw6_JgtKwSGzbCye3JZmWlGY6ybrbF_8M', '服务到期提醒', 'IT科技', '互联网|电子商务', '{{first.DATA}}\n品牌名称：{{keyword1.DATA}}\n服务类型：{{keyword2.DATA}}\n到期时间：{{keyword3.DATA}}\n{{remark.DATA}}', '服务到期提醒\r\n品牌名称：网购时代[51931]\r\n服务类型：999178服务\r\n到期时间：2014-11-13\r\n请注意跟进，谢谢！', '2018-05-02 10:51:11', '2018-05-02 10:51:11', '1');
INSERT INTO `we_template` VALUES ('106', 'wxf42302be9b7152f8', '2ro1sQJiGDRs4Fhco6NlP6-WX8X5MC-Tn8icRHxOU2A', '未签到提醒', 'IT科技', '互联网|电子商务', '{{first.DATA}}\n学生姓名：{{keyword1.DATA}}\n机构名称：{{keyword2.DATA}}\n签到状态：{{keyword3.DATA}}\n机构电话：{{keyword4.DATA}}\n{{remark.DATA}}', '以下学生尚未签到\r\n学生姓名：小林\r\n机构名称：博远教育\r\n签到状态：未签到\r\n机构电话：1871XXXXX58\r\n若学生未请假，请及时联系老师或家长。', '2018-05-02 10:51:11', '2018-05-02 10:51:11', '1');
INSERT INTO `we_template` VALUES ('107', 'wxf42302be9b7152f8', '__jdW0SzLUbJOmU8R6g-d2K7rEvYSBqxspL1H32pyk8', '活动结果通知', 'IT科技', '互联网|电子商务', '{{first.DATA}}\n活动名称：{{keyword1.DATA}}\n活动结果：{{keyword2.DATA}}\n活动时间：{{keyword3.DATA}}\n会员名称：{{keyword4.DATA}}\n{{remark.DATA}}', '恭喜您中奖！\r\n活动名称：LEE SMILE 会员积分幸运抽奖\r\n活动结果：获得100分幸运积分\r\n活动时间：2017年6月22日\r\n会员名称：Robbin Qian\r\n感谢您参与活动！', '2018-05-02 10:51:11', '2018-05-02 10:51:11', '1');

-- ----------------------------
-- Table structure for we_template_pushlog
-- ----------------------------
DROP TABLE IF EXISTS `we_template_pushlog`;
CREATE TABLE `we_template_pushlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '所属用户ID',
  `wechatappid` varchar(64) DEFAULT NULL COMMENT '公众号appid',
  `title` varchar(64) NOT NULL DEFAULT '',
  `template_id` varchar(64) NOT NULL DEFAULT '' COMMENT '推送使用的模板ID',
  `content` text NOT NULL COMMENT '推送的具体内容',
  `senduser` varchar(255) NOT NULL DEFAULT '' COMMENT '接收此模板消息的人的OPENID',
  `sendtime` datetime NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '推送时间',
  `createtime` datetime NOT NULL DEFAULT '1900-01-01 00:00:00',
  `updatetime` datetime NOT NULL DEFAULT '1900-01-01 00:00:00',
  `msg` varchar(255) DEFAULT '' COMMENT '推送详情',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='模板消息推送日志表';

-- ----------------------------
-- Records of we_template_pushlog
-- ----------------------------
INSERT INTO `we_template_pushlog` VALUES ('1', '1', 'wxf42302be9b7152f8', '工单进度通知', 's7D67zlqet88odLa9gsAp9ihRe8d8rJ12fY7IfBmP_M', '{\"template_id\":\"s7D67zlqet88odLa9gsAp9ihRe8d8rJ12fY7IfBmP_M\",\"topcolor\":\"#FF0000\",\"data\":{\"keyword1\":{\"value\":\"1111\",\"color\":\"#173177\"},\"keyword2\":{\"value\":\"\\u6d4b\\u8bd5\",\"color\":\"#173177\"},\"keyword3\":{\"value\":\"\\u6d4b\\u8bd5\",\"color\":\"#173177\"},\"first\":{\"value\":\"\\u63a8\\u9001\\u6d4b\\u8bd5\",\"color\":\"#173177\"},\"remark\":{\"value\":\"\\u6d4b\\u8bd5\\u6d4b\\u8bd5\\u6d4b\\u8bd5\",\"color\":\"#173177\"}},\"touser\":\"o3InpjoCRWb9F7z8jhQpHudmL7IE\"}', 'o3InpjoCRWb9F7z8jhQpHudmL7IE', '2018-05-04 17:38:54', '2018-05-04 17:38:54', '2018-05-04 17:38:54', '成功:1条,失败:0条.');

-- ----------------------------
-- Table structure for we_user
-- ----------------------------
DROP TABLE IF EXISTS `we_user`;
CREATE TABLE `we_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) CHARACTER SET latin1 NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '' COMMENT '密码',
  `group` int(11) NOT NULL DEFAULT '1' COMMENT '所属用户组',
  `createtime` datetime NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '创建时间',
  `updatetime` datetime NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='微信管理后台用户表';

-- ----------------------------
-- Records of we_user
-- ----------------------------
INSERT INTO `we_user` VALUES ('1', 'mrsong', 'ccf747447e4a6a98f07d211abd414c2892af5d76', '1', '1900-01-01 00:00:00', '1900-01-01 00:00:00');
INSERT INTO `we_user` VALUES ('2', 'mrsong2', 'ccf747447e4a6a98f07d211abd414c2892af5d76', '1', '1900-01-01 00:00:00', '1900-01-01 00:00:00');
INSERT INTO `we_user` VALUES ('3', 'mrsongnew', 'ccf747447e4a6a98f07d211abd414c2892af5d76', '1', '1900-01-01 00:00:00', '1900-01-01 00:00:00');

-- ----------------------------
-- Table structure for we_wechat_config
-- ----------------------------
DROP TABLE IF EXISTS `we_wechat_config`;
CREATE TABLE `we_wechat_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(11) NOT NULL DEFAULT '' COMMENT '所属用户ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '公众号名称',
  `wechatid` varchar(20) NOT NULL DEFAULT '' COMMENT '微信号',
  `appid` varchar(64) NOT NULL DEFAULT '',
  `appsecret` varchar(64) NOT NULL DEFAULT '',
  `token` varchar(64) NOT NULL DEFAULT '',
  `encodingaeskey` varchar(64) NOT NULL DEFAULT '',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态 0表示未使用 1 表示使用中',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '开发者模式的URL',
  `createtime` datetime DEFAULT '1900-01-01 00:00:00',
  `updatetime` datetime DEFAULT '1900-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='公众号配置信息表';

-- ----------------------------
-- Records of we_wechat_config
-- ----------------------------
INSERT INTO `we_wechat_config` VALUES ('1', '1', '个人测试平台公众号', 'gh_7557b6fe18eb', 'wx7ad4ce9789a311ea', '67083c9d2d66055bdea6a20b63edcb3c', 'songphper', ' 1234', '1', '', '2018-03-09 23:24:17', '2018-05-11 15:20:19');
INSERT INTO `we_wechat_config` VALUES ('11', '1', '天乐邦测试公众号', '123', 'fdsfdsfsdfs', 'fdsfdsfdsfsdf', 'fdsfdsfsdfsd', '123', '0', '', '2018-05-02 10:00:16', '2018-05-11 15:20:19');
INSERT INTO `we_wechat_config` VALUES ('12', '1', '掌握传媒', '1234', 'wxf42302be9b7152f8', 'fae546a19b3112151ed598ba1c293bfd', 'zwmediatoken', '124', '0', '', '2018-05-02 10:33:34', '2018-05-11 15:20:19');
INSERT INTO `we_wechat_config` VALUES ('13', '1', 'fsafdsaf', '12344', 'fdaf', 'fdsaf', 'dsafdsa', '', '0', '', '2018-05-09 17:41:43', '2018-05-11 15:20:19');
INSERT INTO `we_wechat_config` VALUES ('27', '1', '测试公众号', 'gh_7557b6fe18eb', '1231', '321321', '321321', '', '0', '', '2018-05-10 10:10:27', '2018-05-11 15:20:19');
INSERT INTO `we_wechat_config` VALUES ('29', '2', 'songphper', 'songphper', 'wx7ad4ce9789a311ea3', '67083c9d2d66055bdea6a20b63edcb3c', 'songphper', '', '1', '', '2018-05-10 10:44:04', '2018-05-11 16:52:01');
INSERT INTO `we_wechat_config` VALUES ('30', '2', 'fdsfd', 'fsdfsd', 'wx7ad4ce9789a311ea2', 'fdsafdasfdsaf', 'fdsf', 'sfds', '0', '', '2018-05-10 11:33:06', '2018-05-11 16:52:01');
INSERT INTO `we_wechat_config` VALUES ('31', '3', 'new测试的公众号', 'gh_7557b6fe18eb', 'wx7ad4ce9789a311ea', '67083c9d2d66055bdea6a20b63edcb3c', 'songphper', '', '1', '', '2018-05-10 16:19:43', '2018-05-11 10:12:31');
