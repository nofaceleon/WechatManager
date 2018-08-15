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
        $openid = input('param.openid', '');
        if (empty($tag)) return Format::error('标签不能为空', 'Tag/addTag/error', $this->wechatconfig['appid']);

        $data = [
            'openid' => $openid,
            'tagid' => $tag,
            'remark' => $remark,
            'createtime' => date('Y-m-d H:i:s')
        ];

        try {
            Db::name('UserTag')->insert($data);
            return Format::success('添加标签成功');
        } catch (Exception $e) {
            $errormsg = $e->getMessage();
            return Format::error('添加标签失败', 'Tag/addTag/error', $this->wechatconfig['appid'], $errormsg);
        }


    }

    /**
     * 不使用递归和循环查询的方法生成三级导航(推荐方法)
     */
    public function getTag()
    {
        //先取出所有的数据
        $alldata = Db::name('Tag')->where(['appid' => $this->wechatconfig['appid']])->field('id as value,tag as label,pid')->select();
        if(empty($alldata)){
            return  Format::error('没有标签数据', 'Tag/getTag/error', $this->wechatconfig['appid']);
        }
        foreach ($alldata as $k => $v) {
            $tmpArr[$v['value']] = $alldata[$k];
        }
        $tree = [];
        foreach ($tmpArr as $k => $v) {
            if (isset($tmpArr[$v['pid']])) {
                //说明有父类
                $tmpArr[$v['pid']]['children'][] = &$tmpArr[$v['value']];
            } else {
                //说明没有父类
                $tree[] = &$tmpArr[$v['value']];
            }
        }
        return Format::success('获取数据成功', $tree);

    }


    /**
     * 获取标签数组 (循环查询,效率很低,反面教材,上面的方法速度差不多是这个的5倍,数据量大的话差距会更明显)
     * @return \think\response\Json
     */
    private function getTag_low()
    {
        $cachename = 'Tag_' . $this->wechatconfig['appid'];
        $topTag = json_decode(Cache::get($cachename), true);
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
                    foreach ($children as $k1 => $v1) {
                        $children2 = Db::name('tag')->where(['appid' => $this->wechatconfig['appid'], 'pid' => $v1['value']])->field('id as value,tag as label')->select();
                        if (!empty($children2)) {
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
     * 通过标签ID来查找子标签(按需查询,暂未使用)
     */
    public function getTageById()
    {
        $tagid = input('param.tagid', 0);
        $taglist = Db::name('tag')->where(['pid' => $tagid])->cache(30)->select();
        return Format::success('获取数据成功', $taglist);
    }





}