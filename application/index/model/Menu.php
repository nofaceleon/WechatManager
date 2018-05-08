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
