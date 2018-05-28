<?php
namespace app\index\controller;

use think\Db;
use think\facade\Cache;
use think\facade\Request;
use think\Validate;
use Wxcomponent\WechatApi;

class Wechat extends Common
{

    public function __construct()
    {
        parent::__construct();
        //这边目前只能使用一个账号的配置信息
        $config = [
            'appid' => $this->wechatconfig['appid'],
            'appsecret' => $this->wechatconfig['appsecret'],
            'token' => $this->wechatconfig['token'],
        ];
        $this->weixin = new WechatApi($config);

    }
    /**
     * 创建自定义菜单
     */
    public function createMenu()
    {

        $this->userAuth('action');

        //先查出顶级菜单
        $MenuModel = model('Menu');
        $map['parentid'] = 0;
        $map['status'] = 1;
        $map['appid'] = $this->wechatconfig['appid'];
        $mainbutton = $MenuModel->where($map)->order('sort desc')->select()->toArray(); //根据为微信公众号的appid查询出对应的菜单(顶级菜单)

        $finall = [];
        foreach ($mainbutton as $k => $v) {
            //查询出所有的子按钮
            $main[$k]['name'] = $v['buttonname'];
            $childbutton = $MenuModel->where(['parentid' => $v['id'], 'status' => 1])->order('sort desc')->select()->toArray(); //转换成数组格式的数据,tp5使用模型进行select查询的时候返回的是对象格式的数据

            if (empty($childbutton)) {
                //说明没有子按钮
//                $main[$k]['name'] = $v['buttonname'];
                $main[$k]['type'] = $v['type'];
                if (strcasecmp($v['type'], 'view') == 0) {
                    $main[$k]['url'] = $v['url'];
                } elseif (strcasecmp($v['type'], 'media_id') == 0) {
                    //说明是图文消息
                    $main[$k]['media_id'] = $v['url'];
                } elseif (strcasecmp($v['type'], 'miniprogram') == 0) {
                    //说明是小程序
                    $main[$k]['appid'] = $v['key'];
                    $main[$k]['pagepath'] = $v['url'];
                } else {
                    $main[$k]['key'] = 'rselfmenu_' . $v['id'] . '_0';
                }
            } else {
                //说明有子按钮
//                $arr['name']= $v['buttonname'];
                foreach ($childbutton as $ckey => $cvalue) {
                    //filedebug('cvalue = ' . print_r($cvalue, true));
                    $temp[$ckey]['name'] = $cvalue['buttonname'];
                    $temp[$ckey]['type'] = $cvalue['type'];
//                    $temp[$ckey]['key']= 'rselfmenu_'.$v['id'].'_'.$ckey;
                    if (strcasecmp($cvalue['type'], 'view') == 0) {
                        $temp[$ckey]['url'] = $cvalue['url'];
                    } elseif (strcasecmp($cvalue['type'], 'media_id') == 0) {
                        $temp[$ckey]['media_id'] = $cvalue['url'];
                    } elseif (strcasecmp($cvalue['type'], 'miniprogram') == 0) {
                        //说明是小程序
                        //TODO 这边之后的数据应该改成json格式的数据
                        $temp[$ckey]['appid'] = $cvalue['key'];
                        $pathstr = trim($cvalue['url'], ';');
                        $patharr = explode(';', $pathstr);//将字符串分割成数组
                        $temp[$ckey]['pagepath'] = $patharr[0]; //小程序路径
                        $temp[$ckey]['url'] = $patharr[1]; //低版本微信中无法打开小程序的时候跳转的页面

                    } else {
                        $temp[$ckey]['key'] = 'rselfmenu_' . $v['id'] . '_' . $ckey;
                    }
                }
                $main[$k]['sub_button'] = $temp;
                unset($temp); //临时数组用完之后需要清空,防止下次循环的时候导致数据重复!!!!
            }
        }

        $finall['button'] = $main;
        //filedebug('最后推送的数据格式为 = '.print_r($finall,true));
        $res = $this->weixin->createMenu($finall); //调用接口推送菜单栏
        if ($res) {
            $response = [
                'status' => 1,
                'msg' => '推送成功!',
            ];

            doLog('Wechat/createMenu','推送菜单成功','',$this->wechatconfig['appid']);


            //推送成功后把当前是哪个用户推送的操作记录写入数据库日志中


        } else {
            $response = [
                'status' => 0,
                'msg' => '推送失败:' . $this->weixin->errMsg,
            ];

            doLog('Wechat/createMenu/error','推送菜单失败',$this->weixin->errMsg,$this->wechatconfig['appid']);


        }

        return json($response);

    }


