<?php
/**
 * Created by PhpStorm.
 * User: 123
 * Date: 2018/4/28
 * Time: 10:35
 * 微信公众号配置数据验证器
 */
namespace app\index\validate;

use think\Validate;

class ConfigValidate extends Validate
{

    /**
     * 验证的规则
     * @var array
     */
    protected $rule =   [
        'name'  => 'require|unique:WechatConfig',
        'wechatid' => 'require|unique:WechatConfig',
        'appid' => 'require|unique:WechatConfig',
        'appsecret' => 'require',
        'token' => 'require',
    ];



    /**
     * 自定义错误消息
     * @var array
     */
    protected $message  =   [
        'name.require' => '公众号名称不能为空',
        'name.unique' => '该公众号名称已经存在',
        'wechatid.require' => '微信号不能为空',
        'wechatid.unique' => '该微信号已经存在',
    ];


}