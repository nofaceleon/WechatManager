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

        $this->isAjax = Request::isAjax(); //是否验证是不是ajax请求

        //验证用户是否已经登录,从session中获取用户是否登录的信息
        $alluserinfo = $this->isExpireSession();

        //$alluserinfo = Session::get('alluserinfo');

        $this->wechatuser = $alluserinfo['username'];
        $this->userid = $alluserinfo['userid'];

        //$this->wechatuser = Session::get('wechatuser');
        //$this->userid = Session::get('userid');
//        if (empty($this->wechatuser)) {
//            //说明用户没有登录,跳转到登录页面
//            $this->redirect('index/Login/index');
//        }
        $this->wechatconfig = model('WechatConfig')->getWechatConfig($this->userid);
        $this->assign('wechatname', $this->wechatconfig['name']);

        //$this->userAuth();

//        $isAuth = 0; //是否开启权限认证
//        if($isAuth){
//            //在Common中加上权限认证
//            $UserAuth = new Auth();
//            //验证当前访问的用户是否有访问的某控制器的权限
//            if(!$UserAuth->check(Request::module().'-'. Request::controller(),$this->userid)){
//                //如果是ajax请求就返回json格式的数据
//                if(Request::isAjax()){
//                    $response = [
//                        'status' => 0,
//                        'msg' => '没有权限!'
//                    ];
//                    return json($response);
//                }else{
//                    $this->error('你没有权限');
//                }
//
//            }
//        }

    }

    /**
     * 用户权限认证,只在需要验证的地方加上该方法
     * @param string $type 验证模式:controller表示对控制器进行验证 ,action表示对控制器中的具体方法进行验证
     * @return \think\response\Json
     */
    protected function userAuth($type = 'controller')
    {

        return; //临时关闭权限认证

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
            //如果是ajax请求就返回json格式的数据
            if (Request::isAjax()) {
                $response = [
                    'status' => 0,
                    'msg' => '对不起权限不足!'
                ];
//                return json($response);
                exit(json_encode($response)); //这边直接退出
            } else {
                //不是ajax请求就直接跳转到错误界面
                $this->error('你没有权限');
            }
        }

        return;
    }


    /**
     * 判断session是否已经过期,控制登录时间,API
     */
    private function isExpireSession()
    {

        //判断是否有session
        $alluserinfo = Session::get('alluserinfo');
        if (empty($alluserinfo)) {
            $this->redirect('index/Login/index');
        }
        //控制session的有效期
        $logintime = $alluserinfo['logintime'];
        $expiretime = 60 * 10; //定义session有效期为10分钟
        $lasttime = intval($logintime + $expiretime);
        if ($lasttime < time()) {
            //说明登录时间已经过期,清除session,并重定向到首页
            Session::delete('alluserinfo');
            $this->redirect('index/Login/index');
        }
        //更新session中的时间,保证只是在使用的过程中session不会失效
        $alluserinfo['logintime'] = time();
        Session::set('alluserinfo',$alluserinfo);


        return $alluserinfo;
    }





}