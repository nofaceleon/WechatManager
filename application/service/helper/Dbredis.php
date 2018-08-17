<?php
/**
 * Created by PhpStorm.
 * User: 123
 * Date: 2018/8/17
 * Time: 15:07
 */
namespace app\service\helper;


class Dbredis
{

    private $redis;

    private static $instance;

    private function __construct($config = [])
    {

        if(empty($config)){
            $host = config('redisconfig.REDIS_HOST_DEFAULT');
            $port = config('redisconfig.REDIS_PORT_DEFAULT');
            $auth = config('redisconfig.REDIS_AUTH_DEFAULT');
        } else {
            $host = $config['host'];
            $port = $config['port'];
            $auth = $config['auth'];
        }

        $this->redis = new \Redis();
        $this->redis->pconnect($host, $port);
        $this->redis->auth($auth);
    }

    public static function getInstance()
    {
        if(!self::$instance instanceof self){
            self::$instance = new self();
        }
        return self::$instance;

    }


    /**
     * [set key-value设置  会覆盖]
     * @ckhero
     * @DateTime 2016-06-17
     * @param    [type]     $name   [缓存名字（传进来的参数可为数组）]
     * @param    [type]     $value  [缓存值]
     * @param    integer $expire [缓存有效期]
     */
    public function set($name, $value, $expire = 0)
    {

        if (is_array($name)) {       //判断是否维数组

            foreach ($name as $key => $val) {

                if ($expire == 0) {

                    if (!$this->redis->set($val, $value[$key])) {          //缓存失败则会中断

                        return false;
                    }
                } else {


                    if (!$this->redis->setex($val, $expire, $value[$key])) {

                        return false;
                    }
                }
            }

            return true;
        } else {

            if ($expire == 0) {

                return $this->redis->set($name, $value);
            } else {


                return $res = $this->redis->setex($name, $expire, $value);
            }
        }
    }

    /**
     * [setArr 将存入的数据进行序列化]
     * @ckhero
     * @DateTime 2016-10-27
     * @param    [type]     $key  [description]
     * @param    [type]     $data [description]
     */
    public function setArr($key, $data, $expire = 0)
    {
        $this->set($key, serialize($data), $expire);

    }

    public function getArr($key)
    {

        return unserialize($this->get($key));
    }

    /**
     * [get 获取缓存]
     * @ckhero
     * @DateTime 2016-06-17
     * @param    [type]     $name [缓存名字（可为数组）]
     * @return   [type]           [返回值]
     */
    public function get($name)
    {

        if (!is_array($name)) {

            return $this->redis->get($name);
        } else {

            return $this->redis->getMultiple($name);
        }
    }

    /**
     * [exists 验证指定的键是否存在]
     * @ckhero
     * @DateTime 2016-06-17
     * @param    [type]     $name [缓存名字]
     * @return   [type]           [返回 存在（true）/不存在（false）]
     */
    public function exists($name)
    {
        return $this->redis->exists($name);
    }

    /**
     * [delete 删除]
     * @ckhero
     * @DateTime 2016-06-17
     * @param    [type]     $name [缓存名字]
     * @return   [type]           [返回 成功（true）/失败（false）]
     */
    public function delete($name)
    {

        return $this->redis->delete($name);
    }


    /**
     * [__destruct 断开连接]
     * @ckhero
     * @DateTime 2016-06-17
     */
    // public function __destruct(){

    // 	if($this->redis){

    // 		$this->redis->close();
    // 	}
    // }


    public function hset($key, $val, $field)
    {

        if (!is_array($val)) {

            return $this->redis->hset($key, $field, $val);
        } else {

            return $this->redis->hMset($key, $val);
        }
    }


    public function hget($key, $field = false)
    {

        if (!$field) {

            return $this->redis->hGetAll($key);
        } else {

            return $this->redis->hGet($key, $field);
        }
    }


    /**
     * list
     * 操作
     */

