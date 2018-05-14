<?php

namespace app\index\model;

use think\Model;

class AutoReply extends Model
{

    /**
     * 获取回复的信息
     * @param string $content
     * @param string $type
     * @param int $status 1为可用 0为不可用 -1为默认回复内容
     * @return mixed
     */
    public function getReplyInfo($content = '',$type='',$appid = '')
    {
        $map['status'] = 1;
        $map['keyword'] = $content;
        $map['msgtype'] = $type;
        $map['appid'] = $appid;
        $res = $this->where($map)->value('reply');//获取回复的内容
        return $res;

    }


    /**
     * 根据某个公众号的appid获取所有的回复数据
     */
    public function getAllReplyInfo($appid='')
    {
        $map['appid'] = $appid;
        $res = $this->where($map)->select()->toArray(); //将查询的结果转换成数组格式
        

        return $res;

    }


    /**
     * 获取默认的回复内容
     * @param string $appid
     */
    public function getDefaultReply($appid = '')
    {
        $map['appid'] = $appid;
        $map['status'] = -1;
        $res = $this->where($map)->value('reply');//获取回复的内容
        return $res;

    }
}
