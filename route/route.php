<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

//需要添加新的公众号的时候就需要在这里面新添加一条配置,当删除或者停用某个公众号,记得在这边删除指定路由

Route::any('CSGZH', 'index/WechatServer/index?appid=wx7ad4ce9789a311ea');
Route::any('fsf', 'index/WechatServer/index?appid=fds');
