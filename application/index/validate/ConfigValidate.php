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
        'name'  => 'require',
        'wechatid' => 'require',
        'appid' => 'require',
        'appsecret' => 'require',
        'token' => 'require',
    ];

}