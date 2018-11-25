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

//登录路由不需要验证登录
Route::any('index/login/userlogin','index/Login/userlogin'); //用户登录接口
Route::any('index/login/logout','index/Login/logout'); //退出登录接口
Route::any('/','index/index/index'); //首页接口

//所有的方法都生成一个路由 http://wechat.songphper.top/index/Autoreply/index.html
Route::group('index',function (){
//    Route::any('login/userlogin','index/Login/userlogin');
    Route::any('config/index','index/Config/index'); //获取公众号列表
    Route::any('config/getConfigInfo','index/Config/getConfigInfo'); //获取具体的配置信息
    Route::any('config/changeAccount','index/Config/changeAccount'); //切换公众号配置
    Route::any('config/updateConfig','index/Config/updateConfig')->middleware('checkAuth'); //修改公众号配置
    Route::any('config/addConfig','index/Config/addConfig')->middleware('checkAuth'); //添加公众号配置
    Route::any('config/delConfig','index/Config/delConfig')->middleware('checkAuth'); //删除公众号配置

    Route::any('autoreply/index','index/Autoreply/index'); //获取自动回复列表
    Route::any('autoreply/editReply','index/Autoreply/editReply')->middleware('checkAuth'); //修改自动回复
    Route::any('autoreply/addReply','index/Autoreply/addReply')->middleware('checkAuth'); //添加新的自动回复
    Route::any('autoreply/delReply','index/Autoreply/delReply')->middleware('checkAuth'); //删除自动回复
    Route::any('autoreply/exchangeStatus','index/Autoreply/exchangeStatus')->middleware('checkAuth'); //更改启用或者禁用的状态
    Route::any('autoreply/getQrcode','index/Autoreply/getQrcode')->middleware('checkAuth'); //获取生成的二维码
    Route::any('autoreply/getReplyInfo','index/Autoreply/getReplyInfo'); //获取自动回复的详细信息

    Route::any('customerinfo/getCustomerUserInfo','index/Customerinfo/getCustomerUserInfo'); //获取客户的基本信息
    Route::any('customerinfo/getUserTagInfo','index/Customerinfo/getUserTagInfo'); //获取客户的标签信息
    Route::any('customerinfo/saveTel','index/Customerinfo/saveTel'); //修改客户的手机号
    Route::any('customerinfo/getUserAllInfo','index/Customerinfo/getUserAllInfo'); //获取客户在平台的一些相关信息

    Route::any('imgmaterial/getImageUrl','index/Imgmaterial/getImageUrl'); //根据media_id获取图片路径
    Route::any('imgmaterial/getAllImg','index/Imgmaterial/getAllImg'); //获取所有素材

    Route::any('kefu/getAllImg','index/Kefu/getChatList'); //获取信息列表数据
    Route::any('kefu/getUserChatInfo','index/Kefu/getUserChatInfo'); //获取具体聊天信息
    Route::any('kefu/changeStatus','index/Kefu/changeStatus'); //更改消息状态



    Route::any('menu/index','index/Menu/index'); //获取公众号自定义菜单
    Route::any('menu/editMenu','index/Menu/editMenu')->middleware('checkAuth'); //编辑菜单信息
    Route::any('menu/getMenuInfo','index/Menu/getMenuInfo'); //获取菜单信息
    Route::any('menu/exchangeStatus','index/Menu/exchangeStatus')->middleware('checkAuth'); //更改启用状态
    Route::any('menu/addMenu','index/Menu/addMenu')->middleware('checkAuth'); //添加菜单
    Route::any('menu/getTopMenu','index/Menu/getTopMenu'); //获取所有的父级菜单
    Route::any('menu/delMenu','index/Menu/delMenu')->middleware('checkAuth'); //删除菜单


    Route::any('tag/addTag','index/Tag/addTag')->middleware('checkAuth','controller'); //添加用户标签
    Route::any('tag/getTag','index/Tag/getTag')->middleware('checkAuth','controller'); //获取用户标签
    Route::any('tag/delMenu','index/Tag/delMenu')->middleware('checkAuth','controller'); //删除菜单

    Route::any('userauth/index','index/Userauth/index')->middleware('checkAuth','controller'); //获取管理员用户列表
    Route::any('userauth/getAllRole','index/Userauth/getAllRole')->middleware('checkAuth','controller'); //获取所有角色
    Route::any('userauth/getAllRules','index/Userauth/getAllRules')->middleware('checkAuth','controller'); //获取所有权限
    Route::any('userauth/getAllRules','index/Userauth/getAllRules')->middleware('checkAuth','controller'); //获取所有权限
    Route::any('userauth/addUser','index/Userauth/addUser')->middleware('checkAuth','controller'); //添加新的管理员
    Route::any('userauth/delUser','index/Userauth/delUser')->middleware('checkAuth','controller'); //删除管理员
    Route::any('userauth/editUser','index/Userauth/editUser')->middleware('checkAuth','controller'); //编辑管理员
    Route::any('userauth/getUserInfo','index/Userauth/getUserInfo')->middleware('checkAuth','controller'); //获取管理员信息
    Route::any('userauth/addRole','index/Userauth/addRole')->middleware('checkAuth','controller'); //添加角色
    Route::any('userauth/editRole','index/Userauth/editRole')->middleware('checkAuth','controller'); //编辑角色
    Route::any('userauth/delRole','index/Userauth/delRole')->middleware('checkAuth','controller'); //删除角色
    Route::any('userauth/getAllWechatConfig','index/Userauth/getAllWechatConfig')->middleware('checkAuth','controller'); //获取所有公众号配置

    Route::any('wechat/createMenu','index/Wechat/createMenu')->middleware('checkAuth','controller'); //创建自定义菜单
    Route::any('wechat/getMenu','index/Wechat/getMenu')->middleware('checkAuth','controller'); //从微信服务器上获取自定义菜单
    Route::any('wechat/pushTemMsg','index/Wechat/pushTemMsg')->middleware('checkAuth','controller'); //推送模板消息
    Route::any('wechat/createQRcode','index/Wechat/createQRcode')->middleware('checkAuth','controller'); //生成带参数的二维码
    Route::any('wechat/getMaterial','index/Wechat/getMaterial')->middleware('checkAuth','controller'); //获取素材列表
    Route::any('wechat/getNews','index/Wechat/getNews')->middleware('checkAuth','controller'); //获取图文消息
    Route::any('wechat/getForeverForLibrary','index/Wechat/getForeverForLibrary')->middleware('checkAuth','controller'); //从微信素材库中获取数据
    Route::any('wechat/uploadMatrial','index/Wechat/uploadMatrial')->middleware('checkAuth','controller'); //上传永久素材
    Route::any('wechat/deleteMatrial','index/Wechat/deleteMatrial')->middleware('checkAuth','controller'); //删除永久素材
    Route::any('wechat/initreply','index/Wechat/initreply')->middleware('checkAuth','controller'); //主动回复消息




})->middleware('checkLogin');






//===========================================
//公众号回调链接路由配置，以下配置是自动生成的
//===========================================
Route::any('CSGZH', 'index/WechatServer/index?appid=wx7ad4ce9789a311ea');
Route::any('WLCS', 'index/WechatServer/index?appid=wx7ad4ce9789a311ea');