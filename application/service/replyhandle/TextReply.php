<?php
/**
 * Created by PhpStorm.
 * User: 123
 * Date: 2018/8/1
 * Time: 14:09
 */

namespace app\service\replyhandle;

use think\Db;
use think\Exception;

class TextReply
{


    private static $instance;

    private function __construct()
    {
    }

    private function __clone()
    {
    }

    public static function getInstance()
    {
        if (!self::$instance instanceof self) {
            self::$instance = new self();
        }
        return self::$instance;

    }

    public function saveData($data = '')
    {

        $questionInfo = [
            'to_user_name' => $data['ToUserName'],
            'openid' => $data['FromUserName'],
            'content' => $data['Content'],
            'msgtype' => $data['MsgType'],
            'detail' => json_encode($data),
            'replytype' => 1,
            'kfid' => 0,
            'createtime' => date('Y-m-d H:i:s'),
        ];

        try {
            Db::name('Kefu')->insert($questionInfo);
        } catch (Exception $e) {
            $errormsg = $e->getMessage(); //获取错误信息
            doLog('replyhandle/TextReply/saveText/error', '接收用户回复失败', $errormsg, '');
        }


    }


    /**
     * 储存客服回复的消息
     */
    public static function saveKefuReply($data = '')
    {




        


    }
}