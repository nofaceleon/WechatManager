<?php

namespace app\http\middleware;

class checkLogin
{
    public function handle($request, \Closure $next)
    {
        //TODO 将来使用中间件来验证用户是否登录
    }
}
