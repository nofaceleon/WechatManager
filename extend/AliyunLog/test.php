<?php

require_once realpath(dirname(__FILE__) . '\Log_Autoload.php');

$endpoint = 'cn-shanghai.log.aliyuncs.com'; // 选择与上面步骤创建 project 所属区域匹配的 Endpoint
$accessKeyId = 'LTAIV5PP4qVDLkOB';        // 使用你的阿里云访问秘钥 AccessKeyId
$accessKey = 'uN6nHNsxM9rXgHi1eUNJv1G63zxuLF';             // 使用你的阿里云访问秘钥 AccessKeySecret
$project = 'zwmedia-uat';                  // 上面步骤创建的项目名称
$logstore = 'test';                // 上面步骤创建的日志库名称


$client = new Aliyun_Log_Client($endpoint, $accessKeyId, $accessKey);

$req1 = new Aliyun_Log_Models_ListLogstoresRequest($project);
$res1 = $client->listLogstores($req1);


//$topic = "";
//$source = "";
//$logitems = array();
//for ($i = 0; $i < 20; $i++)
//{
//    $rand = rand(1,100);
//
//    if( $rand > 50) $contents = array('log'=> '测试数据第'.$i.'条','code'=>$rand);
//    else $contents = array('log'=> '测试数据第'.$i.'条','product'=>$rand);
//
//    $logItem = new Aliyun_Log_Models_LogItem();
//    $logItem->setTime(time());
//    $logItem->setContents($contents);
//    array_push($logitems, $logItem);
//}
//$req2 = new Aliyun_Log_Models_PutLogsRequest($project, $logstore, $topic, $source, $logitems);
//$res2 = $client->putLogs($req2);
//var_dump($res2);


#不必等待，立即拖数据
#首先遍历有哪些 shardId
//$listShardRequest = new Aliyun_Log_Models_ListShardsRequest($project,$logstore);
//$listShardResponse = $client -> listShards($listShardRequest);
//foreach($listShardResponse-> getShardIds()  as $shardId)
//{
//    #对每一个 ShardId，先获取 Cursor
//    $getCursorRequest = new Aliyun_Log_Models_GetCursorRequest($project,$logstore,$shardId,null, time() - 60);
//    $response = $client -> getCursor($getCursorRequest);
//    $cursor = $response-> getCursor();
//    $count = 100;
//    while(true)
//    {
//        #从 cursor 开始读数据
//        $batchGetDataRequest = new Aliyun_Log_Models_BatchGetLogsRequest($project,$logstore,$shardId,$count,$cursor);
//        var_dump($batchGetDataRequest);
//        $response = $client -> batchGetLogs($batchGetDataRequest);
//        if($cursor == $response -> getNextCursor())
//        {
//            break;
//        }
//        $logGroupList = $response -> getLogGroupList();
//        foreach($logGroupList as $logGroup)
//        {
//            print ($logGroup->getCategory());
//            foreach($logGroup -> getLogsArray() as $log)
//            {
//                foreach($log -> getContentsArray() as $content)
//                {
//                    print($content-> getKey().":".$content->getValue()."\t");
//                }
//                print("\n");
//            }
//        }
//        $cursor = $response -> getNextCursor();
//    }
//}



$topic = "";
$query='code : *';
$from = time()-7200;
$to = time();
$res3 = NULL;
//while (is_null($res3) || (! $res3->isCompleted()))
//{
//    $req3 = new Aliyun_Log_Models_GetHistogramsRequest($project, $logstore, $from, $to, $topic, $query);
//    $res3 = $client->getHistograms($req3);
//}
//var_dump($res3);


$res4 = NULL;
while (is_null($res4) || (! $res4->isCompleted()))
{
    $req4 = new Aliyun_Log_Models_GetLogsRequest($project, $logstore, $from, $to, $topic, $query, '', 0, False);
    $res4 = $client->getLogs($req4);
}
//echo '<pre>';
//var_dump($res4->getLogs());
//echo '</pre>';

foreach ($res4->getLogs() as $k => $v){

    echo '<pre>';
    var_dump($v->getContents());
    echo '</pre>';

}

?>