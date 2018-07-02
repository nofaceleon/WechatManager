<?php

namespace app\index\controller;

use think\Db;

class Imgmaterial extends Common
{

    /**
     * 根据media_id获取图片路径
     */
    public function getImageUrl()
    {
        $media_id = input('param.media_id','');

        if(empty($media_id)){

            $response = [
                'status' => 0,
                'msg' => 'media_id不能为空'
            ];
            return json($response);
        }
        $res = Db::name('ImgMaterial')->where("media_id = '$media_id'")->cache(300)->find();
        if(empty($res)){

            $response = [
                'status' => 0,
                'msg' => '没有数据'
            ];

        }else{

            $response = [
                'status' => 1,
                'msg' => '获取成功',
                'url' => $res['local_imgurl']
            ];

        }
        return json($response);

    }


    /**
     * 获取所有素材
     */
    public function getAllImg()
    {

        $page = input('param.page',1);
        $limit = input('param.limit',20);
        $appid = $this->wechatconfig['appid'];
        $count = Db::name('ImgMaterial')->where("appid = '$appid'")->cache(300)->count();
        $res = Db::name('ImgMaterial')->where("appid = '$appid'")->page($page,$limit)->select();
        if(empty($res)){
            $response = [
                'status' => 0,
                'msg' => '没有数据',
            ];
        }else{
            $response = [
                'status' => 1,
                'msg' => '获取成功',
                'list' => $res,
                'count' => $count,
            ];
        }

        return json($response);

    }


}
