<?php

namespace app\index\controller;

use think\Db;
use think\facade\Request;

class Template extends Common
{
    protected $tempmodel;

    public function __construct()
    {
        parent::__construct();
        $this->tempmodel = model('Template'); //统一实例化
    }


    /**
     * 查看模板详情
     */
    public function tempdetail()
    {
        $tempid = input('param.id', 0);
        $tempinfo = $this->tempmodel->where(['id' => $tempid])->find();
        $res = preg_replace('/{{.*?}}/','',$tempinfo['content']);
        $keywords = explode('：',$res);//根据中文的分号分隔成数组
        array_pop($keywords); //删除数组中的最后一个元素
        $keywordscount = count($keywords);

    }


    /**
     * 获取模板消息推送日志 自带了分页,这边需要修改
     */
    public function temppushlog()
    {

        $tempushlogmodel = Db::name('TemplatePushlog');
        $map['wechatappid'] = $this->wechatconfig['appid'];

    }


    /**
     * 删除模板消息
     */
    public function deltemplate()
    {
        $id = input('param.id',0);
        if(empty($id)){
            $response = [
                'status' => 0,
                'msg' => 'ID不能为空!',
            ];
            return json($response);
        }
        //根据主键ID删除
        $res = $this->tempmodel->where(['id'=>$id])->delete();
        if($res){
            //删除成功
            $response = [
                'status' => 1,
                'msg' => '删除成功!',
            ];
        }else{
            //删除失败
            $response = [
                'status' => 0,
                'msg' => '删除失败!',
            ];
        }
       return json($response);

    }

}
