<?php
namespace app\index\controller;

use app\service\helper\Dbredis;
use app\service\helper\Format;
use think\facade\Session;

class Index extends Common
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

        return Format::success('yes',Session::get('alluserinfo'));
//        die('hello');

        //dump(config('defineurl.weburl'));
//        die;
       // (Dbredis::getInstance())->set('test132131test','pppppp',3600);
    // header('location: href');
        //TODO 访问首页的时候如果没有登录，就直接重定向到登录页面
//      header("Location:" . 'http://wechat.songphper.top/dist/');
      header("Location:" . 'http://my.song.top/dist/');
    }

    public function test()
    {
        echo 'tst';
    }



}
