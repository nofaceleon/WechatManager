<?php

namespace app\index\controller;

use think\Db;
use think\facade\Request;

class Autoreply extends Common
{

    public function __construct()
    {
        parent::__construct();
        $this->AutoReplyModel = model('AutoReply');
    }


    /**
     * 显示已经配置好的自动回复内容
     */
    public function index()
    {

        //根据当前使用的公众号的appid去查询对应的数据
        //$replylist = $this->AutoReplyModel->getAllReplyInfo($this->wechatconfig['appid']);
       // $page = input('param.page',1); //
        //$limit = 5;
        //$replylist = Db::name('AutoReply')->where(['appid'=>$this->wechatconfig['appid']])->page($page,$limit)->select();
        $replylist = Db::name('AutoReply')->where(['appid'=>$this->wechatconfig['appid']])->select();

        $replylist = empty($replylist) ? [] : $replylist;

        $response = [
            'status' => 1,
            'replylist' => $replylist

        ];

        return json($response);

    }


    /**
     * 修改自动回复
     */
    public function editReply()
    {
        $data = Request::param(false); //不对输入的数据进行过滤操作
        $data['updatetime'] = date('Y-m-d H:i:s');
        $res = $this->AutoReplyModel->update($data); //data中包含主键字段就不需要where条件了
        if ($res === false) {
            $response = [
                'status' => 0,
                'msg' => '更新失败!'
            ];
        } else {
            $response = [
                'status' => 1,
                'msg' => '更新成功!'
            ];
        }
        return json($response);


    }

    /**
     * 获取自动回复的详细信息
     */

    public function getReplyInfo($id = 0)
    {
        $replyinfo = Db::name('AutoReply')->find($id);
        if (empty($replyinfo)) {
            $response = [
                'status' => 0,
                'msg' => '没有相关信息!'
            ];
        } else {
            $response = [
                'status' => 1,
                'msg' => '获取成功!',
                'replyinfo' => $replyinfo
            ];

        }
        return json($response);
    }

    
    /**
     * 添加新的回复内容
     */
    public function addReply()
    {

        $data = Request::param(false); //获取原始数据,不对数据进过滤,因为回复的内容中可能包含链接

        //$data['reply'] = $_POST['reply'];
        $date = date('Y-m-d H:i:s');
        //$data['msgtype'] = 'text'; //TODO:目前先固定是text
        //$data['eventtype'] = 1; //先默认都是被动回复

        $data['appid'] = $this->wechatconfig['appid'];
        $data['createtime'] = $date;
        $data['updatetime'] = $date;

        $res = $this->AutoReplyModel->insert($data); //data中包含主键字段就不需要where条件了
        if ($res === false) {
            $response = [
                'status' => 0,
                'msg' => '添加失败!'
            ];
        } else {
            $response = [
                'status' => 1,
                'msg' => '添加成功!'
            ];
        }
        return json($response);

    }


    /**
     * 删除自动回复
     */
    public function delReply($id = 0)
    {


        if ($id == 0) {
            $response = [
                'status' => 0,
                'msg' => 'id不能为空'
            ];
            return json($response);
        }

        $res = $this->AutoReplyModel->where(['id' => $id])->delete(); //根据主键ID删除
        if ($res) {
            $response = [
                'status' => 1,
                'msg' => '删除成功!'
            ];
        } else {
            $response = [
                'status' => 0,
                'msg' => '删除失败!'
            ];
        }
        return json($response);

    }





}
