<?php
/**
 * Created by PhpStorm.
 * User: 123
 * Date: 2018/8/9
 * Time: 18:32
 */
namespace app\index\controller;

use app\service\helper\Format;
use think\Db;

class Customerinfo extends Common
{


    /**
     * 获取用户的基本信息
     */
    public function getCustomerUserInfo()
    {
        $openid = input('param.openid',''); //接收用户的OPENID
        if(empty($openid)) return Format::error('OPENID不能为空', 'Customerinfo/getCustomerUserInfo/error', $this->wechatconfig['appid']);
        $baseInfo = Db::name('ClientUser')->where(['openid'=>$openid])->find();
        //$user_tag_info = Db::name('UserTag')->where(['openid'])->select();

//        $tags = Db::name('Tag')->where(['appid'=>$this->wechatconfig['appid']])->select();

        return Format::success('获取数据成功',$baseInfo);

        



    }


    public function test()
    {
        $openid = 'oHIv-wagNwj9P18vT51lhYc-y0zE';
        $tags = Db::name('Tag')->where(['appid'=>$this->wechatconfig['appid']])->select();
        $user_tag_info = Db::name('UserTag')->where(['openid'=>$openid])->withAttr('tagid',function ($value,$data){
            $resres = Db::name('Tag')->where("id in ($value)")->select();
            return implode('/',$resres);
        })->select();
        return json($user_tag_info);
    }


    

}