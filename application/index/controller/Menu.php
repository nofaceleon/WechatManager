<?php

namespace app\index\controller;

use app\index\validate\MenuValidate;
use think\Db;
use think\facade\Request;
use think\facade\Validate;

class Menu extends Common
{

    public function __construct()
    {
        parent::__construct();

        //自定义菜单的地方需要进行验证
        $this->menumodel = model('Menu');
    }


    /**
     * 显示公众号菜单信息
     *
     */
    public function index()
    {
        //$menulist = $this->menumodel->getMenuinfo($this->wechatconfig['appid']);
        $menulist = $this->menumodel->getMenuInfoNew($this->wechatconfig['appid']);
        $menulist = empty($menulist) ? [] : $menulist;
        $response = [
            'status' => 1,
            'msg' => '获取数据成功',
            'menulist' => $menulist,
        ];

        return json($response);

    }

    /**
     * 编辑菜单信息
     */
    public function editMenu()
    {

        $this->userAuth('action');

        $data = input('param.'); //接收前端传递过来的数据
        $data['updatetime'] = date('Y-m-d H:i:s');


        if (isset($data['miniprogramurl']) && !empty($data['miniprogramurl'])) {
            $data['url'] = $data['url'] . ';' . $data['miniprogramurl']; //使用
            unset($data['miniprogramurl']);
        }


        //对表单数据进行验证
        //说明是外链
        //使用验证器验证URL是否符合规则
        $validate = new MenuValidate();
        if (!$validate->check($data)) {
            $response = [
                'status' => 0,
                'msg' => $validate->getError()
            ];
            return json($response);
        }

        $res = $this->menumodel->update($data); //data中包含主键字段就不需要where条件了
        if ($res === false) {
            $response = [
                'status' => 0,
                'msg' => '更新失败!'
            ];

            doLog('编辑菜单', '修改失败', '', 'Menu/editMenu/error', $this->wechatconfig['appid'], $this->userid);

        } else {
            $response = [
                'status' => 1,
                'msg' => '更新成功!'
            ];

            doLog('编辑菜单', '修改成功', json_encode($data), 'Menu/editMenu', $this->wechatconfig['appid'], $this->userid);
        }
        return json($response);

    }


    /**
     * 获取菜单信息
     */
    public function getMenuInfo($id = 0)
    {

        if ($id == 0) {
            $response = [
                'status' => 0,
                'msg' => 'ID不能为空'
            ];
            return json($response);
        }
        $menuinfo = Db::name('Menu')->find($id);
        if (empty($menuinfo)) {
            $response = [
                'status' => 0,
                'msg' => '没有数据!'
            ];
        } else {
            //当菜单类型是小程序的时候
            if (strcasecmp($menuinfo['type'], 'miniprogram') == 0) {
                $patharr = explode(';', $menuinfo['url']);
                $menuinfo['url'] = $patharr[0] ?? '';
                $menuinfo['miniprogramurl'] = $patharr[1] ?? '';
            }

            $response = [
                'status' => 1,
                'msg' => '获取成功',
                'menuinfo' => $menuinfo
            ];
        }


        return json($response);

    }

    /**
     * 更改启用或者禁用的状态
     */
    public function exchangeStatus()
    {

        $id = input('param.id', 0);
        $status = input('param.status', 0);
        if ($id == 0) {
            $response = [
                'status' => 0,
                'msg' => 'ID不能为空!'
            ];
            return json($response);
        }
        $data['id'] = $id;
        $data['status'] = $status;
        $data['updatetime'] = date('Y-m-d H:i:s');

        $res = Db::name('Menu')->update($data);
        if ($res === false) {
            $response = [
                'status' => 0,
                'msg' => '修改状态失败!'
            ];

        } else {
            $response = [
                'status' => 1,
                'msg' => '修改状态成功!'
            ];

        }

        return json($response);

    }


    /**
     * 添加菜单信息
     */
    public function addMenu()
    {

        $this->userAuth('action');
        $data = input('param.'); //获取全部请求数据
        //作为登录才能使用的接口,不需要进行安全认证
        $data['createtime'] = date('Y-m-d H:i:s');
        $data['updatetime'] = date('Y-m-d H:i:s');
        $data['appid'] = $this->wechatconfig['appid'];
        if (isset($data['miniprogramurl']) && !empty($data['miniprogramurl'])) {
            $data['url'] = $data['url'] . ';' . $data['miniprogramurl']; //使用 //TODO 这边之后应该改成存储json格式的数据
            unset($data['miniprogramurl']);
        }

        //使用验证器对表单数据进行验证
        $validate = new MenuValidate();

        if (!$validate->check($data)) {
            //验证失败
            $response = [
                'status' => 0,
                'msg' => $validate->getError()
            ];
            return json($response);
        }

        // 验证通过 可以进行其他数据操作
        $res = $this->menumodel->insert($data);
        if ($res) {
            $response = [
                'status' => 1,
                'msg' => '添加成功!'
            ];

            doLog('添加菜单', '添加菜单成功', json_encode($data), 'Menu/addMenu/error', $this->wechatconfig['appid'], $this->userid);

        } else {
            $response = [
                'status' => 0,
                'msg' => '添加失败!'
            ];
            doLog('添加菜单', '添加失败', '', 'Menu/addMenu', $this->wechatconfig['appid'], $this->userid);
        }
        return json($response);


    }


    /**
     * 获取所有的父级菜单
     */
    public function getTopMenu()
    {
        $topmenu = $this->menumodel->getTopMenu($this->wechatconfig['appid']); //获取顶级菜单数据
        return json($topmenu);

    }

    /**
     * 删除菜单
     */
    public function delMenu()
    {


        $this->userAuth('action');
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
