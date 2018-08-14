<?php
/**
 * Created by PhpStorm.
 * User: 123
 * Date: 2018/8/14
 * Time: 15:56
 */
namespace app\service\info;

use think\Exception;

trait BaseInfo
{

    protected $dbconfig;

    public function __construct($dbconfig = null)
    {
        if(empty($dbconfig)){
            throw new Exception('数据库配置为空');
        }
        $this->dbconfig = $dbconfig;
    }
}