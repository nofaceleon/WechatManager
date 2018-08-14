<?php
/**
 * Created by PhpStorm.
 * User: 123
 * Date: 2018/8/14
 * Time: 15:55
 */
namespace app\service\info;

use think\Db;

class SignInfo implements InfoInterface
{

    use BaseInfo;

    public function getInfo()
    {

        $userid = 5832705;
        $res = Db::connect($this->dbconfig)->table('tb_sign_day')->where("userid = $userid")->select();
        return $res;

    }
}