<?php
/**
 * Created by PhpStorm.
 * User: 123
 * Date: 2018/8/14
 * Time: 15:00
 * 用户购买商品的信息
 */
namespace app\service\info;

use think\Db;

class BuyInfo implements InfoInterface
{
    use BaseInfo;

    public function getInfo($openid = '')
    {

        $tel = '18656474356';
        $res = Db::connect($this->dbconfig)->table('tb_order')->where("tel = '$tel'")->limit(2)->select();
        return $res;

    }





}