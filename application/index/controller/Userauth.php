<?php

namespace app\index\controller;

use think\Db;
use think\facade\Request;

class Userauth extends Common
{

    public function __construct()
    {
        parent::__construct();


    }

    public function index()
    {

        //首先权限管理只能是超级管理员才能设置还是只要是管理员就能设置


        //超级管理员能够创建管理员账户


        //普通管理员能够创建普通账户

        //查出当前所有的权限
        $authlist = Db::name('AuthRule')->select();
        //查出当前用户所拥有的权限
        $this->assign('authlist',$authlist);
        return $this->fetch();

    }


    /**
     * 新增规则
     */
    public function addAuth()
    {
        

    }

    /**
     * 编辑规则
     */
    public function editAuth()
    {

        $id = input('param.id',0);
        $ruleinfo = Db::name('AuthRule')->find($id);



    }


    /**
     * 删除规则
     */
    public function delAuth()
    {



    }


    /**
     * 用户角色表
     *
     */
    public function userrole()
    {
        //查出所有的用户角色
        $userrole = Db::name("AuthGroup")->select();
        $this->assign('userrole',$userrole);
        $this->assign('empty', '<td colspan="4" class="empty">暂时没有数据</td>');
        return $this->fetch();
    }


    /**
     * 添加用户角色
     */
    public function addrole()
    {

    }


    /**
     * 删除用户角色
     */
    public function delrole()
    {

    }


    /**
     * 新增用户分配角色
     */
    public function setrole()
    {

    }


    /**
     * 给角色添加权限
     */
    public function setroleauth()
    {

    }


    /**
     * 角色权限详细页面
     *
     */
    public function rolerules()
    {
        //根据角色的ID去查询该角色所拥有的权限有哪些
        $id = input('param.id',0);
        //查出角色所拥有的权限
        $authinfo = Db::name("AuthGroup")->where(['id'=>$id])->find();
        if(empty($authinfo) || empty($authinfo['rules'])){
            $authlist = [];
        }else{

            $authids = $authinfo['rules'];
            $authlist = Db::name('AuthRule')->where("id in ($authids)")->select();
        }
        //查出具体的权限
        $this->assign('authlist',$authlist);
        $this->assign('rolename',$authinfo['title']);
        $this->assign('empty', '<td colspan="8" class="empty">暂时没有数据</td>');
        return $this->fetch();
    }













}
