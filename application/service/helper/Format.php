<?php
/**
 * Created by PhpStorm.
 * User: 123
 * Date: 2018/8/1
 * Time: 12:31
 */

namespace app\service\helper;

class Format
{


    /**
     * 成功回复信息
     * @param $msg
     * @param null $meta
     * @param int $status
     * @return \think\response\Json
     */
    public static function success($msg, $meta = null, $status = 1)
    {

        $result = [
            'status' => $status,
            'msg' => $msg
        ];

        if ($meta !== null) {
            $result['meta'] = $meta;
        }


        return json($result);


    }

    /**
     * 失败回复信息
     * @param $msg
     * @param null $meta
     * @param int $status
     * @return \think\response\Json
     */
    public static function error($msg, $meta = null, $status = 0)
    {

        $result = [
            'status' => $status,
            'msg' => $msg
        ];

        if ($meta !== null) {
            $result['meta'] = $meta;
        }

        return json($result);

    }
}                                                                                                                            