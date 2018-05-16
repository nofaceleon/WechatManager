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
        'keyword'  => 'unique:AutoReply', //验证是否唯一
        'msgtype' => 'require',
        'eventtype' => 'require|integer',
        'appid' => 'require',
        'status' => 'require|integer',
    ];


    protected $scene = [
        'edit'  =>  ['reply','msgtype','eventtype','status','keyword'], //编辑场景验证的字段
    ];


    /**
     * 自定义错误消息
     * @var array
     */
    protected $message  =   [
        'reply.require' => '回复内容不能为空',
        'keyword.unique' => '该关键字已经存在,请更换关键字',
    ];

}