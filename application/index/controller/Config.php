<?php

namespace app\index\controller;

use think\Db;
use think\facade\Request;

class Config extends Common
{
    protected $configModel;

    public function __construct()
    {
        parent::__construct();
        $this->configModel = model('WechatConfig');
//        $this->configModel = Db::name('WechatConfig');

    }

    /**
     * 显示公众号配置页面
     */
    public function index()
    {
        $configList = $this->configModel->getAllWechatConfig($this->userid); //获取所有配置信息
        //处理结果
        foreach ($configList as $k => $v) {
            if ($v['status'] == 1) {
                $configList[$k]['status'] = "<span style='color: green'>使用中</span>";
            } else {
                $configList[$k]['status'] = "<span style='color: red'>未使用</span>";
            }
            $configList[$k]['rawstatus'] = $v['status'];
        }
        $this->assign('configlist', $configList);
        $this->assign('empty', '<td colspan="5" class="empty">暂时没有数据</td>');
        return $this->fetch();
    }


    /**
     * 公众号配置修改界面
     */
    public function editconfig()
    {

        if (Request::isAjax()) {
            $data = input('param.');
            $data['updatetime'] = date('Y-m-d H:i:s');
            //这边数据进行更新的时候需要对数据进行验证,使用验证器进行验证
            $res = $this->configModel->update($data);
            if ($res) {
                $response = [
                    'status' => 1,
                    'msg' => '更新成功!'
                ];
            } else {
                $response = [
                    'status' => 0,
                    'msg' => '更新失败!'
                ];
            }
            return json($response);

        } else {
            $id = input('param.id');
            //根据主键ID查询相关的数据信息
            $configlist = $this->configModel->find($id);
            $this->assign('configlist', $configlist);
            return $this->fetch();
        }

    }


    /**
     * 添加公众号配置
     */
    public function addconfig()
    {

        $this->userAuth('action');

        if (Request::isAjax()) {
            //当是ajax提交
            $data = input('param.');
            $data['uid'] = $this->userid;
            $data['createtime'] = date('Y-m-d H:i:s');
            $data['updatetime'] = date('Y-m-d H:i:s');

            //新增之前判断是否已经存在该公众号了

            $map['appid'] = $data['appid'];
            $is_exist = $this->configModel->where($map)->find();
            if ($is_exist) {
                $response = [
                    'status' => 0,
                    'msg' => '该公众号已经存在',
                ];
                return json($response);
            }

            $res = $this->configModel->insert($data);
            if ($res) {
                $response = [
                    'status' => 1,
                    'msg' => '添加成功!'
                ];
                //将新公众号的路由注册到文件中/route/route.php文件
                $name = pinyin1($data['name']); //获取中文名称的第一个大写字母
                $this->registerRoute($name,$data['appid']); //按照规则注册路由
            } else {
                $response = [
                    'status' => 0,
                    'msg' => '添加失败!'
                ];
            }
            return json($response);

        } else {
            return $this->fetch();
        }

    }


    /**
     * 公众号配置删除
     */
    public function delconfig()
    {
        if (!Request::isAjax()) return;

        $id = input('param.id', 0);
        if (empty($id)) {
            $response = [
                'status' => 0,
                'msg' => 'ID不能为空!',
            ];
            return json($response);
        }

        //根据主键ID删除
        $res = $this->configModel->where(['id'=>$id])->delete();

        if ($res) {
            //删除成功
            $response = [
                'status' => 1,
                'msg' => '删除成功!',
            ];

        } else {
            //删除失败
            $response = [
                'status' => 0,
                'msg' => '删除失败!',
            ];

        }

        return json($response);


    }

    /**
     * 切换公众号账户
     */
    public function changeAccount()
    {
        if (!Request::isAjax()) return;

        $id = input('param.id');

        //根据ID将此ID的状态改为1,其他的状态改为0

        //先查询出所有的公众号列表
        $configList = $this->configModel->getAllWechatConfig($this->userid); //获取所有配置信息
//        dump($configList);die;
//        $configList = Db::name('WechatConfig')->where("uid like '%$this->userid%'")->select(); //这样返回的才是标准的数组格式
        $errornum = 0;
        $this->configModel->startTrans();//开启数据库事务
        foreach ($configList as $k => $v) {
            if ($v['id'] == $id) {
                $configList[$k]['status'] = 1; //将接收到的ID状态改为 1
            } else {
                $configList[$k]['status'] = 0; //其他的状态改为 0
            }
            $configList[$k]['updatetime'] = date('Y-m-d H:i:s'); //更新修改时间

            $res = $this->configModel->update($configList[$k]); //tp3貌似没有批量更新,循环更新

            if ($res === false) {
                $errornum++; //如果中间有失败的,就记录一下
            }

        }

        if ($errornum != 0) {
            //说明更新失败
            $response = [
                'status' => 0,
                'msg' => '切换账号失败',
            ];

            $this->configModel->rollback(); //数据回滚

        } else {
            //数据库更新成功
            $response = [
                'status' => 1,
                'msg' => '切换账号成功',
            ];


            $this->configModel->commit(); //数据提交
        }
        return json($response);


    }


    /**
     * 路由注册,在route.php文件中加入该公众号的路由信息
     */
    public function registerRoute($name = '',$appid = '')
    {
        if(empty($name) || empty($appid)) return;
        $str = "Route::any('$name', 'index/WechatServer/index?appid=$appid');"; //注册路由信息
        file_put_contents('../route/route.php',$str."\r\n",8);
    }
}
