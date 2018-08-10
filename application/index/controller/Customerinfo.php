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
        $baseInfo = Db::name('ClientUser')->where(['openid'=>$openid])->cache(300)->find();


//        $user_tag_info = Db::name('UserTag')->where(['openid'=>$openid])->select();
//        foreach ($user_tag_info as $k=>&$v){
//            $tagids = $v['tagid'];
//            $tagarr = Db::name('Tag')->where("id in ($tagids)")->column('tag');
//            $tagstr = implode('/',$tagarr);
//            $v['tagidstr'] = $tagstr;
//        }
//
//        $baseInfo['tagInfo'] = $user_tag_info;

        return Format::success('获取数据成功',$baseInfo);

        



    }



    public function getUserTagInfo()
    {
        $openid = input('param.openid','');
        $page = input('param.page',1);
        $limit = input('param.limit',3);
        if(empty($openid)) return Format::error('OPENID不能为空', 'Customerinfo/getUserTagInfo/error', $this->wechatconfig['appid']);

        $count = Db::name('UserTag')->where(['openid'=>$openid])->count();

        $user_tag_info = Db::name('UserTag')->where(['openid'=>$openid])->page($page,$limit)->select();
        foreach ($user_tag_info as $k=>&$v){
            $tagids = $v['tagid'];
            $tagarr = Db::name('Tag')->where("id in ($tagids)")->column('tag');
            $tagstr = implode('/',$tagarr);
            $v['tagidstr'] = $tagstr;
        }
        $user_tag_info['count'] = $count;
        return Format::success('获取数据成功',$user_tag_info);

    }


    /**
     * 测试使用
     * @return \think\response\Json
     */
    public function test()
    {
        $openid = 'oHIv-wagNwj9P18vT51lhYc-y0zE';
        //这边使用获取器试试
//        $user_tag_info = Db::name('UserTag')->where(['openid'=>$openid])->withAttr('tagid',function ($value,$data){
//            $resres = Db::name('Tag')->where("id in ($value)")->select();
//            return implode('/',$resres);
//        })->select();

        $user_tag_info = Db::name('UserTag')->where(['openid'=>$openid])->select();
        foreach ($user_tag_info as $k=>&$v){
            $tagids = $v['tagid'];
            $tagarr = Db::name('Tag')->where("id in ($tagids)")->column('tag');
            $tagstr = implode('/',$tagarr);
            $v['tagidstr'] = $tagstr;
        }
//
        return json($user_tag_info);
    }


    /**
     * 修改用户手机号
     */
    public function saveTel()
    {

    }


    

}