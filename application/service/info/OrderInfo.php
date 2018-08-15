<?php
/**
 * Created by PhpStorm.
 * User: 123
 * Date: 2018/8/15
 * Time: 14:39
 */
namespace app\service\info;

use think\Db;
use think\Exception;

class OrderInfo implements InfoInterface
{

    use BaseInfo;


    /**
     * 获取用户的订单信息
     */
    public function getInfo()
    {
        if(empty($where)){
            throw new Exception('查询条件不能为空');
        }
        $res = Db::connect($this->dbconfig)->table('tb_order')->where($where)->limit(2)->select();
        return $res;
    }


}