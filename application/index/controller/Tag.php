<?php
/**
 * Created by PhpStorm.
 * User: 123
 * Date: 2018/8/3
 * Time: 16:33
 *
 * 用户标签
 */
namespace app\index\controller;

use app\service\helper\Format;

class Tag extends Common
{


    /**
     * 添加用户标签
     */
    public function addTag()
    {
        $tag = input('param.tag','');
        if(empty($tag)) return Format::error('标签不能为空','Tag/addTag/error', $this->wechatconfig['appid']);
        






    }


    /**
     * 获取标签
     */
    public function getTag()
    {

    }

}