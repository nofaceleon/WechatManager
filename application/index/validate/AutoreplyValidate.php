<?php
/**
 * Created by PhpStorm.
 * User: 123
 * Date: 2018/4/28
 * Time: 10:35
 * 自动回复数据验证器
 */
namespace app\index\validate;

use think\Validate;

class AutoreplyValidate extends Validate
{

    /**
     * 验证的规则
     * @var array
     */
    protected $rule =   [
        'reply'  => 'require',
        'msgtype' => 'require',
        'eventtype' => 'require|integer',
        'appid' => 'require',
        'status' => 'require|integer',
    ];


    protected $scene = [
        'edit'  =>  ['reply','msgtype','eventtype','status'], //编辑场景验证的字段
    ];

}