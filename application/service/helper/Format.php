<?php
/**
 * Created by PhpStorm.
 * User: 123
 * Date: 2018/8/1
 * Time: 12:31
 * 统一封装接口返回的数据格式
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
            $result['data'] = $meta;
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
    public static function error($msg, $action = '', $appid = '', $meta = '', $status = 0, $errorcode = 0)
    {

        $errorCodeList = config('wxerrorcode.');
        $result = [
            'status' => $status,
            'msg' => $errorCodeList[$errorcode] ?? $msg
        ];
        if ($meta !== null) {
            $meta = is_array($meta) ? json_encode($meta) : $meta;
        }
        doLog($action, $msg, $meta, $appid); //统一记录错误信息
        return json($result);

    }
}                                                                                                                            