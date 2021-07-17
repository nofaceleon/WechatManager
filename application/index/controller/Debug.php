<?php
/**
 * Created by PhpStorm.
 * User: 123
 * Date: 2018/8/21
 * Time: 15:02
 */
namespace app\index\controller;

use app\service\helper\Dbredis;

class Debug
{
    public function index()
    {

        //http://uat.zwmedia.com.cn/jiansheng/WechatDevApi/public/index.php/index/Debug/index


        $token = input('param.key','wechat_access_tokenwx307bfefddcfa71a2');

        //调试正式环境下面的redis
        $config = [
            'host'=>'',
            'port'=>'6379',
            'auth'=>'',
        ];

        $redis = new \Redis();
        $redis->pconnect($config['host'], $config['port']);
        $redis->auth($config['auth']);
        $redis->select(11);
//        $res = $redis->get('wechat_access_tokenwx307bfefddcfa71a2');  //
        $res = $redis->get($token);  //
        $ttl = $redis->ttl($token);  //

        echo $token."<br/>";

        echo $res."||".$ttl;



    }


    
    public function delkey()
    {


        //调试正式环境下面的redis
        $config = [
            'host'=>'',
            'port'=>'6379',
            'auth'=>'',
        ];

        $redis = new \Redis();
        $redis->pconnect($config['host'], $config['port']);
        $redis->auth($config['auth']);
        $redis->select(11);
//        $res = $redis->get('wechat_access_tokenwx307bfefddcfa71a2');  //
        //$redis->del('SignGame:luckuserinfo_4');
        //$redis->del('SignGame:luckuserinfo_27');


    }
}