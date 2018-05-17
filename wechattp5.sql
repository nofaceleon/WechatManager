/*
Navicat MySQL Data Transfer

Source Server         : 本机数据库
Source Server Version : 50714
Source Host           : 127.0.0.1:3306
Source Database       : wechattp5

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2018-05-17 17:28:31
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户组的权限表';

-- ----------------------------
-- Records of we_auth_group
-- ----------------------------
INSERT INTO `we_auth_group` VALUES ('1', '超级管理员', '1', '1,2,3,4,5,6,7,8,9,10,11,12');
INSERT INTO `we_auth_group` VALUES ('2', '普通管理员', '1', '1,2,4,5');
INSERT INTO `we_auth_group` VALUES ('3', '普通用户', '1', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='权限规则表';

-- ----------------------------
-- Records of we_auth_rule
-- ----------------------------
INSERT INTO `we_auth_rule` VALUES ('1', 'index/Config/updateConfig', '修改公众号配置', '1', '1', '');
INSERT INTO `we_auth_rule` VALUES ('2', 'index/Config/addConfig', '添加公众号配置', '1', '1', '');
INSERT INTO `we_auth_rule` VALUES ('3', 'index/Config/delConfig', '删除公众号配置', '1', '1', '');
INSERT INTO `we_auth_rule` VALUES ('4', 'inde/Menu/addMenu', '添加自定义菜单', '1', '1', '');
INSERT INTO `we_auth_rule` VALUES ('5', 'index/Menu/editMenu', '编辑自定义菜单', '1', '1', '');
INSERT INTO `we_auth_rule` VALUES ('6', 'index/Menu/delMenu', '删除自定义菜单', '1', '1', '');
INSERT INTO `we_auth_rule` VALUES ('7', 'index/Wechat/createMenu', '推送自定义菜单', '1', '1', '');
INSERT INTO `we_auth_rule` VALUES ('8', 'index/Wechat/getMenu', '获取自定义菜单', '1', '1', '');
INSERT INTO `we_auth_rule` VALUES ('9', 'index/Autoreply/delReply', '删除自动回复', '1', '1', '');
INSERT INTO `we_auth_rule` VALUES ('10', 'index/Autoreply/addReply', '添加自动回复', '1', '1', '');
INSERT INTO `we_auth_rule` VALUES ('11', 'index/Autoreply/getQrcode', '生成二维码', '1', '1', '');
INSERT INTO `we_auth_rule` VALUES ('12', 'index/Autoreply/editReply', '编辑自动回复', '1', '1', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COMMENT='自动回复配置表';

-- ----------------------------
-- Records of we_auto_reply
-- ----------------------------
INSERT INTO `we_auto_reply` VALUES ('4', '后台管理5', '<a href=\"http://www.songphper.top\">欢迎使用微信后台管理系统</a>', 'text', '1', 'wx7ad4ce9789a311ea', '1', null, '2018-04-15 21:56:21', '2018-05-17 14:43:37');
INSERT INTO `we_auto_reply` VALUES ('5', 'DEFAULT_REPLY', '如需帮助，<a href=\"https://uat.zwmedia.com.cn/wxzspfse/index.php/Customer/index/index\">请点击咨询客服</a> [耶] \r\n如自助咨询内无您遇到的问题，可在客服链接内选择“提交工单”，进行反馈，客服会为您解答！[皱眉]', 'text', '1', 'wx7ad4ce9789a311ea', '0', null, '2018-04-15 22:03:23', '2018-04-19 23:44:31');
INSERT INTO `we_auto_reply` VALUES ('7', '百度一下', '<a href=\"www.baidu.com\">百度一下</a>', 'text', '1', 'wx7ad4ce9789a311ea', '1', null, '2018-04-15 22:06:55', '2018-04-15 22:06:55');
INSERT INTO `we_auto_reply` VALUES ('8', '客服', '<a href=\"https://uat.zwmedia.com.cn/wxzspfse/index.php/Customer/index/index\">请点击咨询客服</a> ', 'text', '1', 'wx7ad4ce9789a311ea', '1', null, '2018-04-15 22:08:02', '2018-04-15 22:08:02');
INSERT INTO `we_auto_reply` VALUES ('13', '关键字测试', '关键关键', 'text', '1', 'wx7ad4ce9789a311ea', '1', null, '2018-05-14 14:19:29', '2018-05-14 14:19:29');
INSERT INTO `we_auto_reply` VALUES ('15', '链接', '<a href=\"http://www.baidu.com\">百度一下</a>', 'text', '1', 'wx7ad4ce9789a311ea', '1', null, '2018-05-14 14:20:16', '2018-05-14 14:20:16');
INSERT INTO `we_auto_reply` VALUES ('16', '关注', '关注也回复', 'text', '11', 'wx7ad4ce9789a311ea', '1', null, '2018-05-14 14:33:12', '2018-05-14 14:33:12');
INSERT INTO `we_auto_reply` VALUES ('30', '后台管理4f', 'fdsfsdfdsfsdwwwww', 'text', '1', 'wx7ad4ce9789a311ea', '1', null, '2018-05-15 10:26:12', '2018-05-15 10:48:24');
INSERT INTO `we_auto_reply` VALUES ('32', 'test', '回复test222999999', 'text', '13', 'wx7ad4ce9789a311ea', '1', '{\"imgurl\":\"https:\\/\\/mp.weixin.qq.com\\/cgi-bin\\/showqrcode?ticket=gQGp8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyQ2UzNHc5c2JmLTExVms4V05xY1UAAgQYiPpaAwQ8AAAA\",\"qrtype\":1,\"expire\":5}', '2018-05-15 15:11:20', '2018-05-15 16:59:25');
INSERT INTO `we_auto_reply` VALUES ('34', '1234', '123', 'text', '13', 'wx7ad4ce9789a311ea', '1', '{\"imgurl\":\"https:\\/\\/mp.weixin.qq.com\\/cgi-bin\\/showqrcode?ticket=gQEX8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAySjFWaHdNc2JmLTExMDAwMHcwN18AAgR1hfpaAwQAAAAA\",\"qrtype\":2,\"expire\":0}', '2018-05-15 15:12:26', '2018-05-15 16:41:35');
INSERT INTO `we_auto_reply` VALUES ('36', '123', '123', 'text', '13', 'wx7ad4ce9789a311ea', '1', '{\"imgurl\":\"https:\\/\\/mp.weixin.qq.com\\/cgi-bin\\/showqrcode?ticket=gQEX8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAySjFWaHdNc2JmLTExMDAwMHcwN18AAgR1hfpaAwQAAAAA\",\"qrtype\":2,\"expire\":0}', '2018-05-15 15:35:03', '2018-05-15 15:35:03');
INSERT INTO `we_auto_reply` VALUES ('38', '1', '1', 'text', '13', 'wxf42302be9b7152f8', '1', '{\"imgurl\":\"https:\\/\\/mp.weixin.qq.com\\/cgi-bin\\/showqrcode?ticket=gQFb8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyX3hBdUlKczliRmUxMDAwMGcwNzkAAgQNnPpaAwQAAAAA\",\"qrtype\":2,\"expire\":0}', '2018-05-15 16:36:29', '2018-05-15 16:36:29');
INSERT INTO `we_auto_reply` VALUES ('41', 'lyn', 'lyn', 'text', '13', 'wx7ad4ce9789a311ea', '1', '{\"imgurl\":\"https:\\/\\/mp.weixin.qq.com\\/cgi-bin\\/showqrcode?ticket=gQEG8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyYTMyOHdac2JmLTExVnp2WGhxY1kAAgQnn-taAwQ8AAAA\",\"qrtype\":1,\"expire\":30}', '2018-05-16 11:01:59', '2018-05-16 11:01:59');
INSERT INTO `we_auto_reply` VALUES ('42', 'nihao', '123', 'text', '13', 'wx7ad4ce9789a311ea', '1', '{\"imgurl\":\"https:\\/\\/mp.weixin.qq.com\\/cgi-bin\\/showqrcode?ticket=gQFP8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyTXFwZXdnc2JmLTExWTIzWDFxY2sAAgTGwvtaAwQ8AAAA\",\"qrtype\":1,\"expire\":30}', '2018-05-16 13:33:58', '2018-05-16 13:33:58');
INSERT INTO `we_auto_reply` VALUES ('44', 'test10', 'fdsfdsaf', 'text', '13', 'wx7ad4ce9789a311ea', '1', '{\"imgurl\":\"https:\\/\\/mp.weixin.qq.com\\/cgi-bin\\/showqrcode?ticket=gQEk8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyWkxYOXd6c2JmLTExZDhPOE5yYzEAAgRIw-taAwQALw0A\",\"qrtype\":1,\"expire\":\"10\"}', '2018-05-16 13:36:08', '2018-05-16 13:36:08');
INSERT INTO `we_auto_reply` VALUES ('46', 'llll', ';;lll', 'text', '13', 'wx7ad4ce9789a311ea', '1', '{\"imgurl\":\"https:\\/\\/mp.weixin.qq.com\\/cgi-bin\\/showqrcode?ticket=gQFl8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyZlRpanh3c2JmLTExMjQ2OXhyY3AAAgSE1-taAwQALw0A\",\"qrtype\":1,\"expire\":\"10\"}', '2018-05-16 15:02:28', '2018-05-16 15:02:28');
INSERT INTO `we_auto_reply` VALUES ('47', '147', '147', 'text', '13', 'wx7ad4ce9789a311ea', '1', '{\"imgurl\":\"https:\\/\\/mp.weixin.qq.com\\/cgi-bin\\/showqrcode?ticket=gQGL8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyVV9WRnhoc2JmLTExNTZFek5yYy0AAgRG2-taAwQAjScA\",\"qrtype\":1,\"expire\":30}', '2018-05-16 15:18:31', '2018-05-16 15:18:31');
INSERT INTO `we_auto_reply` VALUES ('48', 'day', 'fdsfdsfs', 'text', '13', 'wx7ad4ce9789a311ea', '1', '{\"imgurl\":\"https:\\/\\/mp.weixin.qq.com\\/cgi-bin\\/showqrcode?ticket=gQHE8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyQ3NsWXhPc2JmLTExTXFNWk5xYzMAAgSa3vtaAwSAUQEA\",\"qrtype\":1,\"expire\":\"1\"}', '2018-05-16 15:32:42', '2018-05-16 15:32:42');
INSERT INTO `we_auto_reply` VALUES ('49', 'lkjh', '4567898', 'text', '13', 'wx7ad4ce9789a311ea', '1', '{\"imgurl\":\"https:\\/\\/mp.weixin.qq.com\\/cgi-bin\\/showqrcode?ticket=gQFI8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAydnpnT3dmc2JmLTExMzBkOU5yY0IAAgTA3vtaAwQALw0A\",\"qrtype\":1,\"expire\":\"10\"}', '2018-05-16 15:33:20', '2018-05-16 15:33:20');
INSERT INTO `we_auto_reply` VALUES ('50', '258', '147', 'text', '13', 'wx7ad4ce9789a311ea', '1', '{\"imgurl\":\"https:\\/\\/mp.weixin.qq.com\\/cgi-bin\\/showqrcode?ticket=gQF-8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAybl9ZeHg2c2JmLTExMl9lOTFyYzAAAgS-3-taAwQALw0A\",\"qrtype\":1,\"expire\":\"10\"}', '2018-05-16 15:37:35', '2018-05-16 15:37:35');
INSERT INTO `we_auto_reply` VALUES ('51', '232323232', '23213213', 'text', '13', 'wx7ad4ce9789a311ea', '1', '{\"imgurl\":\"https:\\/\\/mp.weixin.qq.com\\/cgi-bin\\/showqrcode?ticket=gQER8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyYVdnbHdmc2JmLTExMDAwMGcwN1cAAgTN3-taAwQAAAAA\",\"qrtype\":2,\"expire\":0}', '2018-05-16 15:37:49', '2018-05-16 15:40:04');
INSERT INTO `we_auto_reply` VALUES ('52', 'testst', 'fsfdsfs', 'text', '1', 'wxf42302be9b7152f8', '1', '', '2018-05-17 16:40:59', '2018-05-17 16:40:59');
INSERT INTO `we_auto_reply` VALUES ('53', 'fsfsdfsfds', 'fdsfdsfsdf', 'text', '1', 'wxf42302be9b7152f8', '1', '', '2018-05-17 16:46:37', '2018-05-17 16:46:37');

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
INSERT INTO `we_event` VALUES ('7', 'news', '', '1');
INSERT INTO `we_event` VALUES ('8', 'voice', '', '1');
INSERT INTO `we_event` VALUES ('9', 'video', '', '1');
INSERT INTO `we_event` VALUES ('10', 'shortvideo', '', '1');
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='平台日志表';

-- ----------------------------
-- Records of we_log
-- ----------------------------
INSERT INTO `we_log` VALUES ('1', 'wx7ad4ce9789a311ea', '1', '修改自动回复成功', 'Autoreply/editReply', '', '', '2018-05-17 14:43:37');
INSERT INTO `we_log` VALUES ('2', '', '', '用户登录', 'Login/userLogin', '登录成功', '', '2018-05-17 14:54:54');
INSERT INTO `we_log` VALUES ('3', '', '', '用户登录', 'Login/userLogin', '登录成功', 'mrsong登录', '2018-05-17 14:55:47');
INSERT INTO `we_log` VALUES ('4', ' wxfede681f96a1c9a6', '1', '编辑菜单', 'Menu/editMenu', '修改成功', '', '2018-05-17 15:00:17');
INSERT INTO `we_log` VALUES ('5', 'wx7ad4ce9789a311ea', '1', '编辑菜单', 'Menu/editMenu', '修改成功', '{\"buttonname\":\"\\u9876\\u7ea7\\u83dc\",\"sort\":100,\"status\":1,\"id\":188,\"parentid\":0,\"type\":\"show\",\"updatetime\":\"2018-05-17 15:08:27\"}', '2018-05-17 15:08:27');
INSERT INTO `we_log` VALUES ('6', '', '', '用户登录', 'Login/userLogin', '登录成功', 'mrsong登录', '2018-05-17 15:13:12');
INSERT INTO `we_log` VALUES ('7', 'wxf42302be9b7152f8', '1', '编辑菜单', 'Menu/editMenu', '修改成功', '{\"buttonname\":\"wechat\",\"sort\":0,\"status\":1,\"parentid\":200,\"id\":203,\"type\":\"media_id\",\"url\":\"fjXYanzKvnxn-F-BJ_OBsxaGD4TR19ZWC3hRGXeWaBg\",\"key\":\"\\u65b0\\u5a92\\u4f53\\u8425\\u9500\\uff0c\\u8fd9\\u4e9b\\u6e20\\u9053\\u73a9\\u6cd5\\u4f60\\u90fd\\u505a\\u4e86\\u5417\\uff1f\",\"updatetime\":\"2018-05-17 15:31:47\"}', '2018-05-17 15:31:47');
INSERT INTO `we_log` VALUES ('8', 'wxf42302be9b7152f8', '1', '添加菜单', 'Menu/addMenu/error', '添加菜单成功', '{\"buttonname\":\"12\",\"sort\":\"\",\"status\":1,\"parentid\":0,\"type\":\"media_id\",\"url\":\"KrulI7-ilUtDZHUDdioQkxWxL6o47Mhb-mT5uafjnho\",\"key\":\"LOVECLUB\",\"createtime\":\"2018-05-17 15:32:07\",\"updatetime\":\"2018-05-17 15:32:07\",\"appid\":\"wxf42302be9b7152f8\",\"cid\":12}', '2018-05-17 15:32:07');
INSERT INTO `we_log` VALUES ('9', 'wxf42302be9b7152f8', '1', '编辑菜单', 'Menu/editMenu', '修改成功', '{\"buttonname\":\"12\",\"sort\":0,\"status\":1,\"id\":205,\"parentid\":0,\"type\":\"media_id\",\"url\":\"KrulI7-ilUtDZHUDdioQkxWxL6o47Mhb-mT5uafjnho\",\"key\":\"LOVECLUB\",\"updatetime\":\"2018-05-17 15:32:33\"}', '2018-05-17 15:32:33');
INSERT INTO `we_log` VALUES ('10', 'wxf42302be9b7152f8', '1', '编辑菜单', 'Menu/editMenu', '修改成功', '{\"buttonname\":\"12\",\"sort\":0,\"status\":1,\"id\":205,\"parentid\":0,\"type\":\"media_id\",\"url\":\"KyLKdTqiKZqw5kq6Vz487Lz6QwXz5FhNbKS6AAzP8WU\",\"key\":\"\\u4f60\\u79bb\\u4eba\\u751f\\u5dc5\\u5cf0\\uff0c\\u53ea\\u5dee\\u4e00\\u4e2a\\u597d\\u57fa\\u53cb\\u7684\\u8ddd\\u79bb\\uff01\",\"updatetime\":\"2018-05-17 15:40:30\"}', '2018-05-17 15:40:30');
INSERT INTO `we_log` VALUES ('11', '', '', '用户登录', 'Login/userLogin', '登录成功', 'mrsong登录', '2018-05-17 15:41:03');
INSERT INTO `we_log` VALUES ('12', '', '', '用户登录', 'Login/userLogin', '登录成功', 'mrsong登录', '2018-05-17 15:54:39');
INSERT INTO `we_log` VALUES ('13', '', '', '用户登录', 'Login/userLogin', '登录成功', 'mrsong登录', '2018-05-17 16:22:01');
INSERT INTO `we_log` VALUES ('14', '', '', '用户登录', 'Login/userLogin', '登录成功', 'mrsong登录', '2018-05-17 16:22:56');
INSERT INTO `we_log` VALUES ('15', '', '', '用户登录', 'Login/userLogin', '登录成功', 'mrsong2登录', '2018-05-17 16:23:30');
INSERT INTO `we_log` VALUES ('16', '', '', '用户登录', 'Login/userLogin', '登录成功', 'mrsong登录', '2018-05-17 16:24:12');
INSERT INTO `we_log` VALUES ('17', 'wxf42302be9b7152f8', '1', '添加菜单', 'Menu/addMenu/error', '添加菜单成功', '{\"buttonname\":\"123\",\"sort\":\"\",\"status\":1,\"parentid\":0,\"type\":\"media_id\",\"url\":\"fjXYanzKvnxn-F-BJ_OBs12Q84mJ_q2WJD6F73Rj6n0\",\"key\":\"123\",\"createtime\":\"2018-05-17 16:25:57\",\"updatetime\":\"2018-05-17 16:25:57\",\"appid\":\"wxf42302be9b7152f8\",\"cid\":12}', '2018-05-17 16:25:57');
INSERT INTO `we_log` VALUES ('18', 'wx7ad4ce9789a311ea3', '2', '公众号配置修改', 'Config/updateConfig', '修改成功', '{\"name\":\"songphper\",\"id\":\"29\",\"wechatid\":\"songphper\",\"appid\":\"wx7ad4ce9789a311ea\",\"appsecret\":\"67083c9d2d66055bdea6a20b63edcb3c\",\"token\":\"songphper\",\"encodingaeskey\":\"\",\"uid\":2,\"updatetime\":\"2018-05-17 16:28:52\"}', '2018-05-17 16:28:52');
INSERT INTO `we_log` VALUES ('19', 'wx7ad4ce9789a311ea', '2', '公众号配置修改', 'Config/updateConfig', '修改成功', '{\"name\":\"fdsfd\",\"id\":\"30\",\"wechatid\":\"fsdfsd\",\"appid\":\"wx7ad4ce9789a311ea\",\"appsecret\":\"fdsafdasfdsaf\",\"token\":\"fdsf\",\"encodingaeskey\":\"sfds\",\"uid\":2,\"updatetime\":\"2018-05-17 16:29:00\"}', '2018-05-17 16:29:00');
INSERT INTO `we_log` VALUES ('20', 'wxf42302be9b7152f8', '1', '编辑菜单', 'Menu/editMenu', '修改成功', '{\"buttonname\":\"123\",\"sort\":0,\"status\":1,\"id\":234,\"parentid\":0,\"type\":\"media_id\",\"url\":\"FfaXbaQsGS70LzSCGHZDMWCRZXm_1T0nPTc6hLzIXgU\",\"key\":\"H5\\u7b56\\u5212\\uff0c\\u4f60\\u77e5\\u9053\\u4f60\\u7684\\u7528\\u6237\\u6b63\\u5728\\u60f3\\u4ec0\\u4e48\\u5417\\uff1f\",\"updatetime\":\"2018-05-17 16:30:47\"}', '2018-05-17 16:30:47');
INSERT INTO `we_log` VALUES ('21', '', '', '用户登录', 'Login/userLogin', '登录成功', 'mrsong登录', '2018-05-17 16:31:38');
INSERT INTO `we_log` VALUES ('22', '', '', '用户登录', 'Login/userLogin', '登录成功', 'mrsong登录', '2018-05-17 16:34:34');
INSERT INTO `we_log` VALUES ('23', 'wxf42302be9b7152f8', '1', '编辑菜单', 'Menu/editMenu', '修改成功', '{\"buttonname\":\"123\",\"sort\":0,\"status\":1,\"id\":234,\"parentid\":0,\"type\":\"media_id\",\"url\":\"KrulI7-ilUtDZHUDdioQkxWxL6o47Mhb-mT5uafjnho\",\"key\":\"LOVECLUB\",\"updatetime\":\"2018-05-17 16:35:19\"}', '2018-05-17 16:35:19');
INSERT INTO `we_log` VALUES ('24', 'wxf42302be9b7152f8', '1', '编辑菜单', 'Menu/editMenu', '修改成功', '{\"buttonname\":\"123\",\"sort\":0,\"status\":1,\"id\":234,\"parentid\":0,\"type\":\"media_id\",\"url\":\"fjXYanzKvnxn-F-BJ_OBs90HZGRvKIe7Np9UD0vfG7s\",\"key\":\"\\u600e\\u6837\\u5199\\u51fa\\u8f6c\\u53d1\\u66b4\\u589e\\u7684\\u793e\\u4ea4\\u6587\\u6848\\uff1f\",\"updatetime\":\"2018-05-17 16:35:47\"}', '2018-05-17 16:35:47');
INSERT INTO `we_log` VALUES ('25', 'wxf42302be9b7152f8', '1', '编辑菜单', 'Menu/editMenu', '修改成功', '{\"buttonname\":\"123\",\"sort\":0,\"status\":1,\"id\":234,\"parentid\":0,\"type\":\"media_id\",\"url\":\"fjXYanzKvnxn-F-BJ_OBs90HZGRvKIe7Np9UD0vfG7s\",\"key\":\"\\u600e\\u6837\\u5199\\u51fa\\u8f6c\\u53d1\\u66b4\\u589e\\u7684\\u793e\\u4ea4\\u6587\\u6848\\uff1f\",\"updatetime\":\"2018-05-17 16:36:29\"}', '2018-05-17 16:36:29');
INSERT INTO `we_log` VALUES ('26', 'wxf42302be9b7152f8', '1', '编辑菜单', 'Menu/editMenu', '修改成功', '{\"buttonname\":\"123\",\"sort\":0,\"status\":1,\"id\":234,\"parentid\":0,\"type\":\"media_id\",\"url\":\"fjXYanzKvnxn-F-BJ_OBsxaGD4TR19ZWC3hRGXeWaBg\",\"key\":\"\\u65b0\\u5a92\\u4f53\\u8425\\u9500\\uff0c\\u8fd9\\u4e9b\\u6e20\\u9053\\u73a9\\u6cd5\\u4f60\\u90fd\\u505a\\u4e86\\u5417\\uff1f\",\"updatetime\":\"2018-05-17 16:36:41\"}', '2018-05-17 16:36:41');
INSERT INTO `we_log` VALUES ('27', 'wxf42302be9b7152f8', '1', '删除自动回复', 'Autoreply/delReply', '删除成功', '', '2018-05-17 16:37:45');
INSERT INTO `we_log` VALUES ('28', 'wxf42302be9b7152f8', '1', '删除自动回复', 'Autoreply/delReply', '删除成功', '', '2018-05-17 16:38:28');
INSERT INTO `we_log` VALUES ('29', 'wxf42302be9b7152f8', '1', '添加自动回复', 'Autoreply/addReply', '添加成功', '', '2018-05-17 16:40:59');
INSERT INTO `we_log` VALUES ('30', '', '', '用户登录', 'Login/userLogin', '登录成功', 'mrsong2登录', '2018-05-17 16:41:27');
INSERT INTO `we_log` VALUES ('31', '', '', '用户登录', 'Login/userLogin', '登录成功', 'mrsong登录', '2018-05-17 16:44:08');
INSERT INTO `we_log` VALUES ('32', '', '', '用户登录', 'Login/userLogin', '登录成功', 'mrsong2登录', '2018-05-17 16:46:24');
INSERT INTO `we_log` VALUES ('33', 'wxf42302be9b7152f8', '1', '添加自动回复', 'Autoreply/addReply', '添加成功', '', '2018-05-17 16:46:37');
INSERT INTO `we_log` VALUES ('34', '', '', '用户登录', 'Login/userLogin', '登录成功', 'mrsong登录', '2018-05-17 17:05:07');
INSERT INTO `we_log` VALUES ('35', '', '', '用户登录', 'Login/userLogin', '登录成功', 'mrsongnew登录', '2018-05-17 17:05:24');

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
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=utf8 COMMENT='微信素材';

-- ----------------------------
-- Records of we_material
-- ----------------------------
INSERT INTO `we_material` VALUES ('134', 'wxf42302be9b7152f8', 'fjXYanzKvnxn-F-BJ_OBs12Q84mJ_q2WJD6F73Rj6n0', '123', '', '222222', '2018-03-29 12:11:36', '2018-03-29 14:11:17');
INSERT INTO `we_material` VALUES ('135', 'wxf42302be9b7152f8', 'fjXYanzKvnxn-F-BJ_OBs90HZGRvKIe7Np9UD0vfG7s', '怎样写出转发暴增的社交文案？', '犀利姐', '微信时代，如何让每篇推送出去的微信文章有人味儿，传播得更广，转发量暴增？', '2016-06-08 17:56:41', '2016-06-08 17:58:15');
INSERT INTO `we_material` VALUES ('136', 'wxf42302be9b7152f8', 'fjXYanzKvnxn-F-BJ_OBsxaGD4TR19ZWC3hRGXeWaBg', '新媒体营销，这些渠道玩法你都做了吗？', 'Co菲', '传统媒体的单向传播，读者和媒体之间仅限一种弱粘性的阅读与被阅读关系。依托互联网诞生的芸芸新媒体，表现出了区别', '2016-06-08 17:13:48', '2016-06-12 17:25:52');
INSERT INTO `we_material` VALUES ('137', 'wxf42302be9b7152f8', 'KrulI7-ilUtDZHUDdioQkxWxL6o47Mhb-mT5uafjnho', 'LOVECLUB', '', '                                                      ', '2016-03-29 17:45:58', '2016-03-30 16:10:28');
INSERT INTO `we_material` VALUES ('138', 'wxf42302be9b7152f8', 'KyLKdTqiKZqw5kq6Vz487Lz6QwXz5FhNbKS6AAzP8WU', '你离人生巅峰，只差一个好基友的距离！', '掌握传媒', '4500元的山地自行车、1000元的行车记录仪、500元的汽车床垫以及更多惊喜好礼~', '2016-03-16 15:55:35', '2016-12-02 14:31:19');
INSERT INTO `we_material` VALUES ('139', 'wxf42302be9b7152f8', 'FfaXbaQsGS70LzSCGHZDMWCRZXm_1T0nPTc6hLzIXgU', 'H5策划，你知道你的用户正在想什么吗？', '拇指部落', '作为H5策划，在设计H5产品时我们经常需要查看各种案例，展开各种脑洞，甚至出各种方案A、方案B以作备选。', '2016-03-15 17:55:08', '2016-03-15 18:06:45');
INSERT INTO `we_material` VALUES ('140', 'wxf42302be9b7152f8', 'h23bZuswFf2YE6VaISDjMd_kybIBQhak2i63VufdLlw', '掌握传媒简介', '', '掌握传媒是中国领先的移动数字营销专家，为品牌客户提供全面的移动互联网整合营销服务。', '2016-03-15 15:57:29', '2016-03-15 17:08:27');
INSERT INTO `we_material` VALUES ('141', 'wxf42302be9b7152f8', 'VVarHkys_nXXlXNQ-gDvA2BAzFyKBzNipWlv0uGdZkA', '简而言之 | Marketing+', '简昉', '没有哪个营销舞台，比得过乔布斯时代的苹果全球开发者大会。 　　于是，后来有了“雷布斯”，向世', '2016-02-04 16:50:16', '2016-02-04 17:28:06');
INSERT INTO `we_material` VALUES ('142', 'wxf42302be9b7152f8', '1ONSgZSkqJ1ptkWBkaBMVTBxbrIie7vak1x4qc1BJJw', 'TEST', '1', 'test', '2016-02-03 18:04:32', '2016-02-03 18:14:52');
INSERT INTO `we_material` VALUES ('143', 'wxf42302be9b7152f8', 'EptfgmjpmV6mnEq476TBWABepculP520Al7IQuXEGTc', '从广告到品牌，究竟有多远？', '', '以史为镜，可以知兴替。中国互联网，沧海桑田。今天写个简单的，首发于知乎，这里增补了一些。来源：caoz的梦呓', '2016-01-25 18:36:55', '2016-01-25 19:12:40');
INSERT INTO `we_material` VALUES ('144', 'wxf42302be9b7152f8', 'IaynvL5Ktt6vfaiCjaZU1GUUuxTJdVUiXeTIjCZXcB0', '不是换件衣服斯琴高娃就可以演甄嬛（传统媒体转型好文）', '简昉', '媒体的情怀，首先在于有人看到你，有人要看你，有人要持续地看你。', '2015-12-28 18:01:46', '2015-12-28 18:42:17');
INSERT INTO `we_material` VALUES ('145', 'wxf42302be9b7152f8', '4mS4jmEwlWEsJEDQi_8PtULg2jQw328dENvSHIAjLBU', '移动互联网“下乡记”', '', '移动互联网已进入稳步增长的成熟期，然而在城市领域的竞争也已经是一片“血色红海”。', '2015-11-27 18:23:19', '2015-11-27 19:25:13');
INSERT INTO `we_material` VALUES ('146', 'wxf42302be9b7152f8', '9d4zV-J5gT_1_d29UDt8_mvS0x5HPZV3E_3rdA-csKc', '这些原因导致消费者对网络品牌失去信任', '', '这些原因导致消费者对网络品牌失去信任：研究显示，安全性，性能，营销漏洞会影响消费者的品牌体验。超过90%的消', '2015-11-06 17:54:05', '2015-11-11 20:26:35');
INSERT INTO `we_material` VALUES ('147', 'wxf42302be9b7152f8', 'Up-FbDNC3GPCkRj-1aFtE7mvEU-OsDMilNfnUjtKsHw', '社交媒体文案创作的七个好玩方式', '', '以前广告就是没人看的东西，但社交媒体的普及，让广告成了内容，内容充满了娱乐和趣味性', '2015-10-22 18:33:35', '2016-01-20 15:49:25');
INSERT INTO `we_material` VALUES ('148', 'wxf42302be9b7152f8', 'GN6BupZyJSzGOa5W02q_ScQitbQemJ5wzBTSWumb1Ec', '扫码上网', '', '扫码二维码即可上网', '2015-06-12 17:16:27', '2015-10-23 16:34:49');
INSERT INTO `we_material` VALUES ('149', 'wxf42302be9b7152f8', 'uel1_3w8EwFe3AOFEIHwPsraVDzH5HMH96aCTYkRBjQ', '让你秒懂什么是 SEM、EDM、CPS、CPA、ROI、SEO……', '', 'SEM、CPS、CPA、ROI、SEO……', '2015-04-24 18:03:19', '2015-10-23 16:35:41');
INSERT INTO `we_material` VALUES ('150', 'wxf42302be9b7152f8', 'PVEYnlT-wOoTU7NC_kIafeM8maG31Dwpn1Qg8CcfA00', '上汽阿里互联网汽车项目启动史上最牛招聘（第一篇）', '掌握传媒', '好消息，奔走相告，邀他入伙，一起重新定义汽车。更多岗位即将发布！了解详情，请点击阅读原文', '2015-03-05 11:10:09', '2016-11-29 14:14:39');
INSERT INTO `we_material` VALUES ('151', 'wxf42302be9b7152f8', 'iRM4Nx3DKY8DvRXBn_mnWq-vVHH8dYhbvfEVup1YRGo', '上汽阿里互联网汽车项目启动史上最牛招聘（第一篇）', '掌握传媒', '好消息，奔走相告，邀他入伙，一起重新定义汽车。更多岗位即将发布！', '2014-09-19 17:47:45', '2016-01-20 15:51:34');
INSERT INTO `we_material` VALUES ('152', 'wxf42302be9b7152f8', 'Z0WBL1NHiCfaYIb2z_QXEJlRQFVxGzd7VnhlDi-V8iM', '可穿戴设备上的广告要来了', '掌握传媒', '只要你关注的地方都会有广告，哪怕方寸再小。所以智能手表屏幕被广告盯上也是不可避免的，因此有人已经未雨绸缪。就', '2014-07-17 17:00:43', '2015-02-12 12:40:03');
INSERT INTO `we_material` VALUES ('153', 'wxf42302be9b7152f8', 'Z0WBL1NHiCfaYIb2z_QXEJJHDxjtVCD7r1gMJ5b1bdQ', '移动营销创新：世界杯营销的焦点战', '掌握传媒', '移动将成为互联网的未来，这一点谁都不会否认，而承载着互联网媒体主要收入的广告，也随着用户使用习惯的改变从PC', '2014-07-15 17:23:53', '2014-07-15 17:25:31');
INSERT INTO `we_material` VALUES ('154', 'wxf42302be9b7152f8', 'THQtp_Cmk9MLUuNsNe0R3_el62o_UGFfhaqJyrN88us', '社群商业：移动互联时代的新商业图景', '掌握传媒', '2014年5月17日，中国商业界最大的新闻不是“世界电信日”，而是互联网知识社群第一品牌《罗辑思维》的创办者', '2014-07-10 17:51:44', '2014-07-10 17:54:25');
INSERT INTO `we_material` VALUES ('155', 'wxf42302be9b7152f8', 'o7wYGLZzaphIczyi4o8E_FXhuZ5yqtGGLly1nc65wkY', '移动广告成为美国第三大广告载体', '掌握传媒', '市场调研公司eMarketer周三发布报告称，今年美国媒体广告支出将增长5.3%，达到1801.2亿美元。这', '2014-07-03 18:41:52', '2014-07-03 18:43:45');
INSERT INTO `we_material` VALUES ('156', 'wxf42302be9b7152f8', 'mgMtedMAFwDjAToDKkoxH-YoYKTyRABWiMrkBFeIWbE', 'Twitter正式推出移动应用安装广告', '掌握传媒', '北京时间7月1日早间消息，Twitter周一宣布，经过了长达数月的测试后，该公司将向更多客户正式推出移动应用', '2014-07-01 18:49:51', '2014-07-01 18:50:20');
INSERT INTO `we_material` VALUES ('157', 'wxf42302be9b7152f8', 'eryYnolA5GwRvSt3Ox9x9iM4HUcdHY2MYLN1enVDBso', '域名在移动时代边缘化 美国政府要撒手', '掌握传媒', '腾讯科技讯6月24日消息，在传统的PC互联网时代，人们在网页浏览器中输入带域名后缀的网址，来进行访问。不过在', '2014-06-24 18:19:32', '2014-06-24 18:20:52');
INSERT INTO `we_material` VALUES ('158', 'wxf42302be9b7152f8', 'ZiM2yXG4DPTJ6_1-UMzcOtAek26VZwB4bFsV6BVw4V4', '微信公众号广告正进行最终测试 认证不再是门槛', '掌握传媒', '1. 微信公众号也可以自己选择广告主。 包括两个环节：选取10类细分行业广告；以及对广告主进行定向屏蔽。广点', '2014-06-19 17:35:19', '2014-06-19 17:38:01');
INSERT INTO `we_material` VALUES ('159', 'wxf42302be9b7152f8', 'ZiM2yXG4DPTJ6_1-UMzcOmR98gGSmT-4EfwynJ291II', '夏天来了 选一款健身应用和设备减肥吧', '掌握传媒', '俗话说：“5月6月不减肥，7月8月徒悲伤”。其实，一年四季都应该有规律地持续运动，才能保持最佳的体型和健康的', '2014-06-17 17:36:32', '2014-06-17 17:37:40');
INSERT INTO `we_material` VALUES ('160', 'wxf42302be9b7152f8', 'N7UZ4wvMFschsCAd_Azj441JOVNSiI3sni8_R-mVfJs', '电商混战世界杯', '掌握传媒', '看球前先囤货四年一次的世界杯绝不再是传统体育品牌掘金的机会，营销嗅觉敏锐的电商企业也顺着世界杯的东风轰轰烈烈', '2014-06-12 17:05:41', '2014-06-12 17:35:58');
INSERT INTO `we_material` VALUES ('161', 'wxf42302be9b7152f8', 'wymHhbxjEZ88wdQg28C3ulc1K1w_ZSiGPLft2c24GdI', '微信开放搜索 用户体验和商业变现该如何协调', '掌握传媒', '微信借助搜狗，终于开放了，无疑这是昨天最重磅的消息。虽然早在半年前我就发文讨论关于微信如何通过朋友圈做移动端', '2014-06-10 17:10:36', '2014-06-10 17:29:16');
INSERT INTO `we_material` VALUES ('162', 'wxf42302be9b7152f8', 'gSAN6HyEvYodxBe70IsQRi3z4pT7-9LzcpR5FZ_xn28', '移动广告: 消息推送让零售商大受裨益', '', ' 使用GPS定位的移动广告逐渐提升了广告与顾客之间的关联性。顾客倾向于点击针对自己所处位置进行推送的移动广告', '2014-06-05 18:32:32', '2014-06-05 19:29:08');
INSERT INTO `we_material` VALUES ('163', 'wxf42302be9b7152f8', 'gSAN6HyEvYodxBe70IsQRl0h-qCBFBH5Y1izSp4hIj4', '从6年《互联网趋势报告》看移动互联网发展', '掌握传媒', '凯鹏华盈（KPCB）的合伙人玛丽·米格《互联网趋势报告》是全球互联网行业从业者、创业者所关注的分析报告。而从', '2014-06-03 14:57:09', '2014-06-03 16:38:40');
INSERT INTO `we_material` VALUES ('164', 'wxf42302be9b7152f8', '9h2b6fZv1CDZa2Blrf7laVMvYSmlliPQSm07HrcymFA', '“治理”微信们：国家“专项行动”的商业反响', '掌握传媒', '“微信的人气估计会受到影响。”5月28日，一家为多个知名品牌提供微信营销方案的第三方企业负责人对记者表示。 ', '2014-05-29 16:22:28', '2014-05-29 17:46:20');
INSERT INTO `we_material` VALUES ('165', 'wxf42302be9b7152f8', '9h2b6fZv1CDZa2Blrf7laTWaAbEeUM3b0MqJ34XNIZk', '社交基因的微信难成电商大器！', '掌握传媒', '在折腾了近10年后，腾讯最终放弃了自营电商业务：2014年2月腾讯入股大众点评，变相承认自营生活服务电商业务', '2014-05-27 17:48:35', '2014-05-27 17:53:25');
INSERT INTO `we_material` VALUES ('166', 'wxf42302be9b7152f8', '-tLVVzN-KEK_F6TiD-SZysJivU1FOe5zJtYV61tHQyQ', '手机APP成重灾区 软件破解已成产业链', '掌握传媒', '很多智能手机用户可能并没有意识到，自己下载在手机中的APP，可能是山寨APP或被破解的官方APP。以游戏“植', '2014-05-20 17:38:22', '2014-05-20 17:39:33');
INSERT INTO `we_material` VALUES ('167', 'wxf42302be9b7152f8', 'UZNdtbrMJS3_bOjq1YqqaOS_mlJ-AoVhDsaEYEojaKQ', '如何把握“浮躁”时代消费者的广告需求', '掌握传媒', '现代高科技的发展，激烈的社会竞争和工作压力把当代人带进了一个以追求“快速”、“效率”、强调“自我优化”和寻求', '2014-05-15 18:51:21', '2014-05-15 18:52:13');
INSERT INTO `we_material` VALUES ('168', 'wxf42302be9b7152f8', 'UZNdtbrMJS3_bOjq1YqqaDEeSggM9ZP_2tOb4uO-W0w', '央视：微信公众帐号变成谣言与虚假广告温床', '掌握传媒', '5月13日消息，昨日晚间的《国内焦点》节目中，央视以《微波炉的“秘密”》节目批评了微信公共账号中存在大量的虚', '2014-05-13 17:37:01', '2014-05-13 17:38:40');
INSERT INTO `we_material` VALUES ('169', 'wxf42302be9b7152f8', 'QzBWuGoFyyFkQuJtsCqEvMWL5tJpX2RyTzllPW2YrFE', '3个原因你的营销没像病毒一样传播', '掌握传媒', '病毒式营销：你还能更多地要求些什么呢？你已经看到过它发生在大企业和小公司身上，当一个广告或视频或一篇帖子突然', '2014-04-29 20:44:01', '2014-04-29 20:46:12');
INSERT INTO `we_material` VALUES ('170', 'wxf42302be9b7152f8', 'QzBWuGoFyyFkQuJtsCqEvDo7lCMOa3lr6WHX2UUceBM', '3个原因你的营销没像病毒一样传播', '掌握传媒', '病毒式营销：你还能更多地要求些什么呢？你已经看到过它发生在大企业和小公司身上，当一个广告或视频或一篇帖子突然', '2014-04-29 20:43:59', '2014-04-29 20:44:00');
INSERT INTO `we_material` VALUES ('171', 'wxf42302be9b7152f8', 'QFJbJEtQuT3KOySKOOKDb3ja4fMhsxuntm3LDW_myYo', '女性营销的三个重要趋势', '掌握传媒', '互联网上以男性为结构主导的格局正随着女性网民数量的增加而发生改变。如今女性网民已经形成了一个潜力极大的网络消', '2014-04-24 17:36:00', '2014-04-24 17:36:50');
INSERT INTO `we_material` VALUES ('172', 'wxf42302be9b7152f8', 'zDAe-RZ1cVNHy2I7zp-a4iP6KL4J-LCblVt-n9aJ5nM', '“舌尖”营销再战第二季 电商抢口水商机', '掌握传媒', '电商争抢口水商机回顾第一季《舌尖》走红后的情形，在网上按图索骥购买相关食材的粉丝，一周内就涌现了近600万人', '2014-04-22 17:42:44', '2014-04-22 17:54:06');
INSERT INTO `we_material` VALUES ('173', 'wxf42302be9b7152f8', 'ZqjqOe3-O_hV7Tpye_diUwh3JMsEG0uzXNnn1eIZ13E', '移动时代 网站不死', '掌握传媒', '不久前，专家们曾断言，社交网络的崛起意味着电子邮件大限将至。事实证明，他们错了。 上周早些时候，我十分喜欢的', '2014-04-17 18:10:56', '2014-04-17 18:13:02');
INSERT INTO `we_material` VALUES ('174', 'wxf42302be9b7152f8', 'ZqjqOe3-O_hV7Tpye_diUyUV_8uXtWWmDWUNEgBFPpE', '企业微信运营的22条军规', '掌握传媒', '继上篇《浮躁的微信，你中枪了吗？》，微信到底应该怎么玩？问题出在哪里？今天笔者继续扒一扒。 我们公司的微信也', '2014-04-15 19:45:41', '2014-04-15 19:48:55');
INSERT INTO `we_material` VALUES ('175', 'wxf42302be9b7152f8', 'ftj8GgAStrYmSC2nv6yoKRR3gQqQ7Z2kycr7hrF5r94', '放弃微信？请不要点赞', '掌握传媒', '一边是微信推出的“封杀新规”，一边是微博微信的暗战，更有媒体报道称，微信公众号疑似出现负增长。面对微信这款只', '2014-04-10 17:07:32', '2014-04-10 17:54:12');
INSERT INTO `we_material` VALUES ('176', 'wxf42302be9b7152f8', 'cbp_T14XB9tk3ru7Vqz2wqxTvObF96YbrTzdiulkNu4', 'Twitter将推15种新广告 吸引电商和游戏商', '掌握传媒', '一大波新广告即将出现在Twitter平台上。消息人士表示，为了赢得电商公司和移动游戏开发商的关注，Twitt', '2014-04-08 17:20:08', '2014-04-08 17:35:32');
INSERT INTO `we_material` VALUES ('177', 'wxf42302be9b7152f8', 'Ds5KrIgyl2wB34Vh4LkqBmxhE-M5BP62GQRqiJvBcdY', '从马伊琍父亲的危机公关中 可以学到什么', '掌握传媒', '在笔者就文章出轨事件接连撰写三篇原创文章之后，获得了众多网友的关注。可以说，这次的热点事件对于很多企业或者单', '2014-04-03 18:10:17', '2014-04-03 18:11:51');
INSERT INTO `we_material` VALUES ('178', 'wxf42302be9b7152f8', 'wXHi6PoyBcHawym1sPQxM_lkl-Ai2-wmvvtZ7w45fWo', '像泡妞一样做微信营销', '掌握传媒', '今天和朋友聊天，他向我一本正经的介绍公司业务，当我看到PPT的某一张，没有忍住贼笑了一下： 这么专业的PPT', '2014-03-27 16:07:05', '2014-03-28 10:14:18');
INSERT INTO `we_material` VALUES ('179', 'wxf42302be9b7152f8', 'wXHi6PoyBcHawym1sPQxMxAgIDNxRupkNFMZmipEaMg', '智能手表才是移动广告的新宠？', '掌握传媒', '你的手腕将成为下一个广告牌吗? 索尼、三星、摩托罗拉相继发布新产品加入了智能手表市场，加上一直在传闻中的苹果', '2014-03-25 17:47:11', '2014-03-25 17:48:39');
INSERT INTO `we_material` VALUES ('180', 'wxf42302be9b7152f8', 'xEHkRM_AU4uzcuQuK0hmhco2ZDEbJJajFWalSRkcp5U', 'MMA发布中国广告主移动营销深访报告', '掌握传媒', '近年来，移动营销在世界范围内迅速发展，成为全球广告主瞩目的营销领域。但对于大部分广告主来说，移动营销仍然是一', '2014-03-20 17:37:39', '2014-03-20 17:39:36');
INSERT INTO `we_material` VALUES ('181', 'wxf42302be9b7152f8', 'GHofBrZWDrEW9ofDJii_AiCxcudU83hh9yjGujaf014', '移动互联网时代的“圈地运动”', '掌握传媒', '无论是手机，还是手表，甚至衣服上的纽扣，只要是移动中的事物，都有可能成为信息的媒介，这不是想象，而是离现实并', '2014-03-18 17:11:37', '2014-03-18 17:43:20');
INSERT INTO `we_material` VALUES ('182', 'wxf42302be9b7152f8', 's0JIk3gBFD9-3EWkfDHNgSkqTbkd1CZ2yDIYaiqdRig', '谷歌争夺移动广告的利器：深度应用链接', '掌握传媒', '虽然谷歌一直牢牢统治着桌面网络搜索市场，但是随着用户不断向移动设备转移，谷歌突然发现自己也处于危险之中：因为', '2014-03-11 17:21:41', '2014-03-11 18:14:11');
INSERT INTO `we_material` VALUES ('183', 'wxf42302be9b7152f8', 'zLx2Ss4ZLQNyrbcbRHULMWq38ev6kAb7xCrYxkHPdrs', '2014年移动互联网下的中国营销人员现状调查', '掌握传媒', '全球市场研究集团益普索（Ipsos）近期在中国开展的《2014年营销展望》调查发现，总体来说，中国营销管理人', '2014-03-06 17:31:17', '2014-03-06 17:32:45');
INSERT INTO `we_material` VALUES ('184', 'wxf42302be9b7152f8', 'TRI1VKfJi82ci0qr512d9ntWN012-smS6xgnsmvkqVM', '瓶盖玩家可口可乐转战微信 移动营销初试水', '掌握传媒', '对于许多大学学渣而言，能在简历上写下的获奖记录也就是“多次荣获康师傅再来一瓶奖励”。这种调侃反应出了对于饮料', '2014-03-04 17:30:01', '2014-03-04 17:32:16');
INSERT INTO `we_material` VALUES ('185', 'wxf42302be9b7152f8', '_1mVqkwB2gnO-qu9RTccjB9sapkxW0I1iF6eGLvjVqI', 'Agency数字广告之路 该何去何从？', '掌握传媒', '经5家跨国媒体代理集团寡头把持大部分媒体预算的时代渐行渐远，碎片化环境让受众愈加分散。广告产业链上游的广告主', '2014-02-25 16:49:40', '2014-02-25 17:29:47');
INSERT INTO `we_material` VALUES ('186', 'wxf42302be9b7152f8', 'cy9R2H-lMoMrwgyy9Qaj7lybifsA2nTtVmW__OKxjP8', '190亿美元 Facebook收购WhatsApp', '掌握传媒', '2月19日，Facebook宣布该公司已经同快速成长的跨平台移动通讯应用WhatsApp达成最终协议，将以大', '2014-02-20 17:19:33', '2014-02-20 17:48:57');
INSERT INTO `we_material` VALUES ('187', 'wxf42302be9b7152f8', 'cy9R2H-lMoMrwgyy9Qaj7mnDFSilyLk_dDT7kDe2IYg', '2014 营销向何处去', '掌握传媒', '相比诸多研究机构和营销专家对于2014年以及未来营销趋势的众多预测而言，摆在营销经理人面前迫切而现实的问题其', '2014-02-18 16:00:55', '2014-02-18 17:48:32');
INSERT INTO `we_material` VALUES ('188', 'wxf42302be9b7152f8', '3MNbzf43Adaf5qX6MupsCE7ukt0HMNqOlGD74gMjRsM', '2.14，让我们想约“缘满”！', '掌握传媒', '2014年2月14日，情人节偶遇元宵节，这样的双节合璧19年才能遇见一次。在这特殊的日子里，互动通精心策划的', '2014-02-14 11:25:30', '2014-02-14 11:27:09');
INSERT INTO `we_material` VALUES ('189', 'wxf42302be9b7152f8', '3MNbzf43Adaf5qX6MupsCCXqv1StIcVPlYJRqwijOh4', '2014年值得营销人关注的5个社交媒体趋势', '掌握传媒', '2013对于社会化媒体来说是重大的一年，这一年，通过Facebook, Twitter, Instagram', '2014-02-12 17:53:50', '2014-02-12 17:58:15');
INSERT INTO `we_material` VALUES ('190', 'wxf42302be9b7152f8', '2UHEG2JNotFXLXrI_RsybvXYvZMFjJztdtZgMbflZU8', '掌握传媒给大家拜年啦！', '掌握传媒', '马年钟声即将敲响，感谢各位在过去一年中对掌握传媒的大力支持，在新的一年里，祝大家马年大吉喜气扬，马头扬扬好运', '2014-01-27 17:09:34', '2014-01-31 08:40:41');
INSERT INTO `we_material` VALUES ('191', 'wxf42302be9b7152f8', 'Al33Rf5rEargbN0Tf4u24Su0MvpJAI2bF5f3he3L460', '﻿﻿移动广告下一个热点：激活应用休眠用户', '掌握传媒', '新的应用像滔滔江水一样，不断涌入市场，与此同时，应用开发者获得新的用户也变得愈来愈困难，这就迫使开发者和市场', '2014-01-23 16:01:11', '2014-01-23 17:32:56');
INSERT INTO `we_material` VALUES ('192', 'wxf42302be9b7152f8', 'Al33Rf5rEargbN0Tf4u24RvDYfzvzFTYmrljoqx4P1o', '移动购物增速四倍于PC端折射网购习惯迁移', '掌握传媒', '移动购物发展突飞猛进。市场研究机构艾瑞最新统计数据显示，2013年移动网购整体交易规模1676.4亿元，同比', '2014-01-21 17:19:06', '2014-01-21 17:34:17');
INSERT INTO `we_material` VALUES ('193', 'wxf42302be9b7152f8', 'Al33Rf5rEargbN0Tf4u24SqaYH8O7D1RZyfClf8feLk', '微信“模板消息” 企业短信市场或将受影响', '掌握传媒', '某接近微信内部人士透露，“微信模板消息”即将推出，现已启动内测。这恐怕是在微信5.2版发布前最重磅的微信动态', '2014-01-16 16:01:27', '2014-01-16 17:45:22');
INSERT INTO `we_material` VALUES ('194', 'wxf42302be9b7152f8', 'Al33Rf5rEargbN0Tf4u24a7_cvPcRh0IDTK8EeFrbNs', '移动互联网营销：跨屏新玩法', '掌握传媒', '很多人将刚刚过去的2013年称为移动互联网营销元年，众多企业也都开始在移动互联网广告上投入重金。而随着201', '2014-01-15 11:14:39', '2014-01-15 11:16:32');
INSERT INTO `we_material` VALUES ('195', 'wxf42302be9b7152f8', 'Al33Rf5rEargbN0Tf4u24bbVbwSXlTqZ6RZa5RqWmqY', '巨头角逐移动支付战场 支付宝联手微博阻击微信', '掌握传媒', '支付作为移动互联网商业模式中最重要的一环，正成为各大巨头角逐的战场。 昨日（1月6日），一位不愿具名的消息人', '2014-01-07 17:42:01', '2014-01-07 17:44:15');
INSERT INTO `we_material` VALUES ('196', 'wxf42302be9b7152f8', 'Al33Rf5rEargbN0Tf4u24eg-NnmV3vZEPwBqzC1ksIY', '物联网大潮来了，你需要了解哪些东西', '', '过去5年见证了智能手机崛起为我们日常生活中最常使用的联网设备，平板电脑紧随其后。下一代设备的创新将带领互联网', '2014-01-02 18:27:47', '2014-01-02 18:33:29');
INSERT INTO `we_material` VALUES ('197', 'wxf42302be9b7152f8', 'Al33Rf5rEargbN0Tf4u24ay8J6agn4N6fvMapHa4dYM', '“越狱”变脸：手机助手暗战升级', '掌握传媒', '太极助手，一个闻所未闻的软件，突然间因为iOS7系统越狱搅动了这个市场，甚至正在推动越狱应用渠道分发战争的升', '2013-12-24 18:11:49', '2013-12-24 18:13:22');
INSERT INTO `we_material` VALUES ('198', 'wxf42302be9b7152f8', 'Al33Rf5rEargbN0Tf4u24VaSUTKQIGVWI1jno8s-sl8', '苹果移动广告业务低迷？即将实施自救策略', '掌握传媒', '在全球移动端广告显示份额上，苹果的iPhone和iPad毋庸置疑名列前茅，然而有点尴尬的是，苹果自家的移动广', '2013-12-17 15:42:55', '2013-12-19 18:04:32');
INSERT INTO `we_material` VALUES ('199', 'wxf42302be9b7152f8', 'Al33Rf5rEargbN0Tf4u24Ys-V-IjsFqBVbiM9G5M5bs', '从“妈妈再打我一次” 看内容传播', '掌握传媒', '这世界上本无热点，参与的人多了，也就成了热点。 妈妈再打我一次这个漫画火了之后，有很多朋友在问，如何成功制作', '2013-12-10 17:42:10', '2013-12-10 17:45:46');
INSERT INTO `we_material` VALUES ('200', 'wxf42302be9b7152f8', 'TBpoosP2LOuN0Av3cTKgnx-96Hv1AtSSTvr_71X9MXo', '信息图：社交媒体的12个失误', '掌握传媒', ' 来自：多阅网 这里是掌握传媒（微信号zhangwochuanmei），每分享移动数字新闻与公司资讯，欢迎点', '2013-12-04 17:30:13', '2013-12-04 17:33:41');
INSERT INTO `we_material` VALUES ('201', 'wxf42302be9b7152f8', 'TBpoosP2LOuN0Av3cTKgnzn4kUWLi8ixKLjpLUbVn90', '反打扰式广告的战争', '掌握传媒', '浏览器广告插件AdPlus赞助调研了1900位英国用户发现，随处乱发的广告的确破坏了很多人的上网体验，87%', '2013-11-26 16:08:24', '2013-11-26 17:45:07');
INSERT INTO `we_material` VALUES ('202', 'wxf42302be9b7152f8', 'zoz1HFDY1FCTuQ_5uE5Q2xTvFCsnscZkvSHZ8HSiNQE', '移动端媒体的多元化形态', '掌握传媒', '移动互联网和互联网很不一样，屏幕大小、用户使用习惯、入口等，和PC端完全不同，马化腾也提到“移动互联网是对互', '2013-11-21 16:44:56', '2013-11-21 17:46:02');
INSERT INTO `we_material` VALUES ('203', 'wxf42302be9b7152f8', 'zoz1HFDY1FCTuQ_5uE5Q2-gQh-8OOmysuEnrMBlwz5E', '微信：每一个公众号都是一个APP', '掌握传媒', '11月18日（周一），腾讯微信在广州举行首次“微信·公众”合作伙伴沟通会。微信在会上提出“平台化，公开化，自', '2013-11-19 16:58:24', '2013-11-19 17:44:49');
INSERT INTO `we_material` VALUES ('204', 'wxf42302be9b7152f8', 'zoz1HFDY1FCTuQ_5uE5Q29r55_ZnE1yE7WRwnRzLsAk', '社交媒体10个你意想不到的数字', '掌握传媒', '社交媒体正在以前所未有的速度迅猛发展，即便是Twitter、Facebook、LinkedIn这些大家耳熟能', '2013-11-14 17:09:41', '2013-11-14 17:35:35');
INSERT INTO `we_material` VALUES ('205', 'wxf42302be9b7152f8', 'zoz1HFDY1FCTuQ_5uE5Q2w7D8U4wRHcZ-3OczRP-3Yc', '第三方数据：互联网异常流量造成近百亿广告费损失11.12', '掌握传媒', '截止到2013年6月底，中国已经拥有5.91亿网民和4.64亿手机网民，覆盖了近半数的中国人。从1997年I', '2013-11-12 17:47:07', '2013-11-12 17:49:24');
INSERT INTO `we_material` VALUES ('206', 'wxf42302be9b7152f8', 'zoz1HFDY1FCTuQ_5uE5Q2ySNsPX0qFDQjvuW1-03JUs', '移动4G抢跑：覆盖还是大问题', '掌握传媒', '原生广告（Native-Advertisement）成为一种新的网络广告理念。最近业内机构的一份研究报告指出', '2013-11-07 16:26:29', '2013-11-07 17:59:49');
INSERT INTO `we_material` VALUES ('207', 'wxf42302be9b7152f8', 'zoz1HFDY1FCTuQ_5uE5Q2413d4rIv0ufvomkl2mt5cE', '博文成原生广告最流行平台 脸书列第三', '掌握传媒', '原生广告（Native-Advertisement）成为一种新的网络广告理念。最近业内机构的一份研究报告指出', '2013-11-05 18:03:10', '2013-11-05 18:05:38');
INSERT INTO `we_material` VALUES ('208', 'wxf42302be9b7152f8', 'zoz1HFDY1FCTuQ_5uE5Q23yFfbZHTlxIFaSfafcTnzY', 'Facebook月活跃用户逼近12亿：移动用户占73%', '掌握传媒', '北京时间10月31日早间消息，Facebook(49.01, -0.39, -0.78%)周三公布了第三季度', '2013-10-31 17:00:06', '2013-10-31 17:47:01');
INSERT INTO `we_material` VALUES ('209', 'wxf42302be9b7152f8', 'zoz1HFDY1FCTuQ_5uE5Q291qb2egdTVNBgqs4avO56A', '社交广告投资回报大涨：Twitter单位营收增4倍', '掌握传媒', '北京时间10月29日早间消息，本周二发布的第三季度“Adobe社交情报报告”显示，今年Twitter(0,', '2013-10-29 17:21:06', '2013-10-29 18:04:30');
INSERT INTO `we_material` VALUES ('210', 'wxf42302be9b7152f8', 'zoz1HFDY1FCTuQ_5uE5Q29dF2HGWRY6bciOyNGiiIs8', '移动广告市场未来5年增长3倍 达400亿美元', '掌握传媒', '据国外媒体报道，市场研究机构Juniper Research最新研究报告显示，今年全球移动广告市场规模为13', '2013-10-24 15:08:20', '2013-10-24 17:29:48');
INSERT INTO `we_material` VALUES ('211', 'wxf42302be9b7152f8', 'zoz1HFDY1FCTuQ_5uE5Q2wIX9bPE3EuXsM5kOB7OhD0', '移动互联网变现难题：流量难转化为收入', '艾瑞网', '最近的几则新闻都是与“尝试变现”有关。媒体报道，在上月推出了增值服务模式的Path目前来看并没有取得太大的效', '2013-10-22 15:47:09', '2013-10-22 17:44:26');
INSERT INTO `we_material` VALUES ('212', 'wxf42302be9b7152f8', 'zoz1HFDY1FCTuQ_5uE5Q24zHLd35H6duZPNtIDDu-lU', '数说营销：互联网广告迈向千亿市场', '梅花网', '【1.5倍】美国交互广告署(以下简称“IAB”)估计，今年上半年，美国移动广告支出由上年同期的12亿美元增长', '2013-10-17 17:52:21', '2013-10-17 17:57:09');
INSERT INTO `we_material` VALUES ('213', 'wxf42302be9b7152f8', 'zoz1HFDY1FCTuQ_5uE5Q2wzHsgoruONASM1CxNYnvdg', '雅虎收购社交与移动广告平台Bread', '新浪科技', '雅虎刚刚收购了社交媒体和移动端广告设计与发布平台Bread，它通过在Facebook、Twitter上生成广', '2013-10-12 16:07:18', '2013-10-12 17:36:56');
INSERT INTO `we_material` VALUES ('214', 'wxf42302be9b7152f8', 'zoz1HFDY1FCTuQ_5uE5Q27rAiNKNV835giCNA5knKDQ', 'ITU：预计2013年全球网民数达27亿 移动设备量等同人口数', '199it', '国际电联（ITU）今日发布的最新年报称，移动市场将在今年获得巨大的发展，预计到年底的时候，全球移动连网设备数', '2013-10-09 17:32:53', '2013-10-09 17:37:13');
INSERT INTO `we_material` VALUES ('215', 'wxf42302be9b7152f8', 'zoz1HFDY1FCTuQ_5uE5Q2xLPMXZuO3DVV5UzV8fPFzs', '掌握传媒祝您国庆快乐', '', '理一理思绪，换一副好心情；抖一抖重负，脚步变得轻轻；赏一赏秋景，做个快乐精灵；吹一吹清风，人儿变得精神。掌握', '2013-09-30 16:05:00', '2013-09-30 16:11:43');
INSERT INTO `we_material` VALUES ('216', 'wxf42302be9b7152f8', 'zoz1HFDY1FCTuQ_5uE5Q2_gNnXOADRGZyU0fcKCn_EI', '【玩转假日】玩转指尖APP', '', '7天假日，小编精选了几个不错的娱乐APP，来和小伙伴一起玩耍起来吧！\r\n \r\n1. Kingom Rush', '2013-09-30 11:57:51', '2013-09-30 12:02:05');
INSERT INTO `we_material` VALUES ('217', 'wxf42302be9b7152f8', 'zoz1HFDY1FCTuQ_5uE5Q2wXIR2EXktmiSsw_poIg-nM', '阿里高调推广APP“来往” 移动社交领域战微信', '搜狐IT', '在切断与微信联系后，阿里巴巴在移动IM社交领域动作频频。9月23日，阿里巴巴宣布将高调推广旗下社交APP来往', '2013-09-24 17:45:18', '2013-09-24 17:47:41');
INSERT INTO `we_material` VALUES ('218', 'wxf42302be9b7152f8', 'zoz1HFDY1FCTuQ_5uE5Q2z2r-6ECG72B_lL7kSU1DYc', '移动互联网口水仗：免费还是收费？', '艾瑞网', '百度的狼性彻底迸发，以至于祭出了免费的大旗。8月28日，百度地图突然宣布，原本收费30元的百度导航从即刻起全', '2013-09-17 15:13:02', '2013-09-17 17:23:18');
INSERT INTO `we_material` VALUES ('219', 'wxf42302be9b7152f8', 'zoz1HFDY1FCTuQ_5uE5Q21d_2CI2IDjZ3uJebOe1C-A', '【掌握案例】交通银行信用卡：2013点亮愿望，新年派礼', '', '案例背景：\r\n\r\n中国经济的快速增长以及对外开放程度的提高，都使得商务差旅市场在中国迅速成长，并成为了一个最', '2013-09-16 17:24:08', '2013-09-16 17:49:08');
INSERT INTO `we_material` VALUES ('220', 'wxf42302be9b7152f8', 'zoz1HFDY1FCTuQ_5uE5Q249Z_jy0-rQr0BTQ2PplBgw', '大数据工具将成为移动互联网标配', '网易科技', '中国互联网协会日前发布的《中国互联网发展报告（2013）》里指出，中国移动营销市场正呈爆炸式增长，2012年', '2013-09-12 17:04:28', '2013-09-12 17:37:18');
INSERT INTO `we_material` VALUES ('221', 'wxf42302be9b7152f8', 'zoz1HFDY1FCTuQ_5uE5Q25ILmASG3q3WGqB24P1IsgE', 'iPhone 5S和5C今夜还会有哪些亮点', '艾瑞网', '苹果计划将于周二（9月10日）召开新iPhone手机的发布会。在发布会前，有关零部件谍照、新产品型号、颜色，', '2013-09-10 17:56:37', '2013-09-10 18:00:46');
INSERT INTO `we_material` VALUES ('222', 'wxf42302be9b7152f8', 'zoz1HFDY1FCTuQ_5uE5Q25w0OdjlzgkufmgvevedOgE', '微软收购诺基亚手机业务：迟到的结局', '腾讯科技', '北京时间今日上午，微软和诺基亚官方宣布，微软将收购诺基亚设备与服务业务，即手机业务部门，交易数额是71.7亿', '2013-09-03 16:20:08', '2013-09-03 18:03:24');
INSERT INTO `we_material` VALUES ('223', 'wxf42302be9b7152f8', 'zoz1HFDY1FCTuQ_5uE5Q209YHWSe5zk2pR0r-qIht7U', '微信推数据统计功能：商业价值或可量化', '梅花网', '8月29日晚，微信产品团队通过服务号“微信公众平台”发布消息，宣布“微信公众平台增加数据统计功能”。与此同时', '2013-08-30 17:32:23', '2013-08-30 17:33:46');
INSERT INTO `we_material` VALUES ('224', 'wxf42302be9b7152f8', 'zoz1HFDY1FCTuQ_5uE5Q294StXWPXJfHV-4y4CQ4d4I', 'Opera：2013年Q2移动广告市场份额 iOS占移动广告收入份额49.36％', '199it', '挪威欧普拉软件（Opera Software）公司，于当地时间2013年7月24日公布了移动广告相关调查结果', '2013-08-27 15:38:31', '2013-08-28 10:03:50');
INSERT INTO `we_material` VALUES ('225', 'wxf42302be9b7152f8', 'zoz1HFDY1FCTuQ_5uE5Q20K_ksepkWKs7xOlCNLgRiU', '快到手机里来——广汽丰田逸致视频&手机互动体验', '', '单纯的视频传播难以吸引关注，我们要如何善用其形式，才能焕发视频广告的活力；新媒体时代，如何找到有趣点来吸引消费者，怎样和消费者做品牌沟通才能真正扩大传播力度？', '2013-08-27 11:37:55', '2013-10-14 11:40:36');
INSERT INTO `we_material` VALUES ('226', 'wxf42302be9b7152f8', 'zoz1HFDY1FCTuQ_5uE5Q25dUSJTQC1T4U1waL1tJo9c', '营销人员对手机广告的3个误解', '199IT', '关于手机广告的质量和成功的谈话一直持续着。并且很快地发展成为有关手机广告乏善可陈性能的根源的讨论。', '2013-08-20 17:14:35', '2013-08-20 17:59:55');
INSERT INTO `we_material` VALUES ('227', 'wxf42302be9b7152f8', 'zoz1HFDY1FCTuQ_5uE5Q2-Z5xQdxFk8yHr81zbQLejM', 'Facebook日活跃用户达6.99亿：移动端占67%', '新浪科技', '北京时间8月14日早间消息，Facebook(37.02, -1.20, -3.14%)周二公布的数据显示，', '2013-08-14 18:06:19', '2013-08-14 18:07:24');
INSERT INTO `we_material` VALUES ('228', 'wxf42302be9b7152f8', 'zoz1HFDY1FCTuQ_5uE5Q2wt1kXWMHCLdjsxHWB28QKA', '工具类应用突围：被平台挤压 转型社区盈利难求', '腾讯科技', '移动互联网生态演进到今日呈现出“冰火两重天”的景象：手机游戏因为明晰的商业模式正热的发烫，而工具类应用却经历', '2013-08-08 16:51:23', '2013-08-08 17:31:57');
INSERT INTO `we_material` VALUES ('229', 'wxf42302be9b7152f8', 'zoz1HFDY1FCTuQ_5uE5Q22c4jGHwmEFWluF-J6ITXy8', '宝洁调整广告投放策略：数字广告占35%', '梅花网', '宝洁CEO雷富礼(A.G. Lafley )上周四表示，该公司目前的数字广告支出占到了总营销预算的25%至3', '2013-08-06 14:49:00', '2013-08-06 17:22:18');
INSERT INTO `we_material` VALUES ('230', 'wxf42302be9b7152f8', 'zoz1HFDY1FCTuQ_5uE5Q21IVtEwg9PSH18k1N1JKo2Q', '传Facebook将推视频广告服务 日收费250万美元', '', '北京时间7月31日消息，据国外媒体报道，消息人士周二透露，一直需求对被电视长期统治的广告预算进行突破的Fac', '2013-08-01 17:02:09', '2013-08-01 17:39:06');
INSERT INTO `we_material` VALUES ('231', 'wxf42302be9b7152f8', 'zoz1HFDY1FCTuQ_5uE5Q28iuiDoTgODd18A7QTipPJE', '谷歌应迅速调整移动广告投放策略', '', 'via 199it.com\r\n \r\n在近日Google发布的2013财年第二季度财报中，我们很明显地注意到移', '2013-07-30 16:21:52', '2013-07-30 16:39:32');
INSERT INTO `we_material` VALUES ('232', 'wxf42302be9b7152f8', 'zoz1HFDY1FCTuQ_5uE5Q29jSRQ3sGQ90FSCmiuO505o', 'Opera Mediaworks：数据显示iOS设备占到移动广告印象的43.8%', '', '2013年7月24日据国外媒体报道，全球第一大移动广告网络Opera Mediaworks发布报告称，苹果i', '2013-07-25 17:23:01', '2013-07-25 17:41:33');
INSERT INTO `we_material` VALUES ('233', 'wxf42302be9b7152f8', 'zoz1HFDY1FCTuQ_5uE5Q2xWILlBVxx9lI2yZg9kBwV4', '苹果公司：开发者中心宕机源自黑客攻击', '', 'via新浪科技\r\n \r\n北京时间7月22日早间消息，苹果公司刚刚发布声明，解释了上周四开始的开发者中心宕机事', '2013-07-22 17:15:13', '2013-07-22 17:20:00');
INSERT INTO `we_material` VALUES ('234', 'wxf42302be9b7152f8', 'zoz1HFDY1FCTuQ_5uE5Q28WnZottfuGdSLQk2ia47vI', '百度拟19亿美元全资收购91无线', '', 'via新浪科技\r\n7月16日上午消息，百度(Nasdaq:BIDU)今日宣布拟全资收购网龙(00777.HK', '2013-07-17 11:35:08', '2013-07-17 17:20:30');
INSERT INTO `we_material` VALUES ('235', 'wxf42302be9b7152f8', 'zoz1HFDY1FCTuQ_5uE5Q281nFSJR8moSCAD-gKNbAAY', '微信游戏即将爆发？腾讯移动游戏平台低调试水', '', 'Via 腾讯科技\r\n \r\n昨日，首款基于腾讯移动游戏平台的手机游戏《天天连萌》发布了删档内测版，游戏引入了微', '2013-07-09 17:25:49', '2013-07-09 17:30:32');
INSERT INTO `we_material` VALUES ('236', 'wxf42302be9b7152f8', 'zoz1HFDY1FCTuQ_5uE5Q2-zlPXBmM5KGFcxc2vVIbnc', '打车App回应禁止加价：正在做软件方面对接', '', '7月2日消息，移动互联网变革大潮渗透到传统行业方方面面，打车软件作为一项移动互联网应用正深刻影响出租车行业，', '2013-07-02 18:19:56', '2013-07-02 18:21:49');
INSERT INTO `we_material` VALUES ('237', 'wxf42302be9b7152f8', 'zoz1HFDY1FCTuQ_5uE5Q2-o3YLPFy-ST1se9sK8qKSM', 'Juniper Networks：2013年移动端恶意软件增长614%', '', '转自：199IT\r\n \r\n在2012年3月到2013年3月之间，移动端的恶意软件增长率高达614%。截止调查', '2013-06-27 17:15:06', '2013-06-27 17:19:18');
INSERT INTO `we_material` VALUES ('238', 'wxf42302be9b7152f8', 'zoz1HFDY1FCTuQ_5uE5Q2-7gMZf5QWn4uGL1zdgeWAs', 'WhatsApp的另类生意经：绝不通过广告赚钱', '', '拒绝风投\r\n \r\n两位雅虎前工程师布莱恩·埃克顿(Brian Acton)和简·库姆(Jan Koum)每年', '2013-06-25 15:53:51', '2013-06-25 17:17:01');
INSERT INTO `we_material` VALUES ('239', 'wxf42302be9b7152f8', 'zoz1HFDY1FCTuQ_5uE5Q26OKRFJmn9goO6gGpn9WGU8', 'LG Display四季度将量产手机柔性显示屏', '', '北京时间6月20日凌晨消息，据英文版《韩国时报》(Korea Times)报道，为进一步巩固显示屏市场的领先', '2013-06-20 17:31:36', '2013-06-20 17:33:59');
INSERT INTO `we_material` VALUES ('240', 'wxf42302be9b7152f8', 'zoz1HFDY1FCTuQ_5uE5Q2xZg4xcF6meEcag1_M30qxk', '维络城教训：移动互联网冲垮线下优惠券模式', '', '从曾经的创业新锐、资本宠儿到被并购后的苦苦挣扎，维络城短短数年时间经历了过山车式的命运。\r\n \r\n今年2月维', '2013-06-18 17:34:20', '2013-06-18 17:39:53');
INSERT INTO `we_material` VALUES ('241', 'wxf42302be9b7152f8', 'zoz1HFDY1FCTuQ_5uE5Q227K-DqmGxfMZS-jYUW2I5o', '微信首次表态：公众平台不是营销工具', '', '6月5日下午消息，腾讯微信产品总监曾鸣今日与媒体沟通，首次公开解读微信公众平台的定位与发展问题。此外，曾鸣还', '2013-06-06 17:46:50', '2013-06-06 17:48:16');
INSERT INTO `we_material` VALUES ('242', 'wxf42302be9b7152f8', 'zoz1HFDY1FCTuQ_5uE5Q27LorbKvn6JOHz7qgjUx7bs', '中移动试水网络电话 迟到的微信竞争者', '', '面对微信等互联网业务的威胁，中国移动(0941.HK)在重构飞信的同时，亦在以另一种方式自我革命。\r\n\r\n6', '2013-06-04 17:58:50', '2013-06-04 18:02:48');
INSERT INTO `we_material` VALUES ('243', 'wxf42302be9b7152f8', 'zoz1HFDY1FCTuQ_5uE5Q28H9uinzTpXPvtbWG4621Us', '互联网女皇：移动设备仍有3-4倍的发展空间', '', '在2013年的总结和预言中，米克尔给出的最迅猛的信号是移动。“智能手机上的社交和沟通让美国用户感到，实时在线', '2013-05-30 17:43:36', '2013-05-30 17:45:02');
INSERT INTO `we_material` VALUES ('244', 'wxf42302be9b7152f8', 'zoz1HFDY1FCTuQ_5uE5Q29FUxpEbR6GyW-UDWK9How4', '盘点打车App市场：嘀嘀、摇摇、易打车列前三', '', '2013年 5月27日获得一份某VC对打车行业的调研报告，报告依据行业公开数据和该机构调研，从下载量、城市热', '2013-05-28 17:39:49', '2013-05-28 17:56:20');
INSERT INTO `we_material` VALUES ('245', 'wxf42302be9b7152f8', 'zoz1HFDY1FCTuQ_5uE5Q27B5mtgUcQ1ZqoPrVkrKdfU', 'MMA：预计美国移动广告市场在未来两年会增长2倍', '', '2012年，移动营销支出模快速增长。据MMA（Mobile Marketing Association）和哥', '2013-05-23 17:56:01', '2013-05-23 18:05:34');
INSERT INTO `we_material` VALUES ('246', 'wxf42302be9b7152f8', 'zoz1HFDY1FCTuQ_5uE5Q2yllFTShrkH3hTASoFf08VA', '梅耶尔收购Tumblr：数据广告战略提升 寄望少年派', '', '她看重的就是Tumblr 可以提升雅虎的广告收入，并让雅虎在消费者社交媒体市场上有更高的地位。', '2013-05-21 17:02:53', '2013-05-21 17:09:22');

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
) ENGINE=InnoDB AUTO_INCREMENT=235 DEFAULT CHARSET=utf8 COMMENT='自定义菜单表';

-- ----------------------------
-- Records of we_menu
-- ----------------------------
INSERT INTO `we_menu` VALUES ('53', '27', '1231', '123', 'show', '', '', '0', '0', '1', '2018-05-11 14:44:01', '2018-05-11 14:44:01');
INSERT INTO `we_menu` VALUES ('54', '27', '1231', '12443', 'show', '', '', '0', '0', '1', '2018-05-11 14:44:14', '2018-05-11 14:44:14');
INSERT INTO `we_menu` VALUES ('71', '27', '1231', '测试子菜单', 'view', '', 'http://www.baidu.com', '53', '0', '1', '2018-05-11 15:03:30', '2018-05-11 15:03:30');
INSERT INTO `we_menu` VALUES ('72', '27', '1231', '图文消息', 'media_id', '', '', '53', '0', '1', '2018-05-11 15:03:53', '2018-05-11 15:03:53');
INSERT INTO `we_menu` VALUES ('73', '27', '1231', '小程序', 'miniprogram', 'fdsfads', 'fdsfsfs', '53', '0', '1', '2018-05-11 15:04:50', '2018-05-11 15:04:50');
INSERT INTO `we_menu` VALUES ('105', '29', 'wx7ad4ce9789a311ea3', '顶级菜单', 'show', '', '', '0', '0', '1', '2018-05-11 16:46:37', '2018-05-11 16:46:37');
INSERT INTO `we_menu` VALUES ('106', '29', 'wx7ad4ce9789a311ea3', '百度一下', 'view', '', 'http://www.baidu.com', '105', '0', '1', '2018-05-11 16:46:53', '2018-05-11 16:46:53');
INSERT INTO `we_menu` VALUES ('107', '29', 'wx7ad4ce9789a311ea3', '百度两下', 'view', '', 'http://www.baidu.com', '105', '0', '1', '2018-05-11 16:47:33', '2018-05-11 16:47:33');
INSERT INTO `we_menu` VALUES ('182', '35', ' wxfede681f96a1c9a6', '123', 'show', '', '', '0', '0', '1', '2018-05-17 09:44:07', '2018-05-17 09:44:07');
INSERT INTO `we_menu` VALUES ('184', '0', 'wx7ad4ce9789a311ea', '消费', 'show', '', '', '0', '0', '1', '2018-05-17 13:44:24', '2018-05-17 13:44:24');
INSERT INTO `we_menu` VALUES ('185', '0', 'wx7ad4ce9789a311ea', '信用卡', 'view', '', 'https://mp.weixin.qq.com/mp/homepage?__biz=MzIwNTMzMDQyOQ==&hid=3&sn=aceac7d43b7fbacc9f59827ef749895e&scene=18&uin=&key=&devicetype=Windows+10&version=620502c8&lang=zh_CN&ascene=7&winzoom=1', '184', '0', '1', '2018-05-17 13:44:24', '2018-05-17 13:44:24');
INSERT INTO `we_menu` VALUES ('186', '0', 'wx7ad4ce9789a311ea', '消费避雷区', 'view', '', 'https://mp.weixin.qq.com/mp/homepage?__biz=MzIwNTMzMDQyOQ==&hid=4&sn=d1e7ff93317f3ec19ed2856b4bcc9261&scene=18&uin=&key=&devicetype=Windows+10&version=620502c8&lang=zh_CN&ascene=7&winzoom=1', '184', '90', '1', '2018-05-17 13:44:24', '2018-05-17 13:45:19');
INSERT INTO `we_menu` VALUES ('187', '0', 'wx7ad4ce9789a311ea', '会员卡权益', 'view', '', 'http://m.zwmedia.com.cn/vip/public/index.php', '184', '100', '1', '2018-05-17 13:44:24', '2018-05-17 13:45:10');
INSERT INTO `we_menu` VALUES ('188', '0', 'wx7ad4ce9789a311ea', '顶级菜', 'show', '', '', '0', '100', '1', '2018-05-17 13:44:24', '2018-05-17 15:08:27');
INSERT INTO `we_menu` VALUES ('189', '0', 'wx7ad4ce9789a311ea', '测试子菜单', 'view', '', 'http://www.baidu.com', '188', '0', '1', '2018-05-17 13:44:24', '2018-05-17 13:44:24');
INSERT INTO `we_menu` VALUES ('204', '35', ' wxfede681f96a1c9a6', '图文', 'media_id', 'H5策划，你知道你的用户正在想什么吗？', 'FfaXbaQsGS70LzSCGHZDMWCRZXm_1T0nPTc6hLzIXgU', '0', '1', '1', '2018-05-17 14:59:33', '2018-05-17 15:00:17');
INSERT INTO `we_menu` VALUES ('220', '0', 'wxf42302be9b7152f8', '案例赏', 'show', '', '', '0', '0', '1', '2018-05-17 16:23:22', '2018-05-17 16:23:22');
INSERT INTO `we_menu` VALUES ('221', '0', 'wxf42302be9b7152f8', '互动H5', 'view', '', 'http://m.zwmedia.com.cn/highlander0321', '220', '0', '1', '2018-05-17 16:23:22', '2018-05-17 16:23:22');
INSERT INTO `we_menu` VALUES ('222', '0', 'wxf42302be9b7152f8', '奇妙H5', 'view', '', 'http://m.zwmedia.com.cn/zx150925', '220', '0', '1', '2018-05-17 16:23:22', '2018-05-17 16:23:22');
INSERT INTO `we_menu` VALUES ('223', '0', 'wxf42302be9b7152f8', '酷炫H5', 'view', '', 'http://landingpage.hdtmedia.com/youyiku', '220', '0', '1', '2018-05-17 16:23:22', '2018-05-17 16:23:22');
INSERT INTO `we_menu` VALUES ('224', '0', 'wxf42302be9b7152f8', '掌握案例秀', 'media_id', '', 'PVEYnlT-wOoTU7NC_kIafeM8maG31Dwpn1Qg8CcfA00', '220', '0', '1', '2018-05-17 16:23:23', '2018-05-17 16:23:23');
INSERT INTO `we_menu` VALUES ('225', '0', 'wxf42302be9b7152f8', '行业案例赏', 'view', '', 'http://m.zwmedia.com.cn/Levin0514', '220', '0', '1', '2018-05-17 16:23:23', '2018-05-17 16:23:23');
INSERT INTO `we_menu` VALUES ('226', '0', 'wxf42302be9b7152f8', '掌握秀', 'show', '', '', '0', '0', '1', '2018-05-17 16:23:23', '2018-05-17 16:23:23');
INSERT INTO `we_menu` VALUES ('227', '0', 'wxf42302be9b7152f8', '掌握简介', 'view', '', 'http://vurl.cn/OGMyN', '226', '0', '1', '2018-05-17 16:23:23', '2018-05-17 16:23:23');
INSERT INTO `we_menu` VALUES ('228', '0', 'wxf42302be9b7152f8', '了解更多', 'view', '', 'http://www.zwmedia.com.cn/', '226', '0', '1', '2018-05-17 16:23:23', '2018-05-17 16:23:23');
INSERT INTO `we_menu` VALUES ('229', '0', 'wxf42302be9b7152f8', '测试子菜单', 'view', '', 'http://www.baidu.com', '226', '0', '1', '2018-05-17 16:23:23', '2018-05-17 16:23:23');
INSERT INTO `we_menu` VALUES ('230', '0', 'wxf42302be9b7152f8', '123', 'show', '', '', '0', '0', '1', '2018-05-17 16:23:23', '2018-05-17 16:23:23');
INSERT INTO `we_menu` VALUES ('231', '0', 'wxf42302be9b7152f8', '跳转小程序', 'miniprogram', '', 'http://www.baidu.com', '230', '0', '1', '2018-05-17 16:23:23', '2018-05-17 16:23:23');
INSERT INTO `we_menu` VALUES ('232', '0', 'wxf42302be9b7152f8', '社群商业', 'media_id', '', 'THQtp_Cmk9MLUuNsNe0R3_el62o_UGFfhaqJyrN88us', '230', '0', '1', '2018-05-17 16:23:23', '2018-05-17 16:23:23');
INSERT INTO `we_menu` VALUES ('233', '0', 'wxf42302be9b7152f8', 'wechat', 'media_id', '', 'zoz1HFDY1FCTuQ_5uE5Q227K-DqmGxfMZS-jYUW2I5o', '230', '0', '1', '2018-05-17 16:23:23', '2018-05-17 16:23:23');
INSERT INTO `we_menu` VALUES ('234', '12', 'wxf42302be9b7152f8', '123', 'media_id', '新媒体营销，这些渠道玩法你都做了吗？', 'fjXYanzKvnxn-F-BJ_OBsxaGD4TR19ZWC3hRGXeWaBg', '0', '0', '1', '2018-05-17 16:25:57', '2018-05-17 16:36:41');

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
  PRIMARY KEY (`id`),
  KEY `index_appid` (`appid`),
  KEY `index_uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='公众号配置信息表';

-- ----------------------------
-- Records of we_wechat_config
-- ----------------------------
INSERT INTO `we_wechat_config` VALUES ('12', '1,2', '掌握传媒', '12345', 'wxf42302be9b7152f8', 'fae546a19b3112151ed598ba1c293bfd', 'zwmediatoken', '124222', '1', '', '2018-05-02 10:33:34', '2018-05-17 15:11:47');
INSERT INTO `we_wechat_config` VALUES ('31', '3', 'new测试的公众号', 'gh_7557b6fe18eb', 'wx7ad4ce9789a311ea', '67083c9d2d66055bdea6a20b63edcb3c', 'songphper', '', '1', '', '2018-05-10 16:19:43', '2018-05-11 10:12:31');
INSERT INTO `we_wechat_config` VALUES ('33', '1', '无脸测试', 'gh_7557b6fe18eb', 'wx7ad4ce9789a311ea', '67083c9d2d66055bdea6a20b63edcb3c', 'songphper', '', '0', 'http://uat.zwmedia.com.cn/jiansheng/WechatDevApi/public/index.php/WLCS', '2018-05-14 16:17:54', '2018-05-17 15:11:47');
INSERT INTO `we_wechat_config` VALUES ('35', '1', '上头DOTA欢乐送', 'gh_73f3f4ffb18c', ' wxfede681f96a1c9a6', '8d7dbf7d2c37d91b047dce7b0f80c968', 'qwert', 'h3ulY8VjLY7Rt52oIARdncto8owsx77RoEIW3oY7Bw9', '0', 'http://uat.zwmedia.com.cn/jiansheng/WechatDevApi/public/index.php/STDOTAHLS', '2018-05-16 10:43:03', '2018-05-17 15:11:47');
