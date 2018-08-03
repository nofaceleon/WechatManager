/*
 Navicat Premium Data Transfer

 Source Server         : 测试服务器数据库
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : 139.224.0.198:3306
 Source Schema         : uatzsmp

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001

 Date: 03/08/2018 18:24:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for we_auto_reply
-- ----------------------------
DROP TABLE IF EXISTS `we_auto_reply`;
CREATE TABLE `we_auto_reply`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `reply` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '回复的内容',
  `msgtype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '消息类型',
  `eventtype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '时间类型',
  `appid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '所属的公众号appid',
  `status` tinyint(2) NULL DEFAULT 1,
  `qrinfo` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '带参数的二维码图片路径',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createtime` datetime(0) NULL DEFAULT NULL,
  `updatetime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_key_appid`(`keyword`, `appid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '自动回复配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of we_auto_reply
-- ----------------------------
INSERT INTO `we_auto_reply` VALUES (2, '你好', '你好啊', 'text', '1', 'wxf42302be9b7152f8', 1, '', NULL, '2018-05-21 16:02:05', '2018-05-21 16:02:05');
INSERT INTO `we_auto_reply` VALUES (3, 'hello', '欢迎扫码', 'text', '13', 'wxf42302be9b7152f8', 1, '{\"imgurl\":\"https:\\/\\/mp.weixin.qq.com\\/cgi-bin\\/showqrcode?ticket=gQE_7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyZk5wU0poczliRmUxZUNlM3hyY3kAAgQmfQJbAwSAUQEA\",\"qrtype\":1,\"expire\":\"1\"}', NULL, '2018-05-21 16:02:48', '2018-05-21 16:02:48');
INSERT INTO `we_auto_reply` VALUES (4, '', '欢迎关注掌握传媒', 'text', '11', 'wxf42302be9b7152f8', 1, '', NULL, '2018-05-21 16:31:49', '2018-05-21 16:31:49');
INSERT INTO `we_auto_reply` VALUES (5, '测试', '今天的测试', 'text', '1', 'wxf42302be9b7152f8', 1, '', NULL, '2018-05-21 16:58:43', '2018-05-21 16:58:43');
INSERT INTO `we_auto_reply` VALUES (6, '测试2', 'fdsfds', 'text', '1', 'wxf42302be9b7152f8', 1, '', NULL, '2018-05-21 16:59:39', '2018-05-21 16:59:39');
INSERT INTO `we_auto_reply` VALUES (11, '物流', '<a href=\"https://m.baidu.com/s?ie=utf-8&f=8&rsv_bp=1&tn=baidu&wd=123123\">点击查看物流信息</a>', 'text', '1', 'wx7ad4ce9789a311ea', 1, '', NULL, '2018-05-28 23:52:11', '2018-06-13 16:11:50');
INSERT INTO `we_auto_reply` VALUES (12, '自动', '自动回复', 'text', '1', 'wx7ad4ce9789a311ea', 1, '', NULL, '2018-05-29 11:39:03', '2018-05-29 11:39:03');
INSERT INTO `we_auto_reply` VALUES (14, '图片', 'fjXYanzKvnxn-F-BJ_OBs_GQP-ImVnQeAvSfOJoAPjE', 'image', '1', 'wxf42302be9b7152f8', 1, '', NULL, '2018-06-28 17:24:29', '2018-06-28 17:24:29');
INSERT INTO `we_auto_reply` VALUES (15, '1231', 'fjXYanzKvnxn-F-BJ_OBs38KszIoK3XZEO97QG7YcxM', 'image', '1', 'wxf42302be9b7152f8', 1, '', NULL, '2018-06-28 17:26:37', '2018-06-28 17:26:37');
INSERT INTO `we_auto_reply` VALUES (16, 'H5', '[{\"Title\":\"H5\\u7b56\\u5212\\uff0c\\u4f60\\u77e5\\u9053\\u4f60\\u7684\\u7528\\u6237\\u6b63\\u5728\\u60f3\\u4ec0\\u4e48\\u5417\\uff1f\",\"Description\":\"\\u4f5c\\u4e3aH5\\u7b56\\u5212\\uff0c\\u5728\\u8bbe\\u8ba1H5\\u4ea7\\u54c1\\u65f6\\u6211\\u4eec\\u7ecf\\u5e38\\u9700\\u8981\\u67e5\\u770b\\u5404\\u79cd\\u6848\\u4f8b\\uff0c\\u5c55\\u5f00\\u5404\\u79cd\\u8111\\u6d1e\\uff0c\\u751a\\u81f3\\u51fa\\u5404\\u79cd\\u65b9\\u6848A\\u3001\\u65b9\\u6848B\\u4ee5\\u4f5c\\u5907\\u9009\\u3002\",\"PicUrl\":\"http:\\/\\/mmbiz.qpic.cn\\/mmbiz\\/licqrJEEUslgeomGApkDEGIbn5fOY3sQMQNNic92rwKSDULx3BOCoBnElkGSWwDbK64QCyF1bJTRak7mpQudBbCw\\/0?wx_fmt=png\",\"Url\":\"http:\\/\\/mp.weixin.qq.com\\/s?__biz=MjM5NzY2OTg1Mg==&mid=405021276&idx=1&sn=dc297f68b384a6a2dc1bc6e44f13ac8f#rd\"}]', 'news', '1', 'wxf42302be9b7152f8', 1, '', 'H5策划，你知道你的用户正在想什么吗？', '2018-07-04 11:43:54', '2018-07-04 11:43:54');
INSERT INTO `we_auto_reply` VALUES (17, '图片', 'I4s8AEYZyUybFvJPqMolDPse6sdZlWdaONTYgIuf2DA', 'image', '1', 'wx7ad4ce9789a311ea', 1, '', NULL, '2018-07-04 12:00:07', '2018-07-04 12:00:07');
INSERT INTO `we_auto_reply` VALUES (18, '图文', '[{\"Title\":\"\\u4ece\\u5e7f\\u544a\\u5230\\u54c1\\u724c\\uff0c\\u7a76\\u7adf\\u6709\\u591a\\u8fdc\\uff1f\",\"Description\":\"\\u4ee5\\u53f2\\u4e3a\\u955c\\uff0c\\u53ef\\u4ee5\\u77e5\\u5174\\u66ff\\u3002\\u4e2d\\u56fd\\u4e92\\u8054\\u7f51\\uff0c\\u6ca7\\u6d77\\u6851\\u7530\\u3002\\u4eca\\u5929\\u5199\\u4e2a\\u7b80\\u5355\\u7684\\uff0c\\u9996\\u53d1\\u4e8e\\u77e5\\u4e4e\\uff0c\\u8fd9\\u91cc\\u589e\\u8865\\u4e86\\u4e00\\u4e9b\\u3002\\u6765\\u6e90\\uff1acaoz\\u7684\\u68a6\\u5453\",\"PicUrl\":\"http:\\/\\/mmbiz.qpic.cn\\/mmbiz\\/licqrJEEUslhtUXvQwf3ia7lfiaKPR1VyiciapnCoWpHibON5oIEnHgT2ed9iaL22l8wGcp3iblRWXApU2wzYo4GHx9AgQ\\/0?wx_fmt=jpeg\",\"Url\":\"http:\\/\\/mp.weixin.qq.com\\/s?__biz=MjM5NzY2OTg1Mg==&mid=403792026&idx=1&sn=f8f88831f2867731363bb35f831a5691#rd\"},{\"Title\":\"\\u79fb\\u52a8\\u5e7f\\u544a\\u5982\\u4f55\\u54c1\\u6548\\u5408\\u4e00\",\"Description\":\"\\u5728\\u8fc7\\u53bb\\u76842015\\u5e74\\u4e2d\\uff0c\\u6211\\u4eec\\u542c\\u8fc7\\u4e86\\u8fc7\\u591a\\u7684\\u8425\\u9500\\u65b0\\u8bcd\\u6c47\\u3001\\u65b0\\u6982\\u5ff5\\u3002\\u6709\\u4e9b\\u662f\\u771f\\u8d8b\\u52bf\\uff0c\\u6709\\u4e9b\\u5219\\u662f\\u7a7a\\u6982\\u5ff5\\u3002\\u5fd9\\u6d3b\",\"PicUrl\":\"http:\\/\\/mmbiz.qpic.cn\\/mmbiz\\/licqrJEEUslhtUXvQwf3ia7lfiaKPR1Vyicia968Zqk8hYkKXJBoiaS6vA1pibAjINCqlBgFbiaYLcxVjWJZUoFQ92A4kg\\/0?wx_fmt=jpeg\",\"Url\":\"http:\\/\\/mp.weixin.qq.com\\/s?__biz=MjM5NzY2OTg1Mg==&mid=403792026&idx=2&sn=e4749c52c875d431b9532ca92b00d2b1#rd\"}]', 'news', '1', 'wxf42302be9b7152f8', 1, '', '从广告到品牌，究竟有多远？', '2018-07-04 12:11:59', '2018-07-04 12:11:59');
INSERT INTO `we_auto_reply` VALUES (19, '太年轻', 'fjXYanzKvnxn-F-BJ_OBswGpmD1RhnUxxlxYOXtZf8o', 'image', '1', 'wxf42302be9b7152f8', 1, '', NULL, '2018-07-04 12:21:46', '2018-07-04 12:21:46');
INSERT INTO `we_auto_reply` VALUES (20, 'DEFAULT_REPLY', 'qwer', 'text', '1', 'wxf42302be9b7152f8', 1, '', NULL, '2018-07-04 13:24:24', '2018-07-04 13:24:24');
INSERT INTO `we_auto_reply` VALUES (21, 'young', 'fjXYanzKvnxn-F-BJ_OBswGpmD1RhnUxxlxYOXtZf8o', 'image', '13', 'wxf42302be9b7152f8', 1, '{\"imgurl\":\"https:\\/\\/mp.weixin.qq.com\\/cgi-bin\\/showqrcode?ticket=gQFr7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyampnU0pRczliRmUxMHQ2X3hyY2kAAgQdYzxbAwQAowIA\",\"qrtype\":1,\"expire\":\"2\"}', NULL, '2018-07-04 14:03:09', '2018-07-04 14:03:09');
INSERT INTO `we_auto_reply` VALUES (22, '微信', '[{\"Title\":\"\\u5fae\\u4fe1\\u516c\\u4f17\\u53f7\\u5e7f\\u544a\\u6b63\\u8fdb\\u884c\\u6700\\u7ec8\\u6d4b\\u8bd5 \\u8ba4\\u8bc1\\u4e0d\\u518d\\u662f\\u95e8\\u69db\",\"Description\":\"1. \\u5fae\\u4fe1\\u516c\\u4f17\\u53f7\\u4e5f\\u53ef\\u4ee5\\u81ea\\u5df1\\u9009\\u62e9\\u5e7f\\u544a\\u4e3b\\u3002 \\u5305\\u62ec\\u4e24\\u4e2a\\u73af\\u8282\\uff1a\\u9009\\u53d610\\u7c7b\\u7ec6\\u5206\\u884c\\u4e1a\\u5e7f\\u544a\\uff1b\\u4ee5\\u53ca\\u5bf9\\u5e7f\\u544a\\u4e3b\\u8fdb\\u884c\\u5b9a\\u5411\\u5c4f\\u853d\\u3002\\u5e7f\\u70b9\",\"PicUrl\":\"http:\\/\\/mmbiz.qpic.cn\\/mmbiz\\/licqrJEEUslgOWfX3CcOsf1ekszapJQicmHCB71ibclfyzcNmnEG6gYY2HSjGyyFlc7A8Kd8fiaE6Y5M28fhTaicyQA\\/0\",\"Url\":\"http:\\/\\/mp.weixin.qq.com\\/s?__biz=MjM5NzY2OTg1Mg==&mid=200307324&idx=1&sn=47a13d110f69d649da1786b7585d89a8#rd\"},{\"Title\":\"\\u79fb\\u52a8\\u5e7f\\u544a\\u4e1a\\u4e4d\\u6696\\u8fd8\\u5bd2\",\"Description\":\"\\u79fb\\u52a8\\u4e92\\u8054\\u5e7f\\u544a\\u70ed\\u5f97\\u53d1\\u70eb\\u3002\\u4e2d\\u56fd\\u624b\\u673a\\u7f51\\u7edc\\u7528\\u6237\\u89c4\\u6a21\\u57282013\\u5e74\\u8fbe\\u52305\\u4ebf\\u3002\\u6362\\u53e5\\u8bdd\\u8bf4\\uff0c5\\u4ebf\\u5757\\u5f62\\u5f71\\u76f8\\u968f\\u7684\\u5e7f\\u544a\\u5c4f\\u5e55\\u8db3\\u4ee5\\u5f15\\u7206\\u5e7f\",\"PicUrl\":\"http:\\/\\/mmbiz.qpic.cn\\/mmbiz\\/licqrJEEUslgOWfX3CcOsf1ekszapJQicmgYQcHpJwT8IY5ucts1xAfC1yvhvQPRdwolOjQG11Vttk5MZknm3BcA\\/0\",\"Url\":\"http:\\/\\/mp.weixin.qq.com\\/s?__biz=MjM5NzY2OTg1Mg==&mid=200307324&idx=2&sn=1431cd28e385bd01d4bb3d59c24e05a4#rd\"},{\"Title\":\"Beats\\u8033\\u673a\\u906dFIFA\\u5c01\\u6740\\uff1a\\u98ce\\u5934\\u4e0d\\u51cf\\u53cd\\u53d7\\u70ed\\u6367\",\"Description\":\"\\u5317\\u4eac\\u65f6\\u95f46\\u670819\\u65e5\\u65e9\\u95f4\\u6d88\\u606f\\uff0c\\u56fd\\u9645\\u8db3\\u8054(FIFA)\\u5df2\\u56e0\\u6388\\u6743\\u7406\\u7531\\u800c\\u7981\\u6b62Beats\\u8033\\u673a\\u8fdb\\u5165\\u8d5b\\u573a\\uff0c\\u4f46\\u5bf9\\u4e8e\\u672c\\u5c4a\\u4e16\\u754c\\u676f\\u7684\",\"PicUrl\":\"http:\\/\\/mmbiz.qpic.cn\\/mmbiz\\/licqrJEEUslgOWfX3CcOsf1ekszapJQicm52RLT0ibgBROzoWfeeI1ELf5WiajlbeUeeBA1Iw40rTNl9ROvADyk4tA\\/0\",\"Url\":\"http:\\/\\/mp.weixin.qq.com\\/s?__biz=MjM5NzY2OTg1Mg==&mid=200307324&idx=3&sn=51f97a9d576737d4388a17ec1754fe0b#rd\"}]', 'news', '1', 'wxf42302be9b7152f8', 1, '', '微信公众号广告正进行最终测试 认证不再是门槛', '2018-07-05 09:58:49', '2018-07-05 09:58:49');
INSERT INTO `we_auto_reply` VALUES (23, '123', '<a href=\"http://www.baidu.com\" style=\"color:red\">test</a>', 'text', '1', 'wxf42302be9b7152f8', 1, '', NULL, '2018-07-25 12:25:52', '2018-07-25 12:25:52');
INSERT INTO `we_auto_reply` VALUES (24, '客服', '1.点我查询物流\n2.直接回复信息', 'text', '1', 'wx7ad4ce9789a311ea', 1, '', NULL, '2018-08-02 10:16:37', '2018-08-02 10:16:37');
INSERT INTO `we_auto_reply` VALUES (25, '签到', 'I4s8AEYZyUybFvJPqMolDASo1JyjBJwoP0i3xn9Vg0g', 'image', '1', 'wx7ad4ce9789a311ea', 1, '', NULL, '2018-08-03 17:18:00', '2018-08-03 17:18:00');

-- ----------------------------
-- Table structure for we_menu
-- ----------------------------
DROP TABLE IF EXISTS `we_menu`;
CREATE TABLE `we_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT 0 COMMENT '所属的配置ID',
  `appid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '所属的公众号',
  `buttonname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '按钮名称',
  `type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '类型',
  `key` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '关键字',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '链接',
  `parentid` int(11) NULL DEFAULT 0 COMMENT '父ID',
  `sort` int(20) NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(2) NULL DEFAULT 1 COMMENT '是否启用1表示启用0表示禁用',
  `createtime` datetime(0) NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '创建时间',
  `updatetime` datetime(0) NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_appid`(`appid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 83 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '自定义菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of we_menu
-- ----------------------------
INSERT INTO `we_menu` VALUES (63, 0, 'wxf42302be9b7152f8', '案例赏', 'show', '', '', 0, 0, 1, '2018-05-22 11:22:09', '2018-05-22 11:22:09');
INSERT INTO `we_menu` VALUES (64, 0, 'wxf42302be9b7152f8', '互动H5', 'view', '', 'http://m.zwmedia.com.cn/highlander0321', 63, 0, 1, '2018-05-22 11:22:09', '2018-05-22 11:22:09');
INSERT INTO `we_menu` VALUES (65, 0, 'wxf42302be9b7152f8', '奇妙H5', 'view', '', 'http://m.zwmedia.com.cn/zx150925', 63, 0, 1, '2018-05-22 11:22:09', '2018-05-22 11:22:09');
INSERT INTO `we_menu` VALUES (66, 0, 'wxf42302be9b7152f8', '酷炫H5', 'view', '', 'http://landingpage.hdtmedia.com/youyiku', 63, 0, 1, '2018-05-22 11:22:09', '2018-05-22 11:22:09');
INSERT INTO `we_menu` VALUES (67, 0, 'wxf42302be9b7152f8', '掌握案例秀', 'media_id', '', 'PVEYnlT-wOoTU7NC_kIafeM8maG31Dwpn1Qg8CcfA00', 63, 0, 1, '2018-05-22 11:22:09', '2018-05-22 11:22:09');
INSERT INTO `we_menu` VALUES (68, 0, 'wxf42302be9b7152f8', '行业案例赏', 'view', '', 'http://m.zwmedia.com.cn/Levin0514', 63, 0, 1, '2018-05-22 11:22:09', '2018-05-22 11:22:09');
INSERT INTO `we_menu` VALUES (69, 0, 'wxf42302be9b7152f8', '掌握秀', 'show', '', '', 0, 0, 1, '2018-05-22 11:22:09', '2018-05-22 11:22:09');
INSERT INTO `we_menu` VALUES (70, 0, 'wxf42302be9b7152f8', '掌握简介', 'view', '', 'http://vurl.cn/OGMyN', 69, 0, 1, '2018-05-22 11:22:09', '2018-05-22 11:22:09');
INSERT INTO `we_menu` VALUES (71, 0, 'wxf42302be9b7152f8', '了解更多', 'view', '', 'http://www.zwmedia.com.cn/', 69, 0, 1, '2018-05-22 11:22:09', '2018-05-22 11:22:09');
INSERT INTO `we_menu` VALUES (72, 0, 'wxf42302be9b7152f8', '测试子菜单', 'view', '', 'http://www.baidu.com', 69, 0, 1, '2018-05-22 11:22:09', '2018-05-22 11:22:09');
INSERT INTO `we_menu` VALUES (73, 0, 'wxf42302be9b7152f8', '123', 'show', '', '', 0, 0, 1, '2018-05-22 11:22:09', '2018-05-22 11:22:09');
INSERT INTO `we_menu` VALUES (74, 0, 'wxf42302be9b7152f8', '个人中心', 'miniprogram', 'wxe2a1b46a45d59a20', 'http://uat.zwmedia.com.cn/wxzspfse/index.php/Home/SignGame/index.html?platcode=MSXYK;pages/couponList/couponList', 73, 0, 1, '2018-05-22 11:22:09', '2018-05-22 11:22:09');
INSERT INTO `we_menu` VALUES (75, 0, 'wxf42302be9b7152f8', '社群商业', 'media_id', '怎样写出转发暴增的社交文案？', 'fjXYanzKvnxn-F-BJ_OBs90HZGRvKIe7Np9UD0vfG7s', 73, 0, 1, '2018-05-22 11:22:09', '2018-05-22 11:28:50');
INSERT INTO `we_menu` VALUES (76, 0, 'wxf42302be9b7152f8', 'wechat', 'media_id', '', 'zoz1HFDY1FCTuQ_5uE5Q227K-DqmGxfMZS-jYUW2I5o', 73, 0, 1, '2018-05-22 11:22:09', '2018-05-22 11:22:09');
INSERT INTO `we_menu` VALUES (77, 0, 'wx7ad4ce9789a311ea', 'I❤上海', 'show', '', '', 0, 0, 1, '2018-06-27 22:30:56', '2018-06-27 22:30:56');
INSERT INTO `we_menu` VALUES (78, 0, 'wx7ad4ce9789a311ea', '百度一下', 'view', '', 'http://www.baidu.com', 77, 0, 1, '2018-06-27 22:30:56', '2018-06-27 23:43:50');
INSERT INTO `we_menu` VALUES (79, 0, 'wx7ad4ce9789a311ea', '消费', 'show', '', '', 0, 0, 1, '2018-06-27 22:30:56', '2018-06-27 22:30:56');
INSERT INTO `we_menu` VALUES (80, 0, 'wx7ad4ce9789a311ea', '会员卡权益', 'view', '', 'http://m.zwmedia.com.cn/vip/public/index.php', 79, 0, 1, '2018-06-27 22:30:56', '2018-06-27 22:30:56');
INSERT INTO `we_menu` VALUES (81, 0, 'wx7ad4ce9789a311ea', '消费避雷区', 'view', '', 'https://mp.weixin.qq.com/mp/homepage?__biz=MzIwNTMzMDQyOQ==&hid=4&sn=d1e7ff93317f3ec19ed2856b4bcc9261&scene=18&uin=&key=&devicetype=Windows+10&version=620502c8&lang=zh_CN&ascene=7&winzoom=1', 79, 0, 1, '2018-06-27 22:30:56', '2018-06-27 22:30:56');
INSERT INTO `we_menu` VALUES (82, 0, 'wx7ad4ce9789a311ea', '信用卡', 'view', '', 'https://mp.weixin.qq.com/mp/homepage?__biz=MzIwNTMzMDQyOQ==&hid=3&sn=aceac7d43b7fbacc9f59827ef749895e&scene=18&uin=&key=&devicetype=Windows+10&version=620502c8&lang=zh_CN&ascene=7&winzoom=1', 79, 0, 1, '2018-06-27 22:30:56', '2018-06-27 22:30:56');

-- ----------------------------
-- Table structure for we_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `we_auth_group`;
CREATE TABLE `we_auth_group`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `rules` char(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '用户拥有的权限',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户组的权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of we_auth_group
-- ----------------------------
INSERT INTO `we_auth_group` VALUES (1, '超级管理员', 1, '1,2,3,4,5,6,7,8,9,10,11,12,13');
INSERT INTO `we_auth_group` VALUES (2, '普通用户', 1, '0');

-- ----------------------------
-- Table structure for we_tag
-- ----------------------------
DROP TABLE IF EXISTS `we_tag`;
CREATE TABLE `we_tag`  (
  `id` int(11) NOT NULL,
  `tag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户标签',
  `createtime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户标签表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for we_material
-- ----------------------------
DROP TABLE IF EXISTS `we_material`;
CREATE TABLE `we_material`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '所属的公众号',
  `media_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '素材ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '标题',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '作者',
  `digest` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '简介',
  `createtime` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `updatetime` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '微信素材' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for we_event
-- ----------------------------
DROP TABLE IF EXISTS `we_event`;
CREATE TABLE `we_event`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `status` tinyint(2) NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '微信事件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of we_event
-- ----------------------------
INSERT INTO `we_event` VALUES (1, 'text', '文本回复', 1);
INSERT INTO `we_event` VALUES (2, 'image', '图片', 1);
INSERT INTO `we_event` VALUES (3, 'location', '', 1);
INSERT INTO `we_event` VALUES (4, 'link', '', 1);
INSERT INTO `we_event` VALUES (5, 'event', '', 1);
INSERT INTO `we_event` VALUES (6, 'music', '', 1);
INSERT INTO `we_event` VALUES (7, 'news', '图文消息', 1);
INSERT INTO `we_event` VALUES (8, 'voice', '音频消息', 1);
INSERT INTO `we_event` VALUES (9, 'video', '视频消息', 1);
INSERT INTO `we_event` VALUES (10, 'shortvideo', '短视频', 1);
INSERT INTO `we_event` VALUES (11, 'subscribe', '用户关注', 1);
INSERT INTO `we_event` VALUES (12, 'unsubscribe', '取消关注', 1);
INSERT INTO `we_event` VALUES (13, 'SCAN', '用户扫码', 1);
INSERT INTO `we_event` VALUES (14, 'LOCATION', '', 1);
INSERT INTO `we_event` VALUES (15, 'VIEW', '', 1);
INSERT INTO `we_event` VALUES (16, 'CLICK', '', 1);
INSERT INTO `we_event` VALUES (17, 'scancode_push', '', 1);
INSERT INTO `we_event` VALUES (18, 'scancode_waitmsg', '', 1);
INSERT INTO `we_event` VALUES (19, 'pic_sysphoto', '', 1);
INSERT INTO `we_event` VALUES (20, 'pic_photo_or_album', '', 1);
INSERT INTO `we_event` VALUES (21, 'pic_weixin', '', 1);
INSERT INTO `we_event` VALUES (22, 'location_select', '', 1);
INSERT INTO `we_event` VALUES (23, 'MASSSENDJOBFINISH', '', 1);
INSERT INTO `we_event` VALUES (24, 'TEMPLATESENDJOBFINISH', '', 1);
INSERT INTO `we_event` VALUES (25, 'kfcreatesession', '', 1);
INSERT INTO `we_event` VALUES (26, 'kfclosesession', '', 1);
INSERT INTO `we_event` VALUES (27, 'kfswitchsession', '', 1);
INSERT INTO `we_event` VALUES (28, 'card_pass_check', '', 1);
INSERT INTO `we_event` VALUES (29, 'card_not_pass_check', '', 1);
INSERT INTO `we_event` VALUES (30, 'user_get_card', '', 1);
INSERT INTO `we_event` VALUES (31, 'user_del_card', '', 1);
INSERT INTO `we_event` VALUES (32, 'merchant_order', '', 1);

-- ----------------------------
-- Table structure for we_user
-- ----------------------------
DROP TABLE IF EXISTS `we_user`;
CREATE TABLE `we_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '' COMMENT '密码',
  `createtime` datetime(0) NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '创建时间',
  `updatetime` datetime(0) NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '微信管理后台用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of we_user
-- ----------------------------
INSERT INTO `we_user` VALUES (1, 'zwcm', '47767678c386e73854d2b8edc2b179ccef00d43e', '1900-01-01 00:00:00', '2018-05-18 16:30:36');
INSERT INTO `we_user` VALUES (2, 'mrsong', 'ccf747447e4a6a98f07d211abd414c2892af5d76', '2018-05-23 15:53:09', '2018-05-23 15:53:09');

-- ----------------------------
-- Table structure for we_img_material
-- ----------------------------
DROP TABLE IF EXISTS `we_img_material`;
CREATE TABLE `we_img_material`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公众号的appid',
  `media_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `local_imgurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '本地图片路径',
  `weixin_imgurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信图片路径',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '图片素材库' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of we_img_material
-- ----------------------------
INSERT INTO `we_img_material` VALUES (1, 'wx7ad4ce9789a311ea', 'I4s8AEYZyUybFvJPqMolDPse6sdZlWdaONTYgIuf2DA', '20180704/422a126f74a760f8e435fccd90949de2.jpg', 'http://mmbiz.qpic.cn/mmbiz_jpg/P0PeU4K1oeT8fTUsF8XjJahFo50GdfNBjlW6cOcbdTBuIA0e8Hq5ZMpiaIagqXc0oel0ax3MOA1NgEtTbYiacIqg/0?wx_fmt=jpeg');
INSERT INTO `we_img_material` VALUES (2, 'wxf42302be9b7152f8', 'fjXYanzKvnxn-F-BJ_OBswGpmD1RhnUxxlxYOXtZf8o', '20180704/8bc14d8abf951102572ac6456336f6b9.jpg', 'http://mmbiz.qpic.cn/mmbiz_jpg/licqrJEEUslg8J6aMzy1ibPEK4TqzpvRc0wcJk4PkMXkcl7rm2nVvjiakarrgWAVibicU2icbn1vEAJtv8oJd4NHibJLw/0?wx_fmt=jpeg');
INSERT INTO `we_img_material` VALUES (3, 'wx7ad4ce9789a311ea', 'I4s8AEYZyUybFvJPqMolDASo1JyjBJwoP0i3xn9Vg0g', '20180803\\29e0bde2e27aa9e1c376ce9f16d87167.png', 'http://mmbiz.qpic.cn/mmbiz_png/P0PeU4K1oeTZvxmALFY30ozAK5tXxdRXyUMfDqGo6t6IYfdZzufOBkFKpkrOYJNVuRicJb1QczAIByXUEb0MX3w/0?wx_fmt=png');
INSERT INTO `we_img_material` VALUES (4, 'wx7ad4ce9789a311ea', 'I4s8AEYZyUybFvJPqMolDAm3XF2iV4h5HuaeuhAMsek', '20180803\\f0efd7c906ffcc19b1d7ff5adbd6e746.png', 'http://mmbiz.qpic.cn/mmbiz_png/P0PeU4K1oeTZvxmALFY30ozAK5tXxdRXj8UCv01aQcFuAoXLs58Ovibdh1FIvqghKndDEuTrxYuXNLnrjEh35Ug/0?wx_fmt=png');
INSERT INTO `we_img_material` VALUES (5, 'wx7ad4ce9789a311ea', 'I4s8AEYZyUybFvJPqMolDHD8y7ZfikwmfsImsjElREU', '20180803\\b5bf4d3f2ec74f6d4bc0dc5578e899c9.jpg', 'http://mmbiz.qpic.cn/mmbiz_jpg/P0PeU4K1oeTZvxmALFY30ozAK5tXxdRX1icGkqcAibLIQfr5Bw3aHrVibpMVzeB02J33A2hNjWpeeibTTDmOW4zKBA/0?wx_fmt=jpeg');

-- ----------------------------
-- Table structure for we_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `we_auth_rule`;
CREATE TABLE `we_auth_rule`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` char(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `title` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `condition` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限规则表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of we_auth_rule
-- ----------------------------
INSERT INTO `we_auth_rule` VALUES (1, 'index/Config/updateConfig', '修改公众号配置', 1, 1, '');
INSERT INTO `we_auth_rule` VALUES (2, 'index/Config/addConfig', '添加公众号配置', 1, 1, '');
INSERT INTO `we_auth_rule` VALUES (3, 'index/Config/delConfig', '删除公众号配置', 1, 1, '');
INSERT INTO `we_auth_rule` VALUES (4, 'index/Menu/addMenu', '添加自定义菜单', 1, 1, '');
INSERT INTO `we_auth_rule` VALUES (5, 'index/Menu/editMenu', '编辑自定义菜单', 1, 1, '');
INSERT INTO `we_auth_rule` VALUES (6, 'index/Menu/delMenu', '删除自定义菜单', 1, 1, '');
INSERT INTO `we_auth_rule` VALUES (7, 'index/Wechat/createMenu', '推送自定义菜单', 1, 1, '');
INSERT INTO `we_auth_rule` VALUES (8, 'index/Wechat/getMenu', '获取自定义菜单', 1, 1, '');
INSERT INTO `we_auth_rule` VALUES (9, 'index/Autoreply/delReply', '删除自动回复', 1, 1, '');
INSERT INTO `we_auth_rule` VALUES (10, 'index/Autoreply/addReply', '添加自动回复', 1, 1, '');
INSERT INTO `we_auth_rule` VALUES (11, 'index/Autoreply/getQrcode', '生成二维码', 1, 1, '');
INSERT INTO `we_auth_rule` VALUES (12, 'index/Autoreply/editReply', '编辑自动回复', 1, 1, '');
INSERT INTO `we_auth_rule` VALUES (13, 'index/Userauth', '权限管理', 1, 1, '');

-- ----------------------------
-- Table structure for we_log_old
-- ----------------------------
DROP TABLE IF EXISTS `we_log_old`;
CREATE TABLE `we_log_old`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `uid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `user_action` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `api_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `createtime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '平台日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of we_log_old
-- ----------------------------
INSERT INTO `we_log_old` VALUES (1, '', '', '用户登录', 'Login/userLogin', '登录成功', 'zwcm登录', '2018-05-20 22:51:46');
INSERT INTO `we_log_old` VALUES (2, '', '', '用户登录', 'Login/userLogin', '登录成功', 'zwcm登录', '2018-05-20 22:52:25');
INSERT INTO `we_log_old` VALUES (3, '', '', '用户登录', 'Login/userLogin', '登录成功', 'zwcm登录', '2018-05-21 15:52:11');
INSERT INTO `we_log_old` VALUES (4, 'wxf42302be9b7152f8', '1', '公众号配置修改', 'Config/updateConfig', '修改成功', '{\"name\":\"\\u638c\\u63e1\\u4f20\\u5a923\",\"id\":\"3\",\"wechatid\":\"gh_2fcf480ac2ac\",\"appid\":\"wxf42302be9b7152f8\",\"appsecret\":\"fae546a19b3112151ed598ba1c293bfd\",\"token\":\"zwmediatoken\",\"encodingaeskey\":\"\",\"uid\":\"1\",\"updatetime\":\"2018-05-21 16:59:24\"}', '2018-05-21 16:59:24');
INSERT INTO `we_log_old` VALUES (5, 'wxf42302be9b7152f8', '1', '添加自动回复', 'Autoreply/addReply', '添加成功', '', '2018-05-21 16:59:39');
INSERT INTO `we_log_old` VALUES (6, 'wxf42302be9b7152f8', '1', '公众号配置修改', 'Config/updateConfig', '修改成功', '{\"name\":\"\\u638c\\u63e1\\u4f20\\u5a92\",\"id\":\"3\",\"wechatid\":\"gh_2fcf480ac2ac\",\"appid\":\"wxf42302be9b7152f8\",\"appsecret\":\"fae546a19b3112151ed598ba1c293bfd\",\"token\":\"zwmediatoken\",\"encodingaeskey\":\"\",\"uid\":\"1\",\"updatetime\":\"2018-05-21 16:59:54\"}', '2018-05-21 16:59:54');
INSERT INTO `we_log_old` VALUES (7, '', '', '用户登录', 'Login/userLogin', '登录成功', 'zwcm登录', '2018-05-22 10:37:16');
INSERT INTO `we_log_old` VALUES (8, '', '', '用户登录', 'Login/userLogin', '登录成功', 'zwcm登录', '2018-05-22 10:41:07');
INSERT INTO `we_log_old` VALUES (9, 'wxf42302be9b7152f8', '1', '添加自动回复', 'Autoreply/addReply', '添加成功', '', '2018-05-22 10:41:32');
INSERT INTO `we_log_old` VALUES (10, 'wxf42302be9b7152f8', '1', '删除自动回复', 'Autoreply/delReply', '删除成功', '', '2018-05-22 10:42:45');
INSERT INTO `we_log_old` VALUES (11, 'wxf42302be9b7152f8', '1', '添加公众号', 'Config/addConfig', '添加成功', '{\"name\":\"\\u6d4b\\u8bd5\\u8d26\\u53f7\",\"wechatid\":\"gh_7557b6fe18eb\",\"appid\":\"wx7ad4ce9789a311ea\",\"appsecret\":\"67083c9d2d66055bdea6a20b63edcb3c\",\"token\":\"songphper\",\"encodingaeskey\":\"\",\"status\":0,\"uid\":\"1\",\"createtime\":\"2018-05-22 10:44:53\",\"updatetime\":\"2018-05-22 10:44:53\",\"url\":\"http:\\/\\/uat.zwmedia.com.cn\\/jiansheng\\/WechatDevApi\\/public\\/index.php\\/CSZH\"}', '2018-05-22 10:44:53');
INSERT INTO `we_log_old` VALUES (12, '', '', '用户登录', 'Login/userLogin', '登录成功', 'zwcm登录', '2018-05-22 10:59:13');
INSERT INTO `we_log_old` VALUES (13, 'wx7ad4ce9789a311ea', '1', '删除公众号配置', 'Config/delConfig', '删除成功', '', '2018-05-22 11:04:35');
INSERT INTO `we_log_old` VALUES (14, 'wx7ad4ce9789a311ea', '1', '删除公众号配置', 'Config/delConfig', '删除成功', '', '2018-05-22 11:04:37');
INSERT INTO `we_log_old` VALUES (15, '', '', '用户登录', 'Login/userLogin', '登录成功', 'zwcm登录', '2018-05-22 11:17:55');
INSERT INTO `we_log_old` VALUES (16, 'wxf42302be9b7152f8', '1', '推送菜单', 'Wechat/createMenu', '推送成功', '', '2018-05-22 11:21:48');
INSERT INTO `we_log_old` VALUES (17, 'wxf42302be9b7152f8', '1', '编辑菜单', 'Menu/editMenu', '修改成功', '{\"buttonname\":\"\\u793e\\u7fa4\\u5546\\u4e1a\",\"sort\":\"0\",\"status\":1,\"parentid\":\"73\",\"id\":\"75\",\"type\":\"media_id\",\"url\":\"fjXYanzKvnxn-F-BJ_OBs90HZGRvKIe7Np9UD0vfG7s\",\"key\":\"\\u600e\\u6837\\u5199\\u51fa\\u8f6c\\u53d1\\u66b4\\u589e\\u7684\\u793e\\u4ea4\\u6587\\u6848\\uff1f\",\"updatetime\":\"2018-05-22 11:28:39\"}', '2018-05-22 11:28:39');
INSERT INTO `we_log_old` VALUES (18, 'wxf42302be9b7152f8', '1', '编辑菜单', 'Menu/editMenu', '修改成功', '{\"buttonname\":\"\\u793e\\u7fa4\\u5546\\u4e1a\",\"sort\":\"0\",\"status\":1,\"parentid\":\"73\",\"id\":\"75\",\"type\":\"media_id\",\"key\":\"\\u600e\\u6837\\u5199\\u51fa\\u8f6c\\u53d1\\u66b4\\u589e\\u7684\\u793e\\u4ea4\\u6587\\u6848\\uff1f\",\"updatetime\":\"2018-05-22 11:28:50\"}', '2018-05-22 11:28:50');
INSERT INTO `we_log_old` VALUES (19, 'wxf42302be9b7152f8', '1', '推送菜单', 'Wechat/createMenu', '推送成功', '', '2018-05-22 11:29:39');
INSERT INTO `we_log_old` VALUES (20, 'wxf42302be9b7152f8', '1', '添加公众号', 'Config/addConfig', '添加成功', '{\"name\":\"\\u6d4b\\u8bd5\\u516c\\u4f17\\u53f7\",\"wechatid\":\"gh_7557b6fe18eb\",\"appid\":\"wx7ad4ce9789a311ea\",\"appsecret\":\"67083c9d2d66055bdea6a20b63edcb3c\",\"token\":\"songphper\",\"encodingaeskey\":\"\",\"status\":0,\"uid\":\"1\",\"createtime\":\"2018-05-22 11:32:53\",\"updatetime\":\"2018-05-22 11:32:53\",\"url\":\"http:\\/\\/uat.zwmedia.com.cn\\/jiansheng\\/WechatDevApi\\/public\\/index.php\\/CSGZH\"}', '2018-05-22 11:32:53');
INSERT INTO `we_log_old` VALUES (21, '', '', '用户登录', 'Login/userLogin', '登录成功', 'zwcm登录', '2018-05-22 11:35:33');
INSERT INTO `we_log_old` VALUES (22, '', '', '用户登录', 'Login/userLogin', '登录成功', 'zwcm登录', '2018-05-22 11:37:53');
INSERT INTO `we_log_old` VALUES (23, 'wx7ad4ce9789a311ea', '1', '添加自动回复', 'Autoreply/addReply', '添加成功', '', '2018-05-22 11:40:06');
INSERT INTO `we_log_old` VALUES (24, '', '', '用户登录', 'Login/userLogin', '登录成功', 'zwcm登录', '2018-05-22 14:30:32');
INSERT INTO `we_log_old` VALUES (25, '', '', '用户登录', 'Login/userLogin', '登录成功', 'zwcm登录', '2018-05-22 15:08:15');
INSERT INTO `we_log_old` VALUES (26, '', '', '用户登录', 'Login/userLogin', '登录成功', 'zwcm登录', '2018-05-23 10:20:56');
INSERT INTO `we_log_old` VALUES (27, '', '', '用户登录', 'Login/userLogin', '登录成功', 'zwcm登录', '2018-05-23 14:11:15');
INSERT INTO `we_log_old` VALUES (28, 'wx7ad4ce9789a311ea', '1', '添加自动回复', 'Autoreply/addReply', '添加成功', '', '2018-05-23 14:12:00');
INSERT INTO `we_log_old` VALUES (29, 'wx7ad4ce9789a311ea', '1', '删除自动回复', 'Autoreply/delReply', '删除成功', '', '2018-05-23 14:29:53');
INSERT INTO `we_log_old` VALUES (30, '', '', '用户登录', 'Login/userLogin', '登录成功', 'zwcm登录', '2018-05-23 15:52:30');
INSERT INTO `we_log_old` VALUES (31, '', '', '用户登录', 'Login/userLogin', '登录成功', 'mrsong登录', '2018-05-23 15:53:19');
INSERT INTO `we_log_old` VALUES (32, '', '', '用户登录', 'Login/userLogin', '登录成功', 'zwcm登录', '2018-05-23 15:59:43');
INSERT INTO `we_log_old` VALUES (33, '', '', '用户登录', 'Login/userLogin', '登录成功', 'zwcm登录', '2018-05-28 11:34:52');

-- ----------------------------
-- Table structure for we_template_pushlog
-- ----------------------------
DROP TABLE IF EXISTS `we_template_pushlog`;
CREATE TABLE `we_template_pushlog`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NULL DEFAULT NULL COMMENT '所属用户ID',
  `wechatappid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公众号appid',
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `template_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '推送使用的模板ID',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '推送的具体内容',
  `senduser` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '接收此模板消息的人的OPENID',
  `sendtime` datetime(0) NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '推送时间',
  `createtime` datetime(0) NOT NULL DEFAULT '1900-01-01 00:00:00',
  `updatetime` datetime(0) NOT NULL DEFAULT '1900-01-01 00:00:00',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '推送详情',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '模板消息推送日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for we_template
-- ----------------------------
DROP TABLE IF EXISTS `we_template`;
CREATE TABLE `we_template`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '所属公众号appid',
  `template_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模板ID',
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模板标题',
  `primary_industry` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模板所属行业的一级行业',
  `deputy_industry` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模板所属行业的二级行业',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模板内容',
  `example` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模板示例',
  `createtime` datetime(0) NOT NULL DEFAULT '1900-01-01 00:00:00',
  `updatetime` datetime(0) NOT NULL DEFAULT '1900-01-01 00:00:00',
  `status` tinyint(2) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '模板消息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for we_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `we_auth_group_access`;
CREATE TABLE `we_auth_group_access`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uid_group_id`(`uid`, `group_id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `group_id`(`group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '每个用户所属的权限组的表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of we_auth_group_access
-- ----------------------------
INSERT INTO `we_auth_group_access` VALUES (1, 1, 1);
INSERT INTO `we_auth_group_access` VALUES (2, 2, 2);

-- ----------------------------
-- Table structure for we_log
-- ----------------------------
DROP TABLE IF EXISTS `we_log`;
CREATE TABLE `we_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `ptid` int(11) UNSIGNED NOT NULL COMMENT '平台id',
  `ptname` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '平台名称',
  `productid` int(11) UNSIGNED NOT NULL COMMENT '商品ID',
  `content` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '内容描述',
  `action` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '动作（访问 注册  登录 收藏 分享 下载 购买）',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客户端ip地址',
  `zwcmopenid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '根据掌握传媒公众号获取到的用户openid',
  `openid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '渠道传递过来获取到的微信用户的openid',
  `longitude` decimal(12, 7) NOT NULL COMMENT '经度',
  `latitude` decimal(12, 7) NOT NULL COMMENT '纬度',
  `createtime` datetime(0) NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '创建时间',
  `details` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '存放详细错误信息或者订单详情',
  `useragent` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'useragent',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `Ptid_Action_Details`(`ptid`, `action`, `details`(12)) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 187 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户端日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of we_log
-- ----------------------------
INSERT INTO `we_log` VALUES (1, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '116.231.152.64', '', '', 0.0000000, 0.0000000, '2018-05-28 17:26:15', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (2, 1, 'zwcm', 0, 'Autoreply', 0, '添加自动回复成功', 'Autoreply/addReply', '116.231.152.64', 'wx7ad4ce9789a311ea', 'wx7ad4ce9789a311ea', 0.0000000, 0.0000000, '2018-05-28 17:27:25', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (3, 1, 'zwcm', 0, 'Autoreply', 0, '删除自动回复成功', 'Autoreply/delReply', '116.231.152.64', 'wx7ad4ce9789a311ea', 'wx7ad4ce9789a311ea', 0.0000000, 0.0000000, '2018-05-28 17:28:09', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (4, 2, 'mrsong', 0, 'Login', 0, '登录成功', 'Login/userLogin', '116.230.65.143', '', '', 0.0000000, 0.0000000, '2018-05-28 23:51:10', 'mrsong登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (5, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '116.230.65.143', '', '', 0.0000000, 0.0000000, '2018-05-28 23:51:25', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (6, 1, 'zwcm', 0, 'Autoreply', 0, '添加自动回复成功', 'Autoreply/addReply', '116.230.65.143', 'wx7ad4ce9789a311ea', 'wx7ad4ce9789a311ea', 0.0000000, 0.0000000, '2018-05-28 23:52:11', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (7, 1, 'zwcm', 0, 'Autoreply', 0, '修改自动回复成功', 'Autoreply/editReply', '116.230.65.143', 'wx7ad4ce9789a311ea', 'wx7ad4ce9789a311ea', 0.0000000, 0.0000000, '2018-05-28 23:52:56', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (8, 1, 'zwcm', 0, 'Autoreply', 0, '修改自动回复成功', 'Autoreply/editReply', '116.230.65.143', 'wx7ad4ce9789a311ea', 'wx7ad4ce9789a311ea', 0.0000000, 0.0000000, '2018-05-28 23:53:50', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (9, 1, 'zwcm', 0, 'Autoreply', 0, '修改自动回复成功', 'Autoreply/editReply', '116.230.65.143', 'wx7ad4ce9789a311ea', 'wx7ad4ce9789a311ea', 0.0000000, 0.0000000, '2018-05-28 23:54:27', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (10, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '116.231.152.64', '', '', 0.0000000, 0.0000000, '2018-05-29 11:10:34', 'zwcm登录', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3 like Mac OS X) AppleWebKit/602.1.50 (KHTML, like Gecko) CriOS/56.0.2924.75 Mobile/14E5239e Safari/602.1');
INSERT INTO `we_log` VALUES (11, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '116.231.152.64', '', '', 0.0000000, 0.0000000, '2018-05-29 11:16:52', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (12, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '116.231.152.64', '', '', 0.0000000, 0.0000000, '2018-05-29 11:16:54', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (13, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '116.231.152.64', '', '', 0.0000000, 0.0000000, '2018-05-29 11:16:55', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (14, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '116.231.152.64', '', '', 0.0000000, 0.0000000, '2018-05-29 11:16:59', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (15, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '116.231.152.64', '', '', 0.0000000, 0.0000000, '2018-05-29 11:17:27', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (16, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '116.231.152.64', '', '', 0.0000000, 0.0000000, '2018-05-29 11:38:24', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (17, 1, 'zwcm', 0, 'Autoreply', 0, '添加自动回复成功', 'Autoreply/addReply', '116.231.152.64', 'wx7ad4ce9789a311ea', 'wx7ad4ce9789a311ea', 0.0000000, 0.0000000, '2018-05-29 11:39:03', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (18, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '116.231.152.64', '', '', 0.0000000, 0.0000000, '2018-05-29 11:39:38', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (19, 1, 'zwcm', 0, 'Autoreply', 0, '删除自动回复成功', 'Autoreply/delReply', '116.231.152.64', 'wx7ad4ce9789a311ea', 'wx7ad4ce9789a311ea', 0.0000000, 0.0000000, '2018-05-29 11:39:41', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (20, 1, 'zwcm', 0, 'Autoreply', 0, '添加自动回复成功', 'Autoreply/addReply', '116.231.152.64', 'wx7ad4ce9789a311ea', 'wx7ad4ce9789a311ea', 0.0000000, 0.0000000, '2018-05-29 11:40:07', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (21, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '116.231.152.64', '', '', 0.0000000, 0.0000000, '2018-05-29 13:35:45', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (22, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '116.231.152.64', '', '', 0.0000000, 0.0000000, '2018-05-29 15:45:50', 'zwcm登录', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3 like Mac OS X) AppleWebKit/602.1.50 (KHTML, like Gecko) CriOS/56.0.2924.75 Mobile/14E5239e Safari/602.1');
INSERT INTO `we_log` VALUES (23, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '116.231.152.64', '', '', 0.0000000, 0.0000000, '2018-05-30 09:57:43', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (24, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '116.230.65.143', '', '', 0.0000000, 0.0000000, '2018-06-03 21:04:35', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (25, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '116.231.152.64', '', '', 0.0000000, 0.0000000, '2018-06-05 09:43:47', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (26, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '116.231.152.64', '', '', 0.0000000, 0.0000000, '2018-06-05 10:14:27', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (27, 1, 'zwcm', 0, 'Config', 0, '删除公众号配置成功', 'Config/delConfig', '116.231.152.64', 'wx7ad4ce9789a311ea', 'wx7ad4ce9789a311ea', 0.0000000, 0.0000000, '2018-06-05 10:33:46', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (28, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '116.231.152.64', '', '', 0.0000000, 0.0000000, '2018-06-05 10:46:22', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (29, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '116.231.152.64', '', '', 0.0000000, 0.0000000, '2018-06-06 12:04:28', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (30, 1, 'zwcm', 0, 'Config', 0, '添加公众号成功', 'Config/addConfig', '116.231.152.64', '', '', 0.0000000, 0.0000000, '2018-06-06 12:19:05', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (31, 1, 'zwcm', 0, 'Config', 0, '删除公众号配置成功', 'Config/delConfig', '116.231.152.64', '', '', 0.0000000, 0.0000000, '2018-06-06 12:20:01', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (32, 1, 'zwcm', 0, 'Config', 0, '删除公众号配置成功', 'Config/delConfig', '116.231.152.64', '', '', 0.0000000, 0.0000000, '2018-06-06 12:20:03', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (33, 1, 'zwcm', 0, 'Config', 0, '删除公众号配置成功', 'Config/delConfig', '116.231.152.64', '', '', 0.0000000, 0.0000000, '2018-06-06 12:20:05', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (34, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '116.231.152.64', '', '', 0.0000000, 0.0000000, '2018-06-06 13:03:17', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (35, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '116.231.152.64', '', '', 0.0000000, 0.0000000, '2018-06-06 13:36:03', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (36, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '116.231.159.88', '', '', 0.0000000, 0.0000000, '2018-06-13 16:08:25', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (37, 1, 'zwcm', 0, 'Autoreply', 0, '修改自动回复成功', 'Autoreply/editReply', '116.231.159.88', 'wx7ad4ce9789a311ea', 'wx7ad4ce9789a311ea', 0.0000000, 0.0000000, '2018-06-13 16:11:07', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (38, 1, 'zwcm', 0, 'Autoreply', 0, '修改自动回复成功', 'Autoreply/editReply', '116.231.159.88', 'wx7ad4ce9789a311ea', 'wx7ad4ce9789a311ea', 0.0000000, 0.0000000, '2018-06-13 16:11:50', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (39, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '116.226.108.87', '', '', 0.0000000, 0.0000000, '2018-06-20 17:02:44', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (40, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '116.226.108.87', '', '', 0.0000000, 0.0000000, '2018-06-20 17:05:02', 'zwcm登录', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.87 Safari/537.36');
INSERT INTO `we_log` VALUES (41, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '43.249.135.118', '', '', 0.0000000, 0.0000000, '2018-06-20 17:05:31', 'zwcm登录', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.87 Safari/537.36');
INSERT INTO `we_log` VALUES (42, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '116.226.108.87', '', '', 0.0000000, 0.0000000, '2018-06-20 17:57:19', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (43, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '116.230.65.143', '', '', 0.0000000, 0.0000000, '2018-06-21 22:15:39', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (44, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '116.230.65.143', '', '', 0.0000000, 0.0000000, '2018-06-21 23:38:09', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (45, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '116.226.110.6', '', '', 0.0000000, 0.0000000, '2018-06-26 10:44:31', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (46, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '116.226.110.6', '', '', 0.0000000, 0.0000000, '2018-06-27 13:59:12', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (47, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '116.226.110.6', '', '', 0.0000000, 0.0000000, '2018-06-27 14:28:06', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (48, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '116.230.65.143', '', '', 0.0000000, 0.0000000, '2018-06-27 22:30:36', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (49, 1, 'zwcm', 0, 'Wechat', 0, '从微信端获取菜单', 'Wechat/getMenu', '116.230.65.143', 'wx7ad4ce9789a311ea', 'wx7ad4ce9789a311ea', 0.0000000, 0.0000000, '2018-06-27 22:30:56', '成功添加6条数据,失败0条', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (50, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '116.230.65.143', '', '', 0.0000000, 0.0000000, '2018-06-27 23:43:03', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (51, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '116.230.65.143', '', '', 0.0000000, 0.0000000, '2018-06-27 23:43:11', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (52, 1, 'zwcm', 0, 'Menu', 0, '编辑菜单成功', 'Menu/editMenu', '116.230.65.143', 'wx7ad4ce9789a311ea', 'wx7ad4ce9789a311ea', 0.0000000, 0.0000000, '2018-06-27 23:43:50', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (53, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '101.81.235.93', '', '', 0.0000000, 0.0000000, '2018-06-28 11:53:08', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (54, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '101.81.235.93', '', '', 0.0000000, 0.0000000, '2018-06-28 17:15:16', 'zwcm登录', 'Mozilla/5.0 (iPhone; CPU iPhone OS 10_3 like Mac OS X) AppleWebKit/602.1.50 (KHTML, like Gecko) CriOS/56.0.2924.75 Mobile/14E5239e Safari/602.1');
INSERT INTO `we_log` VALUES (55, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '101.81.235.93', '', '', 0.0000000, 0.0000000, '2018-06-28 17:17:10', 'zwcm登录', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36');
INSERT INTO `we_log` VALUES (56, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '101.81.235.93', '', '', 0.0000000, 0.0000000, '2018-06-28 17:17:25', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (57, 1, 'zwcm', 0, 'Autoreply', 0, '添加自动回复成功', 'Autoreply/addReply', '101.81.235.93', 'wxf42302be9b7152f8', 'wxf42302be9b7152f8', 0.0000000, 0.0000000, '2018-06-28 17:24:29', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (58, 1, 'zwcm', 0, 'Autoreply', 0, '添加自动回复成功', 'Autoreply/addReply', '101.81.235.93', 'wxf42302be9b7152f8', 'wxf42302be9b7152f8', 0.0000000, 0.0000000, '2018-06-28 17:26:37', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36');
INSERT INTO `we_log` VALUES (59, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '101.81.235.93', '', '', 0.0000000, 0.0000000, '2018-06-29 10:29:24', 'zwcm登录', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36');
INSERT INTO `we_log` VALUES (60, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '116.230.65.143', '', '', 0.0000000, 0.0000000, '2018-06-30 00:37:53', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (61, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '223.166.244.126', '', '', 0.0000000, 0.0000000, '2018-07-01 15:31:14', 'zwcm登录', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_5) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/11.1.1 Safari/605.1.15');
INSERT INTO `we_log` VALUES (62, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '116.226.110.111', '', '', 0.0000000, 0.0000000, '2018-07-02 10:31:42', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (63, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '116.226.110.111', '', '', 0.0000000, 0.0000000, '2018-07-02 11:17:50', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (64, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '116.226.110.111', '', '', 0.0000000, 0.0000000, '2018-07-04 11:30:13', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (65, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '116.226.110.111', '', '', 0.0000000, 0.0000000, '2018-07-04 11:37:17', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (66, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '116.226.110.111', '', '', 0.0000000, 0.0000000, '2018-07-04 11:41:35', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (67, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '116.226.110.111', '', '', 0.0000000, 0.0000000, '2018-07-04 11:42:10', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36');
INSERT INTO `we_log` VALUES (68, 1, 'zwcm', 0, 'Autoreply', 0, '添加自动回复成功', 'Autoreply/addReply', '116.226.110.111', 'wxf42302be9b7152f8', 'wxf42302be9b7152f8', 0.0000000, 0.0000000, '2018-07-04 11:43:54', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36');
INSERT INTO `we_log` VALUES (69, 1, 'zwcm', 0, 'Autoreply', 0, '添加自动回复成功', 'Autoreply/addReply', '116.226.110.111', 'wx7ad4ce9789a311ea', 'wx7ad4ce9789a311ea', 0.0000000, 0.0000000, '2018-07-04 12:00:07', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36');
INSERT INTO `we_log` VALUES (70, 1, 'zwcm', 0, 'Autoreply', 0, '添加自动回复成功', 'Autoreply/addReply', '116.226.110.111', 'wxf42302be9b7152f8', 'wxf42302be9b7152f8', 0.0000000, 0.0000000, '2018-07-04 12:11:59', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36');
INSERT INTO `we_log` VALUES (71, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '116.226.110.111', '', '', 0.0000000, 0.0000000, '2018-07-04 12:17:35', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (72, 1, 'zwcm', 0, 'Wechat', 0, '推送菜单成功', 'Wechat/createMenu', '116.226.110.111', 'wxf42302be9b7152f8', 'wxf42302be9b7152f8', 0.0000000, 0.0000000, '2018-07-04 12:18:56', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (73, 1, 'zwcm', 0, 'Autoreply', 0, '添加自动回复成功', 'Autoreply/addReply', '116.226.110.111', 'wxf42302be9b7152f8', 'wxf42302be9b7152f8', 0.0000000, 0.0000000, '2018-07-04 12:21:46', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (74, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '116.226.110.111', '', '', 0.0000000, 0.0000000, '2018-07-04 13:22:18', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (75, 1, 'zwcm', 0, 'Autoreply', 0, '删除自动回复成功', 'Autoreply/delReply', '116.226.110.111', 'wxf42302be9b7152f8', 'wxf42302be9b7152f8', 0.0000000, 0.0000000, '2018-07-04 13:22:25', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (76, 1, 'zwcm', 0, 'Autoreply', 0, '添加自动回复成功', 'Autoreply/addReply', '116.226.110.111', 'wxf42302be9b7152f8', 'wxf42302be9b7152f8', 0.0000000, 0.0000000, '2018-07-04 13:24:24', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (77, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '116.226.110.111', '', '', 0.0000000, 0.0000000, '2018-07-04 14:01:30', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36');
INSERT INTO `we_log` VALUES (78, 1, 'zwcm', 0, 'Wechat', 0, '推送菜单成功', 'Wechat/createMenu', '116.226.110.111', 'wxf42302be9b7152f8', 'wxf42302be9b7152f8', 0.0000000, 0.0000000, '2018-07-04 14:02:09', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36');
INSERT INTO `we_log` VALUES (79, 1, 'zwcm', 0, 'Autoreply', 0, '添加自动回复成功', 'Autoreply/addReply', '116.226.110.111', 'wxf42302be9b7152f8', 'wxf42302be9b7152f8', 0.0000000, 0.0000000, '2018-07-04 14:03:09', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36');
INSERT INTO `we_log` VALUES (80, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '116.226.110.111', '', '', 0.0000000, 0.0000000, '2018-07-04 16:29:57', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36');
INSERT INTO `we_log` VALUES (81, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '116.226.110.111', '', '', 0.0000000, 0.0000000, '2018-07-05 09:37:25', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (82, 1, 'zwcm', 0, 'Autoreply', 0, '添加自动回复成功', 'Autoreply/addReply', '116.226.110.111', 'wxf42302be9b7152f8', 'wxf42302be9b7152f8', 0.0000000, 0.0000000, '2018-07-05 09:58:49', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (83, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '116.226.110.111', '', '', 0.0000000, 0.0000000, '2018-07-05 17:05:01', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (84, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '116.226.110.111', '', '', 0.0000000, 0.0000000, '2018-07-09 10:24:21', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (85, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '116.226.110.111', '', '', 0.0000000, 0.0000000, '2018-07-11 16:02:37', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (86, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '116.226.110.111', '', '', 0.0000000, 0.0000000, '2018-07-13 15:55:57', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (87, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '124.77.157.114', '', '', 0.0000000, 0.0000000, '2018-07-19 21:17:08', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (88, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '124.77.157.114', '', '', 0.0000000, 0.0000000, '2018-07-19 23:09:34', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (89, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '116.231.84.23', '', '', 0.0000000, 0.0000000, '2018-07-20 09:27:24', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (90, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '101.81.238.185', '', '', 0.0000000, 0.0000000, '2018-07-25 12:25:13', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (91, 1, 'zwcm', 0, 'Autoreply', 0, '添加自动回复成功', 'Autoreply/addReply', '101.81.238.185', 'wxf42302be9b7152f8', 'wxf42302be9b7152f8', 0.0000000, 0.0000000, '2018-07-25 12:25:52', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (92, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '101.81.238.185', '', '', 0.0000000, 0.0000000, '2018-08-01 10:17:22', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (93, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '192.168.1.11', '', '', 0.0000000, 0.0000000, '2018-08-01 10:33:34', 'zwcm登录', 'PostmanRuntime/7.2.0');
INSERT INTO `we_log` VALUES (94, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '192.168.1.31', '', '', 0.0000000, 0.0000000, '2018-08-01 10:39:53', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (95, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '192.168.1.31', '', '', 0.0000000, 0.0000000, '2018-08-01 10:39:54', 'zwcm登录', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36');
INSERT INTO `we_log` VALUES (96, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '192.168.1.31', '', '', 0.0000000, 0.0000000, '2018-08-01 11:34:45', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (97, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '192.168.1.31', '', '', 0.0000000, 0.0000000, '2018-08-01 11:44:24', 'zwcm登录', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.101 Safari/537.36');
INSERT INTO `we_log` VALUES (98, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '192.168.1.31', '', '', 0.0000000, 0.0000000, '2018-08-01 11:52:01', 'zwcm登录', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36');
INSERT INTO `we_log` VALUES (99, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '192.168.1.11', '', '', 0.0000000, 0.0000000, '2018-08-01 12:36:52', 'zwcm登录', 'PostmanRuntime/7.2.0');
INSERT INTO `we_log` VALUES (100, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '::1', '', '', 0.0000000, 0.0000000, '2018-08-01 12:37:16', 'zwcm登录', 'PostmanRuntime/7.2.0');
INSERT INTO `we_log` VALUES (101, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '192.168.1.31', '', '', 0.0000000, 0.0000000, '2018-08-01 13:34:00', 'zwcm登录', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36');
INSERT INTO `we_log` VALUES (102, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '::1', '', '', 0.0000000, 0.0000000, '2018-08-01 13:45:58', 'zwcm登录', 'PostmanRuntime/7.2.0');
INSERT INTO `we_log` VALUES (103, 0, '', 0, 'WechatServer', 0, '接收用户回复失败', 'replyhandle/TextReply/saveText/error', '127.0.0.1', '', '', 0.0000000, 0.0000000, '2018-08-01 15:09:51', 'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'uatzsmp.we_kefu2\' doesn\'t exist', 'Mozilla/4.0');
INSERT INTO `we_log` VALUES (104, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '192.168.1.31', '', '', 0.0000000, 0.0000000, '2018-08-01 16:58:23', 'zwcm登录', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0');
INSERT INTO `we_log` VALUES (105, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '192.168.1.31', '', '', 0.0000000, 0.0000000, '2018-08-01 17:03:14', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (106, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '192.168.1.31', '', '', 0.0000000, 0.0000000, '2018-08-01 18:05:32', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (107, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '192.168.1.35', '', '', 0.0000000, 0.0000000, '2018-08-02 09:54:50', 'zwcm登录', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36');
INSERT INTO `we_log` VALUES (108, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '192.168.1.35', '', '', 0.0000000, 0.0000000, '2018-08-02 10:00:06', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (109, 1, 'zwcm', 0, 'Autoreply', 0, '添加自动回复成功', 'Autoreply/addReply', '192.168.1.35', 'wx7ad4ce9789a311ea', 'wx7ad4ce9789a311ea', 0.0000000, 0.0000000, '2018-08-02 10:16:37', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (110, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '192.168.1.35', '', '', 0.0000000, 0.0000000, '2018-08-02 10:43:53', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (111, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '::1', '', '', 0.0000000, 0.0000000, '2018-08-02 10:54:14', 'zwcm登录', 'PostmanRuntime/7.2.0');
INSERT INTO `we_log` VALUES (112, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '::1', '', '', 0.0000000, 0.0000000, '2018-08-02 11:19:46', 'zwcm登录', 'PostmanRuntime/7.2.0');
INSERT INTO `we_log` VALUES (113, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '192.168.1.35', '', '', 0.0000000, 0.0000000, '2018-08-02 11:51:01', 'zwcm登录', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36');
INSERT INTO `we_log` VALUES (114, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '192.168.1.35', '', '', 0.0000000, 0.0000000, '2018-08-02 12:11:31', 'zwcm登录', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.101 Safari/537.36');
INSERT INTO `we_log` VALUES (115, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '192.168.1.35', '', '', 0.0000000, 0.0000000, '2018-08-02 13:36:43', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (116, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '192.168.1.35', '', '', 0.0000000, 0.0000000, '2018-08-02 14:06:22', 'zwcm登录', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36');
INSERT INTO `we_log` VALUES (117, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '192.168.1.35', '', '', 0.0000000, 0.0000000, '2018-08-02 14:57:30', 'zwcm登录', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36');
INSERT INTO `we_log` VALUES (118, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '192.168.1.35', '', '', 0.0000000, 0.0000000, '2018-08-02 15:03:19', 'zwcm登录', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36');
INSERT INTO `we_log` VALUES (119, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '192.168.1.35', '', '', 0.0000000, 0.0000000, '2018-08-02 15:05:20', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (120, 1, 'zwcm', 0, 'Autoreply', 0, '删除自动回复成功', 'Autoreply/delReply', '192.168.1.35', 'wx7ad4ce9789a311ea', 'wx7ad4ce9789a311ea', 0.0000000, 0.0000000, '2018-08-02 15:05:30', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (121, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '::1', '', '', 0.0000000, 0.0000000, '2018-08-02 15:15:07', 'zwcm登录', 'PostmanRuntime/7.2.0');
INSERT INTO `we_log` VALUES (122, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '192.168.1.35', '', '', 0.0000000, 0.0000000, '2018-08-02 15:21:00', 'zwcm登录', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36');
INSERT INTO `we_log` VALUES (123, 1, 'zwcm', 0, 'Kefu', 0, 'OPENID不能为空', 'Kefu/getgetUserChatInfo/error', '::1', 'wx7ad4ce9789a311ea', 'wx7ad4ce9789a311ea', 0.0000000, 0.0000000, '2018-08-02 15:27:56', '', 'PostmanRuntime/7.2.0');
INSERT INTO `we_log` VALUES (124, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '192.168.1.35', '', '', 0.0000000, 0.0000000, '2018-08-02 15:41:07', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (125, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '::1', '', '', 0.0000000, 0.0000000, '2018-08-02 15:56:06', 'zwcm登录', 'PostmanRuntime/7.2.0');
INSERT INTO `we_log` VALUES (126, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '192.168.1.35', '', '', 0.0000000, 0.0000000, '2018-08-02 16:07:45', 'zwcm登录', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36');
INSERT INTO `we_log` VALUES (127, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '::1', '', '', 0.0000000, 0.0000000, '2018-08-02 16:20:04', 'zwcm登录', 'PostmanRuntime/7.2.0');
INSERT INTO `we_log` VALUES (128, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '192.168.1.35', '', '', 0.0000000, 0.0000000, '2018-08-02 16:47:21', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (129, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '192.168.1.35', '', '', 0.0000000, 0.0000000, '2018-08-02 16:50:01', 'zwcm登录', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.101 Safari/537.36');
INSERT INTO `we_log` VALUES (130, 1, 'zwcm', 0, 'Kefu', 0, '更改已读未读状态失败', 'Kefu/changeStatus/error', '192.168.1.35', 'wx7ad4ce9789a311ea', 'wx7ad4ce9789a311ea', 0.0000000, 0.0000000, '2018-08-02 17:11:47', 'fields not exists:[updatetime]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (131, 1, 'zwcm', 0, 'Kefu', 0, '更改已读未读状态失败', 'Kefu/changeStatus/error', '192.168.1.35', 'wx7ad4ce9789a311ea', 'wx7ad4ce9789a311ea', 0.0000000, 0.0000000, '2018-08-02 17:11:51', 'fields not exists:[updatetime]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (132, 1, 'zwcm', 0, 'Kefu', 0, '更改已读未读状态失败', 'Kefu/changeStatus/error', '192.168.1.35', 'wx7ad4ce9789a311ea', 'wx7ad4ce9789a311ea', 0.0000000, 0.0000000, '2018-08-02 17:11:54', 'fields not exists:[updatetime]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (133, 1, 'zwcm', 0, 'Kefu', 0, '更改已读未读状态失败', 'Kefu/changeStatus/error', '192.168.1.35', 'wx7ad4ce9789a311ea', 'wx7ad4ce9789a311ea', 0.0000000, 0.0000000, '2018-08-02 17:11:55', 'fields not exists:[updatetime]', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (134, 1, 'zwcm', 0, 'Kefu', 0, '更改已读未读状态失败', 'Kefu/changeStatus/error', '192.168.1.35', 'wx7ad4ce9789a311ea', 'wx7ad4ce9789a311ea', 0.0000000, 0.0000000, '2018-08-02 17:12:43', 'fields not exists:[updatetime]', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.101 Safari/537.36');
INSERT INTO `we_log` VALUES (135, 1, 'zwcm', 0, 'Kefu', 0, '获取数据失败', '', '192.168.1.35', '', '', 0.0000000, 0.0000000, '2018-08-02 17:14:17', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (136, 1, 'zwcm', 0, 'Kefu', 0, '获取数据失败', '', '192.168.1.35', '', '', 0.0000000, 0.0000000, '2018-08-02 17:15:52', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36');
INSERT INTO `we_log` VALUES (137, 1, 'zwcm', 0, 'Kefu', 0, '获取数据失败', '', '192.168.1.35', '', '', 0.0000000, 0.0000000, '2018-08-02 17:20:15', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36');
INSERT INTO `we_log` VALUES (138, 1, 'zwcm', 0, 'Kefu', 0, '获取数据失败', '', '192.168.1.35', '', '', 0.0000000, 0.0000000, '2018-08-02 17:21:17', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36');
INSERT INTO `we_log` VALUES (139, 1, 'zwcm', 0, 'Kefu', 0, '获取数据失败', '', '192.168.1.35', '', '', 0.0000000, 0.0000000, '2018-08-02 17:23:19', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36');
INSERT INTO `we_log` VALUES (140, 1, 'zwcm', 0, 'Kefu', 0, '获取数据失败', '', '192.168.1.35', '', '', 0.0000000, 0.0000000, '2018-08-02 17:23:25', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36');
INSERT INTO `we_log` VALUES (141, 1, 'zwcm', 0, 'Kefu', 0, '获取数据失败', '', '192.168.1.35', '', '', 0.0000000, 0.0000000, '2018-08-02 17:29:13', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (142, 1, 'zwcm', 0, 'Kefu', 0, '获取数据失败', '', '192.168.1.35', '', '', 0.0000000, 0.0000000, '2018-08-02 17:31:17', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36');
INSERT INTO `we_log` VALUES (143, 1, 'zwcm', 0, 'Kefu', 0, '获取数据失败', '', '192.168.1.35', '', '', 0.0000000, 0.0000000, '2018-08-02 17:35:34', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36');
INSERT INTO `we_log` VALUES (144, 1, 'zwcm', 0, 'Kefu', 0, '获取数据失败', '', '192.168.1.35', '', '', 0.0000000, 0.0000000, '2018-08-02 17:37:47', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36');
INSERT INTO `we_log` VALUES (145, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '::1', '', '', 0.0000000, 0.0000000, '2018-08-02 17:41:14', 'zwcm登录', 'PostmanRuntime/7.2.0');
INSERT INTO `we_log` VALUES (146, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '192.168.1.35', '', '', 0.0000000, 0.0000000, '2018-08-02 17:47:28', 'zwcm登录', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.101 Safari/537.36');
INSERT INTO `we_log` VALUES (147, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '192.168.1.35', '', '', 0.0000000, 0.0000000, '2018-08-02 18:25:19', 'zwcm登录', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36');
INSERT INTO `we_log` VALUES (148, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '116.235.190.246', '', '', 0.0000000, 0.0000000, '2018-08-03 00:05:10', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (149, 2, 'mrsong', 0, 'Login', 0, '登录成功', 'Login/userLogin', '192.168.1.34', '', '', 0.0000000, 0.0000000, '2018-08-03 09:50:13', 'mrsong登录', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36');
INSERT INTO `we_log` VALUES (150, 2, 'mrsong', 0, 'Login', 0, '登录成功', 'Login/userLogin', '192.168.1.34', '', '', 0.0000000, 0.0000000, '2018-08-03 13:20:35', 'mrsong登录', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36');
INSERT INTO `we_log` VALUES (151, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '192.168.1.34', '', '', 0.0000000, 0.0000000, '2018-08-03 13:43:05', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (152, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '::1', '', '', 0.0000000, 0.0000000, '2018-08-03 13:45:43', 'zwcm登录', 'PostmanRuntime/7.2.0');
INSERT INTO `we_log` VALUES (153, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '::1', '', '', 0.0000000, 0.0000000, '2018-08-03 14:38:43', 'zwcm登录', 'PostmanRuntime/7.2.0');
INSERT INTO `we_log` VALUES (154, 2, 'mrsong', 0, 'Login', 0, '登录成功', 'Login/userLogin', '192.168.1.34', '', '', 0.0000000, 0.0000000, '2018-08-03 14:50:43', 'mrsong登录', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.101 Safari/537.36');
INSERT INTO `we_log` VALUES (155, 2, 'mrsong', 0, 'Login', 0, '登录成功', 'Login/userLogin', '192.168.1.34', '', '', 0.0000000, 0.0000000, '2018-08-03 15:58:45', 'mrsong登录', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36');
INSERT INTO `we_log` VALUES (156, 1, 'zwcm', 0, 'Login', 0, '登录成功', 'Login/userLogin', '192.168.1.34', '', '', 0.0000000, 0.0000000, '2018-08-03 15:59:07', 'zwcm登录', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (157, 1, 'zwcm', 0, 'Kefu', 0, '获取数据失败', '', '192.168.1.34', '', '', 0.0000000, 0.0000000, '2018-08-03 16:01:03', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (158, 1, 'zwcm', 0, 'Kefu', 0, '获取数据失败', '', '192.168.1.34', '', '', 0.0000000, 0.0000000, '2018-08-03 16:01:13', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (159, 2, 'mrsong', 0, 'Login', 0, '登录成功', 'Login/userLogin', '192.168.1.34', '', '', 0.0000000, 0.0000000, '2018-08-03 16:02:02', 'mrsong登录', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.101 Safari/537.36');
INSERT INTO `we_log` VALUES (160, 2, 'mrsong', 0, 'Kefu', 0, '获取数据失败', '', '192.168.1.34', '', '', 0.0000000, 0.0000000, '2018-08-03 16:02:06', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.101 Safari/537.36');
INSERT INTO `we_log` VALUES (161, 2, 'mrsong', 0, 'Kefu', 0, '获取数据失败', '', '192.168.1.34', '', '', 0.0000000, 0.0000000, '2018-08-03 16:02:27', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.101 Safari/537.36');
INSERT INTO `we_log` VALUES (162, 1, 'zwcm', 0, 'Wechat', 0, 'invalid openid hint: [txtpda09544127]', '', '192.168.1.34', '', '', 0.0000000, 0.0000000, '2018-08-03 16:12:35', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (163, 2, 'mrsong', 0, 'Wechat', 0, 'invalid openid hint: [m7vcIa0005shc2]', '', '192.168.1.34', '', '', 0.0000000, 0.0000000, '2018-08-03 16:13:27', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36');
INSERT INTO `we_log` VALUES (164, 2, 'mrsong', 0, 'Wechat', 0, 'invalid openid hint: [_4xcBa00094126]', '', '192.168.1.34', '', '', 0.0000000, 0.0000000, '2018-08-03 16:13:31', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.101 Safari/537.36');
INSERT INTO `we_log` VALUES (165, 2, 'mrsong', 0, 'Wechat', 0, 'invalid openid hint: [vatHwa00254106]', '', '192.168.1.34', '', '', 0.0000000, 0.0000000, '2018-08-03 16:13:46', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.101 Safari/537.36');
INSERT INTO `we_log` VALUES (166, 2, 'mrsong', 0, 'Wechat', 0, 'invalid openid hint: [ioU3700294128]', '', '192.168.1.34', '', '', 0.0000000, 0.0000000, '2018-08-03 16:13:51', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36');
INSERT INTO `we_log` VALUES (167, 2, 'mrsong', 0, 'Wechat', 0, 'invalid openid hint: [jc6bVA00334114]', '', '192.168.1.34', '', '', 0.0000000, 0.0000000, '2018-08-03 16:13:54', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.101 Safari/537.36');
INSERT INTO `we_log` VALUES (168, 2, 'mrsong', 0, 'Wechat', 0, 'invalid openid hint: [YZybVA00404124]', '', '192.168.1.34', '', '', 0.0000000, 0.0000000, '2018-08-03 16:14:02', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.101 Safari/537.36');
INSERT INTO `we_log` VALUES (169, 2, 'mrsong', 0, 'Wechat', 0, 'invalid openid hint: [7fpIPa0063shc2]', '', '192.168.1.34', '', '', 0.0000000, 0.0000000, '2018-08-03 16:14:24', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.101 Safari/537.36');
INSERT INTO `we_log` VALUES (170, 2, 'mrsong', 0, 'Wechat', 0, 'invalid openid hint: [uI3TJA00664120]', '', '192.168.1.34', '', '', 0.0000000, 0.0000000, '2018-08-03 16:14:27', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36');
INSERT INTO `we_log` VALUES (171, 2, 'mrsong', 0, 'Wechat', 0, 'invalid openid hint: [oJ6tca01064123]', '', '192.168.1.34', '', '', 0.0000000, 0.0000000, '2018-08-03 16:15:07', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.101 Safari/537.36');
INSERT INTO `we_log` VALUES (172, 2, 'mrsong', 0, 'Wechat', 0, 'invalid openid hint: [PdAG8a01104108]', '', '192.168.1.34', '', '', 0.0000000, 0.0000000, '2018-08-03 16:15:11', '', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.101 Safari/537.36');
INSERT INTO `we_log` VALUES (173, 2, 'mrsong', 0, 'Wechat', 0, 'invalid openid hint: [1ohi1a07904129]', '', '192.168.1.34', '', '', 0.0000000, 0.0000000, '2018-08-03 16:26:32', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36');
INSERT INTO `we_log` VALUES (174, 2, 'mrsong', 0, 'Wechat', 0, 'invalid openid hint: [QbTlsA08584102]', '', '192.168.1.34', '', '', 0.0000000, 0.0000000, '2018-08-03 16:27:39', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36');
INSERT INTO `we_log` VALUES (175, 2, 'mrsong', 0, 'Wechat', 0, 'invalid openid hint: [XrjsXa08734121]', '', '192.168.1.34', '', '', 0.0000000, 0.0000000, '2018-08-03 16:27:54', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36');
INSERT INTO `we_log` VALUES (176, 2, 'mrsong', 0, 'Wechat', 0, 'invalid openid hint: [fXQaLA08914105]', '', '192.168.1.34', '', '', 0.0000000, 0.0000000, '2018-08-03 16:28:12', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36');
INSERT INTO `we_log` VALUES (177, 2, 'mrsong', 0, 'Wechat', 0, 'invalid openid hint: [lxQkZa09294119]', '', '192.168.1.34', '', '', 0.0000000, 0.0000000, '2018-08-03 16:28:50', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36');
INSERT INTO `we_log` VALUES (178, 1, 'zwcm', 0, 'Wechat', 0, 'invalid openid hint: [zrHgWa09392367]', '', '192.168.1.34', '', '', 0.0000000, 0.0000000, '2018-08-03 16:29:01', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (179, 2, 'mrsong', 0, 'Login', 0, '登录成功', 'Login/userLogin', '192.168.1.34', '', '', 0.0000000, 0.0000000, '2018-08-03 17:05:22', 'mrsong登录', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.101 Safari/537.36');
INSERT INTO `we_log` VALUES (180, 1, 'zwcm', 0, 'Autoreply', 0, '添加自动回复成功', 'Autoreply/addReply', '192.168.1.34', 'wx7ad4ce9789a311ea', 'wx7ad4ce9789a311ea', 0.0000000, 0.0000000, '2018-08-03 17:18:01', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (181, 2, 'mrsong', 0, 'Wechat', 0, 'out of response count limit hint: [3okk_04054105]', '', '192.168.1.34', '', '', 0.0000000, 0.0000000, '2018-08-03 17:43:26', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36');
INSERT INTO `we_log` VALUES (182, 2, 'mrsong', 0, 'Wechat', 0, 'out of response count limit hint: [J0AlNA04114100]', '', '192.168.1.34', '', '', 0.0000000, 0.0000000, '2018-08-03 17:43:33', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36');
INSERT INTO `we_log` VALUES (183, 1, 'zwcm', 0, 'Wechat', 0, 'out of response count limit hint: [g723CA05563113]', '', '192.168.1.34', '', '', 0.0000000, 0.0000000, '2018-08-03 17:45:57', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (184, 1, 'zwcm', 0, 'Wechat', 0, 'out of response count limit hint: [YnZ.05704113]', '', '192.168.1.34', '', '', 0.0000000, 0.0000000, '2018-08-03 17:46:11', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');
INSERT INTO `we_log` VALUES (185, 2, 'mrsong', 0, 'Wechat', 0, 'out of response count limit hint: [5hg1Pa06403932]', '', '192.168.1.34', '', '', 0.0000000, 0.0000000, '2018-08-03 17:47:21', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36');
INSERT INTO `we_log` VALUES (186, 1, 'zwcm', 0, 'Wechat', 0, 'out of response count limit hint: [ZfbcVA08014129]', '', '192.168.1.34', '', '', 0.0000000, 0.0000000, '2018-08-03 17:50:03', '', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36');

-- ----------------------------
-- Table structure for we_kefu
-- ----------------------------
DROP TABLE IF EXISTS `we_kefu`;
CREATE TABLE `we_kefu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wechatid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信号',
  `openid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户OPENID',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
  `msgtype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息类型',
  `detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容细节',
  `replytype` tinyint(2) NULL DEFAULT NULL COMMENT '回复类型 1表示用户回复 2表示是客服回复',
  `status` tinyint(2) NULL DEFAULT 0 COMMENT '0 表示未读 1表示已读',
  `kfid` int(11) NULL DEFAULT NULL COMMENT '客服ID',
  `createtime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_wechatid`(`wechatid`) USING BTREE,
  INDEX `index_openid`(`openid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 140 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客服消息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of we_kefu
-- ----------------------------
INSERT INTO `we_kefu` VALUES (1, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', 'fdsafdsaf', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\",\"CreateTime\":\"1533106450\",\"MsgType\":\"text\",\"Content\":\"fdsafdsaf\",\"MsgId\":\"6584642064465061056\"}', 1, 1, 0, '2018-08-01 14:54:11');
INSERT INTO `we_kefu` VALUES (2, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', 'fdsafda', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\",\"CreateTime\":\"1533107946\",\"MsgType\":\"text\",\"Content\":\"fdsafda\",\"MsgId\":\"6584648489736136226\"}', 1, 1, 0, '2018-08-01 15:19:09');
INSERT INTO `we_kefu` VALUES (3, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', 'fsafsaf', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\",\"CreateTime\":\"1533108989\",\"MsgType\":\"text\",\"Content\":\"fsafsaf\",\"MsgId\":\"6584652969387026195\"}', 1, 1, 0, '2018-08-01 15:36:30');
INSERT INTO `we_kefu` VALUES (4, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', '', 'image', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\",\"CreateTime\":\"1533110016\",\"MsgType\":\"image\",\"PicUrl\":\"http:\\/\\/mmbiz.qpic.cn\\/mmbiz_jpg\\/alns0bibVnImvePgb0Jyu2P84bQquIyeico3Bl8VHlXCWLhWHxAMIOVtbtnGQcAT4t2D5iboC21C4QoRjRAticr12w\\/0\",\"MsgId\":\"6584657380318439448\",\"MediaId\":\"84MCb3BLd6cxlBTpMvf6xHkxMHXuO4fq4wHvpeSwD5mEdMofxn3JuJUCKyWYQXwA\"}', 1, 1, 0, '2018-08-01 15:53:40');
INSERT INTO `we_kefu` VALUES (5, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', '[图片]', 'image', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\",\"CreateTime\":\"1533110134\",\"MsgType\":\"image\",\"PicUrl\":\"http:\\/\\/mmbiz.qpic.cn\\/mmbiz_jpg\\/alns0bibVnImvePgb0Jyu2P84bQquIyeic3qhGqvGlJhRx8u44V9BwbcPFXUHVFhCtSCGrzxmFalPibXyozNl9thA\\/0\",\"MsgId\":\"6584657887124580408\",\"MediaId\":\"syloXgmASlzPR9jg_G-shzjRfMjnb0xRj5_FswffZsimyOxF_OSpEFz71m0haWPw\"}', 1, 1, 0, '2018-08-01 15:55:37');
INSERT INTO `we_kefu` VALUES (6, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', 'fafdas', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\",\"CreateTime\":\"1533111266\",\"MsgType\":\"text\",\"Content\":\"fafdas\",\"MsgId\":\"6584662749027559677\"}', 1, 1, 0, '2018-08-01 16:14:29');
INSERT INTO `we_kefu` VALUES (7, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', '[图片]', 'image', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\",\"CreateTime\":\"1533111421\",\"MsgType\":\"image\",\"PicUrl\":\"http:\\/\\/mmbiz.qpic.cn\\/mmbiz_jpg\\/alns0bibVnImvePgb0Jyu2P84bQquIyeicw3HrzPMD28X7hZR4N7AiaGXd3MBQjgsSTibvpxIyHKSrX0NdtibNNVFdQ\\/0\",\"MsgId\":\"6584663414747490602\",\"MediaId\":\"T-jA63rG4zIxXQOFwhBLQGavHfoadPAoNrHaZwJSUW37Zt1ByNHuCgz6RKKLGSu7\"}', 1, 1, 0, '2018-08-01 16:17:03');
INSERT INTO `we_kefu` VALUES (8, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', '图片', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\",\"CreateTime\":\"1533175624\",\"MsgType\":\"text\",\"Content\":\"\\u56fe\\u7247\",\"MsgId\":\"6584939164532808158\"}', 1, 1, 0, '2018-08-02 10:07:05');
INSERT INTO `we_kefu` VALUES (9, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', '客服', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\",\"CreateTime\":\"1533176211\",\"MsgType\":\"text\",\"Content\":\"\\u5ba2\\u670d\",\"MsgId\":\"6584941685678611106\"}', 1, 1, 0, '2018-08-02 10:16:52');
INSERT INTO `we_kefu` VALUES (10, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', '昵称', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\",\"CreateTime\":\"1533178974\",\"MsgType\":\"text\",\"Content\":\"\\u6635\\u79f0\",\"MsgId\":\"6584953552673250685\"}', 1, 1, 0, '2018-08-02 11:02:56');
INSERT INTO `we_kefu` VALUES (11, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', '客服', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\",\"CreateTime\":\"1533180001\",\"MsgType\":\"text\",\"Content\":\"\\u5ba2\\u670d\",\"MsgId\":\"6584957963604664055\"}', 1, 1, 0, '2018-08-02 11:20:02');
INSERT INTO `we_kefu` VALUES (12, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', '测试', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\",\"CreateTime\":\"1533180008\",\"MsgType\":\"text\",\"Content\":\"\\u6d4b\\u8bd5\",\"MsgId\":\"6584957993669435135\"}', 1, 1, 0, '2018-08-02 11:20:09');
INSERT INTO `we_kefu` VALUES (13, 'gh_7557b6fe18eb', 'oHIv-wXbgD_1q4Gh8anZZdRbRtZg', '1346648', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wXbgD_1q4Gh8anZZdRbRtZg\",\"CreateTime\":\"1533181879\",\"MsgType\":\"text\",\"Content\":\"1346648\",\"MsgId\":\"6584966029553246552\"}', 1, 1, 0, '2018-08-02 11:51:21');
INSERT INTO `we_kefu` VALUES (14, 'gh_7557b6fe18eb', 'oHIv-wXbgD_1q4Gh8anZZdRbRtZg', '97988号', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wXbgD_1q4Gh8anZZdRbRtZg\",\"CreateTime\":\"1533181881\",\"MsgType\":\"text\",\"Content\":\"97988\\u53f7\",\"MsgId\":\"6584966038143181146\"}', 1, 1, 0, '2018-08-02 11:51:22');
INSERT INTO `we_kefu` VALUES (15, 'gh_7557b6fe18eb', 'oHIv-wXbgD_1q4Gh8anZZdRbRtZg', '676565号', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wXbgD_1q4Gh8anZZdRbRtZg\",\"CreateTime\":\"1533181883\",\"MsgType\":\"text\",\"Content\":\"676565\\u53f7\",\"MsgId\":\"6584966046733115740\"}', 1, 1, 0, '2018-08-02 11:51:24');
INSERT INTO `we_kefu` VALUES (16, 'gh_7557b6fe18eb', 'oHIv-wXbgD_1q4Gh8anZZdRbRtZg', '6646568号', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wXbgD_1q4Gh8anZZdRbRtZg\",\"CreateTime\":\"1533181884\",\"MsgType\":\"text\",\"Content\":\"6646568\\u53f7\",\"MsgId\":\"6584966051028083038\"}', 1, 1, 0, '2018-08-02 11:51:25');
INSERT INTO `we_kefu` VALUES (17, 'gh_7557b6fe18eb', 'oHIv-wXbgD_1q4Gh8anZZdRbRtZg', '6765656号', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wXbgD_1q4Gh8anZZdRbRtZg\",\"CreateTime\":\"1533181886\",\"MsgType\":\"text\",\"Content\":\"6765656\\u53f7\",\"MsgId\":\"6584966059618017632\"}', 1, 1, 0, '2018-08-02 11:51:27');
INSERT INTO `we_kefu` VALUES (18, 'gh_7557b6fe18eb', 'oHIv-wXbgD_1q4Gh8anZZdRbRtZg', '[图片]', 'image', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wXbgD_1q4Gh8anZZdRbRtZg\",\"CreateTime\":\"1533181892\",\"MsgType\":\"image\",\"PicUrl\":\"http:\\/\\/mmbiz.qpic.cn\\/mmbiz_jpg\\/y45AutdNQibEhuHDcbicanN0nMULmvcMJZOL8wUd2Pc8x7JcicNI4KjQWmVmvCRpabPNCpjiaWbCGdNywtJGW9aozA\\/0\",\"MsgId\":\"6584966085387821414\",\"MediaId\":\"A3brtgtnLlKvQ8QpKcisrofGk_jiQsuLp4T-SGI06bPbcvRsbpo6CgS9k8igJOlE\"}', 1, 1, 0, '2018-08-02 11:51:34');
INSERT INTO `we_kefu` VALUES (19, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', '发发呆', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\",\"CreateTime\":\"1533190975\",\"MsgType\":\"text\",\"Content\":\"\\u53d1\\u53d1\\u5446\",\"MsgId\":\"6585005096575773825\"}', 1, 1, 0, '2018-08-02 14:22:56');
INSERT INTO `we_kefu` VALUES (20, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', 'fdsfaff', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\",\"CreateTime\":\"1533192078\",\"MsgType\":\"text\",\"Content\":\"fdsfaff\",\"MsgId\":\"6585009833924701604\"}', 1, 1, 0, '2018-08-02 14:41:19');
INSERT INTO `we_kefu` VALUES (21, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', 'fsdfd', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\",\"CreateTime\":\"1533192145\",\"MsgType\":\"text\",\"Content\":\"fsdfd\",\"MsgId\":\"6585010121687510471\"}', 1, 1, 0, '2018-08-02 14:42:26');
INSERT INTO `we_kefu` VALUES (22, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', 'fsdfs', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\",\"CreateTime\":\"1533192191\",\"MsgType\":\"text\",\"Content\":\"fsdfs\",\"MsgId\":\"6585010319256006103\"}', 1, 1, 0, '2018-08-02 14:43:12');
INSERT INTO `we_kefu` VALUES (23, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', '默认', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\",\"CreateTime\":\"1533193173\",\"MsgType\":\"text\",\"Content\":\"\\u9ed8\\u8ba4\",\"MsgId\":\"6585014536913891055\"}', 1, 1, 0, '2018-08-02 14:59:34');
INSERT INTO `we_kefu` VALUES (24, 'gh_7557b6fe18eb', 'oHIv-wXbgD_1q4Gh8anZZdRbRtZg', '123', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wXbgD_1q4Gh8anZZdRbRtZg\",\"CreateTime\":\"1533193336\",\"MsgType\":\"text\",\"Content\":\"123\",\"MsgId\":\"6585015236993560359\"}', 1, 1, 0, '2018-08-02 15:02:17');
INSERT INTO `we_kefu` VALUES (25, 'gh_7557b6fe18eb', 'oHIv-wXbgD_1q4Gh8anZZdRbRtZg', '456', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wXbgD_1q4Gh8anZZdRbRtZg\",\"CreateTime\":\"1533193337\",\"MsgType\":\"text\",\"Content\":\"456\",\"MsgId\":\"6585015241288527657\"}', 1, 1, 0, '2018-08-02 15:02:18');
INSERT INTO `we_kefu` VALUES (26, 'gh_7557b6fe18eb', 'oHIv-wXbgD_1q4Gh8anZZdRbRtZg', '789', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wXbgD_1q4Gh8anZZdRbRtZg\",\"CreateTime\":\"1533193338\",\"MsgType\":\"text\",\"Content\":\"789\",\"MsgId\":\"6585015245583494954\"}', 1, 1, 0, '2018-08-02 15:02:19');
INSERT INTO `we_kefu` VALUES (27, 'gh_7557b6fe18eb', 'oHIv-wXbgD_1q4Gh8anZZdRbRtZg', '147', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wXbgD_1q4Gh8anZZdRbRtZg\",\"CreateTime\":\"1533193341\",\"MsgType\":\"text\",\"Content\":\"147\",\"MsgId\":\"6585015258468396845\"}', 1, 1, 0, '2018-08-02 15:02:22');
INSERT INTO `we_kefu` VALUES (28, 'gh_7557b6fe18eb', 'oHIv-wXbgD_1q4Gh8anZZdRbRtZg', '258', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wXbgD_1q4Gh8anZZdRbRtZg\",\"CreateTime\":\"1533193342\",\"MsgType\":\"text\",\"Content\":\"258\",\"MsgId\":\"6585015262763364143\"}', 1, 1, 0, '2018-08-02 15:02:23');
INSERT INTO `we_kefu` VALUES (29, 'gh_7557b6fe18eb', 'oHIv-wXbgD_1q4Gh8anZZdRbRtZg', '669', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wXbgD_1q4Gh8anZZdRbRtZg\",\"CreateTime\":\"1533193343\",\"MsgType\":\"text\",\"Content\":\"669\",\"MsgId\":\"6585015267058331441\"}', 1, 1, 0, '2018-08-02 15:02:24');
INSERT INTO `we_kefu` VALUES (30, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', '发斯蒂芬斯蒂芬', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\",\"CreateTime\":\"1533193371\",\"MsgType\":\"text\",\"Content\":\"\\u53d1\\u65af\\u8482\\u82ac\\u65af\\u8482\\u82ac\",\"MsgId\":\"6585015387317415739\"}', 1, 1, 0, '2018-08-02 15:02:52');
INSERT INTO `we_kefu` VALUES (31, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', '范德萨发', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\",\"CreateTime\":\"1533193533\",\"MsgType\":\"text\",\"Content\":\"\\u8303\\u5fb7\\u8428\\u53d1\",\"MsgId\":\"6585016083102117762\"}', 1, 1, 0, '2018-08-02 15:05:35');
INSERT INTO `we_kefu` VALUES (32, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', 'gfgfdgfdg', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\",\"CreateTime\":\"1533193813\",\"MsgType\":\"text\",\"Content\":\"gfgfdgfdg\",\"MsgId\":\"6585017285692960736\"}', 1, 1, 0, '2018-08-02 15:10:14');
INSERT INTO `we_kefu` VALUES (33, 'gh_7557b6fe18eb', 'oHIv-wXbgD_1q4Gh8anZZdRbRtZg', '45', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wXbgD_1q4Gh8anZZdRbRtZg\",\"CreateTime\":\"1533193872\",\"MsgType\":\"text\",\"Content\":\"45\",\"MsgId\":\"6585017539096031215\"}', 1, 1, 0, '2018-08-02 15:11:13');
INSERT INTO `we_kefu` VALUES (34, 'gh_7557b6fe18eb', 'oHIv-wXbgD_1q4Gh8anZZdRbRtZg', '4', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wXbgD_1q4Gh8anZZdRbRtZg\",\"CreateTime\":\"1533193873\",\"MsgType\":\"text\",\"Content\":\"4\",\"MsgId\":\"6585017543390998514\"}', 1, 1, 0, '2018-08-02 15:11:14');
INSERT INTO `we_kefu` VALUES (35, 'gh_7557b6fe18eb', 'oHIv-wXbgD_1q4Gh8anZZdRbRtZg', '1', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wXbgD_1q4Gh8anZZdRbRtZg\",\"CreateTime\":\"1533193875\",\"MsgType\":\"text\",\"Content\":\"1\",\"MsgId\":\"6585017551980933107\"}', 1, 1, 0, '2018-08-02 15:11:16');
INSERT INTO `we_kefu` VALUES (36, 'gh_7557b6fe18eb', 'oHIv-wXbgD_1q4Gh8anZZdRbRtZg', '2', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wXbgD_1q4Gh8anZZdRbRtZg\",\"CreateTime\":\"1533193876\",\"MsgType\":\"text\",\"Content\":\"2\",\"MsgId\":\"6585017556275900404\"}', 1, 1, 0, '2018-08-02 15:11:17');
INSERT INTO `we_kefu` VALUES (37, 'gh_7557b6fe18eb', 'oHIv-wXbgD_1q4Gh8anZZdRbRtZg', '3', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wXbgD_1q4Gh8anZZdRbRtZg\",\"CreateTime\":\"1533193877\",\"MsgType\":\"text\",\"Content\":\"3\",\"MsgId\":\"6585017560570867701\"}', 1, 1, 0, '2018-08-02 15:11:18');
INSERT INTO `we_kefu` VALUES (38, 'gh_7557b6fe18eb', 'oHIv-wXbgD_1q4Gh8anZZdRbRtZg', '4', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wXbgD_1q4Gh8anZZdRbRtZg\",\"CreateTime\":\"1533193878\",\"MsgType\":\"text\",\"Content\":\"4\",\"MsgId\":\"6585017564865834998\"}', 1, 1, 0, '2018-08-02 15:11:19');
INSERT INTO `we_kefu` VALUES (39, 'gh_7557b6fe18eb', 'oHIv-wXbgD_1q4Gh8anZZdRbRtZg', '5', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wXbgD_1q4Gh8anZZdRbRtZg\",\"CreateTime\":\"1533193879\",\"MsgType\":\"text\",\"Content\":\"5\",\"MsgId\":\"6585017569160802295\"}', 1, 1, 0, '2018-08-02 15:11:20');
INSERT INTO `we_kefu` VALUES (40, 'gh_7557b6fe18eb', 'oHIv-wXbgD_1q4Gh8anZZdRbRtZg', '6', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wXbgD_1q4Gh8anZZdRbRtZg\",\"CreateTime\":\"1533193883\",\"MsgType\":\"text\",\"Content\":\"6\",\"MsgId\":\"6585017586340671480\"}', 1, 1, 0, '2018-08-02 15:11:24');
INSERT INTO `we_kefu` VALUES (41, 'gh_7557b6fe18eb', 'oHIv-wXbgD_1q4Gh8anZZdRbRtZg', '7', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wXbgD_1q4Gh8anZZdRbRtZg\",\"CreateTime\":\"1533193884\",\"MsgType\":\"text\",\"Content\":\"7\",\"MsgId\":\"6585017590635638777\"}', 1, 1, 0, '2018-08-02 15:11:26');
INSERT INTO `we_kefu` VALUES (42, 'gh_7557b6fe18eb', 'oHIv-wXbgD_1q4Gh8anZZdRbRtZg', '8', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wXbgD_1q4Gh8anZZdRbRtZg\",\"CreateTime\":\"1533193885\",\"MsgType\":\"text\",\"Content\":\"8\",\"MsgId\":\"6585017594930606074\"}', 1, 1, 0, '2018-08-02 15:11:26');
INSERT INTO `we_kefu` VALUES (43, 'gh_7557b6fe18eb', 'oHIv-wXbgD_1q4Gh8anZZdRbRtZg', '9', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wXbgD_1q4Gh8anZZdRbRtZg\",\"CreateTime\":\"1533193886\",\"MsgType\":\"text\",\"Content\":\"9\",\"MsgId\":\"6585017599225573371\"}', 1, 1, 0, '2018-08-02 15:11:27');
INSERT INTO `we_kefu` VALUES (44, 'gh_7557b6fe18eb', 'oHIv-wTV7dAr-RLfZMwSkCUp_GlM', '【收到不支持的消息类型，暂无法显示】', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wTV7dAr-RLfZMwSkCUp_GlM\",\"CreateTime\":\"1533200095\",\"MsgType\":\"text\",\"Content\":\"\\u3010\\u6536\\u5230\\u4e0d\\u652f\\u6301\\u7684\\u6d88\\u606f\\u7c7b\\u578b\\uff0c\\u6682\\u65e0\\u6cd5\\u663e\\u793a\\u3011\",\"MsgId\":\"6585044266677515944\"}', 1, 1, 0, '2018-08-02 16:54:56');
INSERT INTO `we_kefu` VALUES (45, 'gh_7557b6fe18eb', 'oHIv-wTV7dAr-RLfZMwSkCUp_GlM', '[图片]', 'image', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wTV7dAr-RLfZMwSkCUp_GlM\",\"CreateTime\":\"1533200163\",\"MsgType\":\"image\",\"PicUrl\":\"http:\\/\\/mmbiz.qpic.cn\\/mmbiz_jpg\\/wH7bW5Bhwj3om7ofygWrAP6M7NQGbXEDic6EB8qVHGWojAJ0IIUaBJlEjs7g8H67xGQedZKxJB5GT1jlNECibjhg\\/0\",\"MsgId\":\"6585044558735292100\",\"MediaId\":\"6MwaTuVkk7B6O2f8CQDW6zOcAdNAbxMZMf3ekTjx9gIKiBwhh-ks39koVZIVOOsg\"}', 1, 1, 0, '2018-08-02 16:56:06');
INSERT INTO `we_kefu` VALUES (46, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', '[图片]', 'image', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\",\"CreateTime\":\"1533200252\",\"MsgType\":\"image\",\"PicUrl\":\"http:\\/\\/mmbiz.qpic.cn\\/mmbiz_jpg\\/alns0bibVnImU4d2QLvzLKq8z7ibADlWiaxib2kPuNLXaIGnlgD4Gf3vvOJbnDSiaOIaX5yQ3gxXmiczhMRMia7tibO47g\\/0\",\"MsgId\":\"6585044940987381478\",\"MediaId\":\"0bmIpWKAPUCaQuWSSS8TVaE9Xn5nZXyiznTYm0jGCgVHJCsOWm8uqGrN2egiIS_b\"}', 1, 1, 0, '2018-08-02 16:57:34');
INSERT INTO `we_kefu` VALUES (47, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', '图片', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\",\"CreateTime\":\"1533200888\",\"MsgType\":\"text\",\"Content\":\"\\u56fe\\u7247\",\"MsgId\":\"6585047672586581916\"}', 1, 1, 0, '2018-08-02 17:08:09');
INSERT INTO `we_kefu` VALUES (48, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', '自动回复', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\",\"CreateTime\":\"1533200904\",\"MsgType\":\"text\",\"Content\":\"\\u81ea\\u52a8\\u56de\\u590d\",\"MsgId\":\"6585047741306058655\"}', 1, 1, 0, '2018-08-02 17:08:25');
INSERT INTO `we_kefu` VALUES (49, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', '反倒是个地方官', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\",\"CreateTime\":\"1533201403\",\"MsgType\":\"text\",\"Content\":\"\\u53cd\\u5012\\u662f\\u4e2a\\u5730\\u65b9\\u5b98\",\"MsgId\":\"6585049884494739505\"}', 1, 1, 0, '2018-08-02 17:16:44');
INSERT INTO `we_kefu` VALUES (50, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', '测试测试', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\",\"CreateTime\":\"1533202898\",\"MsgType\":\"text\",\"Content\":\"\\u6d4b\\u8bd5\\u6d4b\\u8bd5\",\"MsgId\":\"6585056305470847565\"}', 1, 1, 0, '2018-08-02 17:41:39');
INSERT INTO `we_kefu` VALUES (51, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', '云信', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\",\"CreateTime\":\"1533275292\",\"MsgType\":\"text\",\"Content\":\"\\u4e91\\u4fe1\",\"MsgId\":\"6585367235333290814\"}', 1, 1, 0, '2018-08-03 13:48:14');
INSERT INTO `we_kefu` VALUES (52, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', '[图片]', 'image', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\",\"CreateTime\":\"1533275360\",\"MsgType\":\"image\",\"PicUrl\":\"http:\\/\\/mmbiz.qpic.cn\\/mmbiz_jpg\\/alns0bibVnInugccRVQWGQUMIxnYRLZ7Dp6nlAG9rHZy7hZyTrL2Vjia4aqtTMPZecRqIJbutm4SjaDx82iajzMAw\\/0\",\"MsgId\":\"6585367527391066967\",\"MediaId\":\"TWOFHur_Yc_M0xzHo8H5pJ_yF0eeD6s7QWthonIHRvlol3QyZmETBNQoDS42mikP\"}', 1, 1, 0, '2018-08-03 13:49:22');
INSERT INTO `we_kefu` VALUES (53, 'gh_7557b6fe18eb', 'oHIv-wXbgD_1q4Gh8anZZdRbRtZg', '测试', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wXbgD_1q4Gh8anZZdRbRtZg\",\"CreateTime\":\"1533275608\",\"MsgType\":\"text\",\"Content\":\"\\u6d4b\\u8bd5\",\"MsgId\":\"6585368592542956445\"}', 1, 1, 0, '2018-08-03 13:53:31');
INSERT INTO `we_kefu` VALUES (54, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', '想怎么回复就怎么回复', 'text', '{\"touser\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\",\"msgtype\":\"text\",\"text\":{\"content\":\"\\u60f3\\u600e\\u4e48\\u56de\\u590d\\u5c31\\u600e\\u4e48\\u56de\\u590d\"}}', 2, 1, 1, '2018-08-03 14:40:54');
INSERT INTO `we_kefu` VALUES (55, 'gh_7557b6fe18eb', 'oHIv-wXbgD_1q4Gh8anZZdRbRtZg', '测试 回复\n', 'text', '{\"touser\":\"oHIv-wXbgD_1q4Gh8anZZdRbRtZg\",\"msgtype\":\"text\",\"text\":{\"content\":\"\\u6d4b\\u8bd5 \\u56de\\u590d\\n\"}}', 2, 1, 2, '2018-08-03 14:48:08');
INSERT INTO `we_kefu` VALUES (56, 'gh_7557b6fe18eb', 'oHIv-wXbgD_1q4Gh8anZZdRbRtZg', '<a href=\"http://www.baidu.com\">123</a>', 'text', '{\"touser\":\"oHIv-wXbgD_1q4Gh8anZZdRbRtZg\",\"msgtype\":\"text\",\"text\":{\"content\":\"<a href=\\\"http:\\/\\/www.baidu.com\\\">123<\\/a>\"}}', 2, 1, 2, '2018-08-03 14:48:56');
INSERT INTO `we_kefu` VALUES (57, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', '测试回复', 'text', '{\"touser\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\",\"msgtype\":\"text\",\"text\":{\"content\":\"\\u6d4b\\u8bd5\\u56de\\u590d\"}}', 2, 1, 1, '2018-08-03 14:50:35');
INSERT INTO `we_kefu` VALUES (58, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', '<a href=\"www.baidu.com\">百度</a>', 'text', '{\"touser\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\",\"msgtype\":\"text\",\"text\":{\"content\":\"<a href=\\\"www.baidu.com\\\">\\u767e\\u5ea6<\\/a>\"}}', 2, 1, 1, '2018-08-03 14:51:17');
INSERT INTO `we_kefu` VALUES (59, 'gh_7557b6fe18eb', 'oHIv-wTV7dAr-RLfZMwSkCUp_GlM', '回复回复回复', 'text', '{\"touser\":\"oHIv-wTV7dAr-RLfZMwSkCUp_GlM\",\"msgtype\":\"text\",\"text\":{\"content\":\"\\u56de\\u590d\\u56de\\u590d\\u56de\\u590d\"}}', 2, 1, 1, '2018-08-03 14:52:06');
INSERT INTO `we_kefu` VALUES (60, 'gh_7557b6fe18eb', 'oHIv-wTV7dAr-RLfZMwSkCUp_GlM', '反对萨芬的', 'text', '{\"touser\":\"oHIv-wTV7dAr-RLfZMwSkCUp_GlM\",\"msgtype\":\"text\",\"text\":{\"content\":\"\\u53cd\\u5bf9\\u8428\\u82ac\\u7684\"}}', 2, 1, 1, '2018-08-03 14:52:43');
INSERT INTO `we_kefu` VALUES (61, 'gh_7557b6fe18eb', 'oHIv-wTV7dAr-RLfZMwSkCUp_GlM', '111', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wTV7dAr-RLfZMwSkCUp_GlM\",\"CreateTime\":\"1533279176\",\"MsgType\":\"text\",\"Content\":\"111\",\"MsgId\":\"6585383916986269374\"}', 1, 1, 0, '2018-08-03 14:52:58');
INSERT INTO `we_kefu` VALUES (62, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', '是', 'text', '{\"touser\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\",\"msgtype\":\"text\",\"text\":{\"content\":\"\\u662f\"}}', 2, 1, 2, '2018-08-03 14:54:20');
INSERT INTO `we_kefu` VALUES (63, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', '是', 'text', '{\"touser\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\",\"msgtype\":\"text\",\"text\":{\"content\":\"\\u662f\"}}', 2, 1, 2, '2018-08-03 14:54:21');
INSERT INTO `we_kefu` VALUES (64, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', '是', 'text', '{\"touser\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\",\"msgtype\":\"text\",\"text\":{\"content\":\"\\u662f\"}}', 2, 1, 2, '2018-08-03 14:54:21');
INSERT INTO `we_kefu` VALUES (65, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', ' 的', 'text', '{\"touser\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\",\"msgtype\":\"text\",\"text\":{\"content\":\" \\u7684\"}}', 2, 1, 2, '2018-08-03 14:54:36');
INSERT INTO `we_kefu` VALUES (66, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', ' 的', 'text', '{\"touser\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\",\"msgtype\":\"text\",\"text\":{\"content\":\" \\u7684\"}}', 2, 1, 2, '2018-08-03 14:54:36');
INSERT INTO `we_kefu` VALUES (67, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', ' 的', 'text', '{\"touser\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\",\"msgtype\":\"text\",\"text\":{\"content\":\" \\u7684\"}}', 2, 1, 2, '2018-08-03 14:54:36');
INSERT INTO `we_kefu` VALUES (68, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', ' 的', 'text', '{\"touser\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\",\"msgtype\":\"text\",\"text\":{\"content\":\" \\u7684\"}}', 2, 1, 2, '2018-08-03 14:54:37');
INSERT INTO `we_kefu` VALUES (69, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', ' 的', 'text', '{\"touser\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\",\"msgtype\":\"text\",\"text\":{\"content\":\" \\u7684\"}}', 2, 1, 2, '2018-08-03 14:54:37');
INSERT INTO `we_kefu` VALUES (70, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', '是', 'text', '{\"touser\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\",\"msgtype\":\"text\",\"text\":{\"content\":\"\\u662f\"}}', 2, 1, 2, '2018-08-03 14:54:47');
INSERT INTO `we_kefu` VALUES (71, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', '是', 'text', '{\"touser\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\",\"msgtype\":\"text\",\"text\":{\"content\":\"\\u662f\"}}', 2, 1, 2, '2018-08-03 14:54:47');
INSERT INTO `we_kefu` VALUES (72, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', '是', 'text', '{\"touser\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\",\"msgtype\":\"text\",\"text\":{\"content\":\"\\u662f\"}}', 2, 1, 2, '2018-08-03 14:54:48');
INSERT INTO `we_kefu` VALUES (73, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', '是', 'text', '{\"touser\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\",\"msgtype\":\"text\",\"text\":{\"content\":\"\\u662f\"}}', 2, 1, 2, '2018-08-03 14:54:48');
INSERT INTO `we_kefu` VALUES (74, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', '疯了吧', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\",\"CreateTime\":\"1533279289\",\"MsgType\":\"text\",\"Content\":\"\\u75af\\u4e86\\u5427\",\"MsgId\":\"6585384402317573867\"}', 1, 1, 0, '2018-08-03 14:54:51');
INSERT INTO `we_kefu` VALUES (75, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', '疯了吧\n', 'text', '{\"touser\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\",\"msgtype\":\"text\",\"text\":{\"content\":\"\\u75af\\u4e86\\u5427\\n\"}}', 2, 1, 2, '2018-08-03 14:55:51');
INSERT INTO `we_kefu` VALUES (76, 'gh_7557b6fe18eb', 'oHIv-wXbgD_1q4Gh8anZZdRbRtZg', '测试', 'text', '{\"touser\":\"oHIv-wXbgD_1q4Gh8anZZdRbRtZg\",\"msgtype\":\"text\",\"text\":{\"content\":\"\\u6d4b\\u8bd5\"}}', 2, 1, 2, '2018-08-03 14:56:06');
INSERT INTO `we_kefu` VALUES (77, 'gh_7557b6fe18eb', 'oHIv-wSlW-7Ap09QPGolQQlPYnYc', '哈喽', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wSlW-7Ap09QPGolQQlPYnYc\",\"CreateTime\":\"1533279418\",\"MsgType\":\"text\",\"Content\":\"\\u54c8\\u55bd\",\"MsgId\":\"6585384956368355077\"}', 1, 1, 0, '2018-08-03 14:57:01');
INSERT INTO `we_kefu` VALUES (78, 'gh_7557b6fe18eb', 'oHIv-wSlW-7Ap09QPGolQQlPYnYc', 'fdsafdafdaf', 'text', '{\"touser\":\"oHIv-wSlW-7Ap09QPGolQQlPYnYc\",\"msgtype\":\"text\",\"text\":{\"content\":\"fdsafdafdaf\"}}', 2, 1, 1, '2018-08-03 14:57:41');
INSERT INTO `we_kefu` VALUES (79, 'gh_7557b6fe18eb', 'oHIv-wXbgD_1q4Gh8anZZdRbRtZg', '5', 'text', '{\"touser\":\"oHIv-wXbgD_1q4Gh8anZZdRbRtZg\",\"msgtype\":\"text\",\"text\":{\"content\":\"5\"}}', 2, 1, 2, '2018-08-03 15:04:21');
INSERT INTO `we_kefu` VALUES (80, 'gh_7557b6fe18eb', 'oHIv-wXbgD_1q4Gh8anZZdRbRtZg', '5', 'text', '{\"touser\":\"oHIv-wXbgD_1q4Gh8anZZdRbRtZg\",\"msgtype\":\"text\",\"text\":{\"content\":\"5\"}}', 2, 1, 2, '2018-08-03 15:04:28');
INSERT INTO `we_kefu` VALUES (81, 'gh_7557b6fe18eb', 'oHIv-wXbgD_1q4Gh8anZZdRbRtZg', '123456', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wXbgD_1q4Gh8anZZdRbRtZg\",\"CreateTime\":\"1533281025\",\"MsgType\":\"text\",\"Content\":\"123456\",\"MsgId\":\"6585391858380800197\"}', 1, 1, 0, '2018-08-03 15:23:47');
INSERT INTO `we_kefu` VALUES (82, 'gh_7557b6fe18eb', 'oHIv-wSlW-7Ap09QPGolQQlPYnYc', '', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wSlW-7Ap09QPGolQQlPYnYc\",\"CreateTime\":\"1533281353\",\"MsgType\":\"text\",\"Content\":\"\\ud83c\\udf89\",\"MsgId\":\"6585393267130073341\"}', 1, 1, 0, '2018-08-03 15:29:15');
INSERT INTO `we_kefu` VALUES (83, 'gh_7557b6fe18eb', 'oHIv-wSlW-7Ap09QPGolQQlPYnYc', '【收到不支持的消息类型，暂无法显示】', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wSlW-7Ap09QPGolQQlPYnYc\",\"CreateTime\":\"1533281356\",\"MsgType\":\"text\",\"Content\":\"\\u3010\\u6536\\u5230\\u4e0d\\u652f\\u6301\\u7684\\u6d88\\u606f\\u7c7b\\u578b\\uff0c\\u6682\\u65e0\\u6cd5\\u663e\\u793a\\u3011\",\"MsgId\":\"6585393280014975230\"}', 1, 1, 0, '2018-08-03 15:29:18');
INSERT INTO `we_kefu` VALUES (84, 'gh_7557b6fe18eb', 'oHIv-wSlW-7Ap09QPGolQQlPYnYc', '哦', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wSlW-7Ap09QPGolQQlPYnYc\",\"CreateTime\":\"1533281373\",\"MsgType\":\"text\",\"Content\":\"\\u54e6\",\"MsgId\":\"6585393353029419265\"}', 1, 1, 0, '2018-08-03 15:29:35');
INSERT INTO `we_kefu` VALUES (85, 'gh_7557b6fe18eb', 'oHIv-wSlW-7Ap09QPGolQQlPYnYc', '', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wSlW-7Ap09QPGolQQlPYnYc\",\"CreateTime\":\"1533281376\",\"MsgType\":\"text\",\"Content\":\"\\ud83d\\ude04\",\"MsgId\":\"6585393365914321154\"}', 1, 1, 0, '2018-08-03 15:29:38');
INSERT INTO `we_kefu` VALUES (86, 'gh_7557b6fe18eb', 'oHIv-wSlW-7Ap09QPGolQQlPYnYc', '', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wSlW-7Ap09QPGolQQlPYnYc\",\"CreateTime\":\"1533281381\",\"MsgType\":\"text\",\"Content\":\"\\ud83d\\ude04\",\"MsgId\":\"6585393387389157635\"}', 1, 1, 0, '2018-08-03 15:29:43');
INSERT INTO `we_kefu` VALUES (87, 'gh_7557b6fe18eb', 'oHIv-wSlW-7Ap09QPGolQQlPYnYc', '哦', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wSlW-7Ap09QPGolQQlPYnYc\",\"CreateTime\":\"1533281412\",\"MsgType\":\"text\",\"Content\":\"\\u54e6\\ud83d\\ude04\",\"MsgId\":\"6585393520533143818\"}', 1, 1, 0, '2018-08-03 15:30:13');
INSERT INTO `we_kefu` VALUES (88, 'gh_7557b6fe18eb', 'oHIv-wSlW-7Ap09QPGolQQlPYnYc', '是[Smirk]好', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wSlW-7Ap09QPGolQQlPYnYc\",\"CreateTime\":\"1533281432\",\"MsgType\":\"text\",\"Content\":\"\\u662f[Smirk]\\u597d\",\"MsgId\":\"6585393606432489743\"}', 1, 1, 0, '2018-08-03 15:30:34');
INSERT INTO `we_kefu` VALUES (89, 'gh_7557b6fe18eb', 'oHIv-wXbgD_1q4Gh8anZZdRbRtZg', '/:v', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wXbgD_1q4Gh8anZZdRbRtZg\",\"CreateTime\":\"1533281535\",\"MsgType\":\"text\",\"Content\":\"\\/:v\",\"MsgId\":\"6585394048814121256\"}', 1, 1, 0, '2018-08-03 15:32:17');
INSERT INTO `we_kefu` VALUES (90, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', '[Facepalm]', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\",\"CreateTime\":\"1533283114\",\"MsgType\":\"text\",\"Content\":\"[Facepalm]\",\"MsgId\":\"6585400830567481979\"}', 1, 1, 0, '2018-08-03 15:58:36');
INSERT INTO `we_kefu` VALUES (91, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', '/::D', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\",\"CreateTime\":\"1533283160\",\"MsgType\":\"text\",\"Content\":\"\\/::D\",\"MsgId\":\"6585401028135977607\"}', 1, 1, 0, '2018-08-03 15:59:22');
INSERT INTO `we_kefu` VALUES (92, 'gh_7557b6fe18eb', 'oHIv-wXbgD_1q4Gh8anZZdRbRtZg', '的', 'text', '{\"touser\":\"oHIv-wXbgD_1q4Gh8anZZdRbRtZg\",\"msgtype\":\"text\",\"text\":{\"content\":\"\\u7684\"}}', 2, 1, 2, '2018-08-03 16:06:11');
INSERT INTO `we_kefu` VALUES (93, 'gh_7557b6fe18eb', 'oHIv-wXbgD_1q4Gh8anZZdRbRtZg', '能回车\n回车', 'text', '{\"touser\":\"oHIv-wXbgD_1q4Gh8anZZdRbRtZg\",\"msgtype\":\"text\",\"text\":{\"content\":\"\\u80fd\\u56de\\u8f66\\n\\u56de\\u8f66\"}}', 2, 1, 1, '2018-08-03 16:07:40');
INSERT INTO `we_kefu` VALUES (94, 'gh_7557b6fe18eb', 'oHIv-wXbgD_1q4Gh8anZZdRbRtZg', '回车好像不行啊', 'text', '{\"touser\":\"oHIv-wXbgD_1q4Gh8anZZdRbRtZg\",\"msgtype\":\"text\",\"text\":{\"content\":\"\\u56de\\u8f66\\u597d\\u50cf\\u4e0d\\u884c\\u554a\"}}', 2, 1, 1, '2018-08-03 16:07:57');
INSERT INTO `we_kefu` VALUES (95, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', '回车\n\n\n回车', 'text', '{\"touser\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\",\"msgtype\":\"text\",\"text\":{\"content\":\"\\u56de\\u8f66\\n\\n\\n\\u56de\\u8f66\"}}', 2, 1, 1, '2018-08-03 16:08:14');
INSERT INTO `we_kefu` VALUES (96, 'gh_7557b6fe18eb', 'oHIv-wXbgD_1q4Gh8anZZdRbRtZg', '的', 'text', '{\"touser\":\"oHIv-wXbgD_1q4Gh8anZZdRbRtZg\",\"msgtype\":\"text\",\"text\":{\"content\":\"\\u7684\"}}', 2, 1, 2, '2018-08-03 16:09:41');
INSERT INTO `we_kefu` VALUES (97, 'gh_7557b6fe18eb', 'oHIv-wXbgD_1q4Gh8anZZdRbRtZg', '少时诵诗书所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所', 'text', '{\"touser\":\"oHIv-wXbgD_1q4Gh8anZZdRbRtZg\",\"msgtype\":\"text\",\"text\":{\"content\":\"\\u5c11\\u65f6\\u8bf5\\u8bd7\\u4e66\\u6240\\u6240\\u6240\\u6240\\u6240\\u6240\\u6240\\u6240\\u6240\\u6240\\u6240\\u6240\\u6240\\u6240\\u6240\\u6240\\u6240\\u6240\\u6240\\u6240\\u6240\\u6240\\u6240\\u6240\\u6240\\u6240\\u6240\\u6240\\u6240\\u6240\\u6240\\u6240\\u6240\\u6240\\u6240\\u6240\\u6240\"}}', 2, 1, 2, '2018-08-03 16:10:51');
INSERT INTO `we_kefu` VALUES (98, 'gh_7557b6fe18eb', 'oHIv-wXbgD_1q4Gh8anZZdRbRtZg', '的点点滴滴多多多多多多多多多多多多多多多多多多多多多多多多多多多多多多多多多多多多多多多多多多多多多多多多多多多多多多多多多多多', 'text', '{\"touser\":\"oHIv-wXbgD_1q4Gh8anZZdRbRtZg\",\"msgtype\":\"text\",\"text\":{\"content\":\"\\u7684\\u70b9\\u70b9\\u6ef4\\u6ef4\\u591a\\u591a\\u591a\\u591a\\u591a\\u591a\\u591a\\u591a\\u591a\\u591a\\u591a\\u591a\\u591a\\u591a\\u591a\\u591a\\u591a\\u591a\\u591a\\u591a\\u591a\\u591a\\u591a\\u591a\\u591a\\u591a\\u591a\\u591a\\u591a\\u591a\\u591a\\u591a\\u591a\\u591a\\u591a\\u591a\\u591a\\u591a\\u591a\\u591a\\u591a\\u591a\\u591a\\u591a\\u591a\\u591a\\u591a\\u591a\\u591a\\u591a\\u591a\\u591a\\u591a\\u591a\\u591a\\u591a\\u591a\\u591a\\u591a\"}}', 2, 1, 2, '2018-08-03 16:11:34');
INSERT INTO `we_kefu` VALUES (104, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', 'dsgsd', 'text', '{\"touser\":\"oHIv-wagNwj9P18vT51lhYc-y0zE1\",\"msgtype\":\"text\",\"text\":{\"content\":\"dsgsd\"}}', 2, 1, 1, '2018-08-03 16:12:35');
INSERT INTO `we_kefu` VALUES (105, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', '21321321231', 'text', '{\"touser\":\"oHIv-wagNwj9P18vT51lhYc-y0zE1\",\"msgtype\":\"text\",\"text\":{\"content\":\"21321321231\"}}', 2, 1, 2, '2018-08-03 16:13:26');
INSERT INTO `we_kefu` VALUES (106, 'gh_7557b6fe18eb', 'oHIv-wXbgD_1q4Gh8anZZdRbRtZg', '少时诵诗书所所所所所所', 'text', '{\"touser\":\"oHIv-wXbgD_1q4Gh8anZZdRbRtZg1\",\"msgtype\":\"text\",\"text\":{\"content\":\"\\u5c11\\u65f6\\u8bf5\\u8bd7\\u4e66\\u6240\\u6240\\u6240\\u6240\\u6240\\u6240\"}}', 2, 1, 2, '2018-08-03 16:13:31');
INSERT INTO `we_kefu` VALUES (107, 'gh_7557b6fe18eb', 'oHIv-wXbgD_1q4Gh8anZZdRbRtZg', '少时诵诗书所所所所所所', 'text', '{\"touser\":\"oHIv-wXbgD_1q4Gh8anZZdRbRtZg1\",\"msgtype\":\"text\",\"text\":{\"content\":\"\\u5c11\\u65f6\\u8bf5\\u8bd7\\u4e66\\u6240\\u6240\\u6240\\u6240\\u6240\\u6240\"}}', 2, 1, 2, '2018-08-03 16:13:46');
INSERT INTO `we_kefu` VALUES (108, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', '21321321231', 'text', '{\"touser\":\"oHIv-wagNwj9P18vT51lhYc-y0zE1\",\"msgtype\":\"text\",\"text\":{\"content\":\"21321321231\"}}', 2, 1, 2, '2018-08-03 16:13:50');
INSERT INTO `we_kefu` VALUES (109, 'gh_7557b6fe18eb', 'oHIv-wXbgD_1q4Gh8anZZdRbRtZg', '少时诵诗书所所所所所所', 'text', '{\"touser\":\"oHIv-wXbgD_1q4Gh8anZZdRbRtZg1\",\"msgtype\":\"text\",\"text\":{\"content\":\"\\u5c11\\u65f6\\u8bf5\\u8bd7\\u4e66\\u6240\\u6240\\u6240\\u6240\\u6240\\u6240\"}}', 2, 1, 2, '2018-08-03 16:13:54');
INSERT INTO `we_kefu` VALUES (110, 'gh_7557b6fe18eb', 'oHIv-wXbgD_1q4Gh8anZZdRbRtZg', '少时诵诗书所所所所所所', 'text', '{\"touser\":\"oHIv-wXbgD_1q4Gh8anZZdRbRtZg1\",\"msgtype\":\"text\",\"text\":{\"content\":\"\\u5c11\\u65f6\\u8bf5\\u8bd7\\u4e66\\u6240\\u6240\\u6240\\u6240\\u6240\\u6240\"}}', 2, 1, 2, '2018-08-03 16:14:01');
INSERT INTO `we_kefu` VALUES (111, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', '啊啊啊啊', 'text', '{\"touser\":\"oHIv-wagNwj9P18vT51lhYc-y0zE1\",\"msgtype\":\"text\",\"text\":{\"content\":\"\\u554a\\u554a\\u554a\\u554a\"}}', 2, 1, 2, '2018-08-03 16:14:24');
INSERT INTO `we_kefu` VALUES (112, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', '454564545', 'text', '{\"touser\":\"oHIv-wagNwj9P18vT51lhYc-y0zE1\",\"msgtype\":\"text\",\"text\":{\"content\":\"454564545\"}}', 2, 1, 2, '2018-08-03 16:14:27');
INSERT INTO `we_kefu` VALUES (113, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', '啊啊啊啊', 'text', '{\"touser\":\"oHIv-wagNwj9P18vT51lhYc-y0zE1\",\"msgtype\":\"text\",\"text\":{\"content\":\"\\u554a\\u554a\\u554a\\u554a\"}}', 2, 1, 2, '2018-08-03 16:15:07');
INSERT INTO `we_kefu` VALUES (114, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', '啊啊啊啊', 'text', '{\"touser\":\"oHIv-wagNwj9P18vT51lhYc-y0zE1\",\"msgtype\":\"text\",\"text\":{\"content\":\"\\u554a\\u554a\\u554a\\u554a\"}}', 2, 1, 2, '2018-08-03 16:15:11');
INSERT INTO `we_kefu` VALUES (115, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', '123', 'text', '{\"touser\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\",\"msgtype\":\"text\",\"text\":{\"content\":\"123\"}}', 2, 1, 2, '2018-08-03 16:29:46');
INSERT INTO `we_kefu` VALUES (116, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', '发送', 'text', '{\"touser\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\",\"msgtype\":\"text\",\"text\":{\"content\":\"\\u53d1\\u9001\"}}', 2, 1, 1, '2018-08-03 16:29:47');
INSERT INTO `we_kefu` VALUES (117, 'gh_7557b6fe18eb', 'oHIv-wXbgD_1q4Gh8anZZdRbRtZg', '123', 'text', '{\"touser\":\"oHIv-wXbgD_1q4Gh8anZZdRbRtZg\",\"msgtype\":\"text\",\"text\":{\"content\":\"123\"}}', 2, 1, 2, '2018-08-03 16:29:57');
INSERT INTO `we_kefu` VALUES (118, 'gh_7557b6fe18eb', 'oHIv-wXbgD_1q4Gh8anZZdRbRtZg', '12', 'text', '{\"touser\":\"oHIv-wXbgD_1q4Gh8anZZdRbRtZg\",\"msgtype\":\"text\",\"text\":{\"content\":\"12\"}}', 2, 1, 2, '2018-08-03 16:30:16');
INSERT INTO `we_kefu` VALUES (119, 'gh_7557b6fe18eb', 'oHIv-wXbgD_1q4Gh8anZZdRbRtZg', '123', 'text', '{\"touser\":\"oHIv-wXbgD_1q4Gh8anZZdRbRtZg\",\"msgtype\":\"text\",\"text\":{\"content\":\"123\"}}', 2, 1, 2, '2018-08-03 16:31:08');
INSERT INTO `we_kefu` VALUES (120, 'gh_7557b6fe18eb', 'oHIv-wXbgD_1q4Gh8anZZdRbRtZg', '123', 'text', '{\"touser\":\"oHIv-wXbgD_1q4Gh8anZZdRbRtZg\",\"msgtype\":\"text\",\"text\":{\"content\":\"123\"}}', 2, 1, 2, '2018-08-03 16:33:34');
INSERT INTO `we_kefu` VALUES (121, 'gh_7557b6fe18eb', 'oHIv-wXbgD_1q4Gh8anZZdRbRtZg', '132', 'text', '{\"touser\":\"oHIv-wXbgD_1q4Gh8anZZdRbRtZg\",\"msgtype\":\"text\",\"text\":{\"content\":\"132\"}}', 2, 1, 2, '2018-08-03 16:34:12');
INSERT INTO `we_kefu` VALUES (122, 'gh_7557b6fe18eb', 'oHIv-wXbgD_1q4Gh8anZZdRbRtZg', '123', 'text', '{\"touser\":\"oHIv-wXbgD_1q4Gh8anZZdRbRtZg\",\"msgtype\":\"text\",\"text\":{\"content\":\"123\"}}', 2, 1, 2, '2018-08-03 16:37:55');
INSERT INTO `we_kefu` VALUES (123, 'gh_7557b6fe18eb', 'oHIv-wXbgD_1q4Gh8anZZdRbRtZg', '12\n45\n454', 'text', '{\"touser\":\"oHIv-wXbgD_1q4Gh8anZZdRbRtZg\",\"msgtype\":\"text\",\"text\":{\"content\":\"12\\n45\\n454\"}}', 2, 1, 2, '2018-08-03 16:55:56');
INSERT INTO `we_kefu` VALUES (124, 'gh_7557b6fe18eb', 'oHIv-wXbgD_1q4Gh8anZZdRbRtZg', '12\n45\n45\n45\n45\n45', 'text', '{\"touser\":\"oHIv-wXbgD_1q4Gh8anZZdRbRtZg\",\"msgtype\":\"text\",\"text\":{\"content\":\"12\\n45\\n45\\n45\\n45\\n45\"}}', 2, 1, 2, '2018-08-03 17:02:38');
INSERT INTO `we_kefu` VALUES (125, 'gh_7557b6fe18eb', 'oHIv-wXbgD_1q4Gh8anZZdRbRtZg', '12\n12\n12\n', 'text', '{\"touser\":\"oHIv-wXbgD_1q4Gh8anZZdRbRtZg\",\"msgtype\":\"text\",\"text\":{\"content\":\"12\\n12\\n12\\n\"}}', 2, 1, 2, '2018-08-03 17:03:48');
INSERT INTO `we_kefu` VALUES (126, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', '签到', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\",\"CreateTime\":\"1533287903\",\"MsgType\":\"text\",\"Content\":\"\\u7b7e\\u5230\",\"MsgId\":\"6585421399165863455\"}', 1, 1, 0, '2018-08-03 17:18:24');
INSERT INTO `we_kefu` VALUES (127, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', '图片', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\",\"CreateTime\":\"1533288867\",\"MsgType\":\"text\",\"Content\":\"\\u56fe\\u7247\",\"MsgId\":\"6585425539514336952\"}', 1, 1, 0, '2018-08-03 17:34:31');
INSERT INTO `we_kefu` VALUES (128, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', '测试测试', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\",\"CreateTime\":\"1533288885\",\"MsgType\":\"text\",\"Content\":\"\\u6d4b\\u8bd5\\u6d4b\\u8bd5\",\"MsgId\":\"6585425616823748283\"}', 1, 1, 0, '2018-08-03 17:34:46');
INSERT INTO `we_kefu` VALUES (129, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', '内容分发网络(CDN)是一种新型网络构建方式，它是为能在传统的IP网发布宽带丰富媒体而特别优化的网络覆盖层；而从广义的角度，CDN代表了一种基于质量与秩序的网络服务模式。\n简单地说，内容分发网络(CDN)是一个经策略性部署的整体系统，包括分布式存储、负载均衡、网络请求的重定向和内容管理4个要件，而内容管理和全局的网络流量管理(Traffic Management)是CDN的核心所在。通过用户就近性和服务器负载的判断，CDN确保内容以一种极为高效的方式为用户的请求提供服务。\n总的来说，内容服务基于缓存服务器，也称作代理缓存(Surrogate)，它位于网络的边缘，距用户仅有\"一跳\"(Single Hop)之遥。同时，代理缓存是内容提供商源服务器（通常位于CDN服务提供商的数据中心）的一个透明镜像。这样的架构使得CDN服务提供商能够代表他们客户，即内容供应商，向最终用户提供尽可能好的体验，而这些用户是不能容忍请求响应时间有任何延迟的。', 'text', '{\"touser\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\",\"msgtype\":\"text\",\"text\":{\"content\":\"\\u5185\\u5bb9\\u5206\\u53d1\\u7f51\\u7edc(CDN)\\u662f\\u4e00\\u79cd\\u65b0\\u578b\\u7f51\\u7edc\\u6784\\u5efa\\u65b9\\u5f0f\\uff0c\\u5b83\\u662f\\u4e3a\\u80fd\\u5728\\u4f20\\u7edf\\u7684IP\\u7f51\\u53d1\\u5e03\\u5bbd\\u5e26\\u4e30\\u5bcc\\u5a92\\u4f53\\u800c\\u7279\\u522b\\u4f18\\u5316\\u7684\\u7f51\\u7edc\\u8986\\u76d6\\u5c42\\uff1b\\u800c\\u4ece\\u5e7f\\u4e49\\u7684\\u89d2\\u5ea6\\uff0cCDN\\u4ee3\\u8868\\u4e86\\u4e00\\u79cd\\u57fa\\u4e8e\\u8d28\\u91cf\\u4e0e\\u79e9\\u5e8f\\u7684\\u7f51\\u7edc\\u670d\\u52a1\\u6a21\\u5f0f\\u3002\\n\\u7b80\\u5355\\u5730\\u8bf4\\uff0c\\u5185\\u5bb9\\u5206\\u53d1\\u7f51\\u7edc(CDN)\\u662f\\u4e00\\u4e2a\\u7ecf\\u7b56\\u7565\\u6027\\u90e8\\u7f72\\u7684\\u6574\\u4f53\\u7cfb\\u7edf\\uff0c\\u5305\\u62ec\\u5206\\u5e03\\u5f0f\\u5b58\\u50a8\\u3001\\u8d1f\\u8f7d\\u5747\\u8861\\u3001\\u7f51\\u7edc\\u8bf7\\u6c42\\u7684\\u91cd\\u5b9a\\u5411\\u548c\\u5185\\u5bb9\\u7ba1\\u74064\\u4e2a\\u8981\\u4ef6\\uff0c\\u800c\\u5185\\u5bb9\\u7ba1\\u7406\\u548c\\u5168\\u5c40\\u7684\\u7f51\\u7edc\\u6d41\\u91cf\\u7ba1\\u7406(Traffic Management)\\u662fCDN\\u7684\\u6838\\u5fc3\\u6240\\u5728\\u3002\\u901a\\u8fc7\\u7528\\u6237\\u5c31\\u8fd1\\u6027\\u548c\\u670d\\u52a1\\u5668\\u8d1f\\u8f7d\\u7684\\u5224\\u65ad\\uff0cCDN\\u786e\\u4fdd\\u5185\\u5bb9\\u4ee5\\u4e00\\u79cd\\u6781\\u4e3a\\u9ad8\\u6548\\u7684\\u65b9\\u5f0f\\u4e3a\\u7528\\u6237\\u7684\\u8bf7\\u6c42\\u63d0\\u4f9b\\u670d\\u52a1\\u3002\\n\\u603b\\u7684\\u6765\\u8bf4\\uff0c\\u5185\\u5bb9\\u670d\\u52a1\\u57fa\\u4e8e\\u7f13\\u5b58\\u670d\\u52a1\\u5668\\uff0c\\u4e5f\\u79f0\\u4f5c\\u4ee3\\u7406\\u7f13\\u5b58(Surrogate)\\uff0c\\u5b83\\u4f4d\\u4e8e\\u7f51\\u7edc\\u7684\\u8fb9\\u7f18\\uff0c\\u8ddd\\u7528\\u6237\\u4ec5\\u6709\\\"\\u4e00\\u8df3\\\"(Single Hop)\\u4e4b\\u9065\\u3002\\u540c\\u65f6\\uff0c\\u4ee3\\u7406\\u7f13\\u5b58\\u662f\\u5185\\u5bb9\\u63d0\\u4f9b\\u5546\\u6e90\\u670d\\u52a1\\u5668\\uff08\\u901a\\u5e38\\u4f4d\\u4e8eCDN\\u670d\\u52a1\\u63d0\\u4f9b\\u5546\\u7684\\u6570\\u636e\\u4e2d\\u5fc3\\uff09\\u7684\\u4e00\\u4e2a\\u900f\\u660e\\u955c\\u50cf\\u3002\\u8fd9\\u6837\\u7684\\u67b6\\u6784\\u4f7f\\u5f97CDN\\u670d\\u52a1\\u63d0\\u4f9b\\u5546\\u80fd\\u591f\\u4ee3\\u8868\\u4ed6\\u4eec\\u5ba2\\u6237\\uff0c\\u5373\\u5185\\u5bb9\\u4f9b\\u5e94\\u5546\\uff0c\\u5411\\u6700\\u7ec8\\u7528\\u6237\\u63d0\\u4f9b\\u5c3d\\u53ef\\u80fd\\u597d\\u7684\\u4f53\\u9a8c\\uff0c\\u800c\\u8fd9\\u4e9b\\u7528\\u6237\\u662f\\u4e0d\\u80fd\\u5bb9\\u5fcd\\u8bf7\\u6c42\\u54cd\\u5e94\\u65f6\\u95f4\\u6709\\u4efb\\u4f55\\u5ef6\\u8fdf\\u7684\\u3002\"}}', 2, 1, 1, '2018-08-03 17:37:15');
INSERT INTO `we_kefu` VALUES (130, 'gh_7557b6fe18eb', 'oHIv-wXbgD_1q4Gh8anZZdRbRtZg', '12\n12\n12', 'text', '{\"touser\":\"oHIv-wXbgD_1q4Gh8anZZdRbRtZg\",\"msgtype\":\"text\",\"text\":{\"content\":\"12\\n12\\n12\"}}', 2, 1, 2, '2018-08-03 17:40:51');
INSERT INTO `we_kefu` VALUES (131, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', 'fdsfds', 'text', '{\"touser\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\",\"msgtype\":\"text\",\"text\":{\"content\":\"fdsfds\"}}', 2, 1, 1, '2018-08-03 17:47:01');
INSERT INTO `we_kefu` VALUES (132, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', 'fsdfsfdsfds', 'text', '{\"touser\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\",\"msgtype\":\"text\",\"text\":{\"content\":\"fsdfsfdsfds\"}}', 2, 1, 1, '2018-08-03 17:49:31');
INSERT INTO `we_kefu` VALUES (133, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', 'fdsfadaf43434', 'text', '{\"touser\":\"oHIv-wagNwj9P18vT51lhYc-y0zE\",\"msgtype\":\"text\",\"text\":{\"content\":\"fdsfadaf43434\"}}', 2, 1, 1, '2018-08-03 17:49:47');
INSERT INTO `we_kefu` VALUES (134, 'gh_7557b6fe18eb', 'oHIv-wXbgD_1q4Gh8anZZdRbRtZg', '哈哈哈', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wXbgD_1q4Gh8anZZdRbRtZg\",\"CreateTime\":\"1533289848\",\"MsgType\":\"text\",\"Content\":\"\\u54c8\\u54c8\\u54c8\",\"MsgId\":\"6585429752877254496\"}', 1, 1, 0, '2018-08-03 17:50:51');
INSERT INTO `we_kefu` VALUES (135, 'gh_7557b6fe18eb', 'oHIv-wXbgD_1q4Gh8anZZdRbRtZg', '哈哈哈', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wXbgD_1q4Gh8anZZdRbRtZg\",\"CreateTime\":\"1533289851\",\"MsgType\":\"text\",\"Content\":\"\\u54c8\\u54c8\\u54c8\",\"MsgId\":\"6585429765762156385\"}', 1, 1, 0, '2018-08-03 17:50:53');
INSERT INTO `we_kefu` VALUES (136, 'gh_7557b6fe18eb', 'oHIv-wXbgD_1q4Gh8anZZdRbRtZg', '哦哦哦', 'text', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wXbgD_1q4Gh8anZZdRbRtZg\",\"CreateTime\":\"1533289854\",\"MsgType\":\"text\",\"Content\":\"\\u54e6\\u54e6\\u54e6\",\"MsgId\":\"6585429778647058276\"}', 1, 1, 0, '2018-08-03 17:50:56');
INSERT INTO `we_kefu` VALUES (137, 'gh_7557b6fe18eb', 'oHIv-wXbgD_1q4Gh8anZZdRbRtZg', 'fdsfsfdsf', 'text', '{\"touser\":\"oHIv-wXbgD_1q4Gh8anZZdRbRtZg\",\"msgtype\":\"text\",\"text\":{\"content\":\"fdsfsfdsf\"}}', 2, 1, 1, '2018-08-03 17:51:27');
INSERT INTO `we_kefu` VALUES (138, 'gh_7557b6fe18eb', 'oHIv-wXbgD_1q4Gh8anZZdRbRtZg', '1.付费\n2.444 \n3。房管局很多国家', 'text', '{\"touser\":\"oHIv-wXbgD_1q4Gh8anZZdRbRtZg\",\"msgtype\":\"text\",\"text\":{\"content\":\"1.\\u4ed8\\u8d39\\n2.444 \\n3\\u3002\\u623f\\u7ba1\\u5c40\\u5f88\\u591a\\u56fd\\u5bb6\"}}', 2, 1, 2, '2018-08-03 17:51:27');
INSERT INTO `we_kefu` VALUES (139, 'gh_7557b6fe18eb', 'oHIv-wXbgD_1q4Gh8anZZdRbRtZg', '1', 'text', '{\"touser\":\"oHIv-wXbgD_1q4Gh8anZZdRbRtZg\",\"msgtype\":\"text\",\"text\":{\"content\":\"1\"}}', 2, 1, 2, '2018-08-03 18:07:52');

-- ----------------------------
-- Table structure for we_server_log
-- ----------------------------
DROP TABLE IF EXISTS `we_server_log`;
CREATE TABLE `we_server_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `to_user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '对哪个公众号的产生的事件',
  `msgtype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `event` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `eventkey` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `createtime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_toUserName`(`to_user_name`) USING BTREE,
  INDEX `index_openid`(`openid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '接收微信服务器返回的消息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of we_server_log
-- ----------------------------
INSERT INTO `we_server_log` VALUES (1, 'o3InpjoCRWb9F7z8jhQpHudmL7IE', 'gh_2fcf480ac2ac', 'event', 'SCAN', 'hello', '{\"ToUserName\":\"gh_2fcf480ac2ac\",\"FromUserName\":\"o3InpjoCRWb9F7z8jhQpHudmL7IE\",\"CreateTime\":\"1526889776\",\"MsgType\":\"event\",\"Event\":\"SCAN\",\"EventKey\":\"hello\",\"Ticket\":\"gQE_7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyZk5wU0poczliRmUxZUNlM3hyY3kAAgQmfQJbAwSAUQEA\"}', '2018-05-21 16:02:56');
INSERT INTO `we_server_log` VALUES (2, 'o3InpjoCRWb9F7z8jhQpHudmL7IE', 'gh_2fcf480ac2ac', 'event', 'SCAN', 'hello', '{\"ToUserName\":\"gh_2fcf480ac2ac\",\"FromUserName\":\"o3InpjoCRWb9F7z8jhQpHudmL7IE\",\"CreateTime\":\"1526889786\",\"MsgType\":\"event\",\"Event\":\"SCAN\",\"EventKey\":\"hello\",\"Ticket\":\"gQE_7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyZk5wU0poczliRmUxZUNlM3hyY3kAAgQmfQJbAwSAUQEA\"}', '2018-05-21 16:03:06');
INSERT INTO `we_server_log` VALUES (3, 'o3InpjoCRWb9F7z8jhQpHudmL7IE', 'gh_2fcf480ac2ac', 'event', 'VIEW', 'http://m.zwmedia.com.cn/highlander0321', '{\"ToUserName\":\"gh_2fcf480ac2ac\",\"FromUserName\":\"o3InpjoCRWb9F7z8jhQpHudmL7IE\",\"CreateTime\":\"1526890048\",\"MsgType\":\"event\",\"Event\":\"VIEW\",\"EventKey\":\"http:\\/\\/m.zwmedia.com.cn\\/highlander0321\",\"MenuId\":\"428415309\"}', '2018-05-21 16:07:28');
INSERT INTO `we_server_log` VALUES (4, 'o3InpjoCRWb9F7z8jhQpHudmL7IE', 'gh_2fcf480ac2ac', 'event', 'VIEW', 'http://m.zwmedia.com.cn/zx150925', '{\"ToUserName\":\"gh_2fcf480ac2ac\",\"FromUserName\":\"o3InpjoCRWb9F7z8jhQpHudmL7IE\",\"CreateTime\":\"1526890051\",\"MsgType\":\"event\",\"Event\":\"VIEW\",\"EventKey\":\"http:\\/\\/m.zwmedia.com.cn\\/zx150925\",\"MenuId\":\"428415309\"}', '2018-05-21 16:07:31');
INSERT INTO `we_server_log` VALUES (5, 'o3InpjoCRWb9F7z8jhQpHudmL7IE', 'gh_2fcf480ac2ac', 'event', 'VIEW', 'http://www.baidu.com', '{\"ToUserName\":\"gh_2fcf480ac2ac\",\"FromUserName\":\"o3InpjoCRWb9F7z8jhQpHudmL7IE\",\"CreateTime\":\"1526890074\",\"MsgType\":\"event\",\"Event\":\"VIEW\",\"EventKey\":\"http:\\/\\/www.baidu.com\",\"MenuId\":\"428415309\"}', '2018-05-21 16:07:54');
INSERT INTO `we_server_log` VALUES (6, 'o3InpjoCRWb9F7z8jhQpHudmL7IE', 'gh_2fcf480ac2ac', 'event', 'SCAN', 'hello', '{\"ToUserName\":\"gh_2fcf480ac2ac\",\"FromUserName\":\"o3InpjoCRWb9F7z8jhQpHudmL7IE\",\"CreateTime\":\"1526890620\",\"MsgType\":\"event\",\"Event\":\"SCAN\",\"EventKey\":\"hello\",\"Ticket\":\"gQE_7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyZk5wU0poczliRmUxZUNlM3hyY3kAAgQmfQJbAwSAUQEA\"}', '2018-05-21 16:17:00');
INSERT INTO `we_server_log` VALUES (7, 'o3InpjoCRWb9F7z8jhQpHudmL7IE', 'gh_2fcf480ac2ac', 'event', 'unsubscribe', '', '{\"ToUserName\":\"gh_2fcf480ac2ac\",\"FromUserName\":\"o3InpjoCRWb9F7z8jhQpHudmL7IE\",\"CreateTime\":\"1526890627\",\"MsgType\":\"event\",\"Event\":\"unsubscribe\",\"EventKey\":{}}', '2018-05-21 16:17:07');
INSERT INTO `we_server_log` VALUES (8, 'o3InpjoCRWb9F7z8jhQpHudmL7IE', 'gh_2fcf480ac2ac', 'event', 'subscribe', 'qrscene_hello', '{\"ToUserName\":\"gh_2fcf480ac2ac\",\"FromUserName\":\"o3InpjoCRWb9F7z8jhQpHudmL7IE\",\"CreateTime\":\"1526890632\",\"MsgType\":\"event\",\"Event\":\"subscribe\",\"EventKey\":\"qrscene_hello\",\"Ticket\":\"gQE_7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyZk5wU0poczliRmUxZUNlM3hyY3kAAgQmfQJbAwSAUQEA\"}', '2018-05-21 16:17:12');
INSERT INTO `we_server_log` VALUES (9, 'o3InpjoCRWb9F7z8jhQpHudmL7IE', 'gh_2fcf480ac2ac', 'event', 'unsubscribe', '', '{\"ToUserName\":\"gh_2fcf480ac2ac\",\"FromUserName\":\"o3InpjoCRWb9F7z8jhQpHudmL7IE\",\"CreateTime\":\"1526891523\",\"MsgType\":\"event\",\"Event\":\"unsubscribe\",\"EventKey\":{}}', '2018-05-21 16:32:03');
INSERT INTO `we_server_log` VALUES (10, 'o3InpjoCRWb9F7z8jhQpHudmL7IE', 'gh_2fcf480ac2ac', 'event', 'subscribe', '', '{\"ToUserName\":\"gh_2fcf480ac2ac\",\"FromUserName\":\"o3InpjoCRWb9F7z8jhQpHudmL7IE\",\"CreateTime\":\"1526891540\",\"MsgType\":\"event\",\"Event\":\"subscribe\",\"EventKey\":{}}', '2018-05-21 16:32:20');
INSERT INTO `we_server_log` VALUES (11, 'o3InpjoCRWb9F7z8jhQpHudmL7IE', 'gh_2fcf480ac2ac', 'event', 'unsubscribe', '', '{\"ToUserName\":\"gh_2fcf480ac2ac\",\"FromUserName\":\"o3InpjoCRWb9F7z8jhQpHudmL7IE\",\"CreateTime\":\"1526891839\",\"MsgType\":\"event\",\"Event\":\"unsubscribe\",\"EventKey\":{}}', '2018-05-21 16:37:19');
INSERT INTO `we_server_log` VALUES (12, 'o3InpjoCRWb9F7z8jhQpHudmL7IE', 'gh_2fcf480ac2ac', 'event', 'subscribe', 'qrscene_hello', '{\"ToUserName\":\"gh_2fcf480ac2ac\",\"FromUserName\":\"o3InpjoCRWb9F7z8jhQpHudmL7IE\",\"CreateTime\":\"1526891848\",\"MsgType\":\"event\",\"Event\":\"subscribe\",\"EventKey\":\"qrscene_hello\",\"Ticket\":\"gQE_7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyZk5wU0poczliRmUxZUNlM3hyY3kAAgQmfQJbAwSAUQEA\"}', '2018-05-21 16:37:28');
INSERT INTO `we_server_log` VALUES (13, 'o3InpjoCRWb9F7z8jhQpHudmL7IE', 'gh_2fcf480ac2ac', 'event', 'SCAN', 'hello', '{\"ToUserName\":\"gh_2fcf480ac2ac\",\"FromUserName\":\"o3InpjoCRWb9F7z8jhQpHudmL7IE\",\"CreateTime\":\"1526956739\",\"MsgType\":\"event\",\"Event\":\"SCAN\",\"EventKey\":\"hello\",\"Ticket\":\"gQE_7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyZk5wU0poczliRmUxZUNlM3hyY3kAAgQmfQJbAwSAUQEA\"}', '2018-05-22 10:38:59');
INSERT INTO `we_server_log` VALUES (14, 'o3InpjpiZVkpzjFhjbzbDtmTTGKY', 'gh_2fcf480ac2ac', 'event', 'unsubscribe', '', '{\"ToUserName\":\"gh_2fcf480ac2ac\",\"FromUserName\":\"o3InpjpiZVkpzjFhjbzbDtmTTGKY\",\"CreateTime\":\"1526959609\",\"MsgType\":\"event\",\"Event\":\"unsubscribe\",\"EventKey\":{}}', '2018-05-22 11:26:49');
INSERT INTO `we_server_log` VALUES (15, 'o3InpjpiZVkpzjFhjbzbDtmTTGKY', 'gh_2fcf480ac2ac', 'event', 'subscribe', '', '{\"ToUserName\":\"gh_2fcf480ac2ac\",\"FromUserName\":\"o3InpjpiZVkpzjFhjbzbDtmTTGKY\",\"CreateTime\":\"1526959612\",\"MsgType\":\"event\",\"Event\":\"subscribe\",\"EventKey\":{}}', '2018-05-22 11:26:52');
INSERT INTO `we_server_log` VALUES (16, 'o3InpjpiZVkpzjFhjbzbDtmTTGKY', 'gh_2fcf480ac2ac', 'event', 'unsubscribe', '', '{\"ToUserName\":\"gh_2fcf480ac2ac\",\"FromUserName\":\"o3InpjpiZVkpzjFhjbzbDtmTTGKY\",\"CreateTime\":\"1526959768\",\"MsgType\":\"event\",\"Event\":\"unsubscribe\",\"EventKey\":{}}', '2018-05-22 11:29:28');
INSERT INTO `we_server_log` VALUES (17, 'o3InpjpiZVkpzjFhjbzbDtmTTGKY', 'gh_2fcf480ac2ac', 'event', 'subscribe', '', '{\"ToUserName\":\"gh_2fcf480ac2ac\",\"FromUserName\":\"o3InpjpiZVkpzjFhjbzbDtmTTGKY\",\"CreateTime\":\"1526959770\",\"MsgType\":\"event\",\"Event\":\"subscribe\",\"EventKey\":{}}', '2018-05-22 11:29:30');
INSERT INTO `we_server_log` VALUES (18, 'o3InpjpiZVkpzjFhjbzbDtmTTGKY', 'gh_2fcf480ac2ac', 'event', 'unsubscribe', '', '{\"ToUserName\":\"gh_2fcf480ac2ac\",\"FromUserName\":\"o3InpjpiZVkpzjFhjbzbDtmTTGKY\",\"CreateTime\":\"1526959784\",\"MsgType\":\"event\",\"Event\":\"unsubscribe\",\"EventKey\":{}}', '2018-05-22 11:29:44');
INSERT INTO `we_server_log` VALUES (19, 'o3InpjpiZVkpzjFhjbzbDtmTTGKY', 'gh_2fcf480ac2ac', 'event', 'subscribe', '', '{\"ToUserName\":\"gh_2fcf480ac2ac\",\"FromUserName\":\"o3InpjpiZVkpzjFhjbzbDtmTTGKY\",\"CreateTime\":\"1526959786\",\"MsgType\":\"event\",\"Event\":\"subscribe\",\"EventKey\":{}}', '2018-05-22 11:29:46');
INSERT INTO `we_server_log` VALUES (20, 'o3InpjoCRWb9F7z8jhQpHudmL7IE', 'gh_2fcf480ac2ac', 'event', 'unsubscribe', '', '{\"ToUserName\":\"gh_2fcf480ac2ac\",\"FromUserName\":\"o3InpjoCRWb9F7z8jhQpHudmL7IE\",\"CreateTime\":\"1530684140\",\"MsgType\":\"event\",\"Event\":\"unsubscribe\",\"EventKey\":{}}', '2018-07-04 14:02:20');
INSERT INTO `we_server_log` VALUES (21, 'o3InpjoCRWb9F7z8jhQpHudmL7IE', 'gh_2fcf480ac2ac', 'event', 'subscribe', '', '{\"ToUserName\":\"gh_2fcf480ac2ac\",\"FromUserName\":\"o3InpjoCRWb9F7z8jhQpHudmL7IE\",\"CreateTime\":\"1530684159\",\"MsgType\":\"event\",\"Event\":\"subscribe\",\"EventKey\":{}}', '2018-07-04 14:02:39');
INSERT INTO `we_server_log` VALUES (22, 'o3InpjoCRWb9F7z8jhQpHudmL7IE', 'gh_2fcf480ac2ac', 'event', 'SCAN', 'young', '{\"ToUserName\":\"gh_2fcf480ac2ac\",\"FromUserName\":\"o3InpjoCRWb9F7z8jhQpHudmL7IE\",\"CreateTime\":\"1530684198\",\"MsgType\":\"event\",\"Event\":\"SCAN\",\"EventKey\":\"young\",\"Ticket\":\"gQFr7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyampnU0pRczliRmUxMHQ2X3hyY2kAAgQdYzxbAwQAowIA\"}', '2018-07-04 14:03:18');
INSERT INTO `we_server_log` VALUES (23, 'o3InpjoCRWb9F7z8jhQpHudmL7IE', 'gh_2fcf480ac2ac', 'event', 'SCAN', 'young', '{\"ToUserName\":\"gh_2fcf480ac2ac\",\"FromUserName\":\"o3InpjoCRWb9F7z8jhQpHudmL7IE\",\"CreateTime\":\"1530684207\",\"MsgType\":\"event\",\"Event\":\"SCAN\",\"EventKey\":\"young\",\"Ticket\":\"gQFr7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyampnU0pRczliRmUxMHQ2X3hyY2kAAgQdYzxbAwQAowIA\"}', '2018-07-04 14:03:27');
INSERT INTO `we_server_log` VALUES (24, 'o3Inpjop7ROQ0nBTUoC7x32MPCBE', 'gh_2fcf480ac2ac', 'event', 'unsubscribe', '', '{\"ToUserName\":\"gh_2fcf480ac2ac\",\"FromUserName\":\"o3Inpjop7ROQ0nBTUoC7x32MPCBE\",\"CreateTime\":\"1530692338\",\"MsgType\":\"event\",\"Event\":\"unsubscribe\",\"EventKey\":{}}', '2018-07-04 16:18:58');
INSERT INTO `we_server_log` VALUES (25, 'o3InpjoCRWb9F7z8jhQpHudmL7IE', 'gh_2fcf480ac2ac', 'event', 'SCAN', 'young', '{\"ToUserName\":\"gh_2fcf480ac2ac\",\"FromUserName\":\"o3InpjoCRWb9F7z8jhQpHudmL7IE\",\"CreateTime\":\"1530754674\",\"MsgType\":\"event\",\"Event\":\"SCAN\",\"EventKey\":\"young\",\"Ticket\":\"gQFr7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyampnU0pRczliRmUxMHQ2X3hyY2kAAgQdYzxbAwQAowIA\"}', '2018-07-05 09:37:54');
INSERT INTO `we_server_log` VALUES (26, 'o3InpjjBja62QCyv1i_QcVqH47g0', 'gh_2fcf480ac2ac', 'event', 'unsubscribe', '', '{\"ToUserName\":\"gh_2fcf480ac2ac\",\"FromUserName\":\"o3InpjjBja62QCyv1i_QcVqH47g0\",\"CreateTime\":\"1532745862\",\"MsgType\":\"event\",\"Event\":\"unsubscribe\",\"EventKey\":{}}', '2018-07-28 10:44:22');
INSERT INTO `we_server_log` VALUES (27, 'o3InpjooyQBUn0slaQxNB6GlF1y4', 'gh_2fcf480ac2ac', 'event', 'VIEW', 'http://m.zwmedia.com.cn/highlander0321', '{\"ToUserName\":\"gh_2fcf480ac2ac\",\"FromUserName\":\"o3InpjooyQBUn0slaQxNB6GlF1y4\",\"CreateTime\":\"1532932487\",\"MsgType\":\"event\",\"Event\":\"VIEW\",\"EventKey\":\"http:\\/\\/m.zwmedia.com.cn\\/highlander0321\",\"MenuId\":\"429687410\"}', '2018-07-30 14:34:47');
INSERT INTO `we_server_log` VALUES (28, 'o3InpjooyQBUn0slaQxNB6GlF1y4', 'gh_2fcf480ac2ac', 'event', 'VIEW', 'http://m.zwmedia.com.cn/zx150925', '{\"ToUserName\":\"gh_2fcf480ac2ac\",\"FromUserName\":\"o3InpjooyQBUn0slaQxNB6GlF1y4\",\"CreateTime\":\"1532932491\",\"MsgType\":\"event\",\"Event\":\"VIEW\",\"EventKey\":\"http:\\/\\/m.zwmedia.com.cn\\/zx150925\",\"MenuId\":\"429687410\"}', '2018-07-30 14:34:51');
INSERT INTO `we_server_log` VALUES (29, 'oHIv-we6jCytlzrD0yCnXRfCtF80', 'gh_7557b6fe18eb', 'event', 'subscribe', '', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-we6jCytlzrD0yCnXRfCtF80\",\"CreateTime\":\"1533195342\",\"MsgType\":\"event\",\"Event\":\"subscribe\",\"EventKey\":{}}', '2018-08-02 15:35:42');
INSERT INTO `we_server_log` VALUES (30, 'oHIv-wTV7dAr-RLfZMwSkCUp_GlM', 'gh_7557b6fe18eb', 'event', 'subscribe', '', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wTV7dAr-RLfZMwSkCUp_GlM\",\"CreateTime\":\"1533200080\",\"MsgType\":\"event\",\"Event\":\"subscribe\",\"EventKey\":{}}', '2018-08-02 16:54:40');
INSERT INTO `we_server_log` VALUES (31, 'oHIv-wTV7dAr-RLfZMwSkCUp_GlM', 'gh_7557b6fe18eb', 'event', 'VIEW', 'http://www.baidu.com', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wTV7dAr-RLfZMwSkCUp_GlM\",\"CreateTime\":\"1533279169\",\"MsgType\":\"event\",\"Event\":\"VIEW\",\"EventKey\":\"http:\\/\\/www.baidu.com\",\"MenuId\":\"427917189\"}', '2018-08-03 14:52:49');
INSERT INTO `we_server_log` VALUES (32, 'oHIv-wSlW-7Ap09QPGolQQlPYnYc', 'gh_7557b6fe18eb', 'event', 'subscribe', '', '{\"ToUserName\":\"gh_7557b6fe18eb\",\"FromUserName\":\"oHIv-wSlW-7Ap09QPGolQQlPYnYc\",\"CreateTime\":\"1533279385\",\"MsgType\":\"event\",\"Event\":\"subscribe\",\"EventKey\":{}}', '2018-08-03 14:56:25');

-- ----------------------------
-- Table structure for we_client_user
-- ----------------------------
DROP TABLE IF EXISTS `we_client_user`;
CREATE TABLE `we_client_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wechatid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公众号的微信号',
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户OPENID',
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `headimgurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `sex` tinyint(2) NULL DEFAULT NULL COMMENT '用户性别',
  `subscribe` tinyint(2) NULL DEFAULT NULL COMMENT '关注状态 0 未关注 1 已关注',
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户所在城市',
  `country` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户所在国家',
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户所在省份',
  `language` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户的语言',
  `subscribe_time` datetime(0) NULL DEFAULT NULL COMMENT '用户关注时间,如果用户曾多次关注,则取最后关注时间',
  `unionid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '只用在用户将公众号绑定到微信开放平台账号后,才会出现该字段',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公众号运营者对粉丝的备注，公众号运营者可在微信公众平台用户管理界面对粉丝添加备注',
  `groupid` int(11) NULL DEFAULT NULL COMMENT '用户所在的分组ID（兼容旧的用户分组接口）',
  `tagid_list` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户被打上的标签ID列表',
  `subscribe_scene` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '返回用户关注的渠道来源，ADD_SCENE_SEARCH 公众号搜索，ADD_SCENE_ACCOUNT_MIGRATION 公众号迁移，ADD_SCENE_PROFILE_CARD 名片分享，ADD_SCENE_QR_CODE 扫描二维码，ADD_SCENEPROFILE LINK 图文页内名称点击，ADD_SCENE_PROFILE_ITEM 图文页右上角菜单，ADD_SCENE_PAID 支付后关注，ADD_SCENE_OTHERS 其他',
  `qr_scene` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '二维码扫码场景（开发者自定义）',
  `qr_scene_str` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '二维码扫码场景描述（开发者自定义）',
  `createtime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公众号用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of we_client_user
-- ----------------------------
INSERT INTO `we_client_user` VALUES (6, 'gh_7557b6fe18eb', 'oHIv-wagNwj9P18vT51lhYc-y0zE', 'จุ๊บ', 'http://thirdwx.qlogo.cn/mmopen/ajNVdqHZLLBu0Hp4NUbDq0EUgkIm5iaqeF63Apubyj1YvYPtVqMnOIyCjaAucDTVS8NFaDDicmzUmFewYCKRQzvw/132', 1, 1, '', '中国', '上海', 'zh_CN', '2018-07-07 10:41:23', '', '', 0, '[]', 'ADD_SCENE_QR_CODE', '0', '', '2018-08-02 15:05:35', '2018-08-02 15:05:35');
INSERT INTO `we_client_user` VALUES (7, 'gh_7557b6fe18eb', 'oHIv-wXbgD_1q4Gh8anZZdRbRtZg', '。。。', 'http://thirdwx.qlogo.cn/mmopen/2EeibkTp2yCEGiaP7vkZiazuXEU1MCzVwDNIgV1GI7QlHAicib7Q8q8bNs8FxoA4Bp1K7LvFSr7cRZqlwYiaEFUSefBteOzkjMcuBj/132', 2, 1, '', '特立尼达和多巴哥', '', 'zh_CN', '2017-12-26 14:24:02', '', '', 0, '[]', 'ADD_SCENE_QR_CODE', '0', '', '2018-08-02 15:11:13', '2018-08-02 15:11:13');
INSERT INTO `we_client_user` VALUES (8, 'gh_7557b6fe18eb', 'oHIv-we6jCytlzrD0yCnXRfCtF80', 'July', 'http://thirdwx.qlogo.cn/mmopen/9WOYib8WKib2kxGrH8W5WFCLXnoN21Sh8vZj6kia2vKKNG1FQ54ehUHQz63GOiaOyEWYZMyO3spPQU8yVrm5T72ibUg/132', 1, 1, '芜湖', '中国', '安徽', 'zh_CN', '2018-08-02 15:35:42', '', '', 0, '[]', 'ADD_SCENE_QR_CODE', '0', '', '2018-08-02 15:35:43', '2018-08-02 15:35:43');
INSERT INTO `we_client_user` VALUES (9, 'gh_7557b6fe18eb', 'oHIv-wTV7dAr-RLfZMwSkCUp_GlM', 'Amos', 'http://thirdwx.qlogo.cn/mmopen/ATYxrD1ppNlg0EQyg778zPib4MvDk0KMASqWD3f08fWS1c2w6sOBUsEr4ibwVaQrJ5RFRhjLW6CfGeHhbmC8DWMKXj5ykJWSdF/132', 1, 1, '青浦', '中国', '上海', 'zh_CN', '2018-08-02 16:54:40', '', '', 0, '[]', 'ADD_SCENE_QR_CODE', '0', '', '2018-08-02 16:54:42', '2018-08-02 16:54:42');
INSERT INTO `we_client_user` VALUES (10, 'gh_7557b6fe18eb', 'oHIv-wSlW-7Ap09QPGolQQlPYnYc', '邱宇航  Pm', 'http://thirdwx.qlogo.cn/mmopen/ajNVdqHZLLDu6smicn0mTTxaoD73z83NxibNzeMicia0AGEEyhnLs3xGQTqzU4y8yjC9NLuYnPJzM5BJ9NiaF2GUW5g/132', 1, 1, '亳州', '中国', '安徽', 'zh_CN', '2018-08-03 14:56:25', '', '', 0, '[]', 'ADD_SCENE_QR_CODE', '0', '', '2018-08-03 14:56:27', '2018-08-03 14:56:27');

-- ----------------------------
-- Table structure for we_wechat_config
-- ----------------------------
DROP TABLE IF EXISTS `we_wechat_config`;
CREATE TABLE `we_wechat_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '所属用户ID',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '公众号名称',
  `wechatid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '微信号',
  `appid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `appsecret` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `token` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `encodingaeskey` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '状态 0表示未使用 1 表示使用中',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '开发者模式的URL',
  `createtime` datetime(0) NULL DEFAULT '1900-01-01 00:00:00',
  `updatetime` datetime(0) NULL DEFAULT '1900-01-01 00:00:00',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_appid`(`appid`) USING BTREE,
  INDEX `index_uid`(`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公众号配置信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of we_wechat_config
-- ----------------------------
INSERT INTO `we_wechat_config` VALUES (6, '1', '掌握传媒', 'gh_2fcf480ac2ac', 'wxf42302be9b7152f8', 'f64ec46639dd6e3c48c7fe5a9ec9f13e', 'zwmedia', 'HCnm46mQ5A3If8sZBCfIsnoU4eKsypK7D24W3iYzg1T', 0, 'http://uat.zwmedia.com.cn/jiansheng/WechatDevApi/public/index.php/ZWCM', '2018-05-22 11:06:16', '2018-08-03 16:02:41');
INSERT INTO `we_wechat_config` VALUES (9, '1', '无脸测试', 'gh_7557b6fe18eb', 'wx7ad4ce9789a311ea', '67083c9d2d66055bdea6a20b63edcb3c', 'songphper', '', 1, 'http://uat.zwmedia.com.cn/jiansheng/WechatDevApi/public/index.php/WLCS', '2018-06-06 12:05:26', '2018-08-03 16:02:41');

SET FOREIGN_KEY_CHECKS = 1;
