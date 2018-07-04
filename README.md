# 微信开发者后台VUE版本

#### 项目介绍
适用于vue的后台接口

1.一个后台账号只能生成一个公众号信息

2.代码上传的时候,一般只需要上传application文件夹就行了

3.正常情况下 route/route.php 和 config/database.php 这两个文件是不需要修改的(因为正式环境的配置跟测试环境的配置是不一样的)

####数据库修改日志:
 
1.(2018-7-2 11:41:10)we_auto_reply表中的 reply 字段类型改为text,并增加remark字段
```sql
ALTER TABLE `we_auto_reply`
MODIFY COLUMN `reply`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '回复的内容' AFTER `keyword`,
ADD COLUMN `remark`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `qrinfo`;
```


2.创建图片素材库表

```sql
CREATE TABLE `we_img_material` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appid` varchar(255) DEFAULT NULL COMMENT '公众号的appid',
  `media_id` varchar(255) DEFAULT NULL,
  `local_imgurl` varchar(255) DEFAULT NULL COMMENT '本地图片路径',
  `weixin_imgurl` varchar(255) DEFAULT NULL COMMENT '微信图片路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

```







