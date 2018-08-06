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
use think\Db;
use think\Exception;
use think\facade\Cache;

class Tag extends Common
{


    /**
     * 添加用户标签
     */
    public function addTag()
    {
        $tag = input('param.tagid', '');
        $remark = input('param.remark', '');
        $openid = input('param.openid','');
        if (empty($tag)) return Format::error('标签不能为空', 'Tag/addTag/error', $this->wechatconfig['appid']);
        //$tagids = implode(',',$tag);

        //$taglist = Db::name('Tag')->where("id in ($tag)")->column('tag'); //获取标签的内容
        //$tagstr = implode('/',$taglist);


        $data = [
            'openid'=>$openid,
            'tagid'=>$tag,
            'remark'=>$remark,
            'createtime'=>date('Y-m-d H:i:s')
        ];

        try{
            Db::name('UserTag')->insert($data);
            return Format::success('添加标签成功');
        }catch (Exception $e){
            $errormsg = $e->getMessage();
            return Format::error('添加标签失败', 'Tag/addTag/error', $this->wechatconfig['appid'],$errormsg);
        }




    }


    /**
     * 获取标签
     */
    public function getTag_old()
    {

        $res = Db::name('tag')->where(['appid' => $this->wechatconfig['appid']])->select();

        $finalRes = treeTo($res);

        filedebug('标签数据' . print_r($finalRes, true));

        return Format::success('获取数据成功', $finalRes);


    }


    /**
     * 获取标签
     * @return \think\response\Json
     */
    public function getTag()
    {

        $cachename = 'Tag_' . $this->wechatconfig['appid'];
        $topTag = json_decode(Cache::get($cachename),true);
        if (empty($topTag)) {
            //先获取所有父级标签
            $topTag = Db::name('tag')->where(['appid' => $this->wechatconfig['appid'], 'pid' => 0])->field('id as value,tag as label')->select();
            if (empty($topTag)) {
                return Format::error('没有标签数据', 'Tag/getTag/error', $this->wechatconfig['appid']);
            }

            foreach ($topTag as $k => &$v) {
                $children = Db::name('tag')->where(['appid' => $this->wechatconfig['appid'], 'pid' => $v['value']])->field('id as value,tag as label')->select();
                if (!empty($children)) {
                    $v['children'] = $children;
                }
            }
            Cache::set($cachename, json_encode($topTag), 300); //缓存5分钟
        }
        //这边的结果数据
        return Format::success('获取数据成功', $topTag);


    }


}