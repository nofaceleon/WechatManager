<?php

namespace app\index\controller;

use think\Controller;
use think\Db;
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
        $this->wechatuser = $alluserinfo['username']; //当前登录用户的用户名
        $this->userid = $alluserinfo['userid']; //当前登录用户的id
//        $this->wechatconfiglist = $alluserinfo['wechatconfiglist'] ?? ''; //当前登录用户的id
        //$this->wechatconfig = model('WechatConfig')->getWechatConfig($this->userid); //该用户当前使用的微信公众号配置信息

        $this->wechatconfig = Db::name('WechatConfig')->where(['status'=>1])->find(); //找出当前平台正在使用的配置信息

        
        $this->group_id = $alluserinfo['group_id']; //当前登录用户的角色

        //接口权限认证 (common里面不验证)
        //$this->userAuth(); //默认是对控制器进行验证
    }

    /**
     * 用户权限认证,只在需要验证的地方加上该方法
     * $type 验证模式:controller表示对控制器进行验证 ,action表示对控制器中的具体方法进行验证
     */
    protected function userAuth($type = 'controller')
    {

        //return; //临时关闭权限认证
        //在Common中加上权限认证
//        $UserAuth = new Auth();
        $UserAuth = Auth::getInstance(); //使用单例模式实例化对象
        //默认是对控制器进行验证
        if (strcasecmp($type, 'controller') == 0) {
            $authname = Request::module() . '/' . Request::controller(); //获取当前控制器的名称
        } else {
            $authname = Request::module() . '/' . Request::controller() . '/' . Request::action(); //获取当前方法的名称
        }

//        filedebug('验证的规则 = '.$authname);

        //验证当前访问的用户是否有访问的某控制器的权限
        if (!$UserAuth->check($authname, $this->userid)) {
            //如果是ajax请求就返回json格式的数据
            $response = [
                'status' => 0,
                'msg' => '对不起权限不足!'
            ];
            exit(json_encode($response)); //这边直接退出
        }
        return true;
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
        $expiretime = 60 * 20; //定义session有效期为20分钟,也就是10分钟内没有任何操作就显示登录已经过期
        $lasttime = intval($logintime + $expiretime);
        if ($lasttime < time()) {
            //说明登录时间已经过期,清除session
            Session::delete('alluserinfo');
            $response = [
                'status' => 2,
                'msg' => '登录状态已过期,请重新登录'
            ];
            exit(json_encode($response));
        }
        //更新session中的时间,保证只是在使用的过程中session不会失效
        $alluserinfo['logintime'] = time();
        Session::set('alluserinfo', $alluserinfo);
        return $alluserinfo;
    }


    /**
     * 验证api请求的身份(暂未使用)
     * @return bool|\think\response\Json
     */
    protected function authApi_del()
    {

        //验证API信息
        $timestamp = input('post.time', '');
        $apitoken = input('post.apitoken', '');
        //验证该请求是否已经过期
        $expire = 600; //设置每次请求的有效时间
        //在通用方法中对API安全进行验证
        $authres = authApiToken($timestamp, $apitoken);
        if (!$authres || ($timestamp + $expire) < time()) {
            $response = [
                'status' => 0,
                'msg' => 'api auth failed'
            ];
            exit(json_encode($response)); //返回数据并终止程序继续运行
        }
        return true;
    }


    /**
     * 定义空控制器
     * @param $name
     * @return mixed
     */
    public function _empty()
    {
        $response = [
            'status' => 0,
            'msg' => '方法不存在!',
        ];
        return json($response);
    }


}