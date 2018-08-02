<?php
/**
 * Created by PhpStorm.
 * User: 123
 * Date: 2018/8/1
 * Time: 10:57
 */

namespace app\service\replyhandle;

use think\Db;
use think\Exception;

class ImgReply
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
//        //将图片数据存入数据库中
//        filedebug('获取到的图片数据是=' . print_r($data, true));

        $questionInfo = [
            'wechatid' => $data['ToUserName'],
            'openid' => $data['FromUserName'],
            'content' => '[图片]',
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
            doLog('replyhandle/ImgReply/saveData/error', '接收用户回复失败', $errormsg, '');
        }


    }


}