<?php

namespace app\index\controller;

use app\index\validate\UserVlidate;
use think\Db;

class Userauth extends Common
{

    public function __construct()
    {
        parent::__construct();


    }


    /**
     * 获取用户信息
     */
    public function index()
    {
        // $sql  = 'SELECT a.username,c.* from we_user as a INNER JOIN we_auth_group_access as b on a.id = b.uid INNER JOIN we_auth_group as c on c.id = b.group_id';
        $userlist = Db::name('User')
            ->alias('a')
            ->join(['we_auth_group_access' => 'b'], 'a.id = b.uid')
            ->join(['we_auth_group' => 'c'], 'c.id = b.group_id')
            ->field('a.id as userid,a.username,c.*')
            ->select();


        $response = [
            'status' => 1,
            'msg' => '获取成功',
            'userlist' => $userlist ?? []
        ];

        return json($response);

    }


    /**
     * 更改用户角色
     */
    public function changeUserRole($userid = 0, $group_id = 0)
    {

        //接收用户的id


        //接收更改的用户组ID


    }


    /**
     * 获取所有用户角色
     */
    public function getAllRole()
    {

        $rolelist = Db::name('AuthGroup')->select();

        if (empty($rolelist)){
            $response = [
                'status' => 1,
                'msg' => '获取成功',
                'rolelist' => [],
            ];

            return json($response);

        }

        foreach ($rolelist as $k => $v){
            if(!empty($v['rules'])){
                $rulelist = explode(',',$v['rules']);
                $rolelist[$k]['rules'] = array_map('intval',$rulelist);
            }else{
                $rolelist[$k]['rules'] = [];
            }
        }
//        if(!empty($rolelist)){
//            $rolelistarr = explode(',',$rolelist);
//        }

        $response = [
            'status' => 1,
            'msg' => '获取成功',
            'rolelist' => $rolelist
        ];

        return json($response);

    }


    /**
     * 获取所有权限
     */
    public function getAllRules()
    {

        $ruleslist = Db::name('AuthRule')->select();

        $response = [
            'status' => 1,
            'msg' => '获取成功',
            'rolelist' => $ruleslist ?? []
        ];

        return json($response);

    }


    public function index2()
    {

        //首先权限管理只能是超级管理员才能设置还是只要是管理员就能设置


        //超级管理员能够创建管理员账户


        //普通管理员能够创建普通账户

        //查出当前所有的权限
        $authlist = Db::name('AuthRule')->select();
        //查出当前用户所拥有的权限
        $this->assign('authlist', $authlist);
        return $this->fetch();

    }


    /**
     * 添加用户
     */
    public function addUser()
    {

        $username = input('param.username', ''); //获取用户名
        $password = input('param.password', ''); //获取用户密码
        $role = input('param.role', 0); //获取用户角色

        if (empty($role)) {
            $response = [
                'status' => 0,
                'msg' => '角色不能为空'
            ];
            return json($response);
        }

        $userinfo = [
            'username' => $username,
            'password' => sha1($password),
            'createtime' => date('Y-m-d H:i:s'),
            'updatetime' => date('Y-m-d H:i:s')
        ];

        $validate = new UserVlidate();

        if (!$validate->check($userinfo)) {
            //验证失败
            $response = [
                'status' => 0,
                'msg' => $validate->getError()
            ];

            return json($response);

        }

        //开启数据库事务
        // 启动事务
        Db::startTrans();

        $uid = Db::name('User')->insertGetId($userinfo); //插入数据,并返回自增主键,也就是新用户的userid

        $roleinfo = [
            'uid' => $uid,
            'group_id' => $role
        ];

        $res = Db::name('AuthGroupAccess')->insert($roleinfo);

        if ($uid && $res) {
            Db::commit();
            //添加成功
            $response = [
                'status' => 1,
                'msg' => '添加用户成功'
            ];

            return json($response);
        } else {
            //添加用户失败
            Db::rollback();
            $response = [
                'status' => 0,
                'msg' => '添加用户失败'
            ];

        }

        return json($response);


    }


