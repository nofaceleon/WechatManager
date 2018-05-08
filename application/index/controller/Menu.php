<?php

namespace app\index\controller;

use think\facade\Request;

class Menu extends Common
{


    public function __construct()
    {
        parent::__construct();

        //自定义菜单的地方需要进行验证
        $this->userAuth();

        $this->menumodel = model('Menu');
    }


    /**
     * 显示公众号菜单信息
     */
    public function index()
    {

        $menulist = $this->menumodel->getMenuinfo($this->wechatconfig['appid']);
        foreach ($menulist as $k => $v) {

            ($v['parentid'] == 0) ? $menulist[$k]['class'] = 'table-secondary' : $menulist[$k]['class'] = '';
            ($v['type'] == 'view') ? $menulist[$k]['type'] = '链接' : $menulist[$k]['type'] = '事件';
            ($v['status'] == '1') ? $menulist[$k]['status'] = '<span style="color: green">可用</span>' : $menulist[$k]['status'] = '<span style="color: red">禁用</span>';
        }
        $this->assign('menulist', $menulist);
        $this->assign('empty', '<td colspan="5" class="empty">暂时没有数据</td>');
        return $this->fetch();
    }

    /**
     * 编辑菜单信息
     */
    public function editmenu()
    {

        if (Request::isAjax()) {
            $data = input('param.'); //接收前端传递过来的数据
            $data['updatetime'] = date('Y-m-d H:i:s');
            //对表单数据进行验证

            $res = $this->menumodel->update($data); //data中包含主键字段就不需要where条件了
            if ($res === false) {
                $response = [
                    'status' => 0,
                    'msg' => '更新失败!'
                ];
            } else {
                $response = [
                    'status' => 1,
                    'msg' => '更新成功!'
                ];
            }
            return json($response);


        } else {
            $id = input('param.menuid', 0); //获取菜单主键ID
            $menuinfo = $this->menumodel->where(['id' => $id])->find(); //获取当前菜单信息
            $topmenu = $this->menumodel->getTopMenu($this->wechatconfig['appid'], $id);//获取所有的顶级菜单信息
            $this->assign('menuinfo', $menuinfo);
            $this->assign('menuparentid', $menuinfo['parentid']);
            $this->assign('topmenu', $topmenu);
            return $this->fetch();

        }

    }


    /**
     * 添加菜单信息
     */
    public function addmenu()
    {

        if (Request::isAjax()) {
            $data = input('param.'); //接收前端传递过来的数据
            $data['createtime'] = date('Y-m-d H:i:s');
            $data['updatetime'] = date('Y-m-d H:i:s');
            $data['appid'] = $this->wechatconfig['appid'];
            //使用模型对表单数据进行验证

            // 验证通过 可以进行其他数据操作
            $res = $this->menumodel->insert($data);
            if ($res) {
                $response = [
                    'status' => 1,
                    'msg' => '添加成功!'
                ];
            } else {
                $response = [
                    'status' => 0,
                    'msg' => '添加失败!'
                ];
            }
            return json($response);

        } else {
            $topmenu = $this->menumodel->getTopMenu($this->wechatconfig['appid']);
            $this->assign('topmenu', $topmenu);
            return $this->fetch();
        }

    }


    /**
     * 删除菜单
     */

    public function delmenu()
    {
        //这边也应该是ajax的请求
        $menuid = input('param.id', '');
        if (empty($menuid)) {
            $response = [
                'status' => 0,
                'msg' => 'ID不能为空!',
            ];
            return json($response);
        }


        //该菜单下面有子类应该禁止删除操作

        //查询是否有子类
        $ishave = $this->menumodel->where(['parentid' => $menuid])->find();
        if ($ishave) {
            //有子菜单,删除失败
            $response = [
                'status' => 0,
                'msg' => '该菜单下含有子菜单,删除失败!',
            ];
            return json($response);
        }

        $res = $this->menumodel->where(['id' => $menuid])->delete();
        if ($res) {
            //删除成功
            $response = [
                'status' => 1,
                'msg' => '删除成功!'
            ];
        } else {
            //删除失败
            $response = [
                'status' => 0,
                'msg' => '删除失败,请稍后再试!'
            ];
        }

        return json($response);


    }

}
