<?php

namespace app\index\controller;

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
        $replylist = $this->AutoReplyModel->getAllReplyInfo($this->wechatconfig['appid']);
        $this->assign('replylist', $replylist);
        $this->assign('empty', '<td colspan="6" class="empty">暂时没有数据</td>');
        return $this->fetch();
    }


    /**
     * 修改自动回复
     */
    public function editreply()
    {
        if (Request::isAjax()) {
            $data = input('param.');
            $data['reply'] = $_POST['reply']; //回复的内容不进行转义操作
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

        } else {
            $id = input('param.id', 0); //接收前端传递过来的主键ID
            $replydetail = $this->AutoReplyModel->find($id);
            $this->assign('replydetail', $replydetail);
           return $this->fetch();
        }

    }


    /**
     * 添加新的回复内容
     */
    public function addreply()
    {
        if (Request::isAjax()) {

            $data = input('param.');
            $data['reply'] = $_POST['reply'];
            $date = date('Y-m-d H:i:s');
            $data['msgtype'] = 'text'; //TODO:目前先固定是text
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


        } else {
            return $this->fetch();
        }

    }


    /**
     * 删除自动回复
     */
    public function delreply()
    {
        if (!Request::isAjax()) return;
        $id = input('param.id', 0);
        $res = $this->AutoReplyModel->where(['id'=>$id])->delete(); //根据主键ID删除
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
