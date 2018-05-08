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
use think\facade\Request;
use think\facade\Session;

class Login extends Controller
{
    /**
     * 显示登录界面
     */
    public function index()
    {

        //判断如果已经登录的话就直接跳转到首页

        $alluserinfo = Session::get('alluserinfo');
        if(!empty($alluserinfo)){
            //说明已经登录过了,直接跳转到首页
            $this->redirect('index/Index/index');
        }
        $this->assign('iscaptcha', CAPTCHA);
        return $this->fetch();
    }


    /**
     * 用户登录接口
     */
    public function userLogin()
    {
        $username = input('post.username', '');
        $pwd = input('post.pwd', '');
        $timestamp = input('post.time', '');
        $apitoken = input('post.apitoken', '');

        $authres = authApiToken($timestamp,$apitoken);
        if(!$authres){
            $response = [
                'status' => 0,
                'msg' => 'api auth failed'
            ];
            return json($response);
        }


        if (CAPTCHA) {
            //验证验证码是否正确
            $result = VerifyLoginServlet($_POST['geetest_challenge'], $_POST['geetest_validate'], $_POST['geetest_seccode']);
            if (!$result) {
                //验证码验证不通过
                $response = [
                    'status' => 0,
                    'msg' => '请先点按钮验证再获取验证码!'
                ];
                return json($response);

            }
        }

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
            $res = $usermodel->where($map)->find();
            if ($res) {
                //说明用户名和密码正确
                $response = [
                    'status' => 1,
                    'msg' => '登录成功!'
                ];
                //将登录的用户名存入session中

                $alluserinfo = [
                    'username' => $username,
                    'userid' => $res['id'],
                    'logintime' => time()
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
     * 用户登出功能
     */
    public function logout()
    {
//        Session::delete('wechatuser'); //清除session
        Session::delete('alluserinfo'); //清除session
        $this->redirect('index/Login/index');

    }


    /**
     * 极验验证码
     */
    public function GeetTest()
    {
        //获取极验验证码的配置文件
        $GtSdk = new GeetestLib(config('myconfig.CAPTCHA_ID'), config('myconfig.PRIVATE_KEY'));
        $data = array(
            "user_id" => session_id(), # 网站用户id
            "client_type" => "web", #web:电脑上的浏览器；h5:手机上的浏览器，包括移动应用内完全内置的web_view；native：通过原生SDK植入APP应用的方式
            "ip_address" => Request::ip() # 请在此处传输用户请求验证时所携带的IP
        );
        $status = $GtSdk->pre_process($data, 1);

        Session::set('gtserver', $status);
        Session::set('user_id', $data['user_id']);

        echo $GtSdk->get_response_str();
        exit();
    }

}