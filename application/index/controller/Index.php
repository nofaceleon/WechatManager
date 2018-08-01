<?php
namespace app\index\controller;

use think\Db;
use think\Exception;

class Index extends Common
{


    /**
     * 初始功能:
     * 1.自动回复功能
     * 2.自定义菜单功能(基本功能完成)
     * 3.识别二维码中参数,可以进行判断
     */

    /**
     * 显示微信后台管理首页
     */


    /**
     * 返回用户的基本信息
     */
    public function getBaseInfo()
    {
        //测试提交,测试推送 2
        $data = $this->group_id;
        return json($data);

    }



}
