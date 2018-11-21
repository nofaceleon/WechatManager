<?php
namespace app\index\controller;

use app\service\helper\Dbredis;

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

        //return 'hello world';

        dump($_SERVER); //默认的时候居然没有 request_scheme 参数
        //(Dbredis::getInstance())->set('test132131test','pppppp',3600);

    }



}
