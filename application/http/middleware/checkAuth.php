<?php

namespace app\http\middleware;

class checkAuth
{
    public function handle($request, \Closure $next)
    {

        //TODO 将来使用中间件验证用户权限的问题
    }
}
