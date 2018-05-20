<?php
/**
 * Created by PhpStorm.
 * User: song
 * Date: 2018/4/26
 * Time: 22:14
 */

namespace app\index\controller;

use Geetest\GeetestLib;
use think\Controller;
use think\Db;
use think\facade\Request;
use think\facade\Session;

class Login extends Controller
{



    public function __construct()
    {
        parent::__construct();


    }


    /**
     * 用户登录接口
     */
    public function userLogin()
    {
        $username = input('post.username', '');
        $pwd = input('post.pwd', '');
        if (empty($username) || empty($pwd)) {
            $response = [
                'status' => 2,
                'msg' => '用户名或密码不能为空!'
            ];
            return json($response);
        } else {

            //验证用户名密码是否正确
            $usermodel = model('User');
            $map['username'] = $username;
            $map['password'] = sha1($pwd);
            $password = sha1($pwd);

            $res = Db::name('User')->alias('a')->join(['we_auth_group_access'=>'b'],"a.id = b.uid")->where("a.username = '$username' and a.password = '$password'")->field("a.*,b.group_id")->find();

           // $res = $usermodel->where($map)->find();
            if ($res) {
                //说明用户名和密码正确
                $response = [
                    'status' => 1,
                    'msg' => '登录成功!'
                ];

                doLog('用户登录','登录成功',$username.'登录','Login/userLogin');

                //将登录的用户名存入session中

                $alluserinfo = [
                    'username' => $username,
                    'userid' => $res['id'],
                    'logintime' => time(),
//                    'wechatconfiglist' =>$res['wechatconfiglist'],
                    'group_id' => $res['group_id']
                ];

//                    Session::set('wechatuser',$username);
//                    Session::set('userid',$res['id']);
                Session::set('alluserinfo', $alluserinfo);
//                    mglog('登录后台系统');
            } else {
                //验证失败
                $response = [
                    'status' => 2,
                    'msg' => '用户名或密码错误!',
                ];
            }
            return json($response);
        }

    }


    /**
     * 用户登出功能,清除session跳转到首页
     */
    public function logout()
    {
//        Session::delete('wechatuser'); //清除session
        Session::delete('alluserinfo'); //清除session
        $response = [
            'status' => 1,
            'msg' => '退出成功!',

        ];
        return json($response);
    }



}