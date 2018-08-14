<?php
/**
 * Created by PhpStorm.
 * User: 123
 * Date: 2018/8/14
 * Time: 15:56
 */
namespace app\service\info;

trait BaseInfo
{

    protected $dbconfig;

    public function __construct($dbconfig = null)
    {
        $this->dbconfig = $dbconfig;
    }
}