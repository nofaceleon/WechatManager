<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

// [ 应用入口文件 ]
namespace think;

// 加载基础文件
require __DIR__ . '/../thinkphp/base.php';


define('DEBUG_MODEL',true); //是否是测试环境
define('CONFIG_URL','http://uat.zwmedia.com.cn/jiansheng/WechatDevApi/public/index.php/'); //配置默认的网站域名
// 执行应用并响应
Container::get('app')->run()->send();
