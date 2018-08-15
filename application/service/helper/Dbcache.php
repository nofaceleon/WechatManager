<?php
/**
 * Created by PhpStorm.
 * User: song
 * Date: 2018/8/5
 * Time: 11:40
 * 在数据库中缓存access_token,方便不同的项目之间能够共用同一个access_token,而不用各自去刷新
 *
    CREATE TABLE `tb_access_token` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `cachekey` varchar(64) NOT NULL DEFAULT '' COMMENT '缓存key',
    `value` varchar(255) NOT NULL DEFAULT '' COMMENT '缓存的内容',
    `expire` int(255) NOT NULL DEFAULT '0' COMMENT '有效期',
    `expiretime` datetime NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '过期时间',
    `createtime` datetime NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '创建时间',
    `updatetime` datetime NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '更新时间',
    `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
    PRIMARY KEY (`id`)
    ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
 */

namespace app\service\helper;

use think\Db;
use think\Exception;

class Dbcache
{

    private static $tabelname = 'tb_wx_cache'; //缓存的表名
    private static $dbconfig; //数据库连接配置
    private static $timenow; //当前时间
    private static $instacne;

    private function __construct($dbconfig = [])
    {

//        if (empty($dbconfig)) {
////            self::$dbconfig = [
////                // 数据库类型
////                'type' => 'mysql',
////                // 数据库连接DSN配置
////                'dsn' => '',
////                // 服务器地址
////                'hostname' => '127.0.0.1',
////                // 数据库名
////                'database' => 'wechat_access_token',
////                // 数据库用户名
////                'username' => 'root',
////                // 数据库密码
////                'password' => 'root',
////                // 数据库连接端口
////                'hostport' => '3306',
////                // 数据库连接参数
////                'params' => [],
////                // 数据库编码默认采用utf8
////                'charset' => 'utf8',
////                // 数据库表前缀
////                'prefix' => '',
////            ];
////
//            self::$dbconfig = config('zsmp.'); //获取配置文件中的数据库配置
//
//        } else {
//            self::$dbconfig = $dbconfig;
//        }
        self::$dbconfig = (empty($dbconfig)) ? config('zsmp.') : $dbconfig;
        self::$timenow = date('Y-m-d H:i:s');
    }

    public static function getInstance($dbconfig = [])
    {
        if (!self::$instacne instanceof self) {
            self::$instacne = new self($dbconfig);
        }
        return self::$instacne;

    }

    /**
     * 设置缓存
     * @param $cachename 缓存名称
     * @param $value 缓存内容
     * @param $expired 过期时间
     */
    public static function setCache($cachename = '', $value = '', $expired = 30)
    {

        //先查询数据库中是否有这个key
        if(empty($cachename) || empty($value)){
            doLog('helper/Dbcache/setCache/error', '缓存名称跟值不能为空', '', '');
            return false;
        }

        $res = Db::connect(self::$dbconfig)->table(self::$tabelname)->where(['cachekey' => $cachename])->find();
        $data = [
            'cachekey' => $cachename,
            'value' => $value,
            'expiretime' => date('Y-m-d H:i:s', time() + intval($expired)),
            'createtime' => self::$timenow,
            'updatetime' => self::$timenow,
            'expire' => $expired,
            'remark' => '微信开发者后台access_token',
        ];

        if (empty($res)) {
            //没有数据,执行插入操作
            try {
                Db::connect(self::$dbconfig)->table(self::$tabelname)->insert($data);
                return true;
            } catch (Exception $e) {
                $errormsg = $e->getMessage();
                doLog('helper/Dbcache/setCache/error', '添加缓存失败', $errormsg, '');
                return false;
            }
        } else {
            //执行更新操作
            try {
                unset($data['createtime']); //更新操作不需要更新创建时间
                Db::connect(self::$dbconfig)->table(self::$tabelname)->where(['cachekey' => $cachename])->update($data);
                return true;
            } catch (Exception $e) {
                $errormsg = $e->getMessage();
                doLog('helper/Dbcache/setCache/error', '更新缓存失败', $errormsg, '');
                return false;
            }
        }

    }


    /**
     * 获取缓存
     * @param $cachename
     */
    public static function getCache($cachename = '')
    {
        $timenow = self::$timenow;
        $res = Db::connect(self::$dbconfig)->table(self::$tabelname)->where("cachekey = '$cachename' and expiretime > '$timenow'")->find();
        if (empty($res)) {
            //没有该缓存数据
            return false;
        } else {
            //缓存数据是
            return $res['value'];
        }

    }


    /**
     * 删除缓存
     * @param string $cachename
     */
    public static function delCache($cachename = '')
    {

        try {
            Db::connect(self::$dbconfig)->table(self::$tabelname)->where("cachekey = '$cachename'")->limit(1)->delete();
            return true;
        } catch (Exception $e) {
            $errormsg = $e->getMessage();
            doLog('helper/Dbcache/delCache/error', '删除缓存失败', $errormsg, '');
            return false;
        }


    }

}