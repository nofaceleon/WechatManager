<?php
/**
 * Created by PhpStorm.
 * User: song
 * Date: 2018/4/30
 * Time: 18:16
 */

 return [
    // 数据库类型
    'type'           => '\think\mongo\Connection',
    // 设置查询类
    'query'			 => '\think\mongo\Query',
    // 服务器地址
    'hostname'       => '127.0.0.1',
    // 集合名
    'database'       => 'wechat',
    // 用户名
    'username'       => '',
    // 密码
    'password'       => '',
    // 端口
    'hostport'       => '',
    // 强制把_id转换为id
    'pk_convert_id'  => true,
];