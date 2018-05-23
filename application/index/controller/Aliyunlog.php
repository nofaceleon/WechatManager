<?php

namespace app\index\controller;

use think\Controller;
use think\Request;

class Aliyunlog extends Controller
{

    private $accessKeyId = 'LTAIN0uBPCKF6xUB';
    private $accessKeySecret = 'XBnWaVDl2BkLtRHpdqPCYyzPxSGXbh';
    private $endpoint = "cn-shanghai.log.aliyuncs.com";
    private $logstore = 'tianlebanglog';
    private $project;



    public function __construct()
    {
        parent::__construct();


        require_once  dirname(dirname(dirname(dirname(__FILE__)))) . '/extend/AliyunLog/Log_Autoload.php';


        $this->client = new \Aliyun_Log_Client($this->endpoint, $this->accessKeyId, $this->accessKeySecret); //这边是能够调用的

        
//        require_once  realpath(dirname(__FILE__) . '/../Log_Autoload.php'); //引入自动加载文件
//        try{
//            $this->client = new \Aliyun_Log_Client($this->endpoint, $this->accessKeyId, $this->accessKeySecret);
//        }catch (\Aliyun_Log_Exception $e){
//            echo '阿里云日志链接失败';
//        }


    }


    public function aliyun_log_write($data)
    {

//        if (!$data) return false;
//        //处理日志数据
//        $data = $this->transData($data);
//
//        $topic = "";
//        $source = "";
//        $logitems = array();
//
//        $logItem = new \Aliyun_Log_Models_LogItem();
//        $logItem->setTime(time());
//        $logItem->setContents($data);
//        array_push($logitems, $logItem);
//
//        $req2 = new \Aliyun_Log_Models_PutLogsRequest($this->project, $this->logstore, $topic, $source, $logitems);
//
//        try{
//            $res2 = $this->client->putLogs($req2);
//        }catch (\Aliyun_Log_Exception $e){
////            sendAliyunMail('OssLogWriteTime','阿里云日志写入失败'.$this->project,$e->getMessage());
//        }
//
//        unset($data);
//
//        return true;

    }
    

}
