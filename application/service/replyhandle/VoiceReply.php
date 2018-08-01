<?php
/**
 * Created by PhpStorm.
 * User: 123
 * Date: 2018/8/1
 * Time: 16:38
 */
namespace app\service\replyhandle;

class VoiceReply
{
    private static $instance;


    private function __construct()
    {
    }

    private function __clone()
    {
        // TODO: Implement __clone() method.
    }


    public static function getInstance()
    {
        if(!self::$instance instanceof self){
            self::$instance = new self();
        }

        return self::$instance;
    }


    /**
     * 存储数据信息
     */
    public function saveData()
    {

    }







}