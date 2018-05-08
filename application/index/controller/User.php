<?php
/**
 * Created by PhpStorm.
 * User: 123
 * Date: 2018/4/27
 * Time: 13:43
 */
namespace app\index\controller;

class User extends Common
{
    public function index()
    {
        $str = '当前访问的session_id = '.session_id(); //单点登录需要用到session_id
        return $str;
    }
}