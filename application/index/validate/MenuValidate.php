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
        'buttonname'  => 'require',
//        'url' => 'url', //验证URL
        'sort' => 'integer',
        'parentid' => 'require|integer',
    ];

    /**
     * 错误消息
     * @var array
     */
    protected $message  =   [
        'buttonname.require' => '按钮名称不能为空',
        'url.url' => 'URL格式不正确',
        'sort.integer' => '排序必须是整数',
    ];

    
}