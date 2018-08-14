<?php
/**
 * Created by PhpStorm.
 * User: 123
 * Date: 2018/8/14
 * Time: 16:21
 */
namespace app\service\info;

use think\Exception;

class InfoFactory
{


    //定义类型
    const BUY_INFO = 'buy';
    const SIGN_INFO = 'sign';

    //具体的类型对应的类的名称,添加type和类名的映射关系,这样以后如果修改类名的话,只需要改这边的映射关系
    private static $classList = [
        self::BUY_INFO => 'BuyInfo',
        self::SIGN_INFO => 'SignInfo',
    ];



    //根据名称实例化类
    public static function Factory($type = '',$dbconfig = null)
    {

        if(empty($type)){
            throw new Exception('参数名不能为空'); //抛出异常,并在调用的地方捕捉异常,并格式化输出错误信息
        }
        $type = strtolower($type); //统一将参数转换成小写
        if(!array_key_exists($type,self::$classList)){
            throw new Exception('没有找到'.$type.'对应的类');
        } else{
            $fullclassname = 'app\service\info\\'.self::$classList[$type];
            return new $fullclassname($dbconfig);
        }


    }
}