    /**
     * 从微信服务器中获取菜单,并写入数据库中
     * 没有对重复信息进行过滤
     */
    public function getMenu()
    {

        $this->userAuth('action');

        $menuinfo = $this->weixin->getMenu();

        //获取菜单信息出错,返回错误信息
        if ($menuinfo === false) {
            $response = [
                'status' => 0,
                'msg' => $this->weixin->errMsg //返回具体的错误信息
            ];
            return json($response);
        }

        //filedebug('获取到的菜单信息是 = ' . print_r($menuinfo, true));
        $menu = $menuinfo['menu'];
        $data['appid'] = $this->wechatconfig['appid'];
        $errornum = 0; //添加失败的数量
        $successnum = 0; //添加成功的数量
        if (empty($menu)) {
            $response = [
                'status' => 0,
                'msg' => '没有菜单信息'
            ];
            return json($response);
        }


        //获取到菜单信息后先清空数据库然后再进行插入,数据插入失败怎么办?

        $res = Db::name('Menu')->where(['appid' => $this->wechatconfig['appid']])->delete();//删除表中该APPID对应的菜单的所有数据


        foreach ($menu as $k1 => $v1) {
            foreach ($v1 as $k2 => $v2) {
                if (empty($v2['sub_button'])) {
                    //说明没有子菜单了
                    $data['buttonname'] = $v2['name'];
                    $data['type'] = $v2['type'];

                    $type = $v2['type'];

                    if(strcasecmp($type,'miniprogram') == 0){
                        $data['key'] = $v2['appid']; //小程序的appid
                        $data['url'] = $v2['pagepath'].';'.$v2['url'];
                    }else{
                        $data['url'] = $v2['url'] ?? $v2[$type];
                    }
                    
                   // $data['url'] = $v2['url'];

                    $data['parentid'] = 0; //没有子菜单,该菜单就是顶级菜单
                    $data['sort'] = 0;
                    $data['status'] = 1;
                    $data['createtime'] = date('Y-m-d H:i:s');
                    $data['updatetime'] = date('Y-m-d H:i:s');
                    $res1 = Db::name('Menu')->insert($data); //数据库中添加数据
                    if (!$res1) {
                        $errornum++;
                    } else {
                        $successnum++;
                    }
                } else {
                    //说明有子菜单
                    //先添加顶级菜单,根据顶级菜单返回的主键ID再循环添加子菜单
                    $data['buttonname'] = $v2['name'];
                    $data['type'] = 'show';
                    $data['parentid'] = 0; //没有子菜单,该菜单就是顶级菜单
                    $data['sort'] = 0;
                    $data['status'] = 1;
                    $data['createtime'] = date('Y-m-d H:i:s');
                    $data['updatetime'] = date('Y-m-d H:i:s');
                    $pkid = Db::name('Menu')->insertGetId($data); //数据库中添加数据,并返回自增的主键id
                    if (!$pkid) {
                        $errornum++;
                    } else {
                        $successnum++;
                        foreach ($v2['sub_button'] as $k3 => $v3) {
                            $type = $v3['type'];
                            $ch_data['appid'] = $this->wechatconfig['appid'];
                            $ch_data['buttonname'] = $v3['name'];
                            $ch_data['type'] = $type;

                            if(strcasecmp($type,'miniprogram') == 0){
                                //当按钮类型是小程序的时候
                                $ch_data['key'] = $v3['appid']; //小程序的appid
//                                $ch_data['url'] = $v3['pagepath'].';'.$v3['url'];
                                $ch_data['url'] = $v3['url'].';'.$v3['pagepath'];
                            }else{
                                $ch_data['url'] = $v3['url'] ?? $v3[$type];
                            }

                            // $ch_data['media_id'] = $v3['media_id'] ?? '';
                            $ch_data['parentid'] = $pkid; //子菜单的父级ID
                            $ch_data['sort'] = 0;
                            $ch_data['status'] = 1;
                            $ch_data['createtime'] = date('Y-m-d H:i:s');
                            $ch_data['updatetime'] = date('Y-m-d H:i:s');
                            $res2 = Db::name('Menu')->insert($ch_data);
                            if (!$res2) {
                                $errornum++;
                            } else {
                                $successnum++;
                            }

                            unset($ch_data); //清空临时数组

                        }
                    }

                }

            }
        }
        $response = [
            'status' => 1,
            'msg' => '成功添加' . $successnum . '条数据,失败' . $errornum . '条',
        ];

        doLog('Wechat/getMenu','从微信端获取菜单',$response['msg'],$this->wechatconfig['appid']);


        return json($response);
    }


