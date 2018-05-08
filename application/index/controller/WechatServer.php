<?php
/**
 * Created by PhpStorm.
 * User: song
 * Date: 2018/4/26
 * Time: 22:38
 * 接收微信端传递过来的消息,微信后台配置的URL也应该是配置到这个里面的
 */
namespace app\index\controller;

use think\Controller;
use think\facade\Request;
use Wxcomponent\WechatApi;

class WechatServer extends Controller
{

    public function __construct()
    {
        parent::__construct();
//        //这边目前只能使用一个账号的配置信息
        //测试账号

//        $request = 'http://'.$_SERVER['HTTP_HOST'].$_SERVER['PHP_SELF'].'?'.$_SERVER['QUERY_STRING'];
        //filedebug('当前请求的地址是 = '.$request);
        $appid = input('param.appid','');//获取路由中的appid参数
//        $allparams = input('param.');
        //filedebug('当前请求的所有参数是 = '.print_r($allparams,true));

        //根据appid参数获取公众号的配置信息
        $this->config = model('WechatConfig')->getWechatConfigByAppid($appid);

        if(empty($this->config)){
            //没有找到对应的公众号配置
            return;//直接退出
        }

//        $this->config = [
//            'appid' => 'wx7ad4ce9789a311ea',
//            'appsecret' => '67083c9d2d66055bdea6a20b63edcb3c',
//            'token' => 'songphper',
//        ];

        $this->weixin = new WechatApi($this->config);

    }

    /**
     * 自动回复应该写到数据库中
     */
    public function index()
    {
//        dump($this->config);
//        die;
        //filedebug('获取到微信服务器发送的消息');
        //这边验证过了之后就不需要接着认证了,微信会将用户发送的消息,或者事件推送到这个地址上面
        //自动回复消息
        $this->weixin->valid(); //这边是需要验证的时候使用
        $type = $this->weixin->getRev()->getRevType(); //获取微信推送过来的消息类型
//        filedebug('获取类型' . print_r($type, true));
        switch ($type) {
            case WechatApi::MSGTYPE_TEXT: //文本
                $content = $this->weixin->getRevContent();
                //filedebug('获取到了用户发送的消息' . print_r($content, true));
                //根据获取到的内容,去数据库中查询与之对应的回复方式并推送
                $this->handleUserReply($content, $type, $this->config['appid']);
                exit;
                break;
            case WechatApi::MSGTYPE_EVENT: //事件
                $detailtype = $this->weixin->getRev()->getEventType(); //获取具体的事件类型
                //获取事件的详细参数
                $eventkey = $this->weixin->getRev()->getRevEvent();
                //filedebug('获取的eventkey = '.print_r($eventkey,true));
                //获取详细信息
                $allinfo = $this->weixin->getRevData();
                //filedebug('详细的返回信息 = ' . print_r($allinfo, true));
                //对数据进行处理,并存入数据库中
//                filedebug('获取到的事件信息是 = '.print_r($allinfo,true));
                $this->handleSeverInfo($allinfo); //保存事件信息
                $this->handleEvent($detailtype,$allinfo);//处理事件信息

//                //当用户关注的时候,推送某条消息
//                if ($detailtype == 'subscribe') {
//                    //当用户关注的时候推送某条消息
//                    $this->weixin->text('欢迎关注!')->reply();
//                } elseif ($detailtype == 'unsubscribe') {
//                    //filedebug('用户取消了关注');
//                }
////
//                if($allinfo['Event'] == 'SCAN'){
//
//                    if($allinfo['EventKey'] == 'userinfo'){
//                        //获取用户的信息
//                        $userinfo = $this->weixin->getUserInfo($allinfo['FromUserName']);
//
//                        $reply = '欢迎访问!'.$userinfo['nickname'];
//
//                        $this->weixin->text($reply)->reply();
//                    }
//
//
//                }

                //filedebug('接收到了事件推送' . print_r($detailtype, true));
                break;
            case WechatApi::MSGTYPE_IMAGE: //图片

                break;
            default:
                $this->weixin->text("help info")->reply();
        }

    }

    /**
     * 处理用户回复
     */
    private function handleUserReply($content = '', $type = 'text', $appid = '')
    {
        //获取用户输入的内容
        $AutoReplyModel = model('AutoReply');
        //数据库中查询对应内容的回复内容
        $reply = $AutoReplyModel->getReplyInfo($content, $type, $appid);
       // filedebug('根据用户输入的内容获取的回复='.print_r($reply,true));
        if (empty($reply)) {
            //获取默认的回复内容
            $reply = $AutoReplyModel->getDefaultReply($appid);
            $reply = empty($reply) ? '欢迎访问2' : $reply;
        }
        $this->weixin->text($reply)->reply();

    }

    /**
     * 处理微信返回的数据信息
     */
    private function handleSeverInfo($content = '')
    {

        $ServerLogModel = model('ServerLog');
        $data['openid'] = $content['FromUserName'];
        $data['to_user_name'] = $content['ToUserName'];
        $data['createtime'] = date('Y-m-d H:i:s', $content['CreateTime']);
        $data['msgtype'] = $content['MsgType'];
        $data['event'] = $content['Event'];
        $data['detail'] = json_encode($content);
        $data['eventkey'] = $content['EventKey']; //获取到的key
        $res = $ServerLogModel->insert($data);
        if (!$res) {
            filedebug('存储日志失败');
        }

    }

    /**
     * 事件处理
     */
    private function handleEvent($detailtype,$allinfo)
    {
        //当用户关注的时候,推送某条消息
        if ($detailtype == 'subscribe') {
            //当用户关注的时候推送某条消息
            $this->weixin->text('欢迎关注!')->reply();
        } elseif ($detailtype == 'unsubscribe') {
            //filedebug('用户取消了关注');
        }

        if ($allinfo['Event'] == 'SCAN') {
            if ($allinfo['EventKey'] == 'userinfo') {
                //获取用户的信息
                $userinfo = $this->weixin->getUserInfo($allinfo['FromUserName']);
                $reply = '欢迎访问!' . $userinfo['nickname'];
            }else{
                $reply = '没有该关键字';
            }

            $this->weixin->text($reply)->reply();

        }

    }

}