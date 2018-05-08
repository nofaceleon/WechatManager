<?php

namespace app\index\model;

use think\Model;

class WechatConfig extends Model
{
    /**
     * 根据userid获取该用户的配置信息
     * 一个用户可能管理多个公众号
     */
    public function getWechatConfig($userid = 0,$status = 1)
    {
        $res = $this->where("status = $status and uid like '%$userid%'")->find();
        return $res;
    }


    /**
     * 根据userid获取该用户的所有的公众号信息
     */
    public function getAllWechatConfig($userid = 0)
    {
        $res = $this->where("uid like '%$userid%'")->select()->toArray(); //模型的all方法或者select方法返回的是一个包含模型对象的二维数组或者数据集对象,如果需要数组格式的数据需要使用toArray方法转换一下
        return $res;

    }

    /**
     * 根据appid获取用户的配置信息
     */
    public function getWechatConfigByAppid($appid = '')
    {
        $map['appid'] = $appid;
        $configinfo = $this->where($map)->find();
        return $configinfo;
    }
}
