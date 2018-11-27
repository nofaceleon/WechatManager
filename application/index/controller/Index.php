<?php
namespace app\index\controller;

class Index
{


    /**
     * 初始功能:
     * 1.自动回复功能
     * 2.自定义菜单功能(基本功能完成)
     * 3.识别二维码中参数,可以进行判断
     */

    /**
     * 显示微信后台管理首页
     */

    /**
     * 返回用户的基本信息
     */
    public function index()
    {

//        return Format::success('yes',Session::get('alluserinfo'));
//        die('hello');

        //dump(config('defineurl.weburl'));
//        die;
       // (Dbredis::getInstance())->set('test132131test','pppppp',3600);
    // header('location: href');
        //TODO 访问首页的时候如果没有登录，就直接重定向到登录页面
//        $index_url = config('defineurl.indexurl');
//        dump($_SERVER);
//        die;
        $index_url = $_SERVER['REQUEST_SCHEME'].'://'.$_SERVER['HTTP_HOST'].'/dist';

      header("Location:" . $index_url);
//      header("Location:" . 'http://my.song.top/dist/');
    }




}
