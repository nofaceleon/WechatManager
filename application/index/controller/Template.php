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



    public function index()
    {
        $map['status'] = 1;
        $map['appid'] = $this->wechatconfig['appid'];
        $templist = $this->tempmodel->where($map)->select();
        $this->assign('templist', $templist);
        $this->assign('empty', '<td colspan="5" class="empty">暂时没有数据</td>');
        return $this->fetch();
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
//        dump($keywords);die;
        $this->assign('tempinfo', $tempinfo);
        $this->assign('keywordscount', $keywordscount);
        $this->assign('keywords', $keywords);

        return $this->fetch();

    }

    /**
     * 添加模板消息配置
     */
    public function addTemp()
    {

    }


    /**
     * 获取模板消息推送日志 自带了分页,这边需要修改
     */
    public function temppushlog()
    {

        $tempushlogmodel = Db::name('TemplatePushlog');
        $map['wechatappid'] = $this->wechatconfig['appid'];


//        $tempmodel = model('TemplatePushlog');
//        $pagenum = input('param.p',1);//获取当前页面
        $limit = 10;//每页显示的条数
//        $TempPushLog = $tempushlogmodel->where($map)->order('createtime desc')->select();
        $TempPushLog = $tempushlogmodel->where($map)->order('createtime desc')->paginate($limit);

//        $map['wechatappid'] = $this->wechatconfig['appid'];
//        $count = $tempmodel->where($map)->count(); //获取数据总数
//        $Page = new \Think\Page($count, $limit);// 实例化分页类 传入总记录数和每页显示的记录数
//
//        //自定义分页样式
//        $Page->setConfig('prev', '上一页');
//        $Page->setConfig('next', '下一页');
//        $Page->setConfig('first', '首页');
////        $Page->setConfig('last', '尾页');
//        $Page->setConfig('theme', '<ul class="pagination pagination-sm">%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END%</ul>');
//        $show = $Page->show();// 分页显示输出
//        $this->assign('page', $show);// 赋值分页输出
//        $TempPushLog = $tempmodel->page($pagenum . ',' . $limit)->where($map)->order("createtime desc")->select();
        $this->assign('temppushlog', $TempPushLog);
        $this->assign('empty', '<td colspan="7" class="empty">暂时没有数据</td>');
        return $this->fetch();

    }


    /**
     * 删除模板消息
     */
    public function deltemplate()
    {
        if(!Request::isAjax()) return;
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


    /**
     * 查询模板日志推送详情
     */
    public function pushlogdetail()
    {
       return $this->fetch();

    }
}