    /**
     * 获取微信模板消息ID,并更新到数据库中
     */
    public function getTempListInfo()
    {
        
        $this->userAuth('action');//这个方法中加入权限控制
        //从微信服务器中获取模板列表
        $templist = $this->weixin->getTempList();
        if ($templist === false) {
            $response = [
                'status' => 0,
                'msg' => '获取模板列表失败!' . $this->weixin->errMsg,
            ];

            doLog('Wechat/getTempListInfo/error','从微信端获取模板列表失败',$this->weixin->errMsg,$this->wechatconfig['appid']);

            return json($response);
        }

        $tempmodel = model('Template');
        $successnum = 0;
        $errornum = 0;
        //循环将数据写入数据库中
        foreach ($templist['template_list'] as $k => $v) {
            $v['appid'] = $this->wechatconfig['appid'];
            $v['createtime'] = date('Y-m-d H:i:s');
            $v['updatetime'] = date('Y-m-d H:i:s');
            //判断是添加数据还是新增数
            //关于数据添加和验证的过程,应该重新写 sjs
            //通过了验证
            //通过模板ID来判断是更新操作还是添加操作

            $template_id = $v['template_id'];
            $ishave = $tempmodel->where(['template_id' => $template_id])->find(); //这边返回的是一个对象
            if (!empty($ishave)) {
                //说明数据已经存在,不执行操作
                $res = false;
            } else {
                //执行添加操作
                $res = $tempmodel->insert($v);
            }

            if ($res === false) {
                $errornum++;
            } else {
                $successnum++;
            }

        }
        if ($errornum == 0) {
            $response = [
                'status' => 1,
                'msg' => '更新成功!',
            ];
        } else {
            $response = [
                'status' => 0,
                'msg' => '结果 = 添加:' . $successnum . '条,未更新:' . $errornum . '条',
            ];
        }


        doLog('Wechat/getTempListInfo','从微信端获取模板列表成功',$response['msg'],$this->wechatconfig['appid']);

        return json($response);


    }


