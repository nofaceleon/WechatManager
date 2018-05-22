/*
Navicat MySQL Data Transfer

Source Server         : 正式微信公众号后台
Source Server Version : 50634
Source Host           : 139.224.0.198:3308
Source Database       : wechatconfig

Target Server Type    : MYSQL
Target Server Version : 50634
File Encoding         : 65001

Date: 2018-05-22 16:27:20
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
  `rules` char(80) NOT NULL DEFAULT '0' COMMENT '用户拥有的权限',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户组的权限表';

-- ----------------------------
-- Records of we_auth_group
-- ----------------------------
INSERT INTO `we_auth_group` VALUES ('1', '超级管理员', '1', '1,2,3,4,5,6,7,8,9,10,11,12,13');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='每个用户所属的权限组的表';

-- ----------------------------
-- Records of we_auth_group_access
-- ----------------------------
INSERT INTO `we_auth_group_access` VALUES ('1', '1', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='权限规则表';

-- ----------------------------
-- Records of we_auth_rule
-- ----------------------------
INSERT INTO `we_auth_rule` VALUES ('1', 'index/Config/updateConfig', '修改公众号配置', '1', '1', '');
INSERT INTO `we_auth_rule` VALUES ('2', 'index/Config/addConfig', '添加公众号配置', '1', '1', '');
INSERT INTO `we_auth_rule` VALUES ('3', 'index/Config/delConfig', '删除公众号配置', '1', '1', '');
INSERT INTO `we_auth_rule` VALUES ('4', 'index/Menu/addMenu', '添加自定义菜单', '1', '1', '');
INSERT INTO `we_auth_rule` VALUES ('5', 'index/Menu/editMenu', '编辑自定义菜单', '1', '1', '');
INSERT INTO `we_auth_rule` VALUES ('6', 'index/Menu/delMenu', '删除自定义菜单', '1', '1', '');
INSERT INTO `we_auth_rule` VALUES ('7', 'index/Wechat/createMenu', '推送自定义菜单', '1', '1', '');
INSERT INTO `we_auth_rule` VALUES ('8', 'index/Wechat/getMenu', '获取自定义菜单', '1', '1', '');
INSERT INTO `we_auth_rule` VALUES ('9', 'index/Autoreply/delReply', '删除自动回复', '1', '1', '');
INSERT INTO `we_auth_rule` VALUES ('10', 'index/Autoreply/addReply', '添加自动回复', '1', '1', '');
INSERT INTO `we_auth_rule` VALUES ('11', 'index/Autoreply/getQrcode', '生成二维码', '1', '1', '');
INSERT INTO `we_auth_rule` VALUES ('12', 'index/Autoreply/editReply', '编辑自动回复', '1', '1', '');
INSERT INTO `we_auth_rule` VALUES ('13', 'index/Userauth', '权限管理', '1', '1', '');

-- ----------------------------
-- Table structure for we_auto_reply
-- ----------------------------
DROP TABLE IF EXISTS `we_auto_reply`;
CREATE TABLE `we_auto_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(255) DEFAULT '',
  `reply` varchar(255) DEFAULT '' COMMENT '回复的内容',
  `msgtype` varchar(255) DEFAULT '' COMMENT '消息类型',
  `eventtype` varchar(255) DEFAULT '1' COMMENT '时间类型',
  `appid` varchar(255) DEFAULT '' COMMENT '所属的公众号appid',
  `status` tinyint(2) DEFAULT '1',
  `qrinfo` varchar(512) DEFAULT '' COMMENT '带参数的二维码图片路径',
  `createtime` datetime DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_key_appid` (`keyword`,`appid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='自动回复配置表';

-- ----------------------------
-- Records of we_auto_reply
-- ----------------------------

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
INSERT INTO `we_event` VALUES ('1', 'text', '文本回复', '1');
INSERT INTO `we_event` VALUES ('2', 'image', '图片', '1');
INSERT INTO `we_event` VALUES ('3', 'location', '', '1');
INSERT INTO `we_event` VALUES ('4', 'link', '', '1');
INSERT INTO `we_event` VALUES ('5', 'event', '', '1');
INSERT INTO `we_event` VALUES ('6', 'music', '', '1');
INSERT INTO `we_event` VALUES ('7', 'news', '图文消息', '1');
INSERT INTO `we_event` VALUES ('8', 'voice', '音频消息', '1');
INSERT INTO `we_event` VALUES ('9', 'video', '视频消息', '1');
INSERT INTO `we_event` VALUES ('10', 'shortvideo', '短视频', '1');
INSERT INTO `we_event` VALUES ('11', 'subscribe', '用户关注', '1');
INSERT INTO `we_event` VALUES ('12', 'unsubscribe', '取消关注', '1');
INSERT INTO `we_event` VALUES ('13', 'SCAN', '用户扫码', '1');
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
  `uid` varchar(255) NOT NULL DEFAULT '',
  `user_action` varchar(255) DEFAULT NULL,
  `api_name` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT '',
  `detail` text,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='平台日志表';

-- ----------------------------
-- Records of we_log
-- ----------------------------
INSERT INTO `we_log` VALUES ('1', '', '', '用户登录', 'Login/userLogin', '登录成功', 'zwcm登录', '2018-05-20 22:51:46');
INSERT INTO `we_log` VALUES ('2', '', '', '用户登录', 'Login/userLogin', '登录成功', 'zwcm登录', '2018-05-20 22:52:25');
INSERT INTO `we_log` VALUES ('3', '', '', '用户登录', 'Login/userLogin', '登录成功', 'zwcm登录', '2018-05-21 17:54:52');
INSERT INTO `we_log` VALUES ('4', '', '', '用户登录', 'Login/userLogin', '登录成功', 'zwcm登录', '2018-05-21 18:14:32');
INSERT INTO `we_log` VALUES ('5', '', '', '用户登录', 'Login/userLogin', '登录成功', 'zwcm登录', '2018-05-22 10:32:33');
INSERT INTO `we_log` VALUES ('6', '', '', '用户登录', 'Login/userLogin', '登录成功', 'zwcm登录', '2018-05-22 16:22:27');

-- ----------------------------
-- Table structure for we_material
-- ----------------------------
DROP TABLE IF EXISTS `we_material`;
CREATE TABLE `we_material` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appid` varchar(255) DEFAULT '' COMMENT '所属的公众号',
  `media_id` varchar(255) NOT NULL DEFAULT '' COMMENT '素材ID',
  `title` varchar(255) DEFAULT '' COMMENT '标题',
  `author` varchar(255) DEFAULT '' COMMENT '作者',
  `digest` text COMMENT '简介',
  `createtime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updatetime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
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
  PRIMARY KEY (`id`),
  KEY `index_appid` (`appid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='自定义菜单表';

-- ----------------------------
-- Records of we_menu
-- ----------------------------
INSERT INTO `we_menu` VALUES ('1', '0', 'wxf42302be9b7152f8', '案例赏', 'show', '', '', '0', '0', '1', '2018-05-22 15:31:41', '2018-05-22 15:31:41');
INSERT INTO `we_menu` VALUES ('2', '0', 'wxf42302be9b7152f8', '互动H5', 'view', '', 'http://m.zwmedia.com.cn/highlander0321', '1', '0', '1', '2018-05-22 15:31:41', '2018-05-22 15:31:41');
INSERT INTO `we_menu` VALUES ('3', '0', 'wxf42302be9b7152f8', '奇妙H5', 'view', '', 'http://m.zwmedia.com.cn/zx150925', '1', '0', '1', '2018-05-22 15:31:41', '2018-05-22 15:31:41');
INSERT INTO `we_menu` VALUES ('4', '0', 'wxf42302be9b7152f8', '酷炫H5', 'view', '', 'http://landingpage.hdtmedia.com/youyiku', '1', '0', '1', '2018-05-22 15:31:41', '2018-05-22 15:31:41');
INSERT INTO `we_menu` VALUES ('5', '0', 'wxf42302be9b7152f8', '掌握案例秀', 'media_id', '', 'PVEYnlT-wOoTU7NC_kIafeM8maG31Dwpn1Qg8CcfA00', '1', '0', '1', '2018-05-22 15:31:41', '2018-05-22 15:31:41');
INSERT INTO `we_menu` VALUES ('6', '0', 'wxf42302be9b7152f8', '行业案例赏', 'view', '', 'http://m.zwmedia.com.cn/Levin0514', '1', '0', '1', '2018-05-22 15:31:41', '2018-05-22 15:31:41');
INSERT INTO `we_menu` VALUES ('7', '0', 'wxf42302be9b7152f8', '掌握秀', 'show', '', '', '0', '0', '1', '2018-05-22 15:31:41', '2018-05-22 15:31:41');
INSERT INTO `we_menu` VALUES ('8', '0', 'wxf42302be9b7152f8', '掌握简介', 'view', '', 'http://vurl.cn/OGMyN', '7', '0', '1', '2018-05-22 15:31:41', '2018-05-22 15:31:41');
INSERT INTO `we_menu` VALUES ('9', '0', 'wxf42302be9b7152f8', '了解更多', 'view', '', 'http://www.zwmedia.com.cn/', '7', '0', '1', '2018-05-22 15:31:41', '2018-05-22 15:31:41');
INSERT INTO `we_menu` VALUES ('10', '0', 'wxf42302be9b7152f8', '测试子菜单', 'view', '', 'http://www.baidu.com', '7', '0', '1', '2018-05-22 15:31:41', '2018-05-22 15:31:41');
INSERT INTO `we_menu` VALUES ('11', '0', 'wxf42302be9b7152f8', '123', 'show', '', '', '0', '0', '1', '2018-05-22 15:31:41', '2018-05-22 15:31:41');
INSERT INTO `we_menu` VALUES ('12', '0', 'wxf42302be9b7152f8', '个人中心', 'miniprogram', 'wxe2a1b46a45d59a20', 'pages/couponList/couponList;http://uat.zwmedia.com.cn/wxzspfse/index.php/Home/SignGame/index.html?platcode=MSXYK', '11', '0', '1', '2018-05-22 15:31:41', '2018-05-22 15:31:41');
INSERT INTO `we_menu` VALUES ('13', '0', 'wxf42302be9b7152f8', '社群商业', 'media_id', '', 'fjXYanzKvnxn-F-BJ_OBs90HZGRvKIe7Np9UD0vfG7s', '11', '0', '1', '2018-05-22 15:31:41', '2018-05-22 15:31:41');
INSERT INTO `we_menu` VALUES ('14', '0', 'wxf42302be9b7152f8', 'wechat', 'media_id', '', 'zoz1HFDY1FCTuQ_5uE5Q227K-DqmGxfMZS-jYUW2I5o', '11', '0', '1', '2018-05-22 15:31:41', '2018-05-22 15:31:41');

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
  PRIMARY KEY (`id`),
  KEY `index_toUserName` (`to_user_name`),
  KEY `index_openid` (`openid`)
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='模板消息';

-- ----------------------------
-- Records of we_template
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='模板消息推送日志表';

-- ----------------------------
-- Records of we_template_pushlog
-- ----------------------------

-- ----------------------------
-- Table structure for we_user
-- ----------------------------
DROP TABLE IF EXISTS `we_user`;
CREATE TABLE `we_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) CHARACTER SET latin1 NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '' COMMENT '密码',
  `createtime` datetime NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '创建时间',
  `updatetime` datetime NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='微信管理后台用户表';

-- ----------------------------
-- Records of we_user
-- ----------------------------
INSERT INTO `we_user` VALUES ('1', 'zwcm', '47767678c386e73854d2b8edc2b179ccef00d43e', '1900-01-01 00:00:00', '2018-05-18 16:30:36');

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
  PRIMARY KEY (`id`),
  KEY `index_appid` (`appid`),
  KEY `index_uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='公众号配置信息表';

-- ----------------------------
-- Records of we_wechat_config
-- ----------------------------
INSERT INTO `we_wechat_config` VALUES ('1', '1', '掌握传媒', 'gh_2fcf480ac2ac', 'wxf42302be9b7152f8', 'f64ec46639dd6e3c48c7fe5a9ec9f13e', 'zwmediatoken', 'HCnm46mQ5A3If8sZBCfIsnoU4eKsypK7D24W3iYzg1T', '1', 'http://uat.zwmedia.com.cn/Wechatadmin/WechatDevApi/public/index.php/ZWCM', '2018-05-21 17:39:22', '2018-05-22 15:15:59');
