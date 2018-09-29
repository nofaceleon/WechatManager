<?php
/**
 * Created by PhpStorm.
 * User: 123
 * Date: 2018/8/17
 * Time: 14:49
 */


//$projectconf = parse_ini_file('/var/www/html/pay_conf/projectconf.ini', true);

if(DEBUG_MODEL){



//    return [
//        // 默认连接信息
//        'REDIS_HOST_DEFAULT' => '127.0.0.1',
//        'REDIS_PORT_DEFAULT' => '3198',
//        'REDIS_AUTH_DEFAULT' => '',
//        // Log连接信息
//        'REDIS_HOST_LOG' => '127.0.0.1',
//        'REDIS_PORT_LOG' => '3199',
//        'REDIS_AUTH_LOG' => '',
//    ];


    return [
        // 默认连接信息
        'REDIS_HOST_DEFAULT' => '192.168.1.104',
        'REDIS_PORT_DEFAULT' => '3198',
        'REDIS_AUTH_DEFAULT' => '',
        // Log连接信息
        'REDIS_HOST_LOG' => '192.168.1.104',
        'REDIS_PORT_LOG' => '3199',
        'REDIS_AUTH_LOG' => '',
    ];



}else{

    $projectconf = parse_ini_file('/var/www/html/pay_conf/projectconf.ini', true);

    return [
        // default 实例
        'REDIS_HOST_DEFAULT' => $projectconf['WechatDevApi']['REDIS_HOST_DEFAULT'],
        'REDIS_PORT_DEFAULT' => $projectconf['WechatDevApi']['REDIS_PORT_DEFAULT'],
        'REDIS_AUTH_DEFAULT' => $projectconf['WechatDevApi']['REDIS_AUTH_DEFAULT'],

        // 记录log的实例
        'REDIS_HOST_LOG' => $projectconf['WechatDevApi']['REDIS_HOST_LOG'],
        'REDIS_PORT_LOG' => $projectconf['WechatDevApi']['REDIS_PORT_LOG'],
        'REDIS_AUTH_LOG' => $projectconf['WechatDevApi']['REDIS_AUTH_LOG'],
    ];

}