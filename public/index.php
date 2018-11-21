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
define('CONFIG_URL','http://uat.zwmedia.com.cn/WechatDevApi/public/index.php/'); //配置默认的网站域名

//这些配置项都应该写到一个配置文件中，测试环境跟正式环境使用不同的配置文件，这样来区分，而不是在代码中进行区分
if(DEBUG_MODEL){
    define('IMG_URL',$_SERVER['REQUEST_SCHEME'] ?? 'http' . '://'.$_SERVER['HTTP_HOST'].'/WechatDevApi/uploads/'); //定义图片路径(测试环境)
}else{
    define('IMG_URL',$_SERVER['REQUEST_SCHEME'] ?? 'http'. '://'.$_SERVER['HTTP_HOST'].'/Wechatadmin/WechatDevApi/uploads/'); //定义图片路径(正式环境)
}

// 执行应用并响应
Container::get('app')->run()->send();
