<?php

namespace app\http\middleware;

use app\service\helper\Format;
use think\facade\Request;
use think\facade\Session;
use UserAuth\Auth;

class checkAuth
{
    // 中间件中可以自定义第三个参数
    public function handle($request, \Closure $next, $type = 'action')
    {

        //TODO 将来使用中间件验证用户权限的问题
        if($this->userAuth($type)){
            //验证通过
            return $next($request);
        }else{
            //验证失败
            return Format::error('对不起撒，权限不足');
        }

    }

    /**
     * $type 验证模式:controller表示对控制器进行验证 ,action表示对控制器中的具体方法进行验证
     * 用户权限认证,只在需要验证的地方加上该方法
     * @param $type
     * @return bool
     */
    protected function userAuth($type)
    {

        //TODO 关于登陆验证跟权限验证，都应该写到中间件中，所有的接口都应该使用自定义的路由
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

        $userid = Session::get('alluserinfo')['userid'];

        return $UserAuth->check($authname, $userid);

//        filedebug('验证的规则 = '.$authname);
//        filedebug('userid = '.$userid);
        //验证当前访问的用户是否有访问的某控制器的权限
//        if (!$UserAuth->check($authname, $userid)) {
//            //如果是ajax请求就返回json格式的数据
////            $response = [
////                'status' => 0,
////                'msg' => '对不起权限不足!'
////            ];
//            return false;
//            //exit(json_encode($response)); //这边直接退出
//        }
//        return true;
    }
}
