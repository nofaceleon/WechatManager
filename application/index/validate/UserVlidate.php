<?php
/**
 * Created by PhpStorm.
 * User: 123
 * 用户添加验证器
 */
namespace app\index\validate;

use think\Validate;

class UserVlidate extends Validate
{

    /**
     * 验证的规则
     * @var array
     */
    protected $rule =   [
        'username'  => 'require|unique:User',
        'password' => 'require',
    ];

    /**
     * 错误消息
     * @var array
     */
    protected $message  =   [
        'username.require' => '用户名不能为空',
        'username.unique' => '该用户名已经存在',
        'password.require' => '用户密码不能为空',
    ];


    protected $scene = [
        'edit'  =>  ['username'], //编辑场景验证的字段
    ];

}