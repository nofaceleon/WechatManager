<?php
/**
 * Created by PhpStorm.
 * User: 123
 * Date: 2018/8/2
 * Time: 10:18
 */

namespace app\index\controller;

use app\service\helper\Format;
use think\Controller;
use think\Db;
use think\Exception;

class Kefu extends Common
{

    /**
     * 获取信息列表数据
     */
    public function getChatList()
    {


        $appid = $this->wechatconfig['appid'];
        $wechatid = $this->wechatconfig['wechatid'];

        //TODO 这边还要过滤掉有自动回复的文案
//        $sql = "SELECT a.openid,a.content,count(*) as num,DATE_FORMAT(a.createtime,'%H:%i'),b.nickname,b.headimgurl FROM we_kefu as a LEFT JOIN we_client_user as b ON a.openid = b.openid WHERE a.`status` = 0 AND a.wechatid = '$wechatid' AND a.content not in (SELECT keyword from we_auto_reply where appid = '$appid' and `status` = 1 ) GROUP BY a.openid ORDER BY a.createtime desc";

        $sql = "SELECT a.openid,a.content,a.status,DATE_FORMAT(a.createtime,'%H:%i') as time,b.nickname,b.headimgurl FROM we_kefu as a LEFT JOIN we_client_user as b ON a.openid = b.openid WHERE a.wechatid = '$wechatid' AND a.content not in (SELECT keyword from we_auto_reply where appid = '$appid' and `status` = 1 ) GROUP BY a.openid ORDER BY a.createtime desc";


        //先查出所有用户列表

        $userList = Db::name('Kefu')->alias('a')->leftJoin('ClientUser b','a.openid = b.openid')->where(['a.wechatid'=>$wechatid])->field('a.openid,b.nickname,b.headimgurl')->group('a.openid')->select();

        foreach ($userList as $k=>&$v){
            $detail = Db::name('Kefu')->where(['openid'=>$v['openid']])->order('createtime desc')->field("content,DATE_FORMAT(createtime,'%H:%i') as time")->find();
            $v = array_merge($v,$detail);
        }



        //SELECT a.openid,b.nickname,b.headimgurl FROM we_kefu as a LEFT JOIN we_client_user as b on a.openid = b.openid  where a.wechatid = 'gh_7557b6fe18eb' GROUP BY a.openid

	   // SELECT * FROM we_kefu where openid = 'oHIv-wagNwj9P18vT51lhYc-y0zE' ORDER BY createtime desc LIMIT 1

        //查出改用户有多少条未读消息和最后一条数据(过滤掉自动回复的文案)


        //


//        $list = Db::name('kefu')->where($where)->field('openid,content,count(*)')->group('openid')->select();
        //$list = Db::name('kefu')->query($sql);
        if ($userList) {
            return Format::success('获取数据成功', $userList);
        } else {
            return Format::error('获取数据失败');
        }


    }


    /**
     * 获取具体某个用户
     */
    public function getUserChatInfo()
    {

        $openid = input('param.openid', '');
        $page = 1;
        $limit = 10;
        if (empty($openid)) return Format::error('OPENID不能为空', 'Kefu/getgetUserChatInfo/error', $this->wechatconfig['appid']);

        $this->changeStatus($openid);


        $appid = $this->wechatconfig['appid'];
        $sql = "SELECT * FROM we_kefu where openid = '$openid' and content not in (SELECT keyword from we_auto_reply where appid = '$appid' and `status` = 1 ) ORDER BY createtime ASC ";
        $chatInfo = Db::name('Kefu')->query($sql);
        if ($chatInfo) {

            foreach ($chatInfo as $k => &$v) {

                if ($v['msgtype'] == 'image') {
                    //说明是图片
                    $v['picurl'] = json_decode($v['detail'], true)['PicUrl']; //获取图片
                }
            }

            return Format::success('获取数据成功', $chatInfo);
        } else {
            return Format::error('获取数据失败', 'Kefu/getgetUserChatInfo/error', $this->wechatconfig['appid']);
        }

    }


    /**
     * 更改消息状态
     */
    public function changeStatus($openid)
    {
        // $openid = input('param.openid','');

        $data = [
            'status' => 1,
        ];


        try {
            Db::name('Kefu')->where(['openid' => $openid, 'status' => 0])->update($data);
        } catch (Exception $e) {
            $errormsg = $e->getMessage();
            doLog('Kefu/changeStatus/error', '更改已读未读状态失败', $errormsg, $this->wechatconfig['appid']);

        }


    }


}