<?php

namespace app\index\controller;

use app\index\validate\AutoreplyValidate;
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

        //根据当前使用的公众号的appid去查询对应的数据,是否需要分页显示
        //$replylist = $this->AutoReplyModel->getAllReplyInfo($this->wechatconfig['appid']);

        $page = input('param.page',1); //
        $limit = input('param.limit',10);
        $count = Db::name('AutoReply')->where(['appid'=>$this->wechatconfig['appid']])->count();
        $replylist = Db::name('AutoReply')->where(['appid'=>$this->wechatconfig['appid']])->page($page,$limit)->order('createtime desc')->select();
//        $replylist = Db::name('AutoReply')->where(['appid'=>$this->wechatconfig['appid']])->select(); //返回的是二维数组
        $replylist = empty($replylist) ? [] : $replylist;
        if(!empty($replylist)){
            foreach ($replylist as $k => $v){
                if(isset($v['qrinfo']) && !empty($v['qrinfo']) && $v['eventtype'] == 13){
                    $qrinfoarr = json_decode($v['qrinfo'],true);
                    $expire = $qrinfoarr['expire']; //定义的过期时间
                    $createtime = $v['createtime'];
                    $endtime = strtotime("$createtime + $expire day");
                    $replylist[$k]['imgurl'] = $qrinfoarr['imgurl'];
                    $replylist[$k]['expire'] = $qrinfoarr['expire'];
                    $replylist[$k]['qrtype'] = $qrinfoarr['qrtype'];
                    $replylist[$k]['endtime'] = date('Y-m-d H:i:s',$endtime); //最终的截止时间
                }
            }
        }
        $response = [
            'status' => 1,
            'replylist' => $replylist,
            'count' => $count,
        ];
        return json($response);

    }


    /**
     * 修改自动回复
     */
    public function editReply()
    {

//        $this->userAuth('action');

        $data = Request::param(false); //不对输入的数据进行过滤操作
        $data['updatetime'] = date('Y-m-d H:i:s');


        $validate = new AutoreplyValidate();
        if(!$validate->scene('edit')->check($data)){
            //没有通过验证
            $response = [
                'status' => 0,
                'msg' => $validate->getError()
            ];

            return json($response);
        }

        $res = $this->AutoReplyModel->update($data); //data中包含主键字段就不需要where条件了
        if ($res === false) {
            $response = [
                'status' => 0,
                'msg' => '更新失败!'
            ];

            doLog('Autoreply/editReply/error','修改自动回复失败','',$this->wechatconfig['appid']);

        } else {
            $response = [
                'status' => 1,
                'msg' => '更新成功!'
            ];

            doLog('Autoreply/editReply','修改自动回复成功','',$this->wechatconfig['appid']);

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
            if(isset($replyinfo['qrinfo']) && !empty($replyinfo['qrinfo'])){
                $qrinfoarr = json_decode($replyinfo['qrinfo'],true);
                $replyinfo['qrtype'] = $qrinfoarr['qrtype'];
                $replyinfo['imgurl'] = $qrinfoarr['imgurl'];
                $replyinfo['expire'] = $qrinfoarr['expire'];
            }

            if(strcasecmp($replyinfo['msgtype'],'image') == 0){
                //当是图片格式的时候,根据media_id感觉
                $media_id = $replyinfo['reply'];
                $imginfo = Db::name('ImgMaterial')->where("media_id = '$media_id'")->cache(300)->find();
                if(!empty($imginfo)) $replyinfo['local_imgurl'] = IMG_URL.$imginfo['local_imgurl'];

            }

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

//        $this->userAuth('action');

        $data = Request::param(false); //获取原始数据,不对数据进过滤,因为回复的内容中可能包含链接
        //$data['reply'] = $_POST['reply'];
        $date = date('Y-m-d H:i:s');
        $data['appid'] = $this->wechatconfig['appid'];
        $data['createtime'] = $date;
        $data['updatetime'] = $date;
        //二维码的数据
        if($data['eventtype'] == 13){
            //说明是扫码回复事件
            $qrinfo = [
                'imgurl' => $data['imgurl'], //生成的二维码图片路径
                'qrtype' => $data['qrtype'], //二维码的类型,1表示临时二维码,2表示永久二维码
                'expire' => $data['expire'] ?? 0, //二维码的有效时间,单位为秒
            ];
            $data['qrinfo'] = json_encode($qrinfo); //将二维码数据按照json格式存入数据库中

//            $endtime = date('Y-m-d H:i:s',strtotime($date.'+'.$data['expire'].' day')); //截止时间
//            $qrtype = $data['qrtype'];
//            $imgurl = $data['imgurl'];
            $info = [
                'endtime' =>  date('Y-m-d H:i:s',strtotime($date.'+'.$data['expire'].' day')),
                'qrtype' => $data['qrtype'],
                'imgurl' => $data['imgurl'],
            ];
            unset($data['imgurl']);
            unset($data['qrtype']);
            unset($data['expire']);
            
        }

        //验证关键字是否重复
        $ishavekeyword = Db::name('AutoReply')->where(['appid'=>$this->wechatconfig['appid'],'keyword'=>$data['keyword']])->find();

        if(!empty($ishavekeyword)){
            //说明关键字已经重复了
            $response = [
                'status' => 0,
                'msg' => '该关键字已经存在'
            ];
            return json($response);
            
        }

        //对数据进行验证
        $validate = new AutoreplyValidate();
        if(!$validate->scene('add')->check($data)){
            //验证不通过
            $response = [
                'status' => 0,
                'msg' => $validate->getError()
            ];
            return json($response);
        }

        $res = $this->AutoReplyModel->insert($data); //data中包含主键字段就不需要where条件了
        if ($res === false) {
            $response = [
                'status' => 0,
                'msg' => '添加失败!'
            ];

//            doLog('','添加失败','','Autoreply/addReply/error',$this->wechatconfig['appid'],$this->userid);

            doLog('Autoreply/addReply/error','添加自动回复失败','',$this->wechatconfig['appid']);

        } else {
            $response = [
                'status' => 1,
                'msg' => '添加成功!',
                'info' => $info ?? [],
            ];

            doLog('Autoreply/addReply','添加自动回复成功','',$this->wechatconfig['appid']);

        }
        return json($response);

    }


    /**
     * 删除自动回复
     */
    public function delReply($id = 0)
    {

//        $this->userAuth('action');

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


            doLog('Autoreply/delReply','删除自动回复成功','',$this->wechatconfig['appid']);

            

        } else {
            $response = [
                'status' => 0,
                'msg' => '删除失败!'
            ];

            doLog('Autoreply/delReply/error','删除自动回复失败','',$this->wechatconfig['appid']);

        }
        return json($response);

    }



    /**
     * 更改启用或者禁用的状态
     */
    public function exchangeStatus()
    {

        $id = input('param.id', 0);
        $status = input('param.status', 0);
        if ($id == 0) {
            $response = [
                'status' => 0,
                'msg' => 'ID不能为空!'
            ];
            return json($response);
        }
        $data['id'] = $id;
        $data['status'] = $status;
        $data['updatetime'] = date('Y-m-d H:i:s');

        $res = Db::name('AutoReply')->update($data);
        if ($res === false) {
            $response = [
                'status' => 0,
                'msg' => '修改状态失败!'
            ];
        } else {
            $response = [
                'status' => 1,
                'msg' => '修改状态成功!'
            ];
        }

        return json($response);

    }


    /**
     * 获取生成的二维码
     */
    public function getQrcode($id = 0)
    {

//        $this->userAuth('action');

        if($id == 0) {
            $response = [
                'status' => 0,
                'msg' => 'ID不能为空!'
            ];
            return json($response);
        }
        $qrinfo = Db::name('AutoReply')->where(['id'=>$id])->value('qrinfo'); //这边返回的应该是一个json数据
        if(empty($qrinfo)){
            $response = [
                'status' => 0,
                'msg' => '没有数据!'
            ];
        }else{

            $qrinfoarr = json_decode($qrinfo,true); //将json数据转换成数组
            $imgurl = $qrinfoarr['imgurl']; //只需要向前端返回二维码的链接就行了
            $response = [
                'status' => 1,
                'msg' => '获取成功!',
                'imgurl'=>$imgurl
            ];

        }
        return json($response);
    }








}
