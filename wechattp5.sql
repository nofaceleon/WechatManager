/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : wechattp5

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2018-04-30 15:48:54
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
INSERT INTO `we_auth_group` VALUES ('1', '超级管理员', '1', '1,2,3,4,5,8');
INSERT INTO `we_auth_group` VALUES ('2', '普通管理员', '1', '2');
INSERT INTO `we_auth_group` VALUES ('3', '普通用户', '1', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='每个用户所属的权限组的表';

-- ----------------------------
-- Records of we_auth_group_access
-- ----------------------------
INSERT INTO `we_auth_group_access` VALUES ('1', '1', '1');
INSERT INTO `we_auth_group_access` VALUES ('2', '2', '2');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='权限规则表';

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
INSERT INTO `we_auth_rule` VALUES ('8', 'index-Menu', '自定义菜单配置', '1', '1', '');
INSERT INTO `we_auth_rule` VALUES ('9', 'index-Wechat-getTempListInfo', '获取模板消息配置', '1', '1', '');
INSERT INTO `we_auth_rule` VALUES ('10', 'index-Config-addconfig', '添加公众号配置', '1', '1', '');

-- ----------------------------
-- Table structure for we_auto_reply
-- ----------------------------
DROP TABLE IF EXISTS `we_auto_reply`;
CREATE TABLE `we_auto_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
INSERT INTO `we_auto_reply` VALUES ('5', '默认回复', '如需帮助，<a href=\"https://uat.zwmedia.com.cn/wxzspfse/index.php/Customer/index/index\">请点击咨询客服</a> [耶] \r\n如自助咨询内无您遇到的问题，可在客服链接内选择“提交工单”，进行反馈，客服会为您解答！[皱眉]', 'text', '1', 'wx7ad4ce9789a311ea', '0', '2018-04-15 22:03:23', '2018-04-19 23:44:31');
INSERT INTO `we_auto_reply` VALUES ('6', '关键字', '目前可使用的关键字有:\r\n1.后台管理\r\n2.百度一下\r\n3.客服', 'text', '1', 'wx7ad4ce9789a311ea', '1', '2018-04-15 22:06:22', '2018-04-15 22:09:26');
INSERT INTO `we_auto_reply` VALUES ('7', '百度一下', '<a href=\"https://www.baidu.com\">百度一下</a>', 'text', '1', 'wx7ad4ce9789a311ea', '1', '2018-04-15 22:06:55', '2018-04-15 22:06:55');
INSERT INTO `we_auto_reply` VALUES ('8', '客服', '<a href=\"https://uat.zwmedia.com.cn/wxzspfse/index.php/Customer/index/index\">请点击咨询客服</a> ', 'text', '1', 'wx7ad4ce9789a311ea', '1', '2018-04-15 22:08:02', '2018-04-15 22:08:02');
INSERT INTO `we_auto_reply` VALUES ('11', '关注回复', '欢迎关注', 'text', '', 'wx7ad4ce9789a311ea', '1', '2018-04-19 22:52:25', '2018-04-19 22:52:25');
INSERT INTO `we_auto_reply` VALUES ('12', '默认回复2', '目前可使用的关键字有:\r\n1.后台管理 \r\n2.百度一下 \r\n3.客服', 'text', '', 'wx7ad4ce9789a311ea', '-1', '2018-04-19 23:44:26', '2018-04-19 23:44:26');

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
-- Table structure for we_menu
-- ----------------------------
DROP TABLE IF EXISTS `we_menu`;
CREATE TABLE `we_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appid` varchar(64) DEFAULT NULL COMMENT '所属的公众号',
  `buttonname` varchar(64) NOT NULL DEFAULT '',
  `type` varchar(30) DEFAULT '',
  `key` varchar(30) DEFAULT '',
  `url` varchar(255) DEFAULT '',
  `parentid` int(11) DEFAULT '0',
  `sort` int(20) DEFAULT '0',
  `status` tinyint(2) DEFAULT '1',
  `createtime` datetime DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 COMMENT='自定义菜单表';

-- ----------------------------
-- Records of we_menu
-- ----------------------------
INSERT INTO `we_menu` VALUES ('1', 'wx7ad4ce9789a311ea', '信用卡攻略', 'view', '', 'https://mp.weixin.qq.com/mp/homepage?__biz=MzIwNTMzMDQyOQ==&hid=3&sn=aceac7d43b7fbacc9f59827ef749895e&scene=18&uin=&key=&devicetype=Windows+10&version=620502c8&lang=zh_CN&ascene=7&winzoom=1', '2', '5', '1', null, '2018-04-19 23:17:48');
INSERT INTO `we_menu` VALUES ('2', 'wx7ad4ce9789a311ea', '消费攻略', 'view', '', '', '0', '0', '1', null, '2018-04-19 23:16:00');
INSERT INTO `we_menu` VALUES ('12', 'wx7ad4ce9789a311ea', '会员卡权益集结', 'view', null, 'http://www.baidu.com', '3', '0', '1', null, null);
INSERT INTO `we_menu` VALUES ('13', 'wx7ad4ce9789a311ea', '日上95折二维码', 'view', null, 'http://www.baidu.com', '3', '0', '1', null, null);
INSERT INTO `we_menu` VALUES ('14', 'wx7ad4ce9789a311ea', '专属福利通道介绍', 'view', null, 'http://www.baidu.com', '3', '0', '1', null, null);
INSERT INTO `we_menu` VALUES ('18', 'wx7ad4ce9789a311ea2', '第二个账号测试菜单', 'view', '', '', '0', '0', '1', '2018-03-10 13:33:37', '2018-03-10 13:33:37');
INSERT INTO `we_menu` VALUES ('19', 'wx7ad4ce9789a311ea2', '子菜单测试', 'view', '', 'http://www.songphper.top/Home/Wechat/index', '18', '0', '1', '2018-03-10 13:39:07', '2018-03-10 13:39:07');
INSERT INTO `we_menu` VALUES ('27', 'wx7ad4ce9789a311ea', '消费避雷区', 'view', '', 'https://mp.weixin.qq.com/mp/homepage?__biz=MzIwNTMzMDQyOQ==&hid=4&sn=d1e7ff93317f3ec19ed2856b4bcc9261&scene=18&uin=&key=&devicetype=Windows+10&version=620502c8&lang=zh_CN&ascene=7&winzoom=1', '2', '0', '1', '2018-04-19 23:18:37', '2018-04-19 23:18:37');
INSERT INTO `we_menu` VALUES ('28', 'wx7ad4ce9789a311ea', '会员卡权益', 'view', '', 'http://m.zwmedia.com.cn/vip/public/index.php', '2', '0', '1', '2018-04-19 23:19:01', '2018-04-19 23:23:09');
INSERT INTO `we_menu` VALUES ('29', 'wx7ad4ce9789a311ea', '机场免税店折扣券', 'view', '', 'http://www.songphper.top', '2', '0', '1', '2018-04-19 23:19:35', '2018-04-19 23:19:35');
INSERT INTO `we_menu` VALUES ('30', 'wx7ad4ce9789a311ea', '每日福利', 'view', '', '', '0', '0', '1', '2018-04-19 23:19:45', '2018-04-19 23:19:45');
INSERT INTO `we_menu` VALUES ('31', 'wx7ad4ce9789a311ea', '请你喝咖啡', 'view', '', 'http://www.songphper.top', '30', '0', '1', '2018-04-19 23:19:55', '2018-04-19 23:19:55');
INSERT INTO `we_menu` VALUES ('32', 'wx7ad4ce9789a311ea', '每日大转盘抽奖', 'view', '', 'http://www.songphper.top', '30', '0', '1', '2018-04-19 23:20:13', '2018-04-19 23:20:13');
INSERT INTO `we_menu` VALUES ('33', 'wx7ad4ce9789a311ea', '集拼图赢华为手机', 'view', '', 'http://www.songphper.top', '30', '0', '1', '2018-04-19 23:20:32', '2018-04-19 23:20:32');
INSERT INTO `we_menu` VALUES ('34', 'wx7ad4ce9789a311ea', '领取返现红包', 'view', '', 'http://www.songphper.top', '30', '0', '1', '2018-04-19 23:20:43', '2018-04-19 23:20:43');
INSERT INTO `we_menu` VALUES ('35', 'wx7ad4ce9789a311ea', '个人中心', 'view', '', '', '0', '0', '0', '2018-04-19 23:21:07', '2018-04-29 10:12:51');
INSERT INTO `we_menu` VALUES ('36', 'wx7ad4ce9789a311ea', '个人中心', 'view', '', 'http://www.songphper.top', '35', '0', '1', '2018-04-19 23:21:29', '2018-04-19 23:21:29');
INSERT INTO `we_menu` VALUES ('37', 'wx7ad4ce9789a311ea', '联系客服', 'view', '', 'http://www.songphper.top', '35', '0', '1', '2018-04-19 23:21:40', '2018-04-19 23:21:40');
INSERT INTO `we_menu` VALUES ('38', 'wx7ad4ce9789a311ea', '为你推荐', 'view', '', 'http://www.songphper.top', '35', '0', '1', '2018-04-19 23:21:49', '2018-04-19 23:21:49');
INSERT INTO `we_menu` VALUES ('39', 'wx7ad4ce9789a311ea', '关于天乐邦', 'view', '', 'http://www.songphper.top', '35', '0', '1', '2018-04-19 23:22:05', '2018-04-19 23:22:05');
INSERT INTO `we_menu` VALUES ('40', 'wx7ad4ce9789a311ea', '超级平台入口', 'view', '', 'http://www.songphper.top', '35', '0', '1', '2018-04-19 23:22:18', '2018-04-19 23:22:18');

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
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='模板消息';

-- ----------------------------
-- Records of we_template
-- ----------------------------
INSERT INTO `we_template` VALUES ('37', 'wx7ad4ce9789a311ea', '0jykVKG9bFMolD5WFbeQOjznORUaG3Ddq2DRgH2iPj4', '中奖结果', '', '', '{{first.DATA}} \n奖品名称：{{keyword1.DATA}} \n中奖时间：{{keyword2.DATA}}\n{{remark.DATA}}', '', '2018-04-15 10:56:08', '2018-04-15 10:56:08', '1');
INSERT INTO `we_template` VALUES ('38', 'wx7ad4ce9789a311ea', '1xMfxtI_uN3ykPH_JFszRoheIEMz8mXnV3NCYDel3Ns', '红包提醒', '', '', '{{first.DATA}}\n 发放时间：{{keyword1.DATA}}\n 红包金额：{{keyword2.DATA}} \n{{remark.DATA}}', '', '2018-04-15 10:56:08', '2018-04-15 10:56:08', '1');
INSERT INTO `we_template` VALUES ('39', 'wx7ad4ce9789a311ea', 'Nl6e8w_Q7tEJz9mYec707e3KV_M3MMG5_oIWSaSfh2I', '签到提醒', '', '', '{{first.DATA}}\n 游戏名称：{{keyword1.DATA}}\n 签到时间：{{keyword2.DATA}} {{remark.DATA}}', '', '2018-04-19 23:41:24', '2018-04-19 23:41:24', '1');
INSERT INTO `we_template` VALUES ('40', 'wx7ad4ce9789a311ea', 'ANEhKtAUbY1GRozEAz_t3r7gCd9zcLbnJDDYSFfYYNQ', '活动结果通知', '', '', '{{first.DATA}} \n活动名称：{{keyword1.DATA}}\n活动结果：{{keyword2.DATA}}\n活动时间：{{keyword3.DATA}}\n会员名称：{{keyword4.DATA}}\n{{remark.DATA}}', '', '2018-04-19 23:41:24', '2018-04-19 23:41:24', '1');
INSERT INTO `we_template` VALUES ('41', 'wx7ad4ce9789a311ea', 'GIe3tUdXGtRTaNtynq9XE8aK5NDJldSJ6T5iuCIxojU', '未签到提醒', '', '', '{{first.DATA}} \n学生姓名：{{keyword1.DATA}}\n机构名称：{{keyword2.DATA}}\n签到状态：{{keyword3.DATA}}\n机构电话：{{keyword4.DATA}} {{remark.DATA}}', '', '2018-04-19 23:41:24', '2018-04-19 23:41:24', '1');
INSERT INTO `we_template` VALUES ('42', 'wx7ad4ce9789a311ea', 'cMhk8cWVam1pLkgU85-8_bK1ZwrlJdjWk26rowTt8V0', '未签到提醒2', '', '', '{{first.DATA}} \n学生姓名：{{keyword1.DATA}}\n机构名称：{{keyword2.DATA}}\n签到状态：{{keyword3.DATA}} \n机构电话：{{keyword4.DATA}}\n{{remark.DATA}}', '', '2018-04-19 23:41:24', '2018-04-19 23:41:24', '1');
INSERT INTO `we_template` VALUES ('43', 'wx7ad4ce9789a311ea', 'M-hMkkXEjBBhZ6l59wRpr6-qDJrfc6Abm3Cy9UQCZGc', '优惠券使用提醒', '', '', '{{first.DATA}} \n优惠券名称：{{keyword1.DATA}} \n领取平台：{{keyword2.DATA}}\n过期时间：{{keyword3.DATA}} \n{{remark.DATA}}', '', '2018-04-29 10:24:27', '2018-04-29 10:24:27', '1');
INSERT INTO `we_template` VALUES ('44', 'wx7ad4ce9789a311ea', 'vsJn3kwFtbjn2yhDuY6v28Ec7x-ffMyv-K9ac52uOaU', '服务到期提醒', '', '', '{{first.DATA}}\n品牌名称：{{keyword1.DATA}}\n服务类型：{{keyword2.DATA}}\n到期时间：{{keyword3.DATA}}\n{{remark.DATA}}', '', '2018-04-29 10:24:27', '2018-04-29 10:24:27', '1');
INSERT INTO `we_template` VALUES ('46', 'wxfaa90d8812d78147', 'vwVEHAdOEaPU0dlmNa4fb6Ht0raI0aMdZbTSwm8IM-s', '服务到期提醒', '', '', '{{first.DATA}} \n品牌名称：{{keyword1.DATA}}\n服务类型：{{keyword2.DATA}} \n到期时间：{{keyword3.DATA}\n{{remark.DATA}}', '', '2018-04-30 09:28:38', '2018-04-30 09:28:38', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='模板消息推送日志表';

-- ----------------------------
-- Records of we_template_pushlog
-- ----------------------------
INSERT INTO `we_template_pushlog` VALUES ('1', '1', 'wx7ad4ce9789a311ea', '未签到提醒2', 'cMhk8cWVam1pLkgU85-8_bK1ZwrlJdjWk26rowTt8V0', '{\"template_id\":\"cMhk8cWVam1pLkgU85-8_bK1ZwrlJdjWk26rowTt8V0\",\"topcolor\":\"#FF0000\",\"data\":{\"keyword1\":{\"value\":\"fdsf\",\"color\":\"#173177\"},\"keyword2\":{\"value\":\"sfdsf\",\"color\":\"#173177\"},\"keyword3\":{\"value\":\"fddfd\",\"color\":\"#173177\"},\"keyword4\":{\"value\":\"dfdfd\",\"color\":\"#173177\"},\"first\":{\"value\":\"fsdfs\",\"color\":\"#173177\"},\"remark\":{\"value\":\"fddfd\",\"color\":\"#173177\"}},\"touser\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\"}', 'oHIv-wagNwj9P18vT51lhYc-y0zE', '2018-04-29 09:32:22', '2018-04-29 09:32:22', '2018-04-29 09:32:22', '成功:1条,失败:0条.');
INSERT INTO `we_template_pushlog` VALUES ('2', '1', 'wx7ad4ce9789a311ea', '未签到提醒2', 'cMhk8cWVam1pLkgU85-8_bK1ZwrlJdjWk26rowTt8V0', '{\"template_id\":\"cMhk8cWVam1pLkgU85-8_bK1ZwrlJdjWk26rowTt8V0\",\"topcolor\":\"#FF0000\",\"data\":{\"keyword1\":{\"value\":\"fdsf\",\"color\":\"#173177\"},\"keyword2\":{\"value\":\"sfdsf\",\"color\":\"#173177\"},\"keyword3\":{\"value\":\"fddfd\",\"color\":\"#173177\"},\"keyword4\":{\"value\":\"dfdfdfdfdf\",\"color\":\"#173177\"},\"first\":{\"value\":\"fsdfs\",\"color\":\"#173177\"},\"remark\":{\"value\":\"fddfd\",\"color\":\"#173177\"}},\"touser\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\"}', 'oHIv-wagNwj9P18vT51lhYc-y0zE', '2018-04-29 09:33:15', '2018-04-29 09:33:15', '2018-04-29 09:33:15', '成功:1条,失败:0条.');
INSERT INTO `we_template_pushlog` VALUES ('3', '1', 'wx7ad4ce9789a311ea', '未签到提醒2', 'cMhk8cWVam1pLkgU85-8_bK1ZwrlJdjWk26rowTt8V0', '{\"template_id\":\"cMhk8cWVam1pLkgU85-8_bK1ZwrlJdjWk26rowTt8V0\",\"topcolor\":\"#FF0000\",\"data\":{\"keyword1\":{\"value\":\"fdd\",\"color\":\"#173177\"},\"keyword2\":{\"value\":\"gfd\",\"color\":\"#173177\"},\"keyword3\":{\"value\":\"gdg\",\"color\":\"#173177\"},\"keyword4\":{\"value\":\"dgfd\",\"color\":\"#173177\"},\"first\":{\"value\":\"gfdg\",\"color\":\"#173177\"},\"remark\":{\"value\":\"gdgfd\",\"color\":\"#173177\"}},\"touser\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\"}', 'oHIv-wagNwj9P18vT51lhYc-y0zE', '2018-04-29 09:38:56', '2018-04-29 09:38:56', '2018-04-29 09:38:56', '成功:1条,失败:0条.');
INSERT INTO `we_template_pushlog` VALUES ('4', '1', 'wxfaa90d8812d78147', '服务到期提醒', 'vwVEHAdOEaPU0dlmNa4fb6Ht0raI0aMdZbTSwm8IM-s', '{\"template_id\":\"vwVEHAdOEaPU0dlmNa4fb6Ht0raI0aMdZbTSwm8IM-s\",\"topcolor\":\"#FF0000\",\"data\":{\"keyword1\":{\"value\":\"fsfs\",\"color\":\"#173177\"},\"keyword2\":{\"value\":\"fs\",\"color\":\"#173177\"},\"keyword3\":{\"value\":\"fsf\",\"color\":\"#173177\"},\"first\":{\"value\":\"\\u653e\\u677e\\u7684\\u65b9\\u5f0f\",\"color\":\"#173177\"},\"remark\":{\"value\":\"dsfdsf\",\"color\":\"#173177\"}},\"touser\":\"oPm5G0ZsdyNE5vi66KJ36raaIGsI\"}', 'oPm5G0ZsdyNE5vi66KJ36raaIGsI', '2018-04-29 22:35:24', '2018-04-29 22:35:24', '2018-04-29 22:35:24', '成功:1条,失败:0条.');

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
  `uid` varchar(11) DEFAULT NULL COMMENT '所属用户ID',
  `name` varchar(30) DEFAULT '' COMMENT '公众号名称',
  `appid` varchar(64) DEFAULT NULL,
  `appsecret` varchar(64) DEFAULT NULL,
  `token` varchar(64) DEFAULT NULL,
  `encodingaeskey` varchar(64) DEFAULT '',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态 0表示未使用 1 表示使用中',
  `createtime` datetime DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='公众号配置信息表';

-- ----------------------------
-- Records of we_wechat_config
-- ----------------------------
INSERT INTO `we_wechat_config` VALUES ('1', '1,3', '测试公众号', 'wx7ad4ce9789a311ea', '67083c9d2d66055bdea6a20b63edcb3c', 'songphper', ' ', '1', '2018-03-09 23:24:17', '2018-04-30 15:37:52');
INSERT INTO `we_wechat_config` VALUES ('3', '1', '无脸的小屋', 'wx3dfc020853bc636b', '89c2d4ecca5ed18ccd375eda8aef81a6', 'songphper', '', '0', '2018-04-29 21:26:02', '2018-04-30 15:37:52');
INSERT INTO `we_wechat_config` VALUES ('4', '1,2', '汪飞飞的公众号', 'wxfaa90d8812d78147', 'f1954c0f71e04dba87876203970857bd', 'hellowang', 'oPm5G0ZsdyNE5vi66KJ36raaIGsI', '0', '2018-04-29 22:29:39', '2018-04-30 15:37:52');
