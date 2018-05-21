<?php
/**
 * Created by PhpStorm.
 * User: song
 * 接收微信端传递过来的消息,微信后台配置的URL也应该是配置到这个里面的
 */
namespace app\index\controller;

use think\Controller;
use think\Db;
use think\facade\Request;
use Wxcomponent\WechatApi;

class WechatServer extends Controller
{

    public function __construct()
    {
        parent::__construct();
//        //这边目前只能使用一个账号的配置信息
        $appid = input('param.appid','');//获取路由中的appid参数
        //根据appid参数获取公众号的配置信息
        $this->config = model('WechatConfig')->getWechatConfigByAppid($appid);
        if(empty($this->config)){
            //没有找到对应的公众号配置
            return;//直接退出
        }
        $this->weixin = new WechatApi($this->config);
    }

    /**
     * 自动回复应该写到数据库中
     */
    public function index()
    {
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
                //filedebug('直行道 = '.$type);

                $this->handleUserReply($content, $this->config['appid'],$type);
                exit;
                break;
            case WechatApi::MSGTYPE_EVENT: //事件

                $detailtype = $this->weixin->getRev()->getEventType(); //获取具体的事件类型

                //获取事件的详细参数
                $eventkey = $this->weixin->getRev()->getRevEvent();

                //filedebug('获取的eventkey = '.print_r($eventkey,true));
                //获取详细信息
                $allinfo = $this->weixin->getRevData();
                //filedebug('事件详细的返回信息 = ' . print_r($allinfo, true));
                //对数据进行处理,并存入数据库中
               // filedebug('获取到的事件信息是 = '.print_r($allinfo,true));
                $this->handleSeverInfo($allinfo); //保存事件信息

                $this->handleUserReply($allinfo['EventKey'], $this->config['appid'],$detailtype); //定义事件回复内容

                //$this->handleEvent($detailtype,$allinfo);//处理事件信息

                //filedebug('接收到了事件推送' . print_r($detailtype, true));
                break;
            case WechatApi::MSGTYPE_IMAGE: //图片

                break;
            default:
                $this->weixin->text("help info")->reply();
        }

    }


    /**
     * 自动回复
     * @param string $content 关键字
     * @param string $type 类型
     * @param string $appid
     */
    private function handleUserReply($content = '',$appid = '',$event = 'text')
    {
        //filedebug('获取到的自动回复数据为start');
        //关注事件,如果携带了参数自动回复的时候改成扫码事件
        if(strcasecmp($event,'subscribe') == 0 && !empty($content)){
            $pattern  =  '/^qrscene_/' ;
            preg_match ( $pattern ,  $content ,  $matches);
            if(!empty($matches)){
                $event = 'SCAN';
                $content = str_replace('qrscene_','',$content); //去除参数中的qrscene_
            }
        }

        //先根据关键词去数据库中查询该关键字所对应的自动回复内容

        //事件字段使用事件表中的数据
        $res = Db::name('AutoReply')->alias('a')->join(['we_event' => 'b'],'a.eventtype = b.id')->where("b.event = '$event' and a.keyword = '$content' and a.status = 1 and a.appid = '$appid'")->field('a.*')->find();


        //事件字段不用事件表中的数据
        //$res = Db::name('AutoReply')->where("keyword = '$content' and appid = '$appid' and status = 1 and eventtype = '$event'")->find();

        //$sql = Db::name('AutoReply')->getLastSql();

       // filedebug('获取到的自动回复数据为end = '.print_r($sql,true));
       // filedebug('获取到的自动回复数据为end2 = '.json_encode($res));

        if(!empty($res)){
            //有定义过自动回复
            $msgtype = $res['msgtype'];
            $reply = $res['reply'];
            //$this->weixin->$msgtype($reply)->reply();
        }else{
            //查询是否有自定义的默认回复内容
            $res = Db::name('AutoReply')->where("keyword = 'DEFAULT_REPLY' and appid = '$appid' and status = 1")->find();
            if(empty($res)){
                $reply = '没有找到回复内容';
                $msgtype = 'text';
            }else{
                $reply = $res['reply'];
                $msgtype = $res['msgtype'];
            }
        }

        $this->weixin->$msgtype($reply)->reply();

    }


    /**
     * 处理用户回复
     */
    private function handleUserReply_old($content = '', $type = 'text', $appid = '')
    {
        //获取用户输入的内容
        $AutoReplyModel = model('AutoReply');
        //数据库中查询对应内容的回复内容
        $reply = $AutoReplyModel->getReplyInfo($content, $type, $appid);
       // filedebug('根据用户输入的内容获取的回复='.print_r($reply,true));
        if (empty($reply)) {
            //获取默认的回复内容
            $reply = $AutoReplyModel->getDefaultReply($appid);
            $reply = empty($reply) ? '欢迎访问' : $reply; //当数据库中没有找到回复内容的时候,默认回复的
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


}