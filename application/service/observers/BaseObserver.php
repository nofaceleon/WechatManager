<?php
/**
 * Created by PhpStorm.
 * User: 123
 * Date: 2018/8/13
 * Time: 17:16
 */
namespace app\service\observers;

trait BaseObserver
{


    private $_observerList = [];

    /**
     * 注册观察者
     */
    public function addObserver($obj = null)
    {
        if($obj !== null) $this->_observerList[] = $obj;
    }


    /**
     * 回调方法
     */
    public function notify()
    {
        //循环调用
        foreach ($this->_observerList as $k=>$v){
            $v->search();
        }
    }


}