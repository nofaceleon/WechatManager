<?php

namespace app\index\model;

use think\Model;

class Menu extends Model
{
    /**
     * 根据公众号appid获取无限极分类信息
     * @param string $appid
     * @return array
     */
    public function getMenuinfo($appid = '')
    {
        //查询出所有的菜单选项
        $map['appid'] = $appid;
        $menuinfo = $this->where($map)->select()->toArray();
        $data = tree($menuinfo);
        return $data;

    }


    /**
     * 根据公众号appid获取无限极分类信息
     * @param string $appid
     * @return array
     */
    public function getMenuInfoNew($appid = '')
    {
        //查询出所有的菜单选项
        $map['appid'] = $appid;
        $map['parentid'] = 0;
        $menuinfo = $this->where($map)->select()->toArray();
        if(empty($menuinfo)){
            return [];
        }
        //先找出所有的顶级菜单
        foreach ($menuinfo as $k => $v){
            //循环查询该顶级菜单下面是否有子菜单
            $chmenu = $this->where(['parentid'=>$v['id']])->select()->toArray();
            $chmenu = empty($chmenu) ? [] : $chmenu;
                //说明有子菜单,将所有子菜单的数据放到顶级菜单下面
            $menuinfo[$k]['chmenu'] = $chmenu;
        }

        return $menuinfo;


    }

    /**
     * 获取顶级菜单
     * @param string $appid
     * @param int $id
     * @return mixed
     */
    public function getTopMenu($appid = '',$id = 0)
    {

        //$map['字段2']  = array('表达式','查询条件2');
//        $map['parentid']  = array('EQ',0);
//        $map['id']  = array('NEQ',$id);
//        $map['appid']  = array('EQ',$appid);
        $topmenu = $this->where("parentid = 0 and appid = '$appid' and id <> $id")->select()->toArray();
        return $topmenu;
    }
}
