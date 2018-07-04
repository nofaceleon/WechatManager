<?php

namespace app\index\controller;

use think\Db;

class ImgMaterial extends Common
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
//            $url = $_SERVER['REQUEST_SCHEME'] . '://'.$_SERVER['HTTP_HOST'].'/WechatDevApi/uploads/'.$res['local_imgurl']; //拼接成需要的URL链接
            $url = IMG_URL.$res['local_imgurl']; //拼接成需要的URL链接
            $response = [
                'status' => 1,
                'msg' => '获取成功',
                'url' => $url
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
        $count = Db::name('ImgMaterial')->where("appid = '$appid'")->count();
        $res = Db::name('ImgMaterial')->where("appid = '$appid'")->page($page,$limit)->select();
        if(empty($res)){
            $response = [
                'status' => 0,
                'msg' => '没有数据',
            ];
        }else{
            foreach ($res as $k=>$v){
                $res[$k]['local_imgurl'] = IMG_URL.$v['local_imgurl'];

            }
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
