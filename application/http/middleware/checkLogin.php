<?php

namespace app\http\middleware;



use app\service\helper\Format;
use think\facade\Session;

class checkLogin
{
    public function handle($request, \Closure $next)
    {
        // 将来使用中间件来验证用户是否登录（完成）
        //获取session中的值
        $userinfo = $this->isExpireSession();
        if($userinfo['status'] == 2){
            //说明没有通过验证'
            return Format::error($userinfo['msg'],'','','',$userinfo['status']);
        }else{
            return $next($request); //将请求进一步交给下一步进行处理
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
            return $response;
//            return Format::error('请先登录222'); //让前端进行判断
            //exit(json_encode($response));
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
            return $response;
//            return Format::error('登录状态已经过期，请重新登录');
//            exit(json_encode($response));
        }
        //更新session中的时间,保证只是在使用的过程中session不会失效
        $alluserinfo['logintime'] = time();
        $alluserinfo['status'] = 1;
        Session::set('alluserinfo', $alluserinfo);
        return $alluserinfo;
    }
}
