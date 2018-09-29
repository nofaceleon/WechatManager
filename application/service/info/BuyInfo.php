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
use think\Exception;

class BuyInfo implements InfoInterface
{
    use BaseInfo;

    public function getInfo($where = [])
    {

        if(empty($where)){
            throw new Exception('查询条件不能为空');
        }
        $res = Db::connect($this->dbconfig)->table('tb_order')->where($where)->select();
        return $res;

    }





}