    /**
     * [lpush 左/右插入]
     * @ckhero
     * @DateTime 2016-07-29
     * @param    [type]     $key  [description]
     * @param    [type]     $val  [description]
     * @param    string $type [l从左边插入，R从右边插入]
     * @return   [type]           [description]
     */
    public function lset($key, $val, $type = 'L', $index = -1)
    {

        if (empty($key)) {

            return false;
        }
        if (!is_array($val)) {    //不是数组先转为数组

            $arr[] = $val;
        } else {

            $arr = $val;
        }
        foreach ($arr as $k => $v) {

            if ($type == 'L') {

                $res[] = $this->redis->lPush($key, $v);      //左插入
            } else if ($type == 'R') {

                $res[] = $this->redis->rPush($key, $v);      //右插入
            } elseif ($type == 'S') {

                $res[] = $this->redis->lSet($key, $index, $v);    //定点插入
            } else {

                return false;
            }
        }

        return $res;
    }

    /**
     * [lsize 返回该列表长度   ]
     * @ckhero
     * @DateTime 2016-07-29
     * @param    [type]     $key [description]
     * @return   [type]          [description]
     */
    public function lsize($key)
    {

        return $this->redis->lSize($key);
    }

    /**
     * [lget 获取list的值]
     * @ckhero
     * @DateTime 2016-08-11
     * @param    [type]     $key   [description]
     * @param    [type]     $type  [description]
     * @param    integer $start [description]
     * @param    integer $end [description]
     * @return   [type]            [description]
     */
    public function lget($key, $type, $start = 0, $end = -1)
    {

        if (empty($key)) {

            return false;
        }

        if ($type == 'g') {

            //return $this->reids->lget($key,1);
        } else if ($type == 'R') {

            return $this->redis->lRange($key, $start, $end);
        }
    }


    /**
     * [pop 返回一个值 并且删除该值]
     * @ckhero
     * @DateTime 2016-08-11
     * @param    [type]     $key  [description]
     * @param    string $type [description]
     * @return   [type]           [description]
     */
    public function pop($key, $type = "L")
    {

        if (!empty($key)) {

            if ($type == 'l') {

                return $this->redis->lPop($key);
            } elseif ($type == 'R') {

                return $this->redis->rPop($key);
            }
        }

        return false;
    }


    public function ltrim($key, $start, $end)
    {

        return $this->redis->lTrim($key, $start, $end);
    }

    /**
     * [expire 设置过期时间]
     * @ckhero
     * @DateTime 2016-08-16
     * @param    [type]     $data [二维数组安然然也array( array('键值'=>过期时间))]
     * @return   [type]           [description]
     */
    public function expire($key, $val)
    {

        if (!is_array($key)) {

            $data[$key] = $val;
        } else {

            $data = $key;
        }
        foreach ($data as $k => $expire_time) {

            $this->redis->expire($k, $expire_time);
        }

        return true;
    }

    /**
     * [databaseSelect 表选择]
     * @ckhero
     * @DateTime 2016-08-18
     * @param    string $name [表名字]
     * @return   [type]           [description]
     */
    public function databaseSelect($name = 'default')
    {
        switch ($name) {

            case 'pt_log':
                $database = 1;
                break;

            case 'zwid':
                $database = 2;
                break;

            case 'one_coin':
                $database = 3;
                break;

            case "wheel" :
                $database = 4;
                break;

            case "home" :
                $database = 5;
                break;

            case "analysis" :
                $database = 6;
                break;

            case "order" :
                $database = 7;
                break;

            case "product_score" :
                $database = 8;
                break;

            case "LeTianBang" :
                $database = 9;
                break;

            case "Ip" :
                $database = 10;
                break;

            case "Sign":
                $database = 11;
                break;

            case "piece" :
                $database = 12;
                break;

            default:
                $database = 0;
                break;
        }
        return $this->redis->select($database);
    }

    /**
     * [del 删除缓存]
     * @ckhero
     * @DateTime 2016-08-18
     * @param    [type]     $key [缓存的key名]
     * @return   [type]          [true/false]
     */
    public function del($key)
    {

        return $this->redis->del($key);
    }

    /**
     * [keys 模糊匹配]
     * @ckhero
     * @DateTime 2016-08-29
     * @param    [type]     $key [description]
     * @return   [type]          [description]
     */
    public function keys($key)
    {

        return $this->redis->keys($key);
    }

    /**
     * zset
     */