    /**
     * 新版推送模板消息
     */
    public function pushTemMsg()
    {
        $this->userAuth('action');
        $alldata = $_POST; //使用原生的获取提交的信息,防止一些数据被过滤掉
        if (empty($alldata)) {
            $response = [
                'status' => 0,
                'msg' => '推送数据不能为空!'
            ];
            return json($response);
        }

        if (empty($alldata['senduser'])) {
            $response = [
                'status' => 0,
                'msg' => '请输入符合规则的接收人数据!',
            ];
            return json($response);
        }
        //去掉末尾的分号
        $alldata['senduser'] = trim($alldata['senduser'], ';');
        $senduserlist = explode(';', $alldata['senduser']); //将接收人信息分成数组格式

        $flag = 1;
        for ($i = 1; $i <= $alldata['keywordscount']; $i++) {
            $name = 'keyword' . $i;
            //$$name = $alldata[$name];
            if (empty($alldata[$name])) {
                $flag = 0;
            }
            $data[$name]['value'] = $alldata[$name];
            $data[$name]['color'] = '#173177'; //颜色目前先固定为黑色
        }

        if (empty($alldata['first']) || empty($alldata['remark'])) $flag = 0;
        if (!$flag) {
            //说明推送的数据中有空的数据
            $response = [
                'status' => 0,
                'msg' => '推送数据不能为空!',
            ];
            return json($response);
        }

        $data['first']['value'] = $alldata['first'];
        $data['first']['color'] = '#173177';
        $data['remark']['value'] = $alldata['remark'];
        $data['remark']['color'] = '#173177';

        if (!empty($alldata['url'])) {
            //验证URL是否合法
            if (validateURL($alldata['url'])) {
                $pushdata['url'] = $alldata['url'];
            } else {
                $response = [
                    'status' => 0,
                    'msg' => 'URL不合法!',
                ];
                return json($response);
            }

        }

        //判断是否有小程序路径
        if (!empty($alldata['miniprogram'])) $pushdata['miniprogram'] = $alldata['miniprogram'];

        $pushdata['template_id'] = $alldata['templatid'];
        $pushdata['topcolor'] = '#FF0000';
        $pushdata['data'] = $data;

        $successnum = 0; //推送成功的数量
        $errornum = 0; //推送失败的数量

        //循环推送模板消息
        foreach ($senduserlist as $k => $v) {
            $pushdata['touser'] = $v; //将接收者openid替换一下
            $result = $this->weixin->sendTemplateMessage($pushdata);
            if ($result === false) {
                //推送失败
                $errornum++;
                //将错误信息存入数组中,之后一次性循环写入数据库
                $errorarr[] = '详细:' . 'OPENID = ' . $v . '错误原因 = ' . $this->weixin->errMsg;
//                doLog($this->wechatconfig['appid'],'', '推送模板消息失败', '详细:' . 'OPENID = ' . $v . '错误原因 = ' . $this->weixin->errMsg, 'pushTemMsg', __CLASS__);
            } else {
                //推送成功
                $successnum++;
            }
        }

        $msg = '成功:' . $successnum . '条,失败:' . $errornum . '条.';

        //将推送记录存储到数据库中
        $temppushlogmodel = model('TemplatePushlog');

        $info['title'] = $alldata['temptitle'];
        $info['uid'] = $this->userid;
        $info['wechatappid'] = $this->wechatconfig['appid'];
        $info['template_id'] = $alldata['templatid'];
        $info['content'] = json_encode($pushdata);
        $info['msg'] = $msg;
        $info['senduser'] = $alldata['senduser'];
        $info['createtime'] = date('Y-m-d H:i:s');
        $info['updatetime'] = date('Y-m-d H:i:s');
        $info['sendtime'] = date('Y-m-d H:i:s');

        //创建数据成功
        $res = $temppushlogmodel->insert($info);

//        if (!empty($errorarr)) {
//            //循环记录错误日志信息
//
//            foreach ($errorarr as $k => $v) {
//                //
//            }
//
//        }

        if ($res) {
            //添加数据成功
            $message = '记录成功!';
        } else {
            //添加数据失败
            $message = '记录失败!';
        }

        $response = [
            'status' => 1,
            'msg' => $msg . $message,
        ];

        return json($response);

    }


    /**
     * 生成带参数的二维码,测试的时候先使用临时的
     */
    public function createQRcode()
    {
        $scene_id = input('param.keyword',''); //自定义的场景ID
        $type = input('param.qrtype',1); //默认是临时二维码
        if(empty($scene_id)){
            $response = [
                'status' => 0,
                'msg' => '关键字不能为空'
            ];
            return json($response);
        }
//        $data = input('param.');
//
//        //独立验证
//        $validate = Validate::make([
//            'keyword'  => 'require',
//            'type' => 'require|integer'
//        ]);
//
//        if (!$validate->check($data)) {
//            dump($validate->getError());
//        }
        //将有效期转天数转换成秒
        $expire = input('param.expire',7); //获取定义的有效时间

        //判断有效期天数是否超过30
        if($type == 1 && $expire > 30){
            $response = [
                'status' => 0,
                'msg' => '临时二维码的有效期不能超过30天'
            ];
            return json($response);
        }
        
        $expire = $expire*3600*24; //将天数参数转换成秒
        //filedebug('生成二维码的有效期为 = '.$expire);
        $ticketinfo = $this->weixin->getQRCode($scene_id, $type,$expire); //获取二维码ticket
        if ($ticketinfo) {
            //成功获取到了ticket信息
            $ticket = $ticketinfo['ticket'];
            $imgurl = $this->weixin->getQRUrl($ticket);
            $response = [
                'status' => 1,
                'msg' => '获取二维码成功',
                'imgurl' => $imgurl
            ];
        } else {
            //没有获取到ticket信息
            $response = [
                'status' => 0,
                'msg' => $this->weixin->errMsg
            ];

            doLog('Wechat/createQRcode/error','生成二维码失败',$this->weixin->errMsg,$this->wechatconfig['appid']);

        }
        return json($response);


    }


