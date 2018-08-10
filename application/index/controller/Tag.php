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

        $data = [
            'openid'=>$openid,
            'tagid'=>$tag,
            'remark'=>$remark,
            'createtime'=>date('Y-m-d H:i:s')
        ];


//        $validate = new TagValidate(); //实例化验证器
//        if(!$validate->check($data)){
//            //验证不通过
//            return Format::error($validate->getError(), 'Tag/addTag/error', $this->wechatconfig['appid']);
//        }
//

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


        $tmp = [];

        foreach ($finalRes as $k=>$v){
            if($v['pid'] == 0){
               $tmp[] = $v;
            }
        }

       // filedebug('标签数据' . print_r($finalRes, true));
        return Format::success('获取数据成功', $finalRes);


    }


    public function getTageRaw()
    {
        $res = Db::name('tag')->where(['appid' => $this->wechatconfig['appid']])->field('id as value,tag as label,pid')->select();

        $resres = $this->ttest($res,0);

        return Format::success('获取数据成功', $resres);

    }



    public function ttest($arr,$pid = 0)
    {

        static $list = [];
        foreach ($arr as $k=>$v){
            if($v['pid'] == $pid){
                if($pid == 0){
                    $list[] = $v;
                }else{
                    $list[$v['pid']]['children'] = $v;
                }
                $this->ttest($arr,$v['value']);
            }

        }
        return $list;

    }




    /**
     * 获取标签
     * @return \think\response\Json
     */
    public function getTag()
    {

        //TODO 这边后续最好改成一次查询,然后递归出数据
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
                    foreach ($children as $k1=>$v1){
                        $children2 = Db::name('tag')->where(['appid' => $this->wechatconfig['appid'], 'pid' => $v1['value']])->field('id as value,tag as label')->select();
                        if(!empty($children2)){
                            $v['children'][$k1]['children'] = $children2;
                        }
                    }
                }

            }
            Cache::set($cachename, json_encode($topTag), 300); //缓存5分钟
        }
        //这边的结果数据
        return Format::success('获取数据成功', $topTag);


    }


    /**
     * 通过标签ID来查找子标签
     */
    public function getTageById()
    {
        $tagid = input('param.tagid',0);
        $taglist = Db::name('tag')->where(['pid'=>$tagid])->cache(30)->select();
        return Format::success('获取数据成功',$taglist);
    }







}