    /**
     * 删除用户
     */
    public function delUser($id = 0)
    {
        if ($id == 0) {
            $response = [
                'status' => 0,
                'msg' => 'ID不能为空',
            ];

            return json($response);
        }
        $res = Db::name('User')->delete($id); // 删除用户
        $res2 = Db::name('AuthGroupAccess')->where(['uid' => $id])->delete(); //删除用户对应的角色
        if ($res && $res2) {
            $response = [
                'status' => 1,
                'msg' => '删除成功',
            ];

        } else {
            $response = [
                'status' => 0,
                'msg' => '删除失败',
            ];
        }

        return json($response);

    }


    /**
     * 编辑用户
     */
    public function editUser()
    {


        $data = input('param.'); //这个里面包含了主键ID


        $userinfo = [
            'id' => $data['id'],
            'username' => $data['username'],
            'password' => sha1($data['newpassword']),
            'updatetime' => date('Y-m-d H:i:s')
        ];

        $validate = new UserVlidate();
        if (!$validate->scene('edit')->check($userinfo)) {
            $response = [
                'status' => 0,
                'msg' => $validate->getError()
            ];

            return json($response);
        }


        //没有输入新密码就不更新密码
        if (empty($data['newpassword'])) {
            unset($userinfo['password']);
        }

        Db::startTrans(); //开启事务
        $res1 = Db::name('User')->update($userinfo);

        $authinfo = [
            'group_id' => $data['role']
        ];

        $res2 = Db::name('AuthGroupAccess')->where(['uid' => $data['id']])->update($authinfo);

        if ($res1 === false || $res2 === false) {

            Db::rollback();
            //更新失败
            $response = [
                'status' => 0,
                'msg' => '更新失败'
            ];

        } else {
            Db::commit();
            //更新成功
            $response = [
                'status' => 1,
                'msg' => '更新成功'
            ];

        }


        return json($response);


    }


    /**
     * 获取用户信息
     */
    public function getUserInfo($id = 0)
    {

        if ($id == 0) {
            $response = [
                'status' => 0,
                'msg' => 'id不能为空',
            ];
            return json($response);
        }

        $userinfo = Db::name('User')
            ->alias('a')
            ->join(['we_auth_group_access' => 'b'], 'a.id = b.uid')
            ->join(['we_auth_group' => 'c'], 'c.id = b.group_id')
            ->field('a.id as userid,a.username,c.*')
            ->find($id);


        $response = [
            'status' => 1,
            'msg' => '获取成功',
            'userinfo' => $userinfo ?? []
        ];

        return json($response);


    }


    /**
     * 添加角色
     */
    public function addRole()
    {

        $data = input('param.');

        if(empty($data['rules'])){
            $rules = 0;
        }else{
            $rules = implode(',',$data['rules']);
        }

        $roleinfo = [
            'title' => $data['title'],
            'rules' => $rules,
            'status' => 1
        ];

        $res = Db::name('AuthGroup')->insert($roleinfo);

        if($res){

            $response = [
                'status' => 1,
                'msg' => '添加成功',
            ];

        }else{

            $response = [
                'status' => 0,
                'msg' => '添加失败',
            ];

        }

        return json($response);

    }


    /**
     * 编辑角色
     */
    public function editRole()
    {

        $data = input('param.');
        
        if(empty($data['rules'])){
            $data['rules'] = 0;
        }else{
            $data['rules'] = implode(',',$data['rules']);
        }


        $res = Db::name('AuthGroup')->update($data);

        if($res === false){
            //更新失败
            $response = [
                'status' => 0,
                'msg' => '更新失败',
            ];
        }else{
            //更新失败
            $response = [
                'status' => 1,
                'msg' => '更新成功',
            ];

        }
        return json($response);


    }


    /**
     * 删除角色
     */
    public function delRole($id = 0)
    {

        if($id == 0){
            $response = [
                'status' => 0,
                'msg' => 'ID不能为空',
            ];

            return json($response);

        }

        $res = Db::name('AuthGroup')->delete($id);

        if($res === false){
            //更新失败
            $response = [
                'status' => 0,
                'msg' => '删除失败',
            ];
        }else{
            //更新失败
            $response = [
                'status' => 1,
                'msg' => '删除成功',
            ];

        }

        return json($response);

    }


    /**
     * 获取所有的公众号配置
     */
    public function getAllWechatConfig()
    {
        $wechatList = Db::name('WechatConfig')->select();

        $response = [
            'status' => 1,
            'msg' => '获取成功',
            'wechatlist' => $wechatList ?? []
        ];

        return json($response);

    }



}
