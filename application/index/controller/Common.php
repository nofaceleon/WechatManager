<?php
/**
 * Created by PhpStorm.
 * User: song
 * Date: 2018/4/26
 * Time: 22:13
 */

namespace app\index\controller;

use think\Controller;
use think\facade\Request;
use think\facade\Session;
use UserAuth\Auth;


class Common extends Controller
{
    protected $wechatuser; //当前登录的用户名
    protected $userid; //用户ID
    protected $wechatconfig; //公众号配置信息

    public function __construct()
    {
        parent::__construct();

        //验证用户是否已经登录,从session中获取用户是否登录的信息
        $alluserinfo = $this->isExpireSession();
        //$alluserinfo = Session::get('alluserinfo');
        $this->wechatuser = $alluserinfo['username'];
        $this->userid = $alluserinfo['userid'];
        $this->wechatconfig = model('WechatConfig')->getWechatConfig($this->userid);
        //api身份验证

        $this->authApi();

        $this->userAuth();
    }

    /**
     * 用户权限认证,只在需要验证的地方加上该方法
     * @param string $type 验证模式:controller表示对控制器进行验证 ,action表示对控制器中的具体方法进行验证
     * @return \think\response\Json
     */
    protected function userAuth($type = 'controller')
    {

        //return; //临时关闭权限认证
        //在Common中加上权限认证
        $UserAuth = new Auth();
        //默认是对控制器进行验证
        if(strcasecmp($type,'controller') == 0){
            $authname = Request::module() . '/' . Request::controller();
        }else{
            $authname = Request::module() . '/' . Request::controller().'/'.Request::action();
        }
        //验证当前访问的用户是否有访问的某控制器的权限
        if (!$UserAuth->check($authname, $this->userid)) {
            filedebug('权限验证'.$authname);
            //如果是ajax请求就返回json格式的数据
                $response = [
                    'status' => 0,
                    'msg' => '对不起权限不足!'
                ];
                exit(json_encode($response)); //这边直接退出
        }
    }


    /**
     * 判断session是否已经过期,控制登录时间,API
     */
    private function isExpireSession()
    {

        //判断是否有session
        $alluserinfo = Session::get('alluserinfo');

        if (empty($alluserinfo)) {
            //用户没有登录,返回到首页
            $response = [
                'status' => 2,
                'msg' => '请先登录'
            ];
            exit(json_encode($response));
        }

        //控制session的有效期
        $logintime = $alluserinfo['logintime'];
        $expiretime = 60 * 10; //定义session有效期为10分钟
        $lasttime = intval($logintime + $expiretime);
        if ($lasttime < time()) {
            //说明登录时间已经过期,清除session,并重定向到首页
            Session::delete('alluserinfo');
            $response = [
                'status' => 2,
                'msg' => '登录状态已过期,请重新登录'
            ];
            exit(json_encode($response));
        }
        //更新session中的时间,保证只是在使用的过程中session不会失效
        $alluserinfo['logintime'] = time();
        Session::set('alluserinfo',$alluserinfo);
        return $alluserinfo;
    }


    /**
     * 验证api身份
     * @return bool|\think\response\Json
     */
    protected function authApi()
    {
        //验证API信息
        $timestamp = input('post.time', '');
        $apitoken = input('post.apitoken', '');
        //验证该请求是否已经过期
        $expire = 600; //设置每次请求的有效时间
        //在通用方法中对API安全进行验证
        $authres = authApiToken($timestamp,$apitoken);
        if(!$authres || ($timestamp+$expire) < time()){
            $response = [
                'status' => 0,
                'msg' => 'api auth failed'
            ];
            exit(json_encode($response)); //返回数据并终止程序继续运行
        }
        return true;
    }





}