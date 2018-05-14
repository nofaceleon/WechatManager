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
Route::any('mrsong', 'index/WechatServer/index?appid=wx7ad4ce9789a311ea');
Route::any('wang', 'index/WechatServer/index?appid=wxfaa90d8812d78147');
Route::any('TLBCSGZH', 'index/WechatServer/index?appid=fdsfdsfsdfs');
Route::any('ZWCM', 'index/WechatServer/index?appid=wxf42302be9b7152f8');
Route::any('WLCS', 'index/WechatServer/index?appid=wx7ad4ce9789a311ea');
