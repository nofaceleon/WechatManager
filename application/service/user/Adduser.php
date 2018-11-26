<?php
/**
 * Created by PhpStorm.
 * User: 123
 * Date: 2018/8/2
 * Time: 13:38
 * 添加新的用户
 */
namespace app\service\user;

use think\Db;
use think\Exception;

class Adduser
{

    private static $instance;
    private $weixin;


    private function __construct($weixinobj)
    {

        $this->weixin = $weixinobj;


    }



    public static function getInstance($weixinobj)
    {
        if(!self::$instance instanceof self){
            self::$instance = new self($weixinobj);
        }

        return self::$instance;
    }

    

    /**
     * 添加新的用户
     */
    public function addUser()
    {

        $data = $this->weixin->getRevData();

        $openid = $data['FromUserName'];
        //先判断数据库中有没有数据,如果有的话就执行更新操作,没有的话就执行插入操作

        $ishave = Db::name('ClientUser')->where(["openid"=>$openid])->find();
        $expire = 7; //默认设置7天更新一次用户数据

        if($ishave){
            //TODO 多久更新一次用户数据呢? 默认7天更新一次
            $updatetime = $ishave['updatetime'];
            $oldtime = strtotime("- $expire day"); //获取指定日期前的时间
            if($oldtime < strtotime($updatetime)){
                return;
            }
            //数据库中有值直接返回
            //return;
        }
        //现在
        $userinfo = $this->weixin->getUserInfo($data['FromUserName']);

        $time = date('Y-m-d H:i:s');

        $userinfodata = [
            'wechatid'=>$data['ToUserName'],
            'openid'=>$userinfo['openid'],
            'nickname'=>$userinfo['nickname'],
            'headimgurl'=>$userinfo['headimgurl'],
            'sex'=>$userinfo['sex'],
            'subscribe'=>$userinfo['subscribe'],
            'city'=>$userinfo['city'] ?? '',
            'country'=>$userinfo['country'],
            'province'=>$userinfo['province'],
            'language'=>$userinfo['language'],
            'subscribe_time'=>date('Y-m-d H:i:s',$userinfo['subscribe_time']),
            'unionid'=>$userinfo['unionid'] ?? '',
            'remark'=>$userinfo['remark'] ?? '',
            'groupid'=>$userinfo['groupid'],
            'tagid_list'=>json_encode($userinfo['tagid_list']),
            'subscribe_scene'=>$userinfo['subscribe_scene'] ?? '',
            'qr_scene'=>$userinfo['qr_scene'],
            'qr_scene_str'=>$userinfo['qr_scene_str'] ?? '',
            'createtime'=>$time,
            'updatetime'=>$time,
        ];


        try{
            if($ishave){
                //filedebug('更新用户数据');
                Db::name('ClientUser')->where('id',$ishave['id'])->update($userinfodata);
            }else{
                Db::name('ClientUser')->insert($userinfodata);
            }

        }catch (Exception $e){
            $errormsg = $e->getMessage(); //获取错误信息
            doLog('user/Adduser/addUser/error', '添加用户信息失败', $errormsg, '');
        }



    }


}