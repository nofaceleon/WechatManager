<?php
/**
 * Created by PhpStorm.
 * User: 123
 * Date: 2018/8/20
 * Time: 14:24
 * 约束数据库相关缓存类接口
 */
namespace app\service\dbcache;

interface CacheInterface
{
    //设置缓存
    public function setCache($cachename,$value,$expire);

    //获取缓存
    public function getCache($cachename);

    //删除缓存
    public function delCache($cachename);
}