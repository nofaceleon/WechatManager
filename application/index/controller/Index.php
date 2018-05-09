<?php
namespace app\index\controller;

use think\Db;
use think\Exception;

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
    public function index()
    {
        return $this->fetch();
    }

    public function test()
    {
        $name = '天乐邦测试公众号';
       $res = pinyin1($name);
       echo $res;
    }


    /**
     * 返回用户的基本信息
     */
    public function getBaseInfo()
    {
        $data = [
            'username' => $this->wechatuser,
        ];

        return json($data);

    }



}
