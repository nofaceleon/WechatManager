<?php
/**
 * Created by PhpStorm.
 * User: 123
 * Date: 2018/4/28
 * Time: 10:35
 * 菜单数据验证器
 */
namespace app\index\validate;

use think\Validate;

class MenuValidate extends Validate
{
    /**
     * 验证的规则
     * @var array
     */
    protected $rule =   [
        'name'  => 'require|max:25',
        'age'   => 'number|between:1,120',
        'email' => 'email',
    ];

    /**
     * 错误消息
     * @var array
     */
    protected $message  =   [
        'name.require' => '名称必须',
        'name.max'     => '名称最多不能超过25个字符',
        'age.number'   => '年龄必须是数字',
        'age.between'  => '年龄只能在1-120之间',
        'email'        => '邮箱格式错误',
    ];

    
}