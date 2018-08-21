<?php
/**
 * Created by PhpStorm.
 * User: 123
 * Date: 2018/8/20
 * Time: 14:56
 * 定义注册器
 */
namespace app\service\common;

class Register
{

    protected static $objs;


    public static function setObj($alias, $obj)
    {
        self::$objs[$alias] = $obj;
    }


    public static function getObj($alias)
    {
        return self::$objs[$alias];
    }


    public static function delObj($alias)
    {
        unset(self::$objs[$alias]);
    }
}