<?php
/**
 * Created by PhpStorm.
 * User: 123
 * Date: 2018/8/9
 * Time: 18:32
 */

namespace app\index\controller;

use app\service\helper\Format;
use app\service\info\InfoFactory;
use app\service\observers\BaseObserver;
use think\Db;
use think\Exception;

class Customerinfo extends Common
{

    /**
     * 获取用户的基本信息
     */
    public function getCustomerUserInfo()
    {
        $openid = input('param.openid', ''); //接收用户的OPENID
        if (empty($openid)) return Format::error('OPENID不能为空', 'Customerinfo/getCustomerUserInfo/error', $this->wechatconfig['appid']);
        $baseInfo = Db::name('ClientUser')->where(['openid' => $openid])->cache(300)->find();
        return Format::success('获取数据成功', $baseInfo);

    }


    /**
     * 获取用户的标签信息
     */
    public function getUserTagInfo()
    {
        //TODO 这个接口有点慢,有空优化一下
        $openid = input('param.openid', '');
        $page = input('param.page', 1);
        $limit = input('param.limit', 3);
        if (empty($openid)) return Format::error('OPENID不能为空', 'Customerinfo/getUserTagInfo/error', $this->wechatconfig['appid']);

        $count = Db::name('UserTag')->where(['openid' => $openid])->count();

        $user_tag_info = Db::name('UserTag')->where(['openid' => $openid])->page($page, $limit)->order('createtime desc')->select();
        foreach ($user_tag_info as $k => &$v) {
            $tagids = $v['tagid'];
            $tagarr = Db::name('Tag')->where("id in ($tagids)")->column('tag');
            $tagstr = implode('/', $tagarr);
            $v['tagidstr'] = $tagstr;
        }
//        $user_tag_info['count'] = $count;

        $totalInfo['user_tag_info'] = $user_tag_info;
        $totalInfo['count'] = $count;

        return Format::success('获取数据成功', $totalInfo);

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

        $user_tag_info = Db::name('UserTag')->where(['openid' => $openid])->select();
        foreach ($user_tag_info as $k => &$v) {
            $tagids = $v['tagid'];
            $tagarr = Db::name('Tag')->where("id in ($tagids)")->column('tag');
            $tagstr = implode('/', $tagarr);
            $v['tagidstr'] = $tagstr;
        }

        return json($user_tag_info);
    }


    /**
     * 修改用户手机号
     */
    public function saveTel()
    {
        $openid = input('param.openid', '');
        $telephone = input('param.telephone', '');
        if (empty($openid) || empty($telephone)) return Format::error('OPENID或电话号码不能为空', 'Customerinfo/saveTel/error', $this->wechatconfig['appid']);

        $ishave = Db::name('ClientUser')->where(['openid'=>$openid])->find();
        if(empty($ishave)) return Format::error('OPENID不存在', 'Customerinfo/saveTel/error', $this->wechatconfig['appid']);

        try {
            $data['telephone'] = $telephone;
            $data['updatetime'] = date('Y-m-d H:i:s');
            Db::name('ClientUser')->where(['openid' => $openid])->update($data);
            return Format::success('保存电话号码成功');
        } catch (Exception $e) {
            return Format::error($e->getMessage(), 'Customerinfo/saveTel/error', $this->wechatconfig['appid']);
        }


    }


    /**
     * 获取用户在平台的相关的信息,根据电话号码或者OPENID来查询
     */
    public function getUserAllInfo()
    {

        $param = input('param.',''); //接收所有的参数
        //接收查询条件(电话号码或者OPENID,默认是根据电话号码去查询)
        $type = $param['type'] ?? '';
        unset($param['type']);
        //根据传递的查询类型去实例化对应的
        //这边通过工厂类去查询相应的数据信息
        try {
            filedebug('where='.print_r($param,true));
            $info = (InfoFactory::Factory($type,config('zsmp.')))->getInfo($param);
            return Format::success('获取数据成功', $info);
        } catch (Exception $e) {
            return Format::error($e->getMessage(), 'Customerinfo/getUserAllInfo/error', $this->wechatconfig['appid']);
        }


        //查询该OPENID对应的领取的优惠券信息
        //查询领取的优惠券信息
        //查询购买的商品的信息
        //查询购买的文件
        //注册观察者,观察者是执行没有返回值的一些操作


    }

















}