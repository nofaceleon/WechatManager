<?php
/**
 * Created by PhpStorm.
 * User: 123
 * Date: 2018/8/20
 * Time: 10:38
 * 简单封装一下
 */
namespace app\service\dbcache;

use app\service\helper\Dbredis;

class Dbcache implements CacheInterface
{

    private static $instance;
    private $redis;

    private function __construct($redis)
    {
        if($redis !== null){
            $this->redis = $redis;
        }else{
//            $config = [
//                'host'=>'139.224.0.198',
//                'port'=>'3198',
//                'auth'=>'#yr9XjB%b6k',
//            ];
            $this->redis = Dbredis::getInstance($config = []);
        }
    }


    public static function getInstance($redis = null)
    {
        if(!self::$instance instanceof self){
            self::$instance = new self($redis);
        }
        return self::$instance;
    }


    /**
     * 设置缓存
     * @param $cachename
     * @param $value
     * @param int $expire
     */
    public function setCache($cachename,$value,$expire = 3600)
    {
        $this->redis->databaseSelect('home');
        $this->redis->set($cachename,$value,$expire);
    }


    /**
     * 获取缓存
     * @param $cachename
     */
    public function getCache($cachename)
    {
        $this->redis->databaseSelect('home');
        $value = $this->redis->get($cachename);
        //file_put_contents('debug.log','从缓存中获取'.$cachename.'='.$value."\r\n",8);
        return $value;
    }


    /**
     * 删除缓存
     * @param $cachename
     */
    public function delCache($cachename)
    {
        $this->redis->databaseSelect('home');
        $this->redis->delete($cachename);

    }



}