    /**
     * [zset 有序集合设置]
     * @ckhero
     * @DateTime 2016-09-01
     * @param    [type]     $key    [键名]
     * @param    [type]     $score  [分数、权重]
     * @param    [type]     $member [键值]
     * @return   [type]             [description]
     */
    public function zset($key, $score, $val)
    {

        return $this->redis->zAdd($key, $score, $val);
    }

    /**
     * [zdel 删除有序集合中某个值]
     * @ckhero
     * @DateTime 2016-09-01
     * @param    [type]     $key [键名]
     * @param    [type]     $val [删除的键值]
     * @return   [type]          [description]
     */
    public function zdel($key, $val)
    {

        return $this->redis->zRem($key, $val);
    }


    /**
     * [zget 获取集合中的数据]
     * @ckhero
     * @DateTime 2016-09-01
     * @param    [type]     $key        [键名]
     * @param    integer $start [开始索引]
     * @param    integer $end [结束索引]
     * @param    string $order ['排序方式'；sec(从小打大)；desc（从大到小）]
     * @param    boolean $withscroes [true返回分数值；默认false 不返回]
     * @return   [type]                 [description]
     */
    public function zget($key, $start = 0, $end = '-1', $order = 'sec', $withscroes = false)
    {

        if ($order == 'sec') {

            return $this->redis->zRange($key, $start, $end, $withscroes);
        } else {

            return $this->redis->zRevRange($key, $start, $end, $withscroes);
        }
    }

    /**
     * @Description:获取list的元素长度（个数）
     * @User:jysdhr
     * @param $list_key
     */
    public function llen($list_key) {
        return $this->redis->lLen($list_key);
    }
    /**
     * [zCard 获取zset长度]
     * @ckhero
     * @DateTime 2017-02-16
     * @param    [type]     $key [description]
     * @return   [type]          [description]
     */
    public function zCard($key)
    {

        return $this->redis->zCard($key);
    }

    /**
     * [exists 判断商品是否存在]
     * @ckhero
     * @DateTime 2016-09-02
     * @param    [type]     $key [键名]
     * @return   [type]          [1为存在，0为不存在]
     */
    public function existsRedis($key)
    {

        return $this->redis->exists($key);
    }

    /**
     * @Description:获取redis key的失效剩余时间
     * @User:jysdhr
     * @param $key
     * @param $type 1:s 以秒为单位  :2 ms 以毫秒为单位，默认秒
     */
    public function expireTime($key, $type = 1)
    {
        return $type == 1 ? $this->redis->ttl($key) : $this->redis->pttl($key) ;
    }

    /**
     * @Description:清楚指定缓存数据库
     * @User:jysdhr
     * @return bool
     */
    public function flushAll(){
        return $this->redis->flushAll();
    }

    /**
     * [__call 当调用的函数找不到的时候调用redis本身的额函数]
     * @ckhero
     * @DateTime 2017-06-01
     * @param    [type]     $functionName [description]
     * @param    [type]     $args         [description]
     * @return   [type]                   [description]
     */
    public function __call($functionName, $args)
    {

        return call_user_func_array(array($this->redis,$functionName), $args);
    }



    /**
     * 对有序集合中(key)指定成员(member)的分数(score)加上增量 value
     * @param $key
     * @param $value
     * @param $member
     * @return float
     */
    public function zIncrBy($key,$value,$member)
    {
        return $this->redis->zIncrBy($key,$value,$member);
    }

    /**
     * Redis Zrevrange 命令返回有序集中，指定区间内的成员。
     * 其中成员的位置按分数值递减(从大到小)来排列。
     * @param $key
     * @param int $start
     * @param int $stop
     * @param bool $WITHSCORES
     * @return array
     */
    public function zRevRange($key,$start = 0,$stop = -1,$WITHSCORES = false)
    {
        return $this->redis->zRevRange($key,$start,$stop,$WITHSCORES);

    }

    //使用redis管道模式
    /**
     * @return \Redis
     */
    public function pipeline()
    {
        return $this->redis->multi(2);
    }

    /**
     * 执行所有事务块内的命令。一般在使用管道之后执行这个语句
     */
    public function exec()
    {
        $this->redis->exec();
    }

    
}