    /**
     * 从微信服务器端获取素材列表,并写入数据库中(暂未使用)
     */
    public function getMaterial()
    {

        set_time_limit(0); //数据获取并写入数据库的时候可能会很慢
        //TODO 先默认获取图文消息

        $offset = 0; //从0开始获取
        $type = 'news'; //获取的素材类型,目前默认为图文消息
//        $count = 10;

        //先获取总数
        $countarr = $this->weixin->getForeverCount();

        if($countarr === false){
            $response = [
                'status' => 0,
                'msg' => $this->weixin->errMsg
            ];
            return json($response);

        }

        $count_str = $type.'_count';
        $newscount = $countarr[$count_str];

        if(empty($newscount)){
            $response = [
                'status' => 0,
                'msg' => '没有数据'
            ];
            return json($response);
        }

        $material = $this->weixin->getForeverList($type,$offset,$newscount); //获取永久素材列表,认证后的公众号或者服务号才能使用
        if(empty($material)){
            $response = [
                'status' => 0,
                'msg' => '获取数据为空'
            ];
            return json($response);

        }elseif($material === false){

            $response = [
                'status' => 0,
                'msg' => $this->weixin->errMsg
            ];

            return json($response);
        }
        $successnum = 0;
        $failednum = 0;
        foreach ($material['item'] as $k=>$v){
            //循环插入数据库中,只保留关键的部分,方便识别
            $data['media_id'] = $v['media_id'];
            $data['title'] = $v['content']['news_item'][0]['title'];
            $data['author'] = $v['content']['news_item'][0]['author'];
//            $data['digest'] = $v['content']['news_item'][0]['digest'];
            $data['createtime'] = date('Y-m-d H:i:s',$v['content']['create_time']);
            $data['updatetime'] = date('Y-m-d H:i:s',$v['content']['update_time']);
            $data['appid'] = $this->wechatconfig['appid']; //
            $res = Db::name('Material')->insert($data);
            if($res){
                //插入成功
                $successnum++;

            } else{
                //插入失败
                $failednum++;
            }
        }
        $response = [
            'status' => 1,
            'msg' =>'插入成功'.$successnum.'条,失败'.$failednum.'条'
        ];
        return json($response);
    }




    /**
     * 获取图文消息的选项(从数据库中获取,暂未使用)
     */
    public function getNews_old()
    {
        $list = Db::name('Material')->where(['appid'=>$this->wechatconfig['appid']])->field('id,media_id,title,createtime')->order('createtime desc')->select();
        $list = empty($list) ? [] : $list;

        $response = [
            'status' => 1,
            'msg' => '获取成功',
            'list' => $list
        ];

        return json($response);
    }


    /**
     * 获取图文消息列表
     */
    public function getNews()
    {


        $cache_name = 'newslist_'.$this->wechatconfig['appid'];
        $res = Cache::get($cache_name);//先看看缓存中是否有数据
        if(!empty($res)){
            $data = json_decode($res,true);
        }else{
            $offset = 0; //从0开始获取
            $type = 'news'; //获取的素材类型,目前默认为图文消息
            //先获取总数
            $countarr = $this->weixin->getForeverCount();


            $count_str = $type.'_count';
            $newscount = $countarr[$count_str];

            if(empty($newscount)){
                $response = [
                    'status' => 1,
                    'list' => [], //没有数据给个空数组
                ];
                //Cache::set('newslist',json_encode([]),30*60); //使用文件缓存30分钟
                return json($response);
            }

            if($newscount > 50) $newscount = 50; //限制只取50条,时间太久远的图文消息就不去查询了

            $material = $this->weixin->getForeverList($type,$offset,$newscount); //获取永久素材列表,认证后的公众号或者服务号才能使用

            foreach ($material['item'] as $k=>$v){
                $data[$k]['media_id'] = $v['media_id'];
                $data[$k]['title'] = $v['content']['news_item'][0]['title'];
                $data[$k]['createtime'] = date('Y-m-d H:i:s',$v['content']['create_time']);
                $data[$k]['updatetime'] = date('Y-m-d H:i:s',$v['content']['update_time']);
            }

            //这边对数据进行缓存
            Cache::set($cache_name,json_encode($data),30*60); //使用文件缓存30分钟
        }

        $response = [
            'status' => 1,
            'msg' => '获取成功',
            'list' => $data
        ];
        return json($response);

    }


}