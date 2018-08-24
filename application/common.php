<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件

/**
 * 调试打印使用
 */
function filedebug($data = '')
{
    file_put_contents('debug.log',date('Y-m-d H:i:s').'_'.$data."\r\n",8);
}


/**
 * 无限极分类函数
 * @param $arr 数组
 * @param int $pid 父级ID
 * @param int $level 缩进等级
 * @param string $flagstr 缩进字符
 * @return array
 */
function tree($arr, $pid = 0, $level = 0, $flagstr = '└―')
{
    static $list = [];
    foreach ($arr as $v) {
        if ($v['parentid'] == $pid) {
            $v['level'] = $level;
            $flg = str_repeat($flagstr, $level);
//            $flg = str_repeat('├──',$level);
            $v['buttonname'] = $flg . $v['buttonname'];
            $list[] = $v;
            tree($arr, $v['id'], $level + 1);
        }
    }
    return $list;

}


/**
 * 无限极分类函数2
 */
function treeTo($arr, $pid = 0, $level = 0, $flagstr = '')
{
    static $list = [];
    foreach ($arr as $v) {
        if ($v['pid'] == $pid) {
            $v['level'] = $level;
            $flg = str_repeat($flagstr, $level);
//            $flg = str_repeat('├──',$level);
            $v['tag'] = $flg . $v['tag'];
            $list[] = $v;
            treeTo($arr, $v['id'], $level + 1);
        }
    }
    return $list;

}


/**
 * 记录系统日志,跟天乐邦平台的日志格式统一起来
 */

function doLog($action = '', $content = '', $details = '',$appid = '')
{
    $userinfo = \think\facade\Session::get('alluserinfo'); //从session中获取用户登录的信息
    $data['uid'] = $userinfo['userid'] ?? 0; //用户的id
    $data['username'] = $userinfo['username'] ?? ''; //用户名
    $data['ptid'] = 0; //平台ID
    $data['zwcmopenid'] = $appid ?? '';
    $data['openid'] = $appid ?? '';
    $data['ptname'] = \think\facade\Request::controller(); //当前控制器的名称
    $data['productid'] = 0; //当前模块的名称
    $data['action'] = $action;
    $data['content'] = $content;

    $data['ip'] = \think\facade\Request::ip(); //获取当前请求的IP地址

    $data['details'] = $details;
    $data['longitude'] = 0;
    $data['latitude'] = 0;
    $data['createtime'] = date('Y-m-d H:i:s');
    $data['useragent'] = $_SERVER['HTTP_USER_AGENT'];

    //filedebug('保存的数据是 = '.print_r($data,true));

    $res = \think\Db::name('Log')->insert($data);
}


/**
 * 验证URL是否合法
 * @param $URL
 * @return bool
 */
function validateURL($URL)
{
//    $pattern_1 = "/^(http|https|ftp):\/\/(([A-Z0-9][A-Z0-9_-]*)(\.[A-Z0-9][A-Z0-9_-]*)+.(com|org|net|dk|at|us|tv|info|uk|co.uk|biz|se|top)$)(:(\d+))?\/?/i";
//    // $pattern_2 = "/^(www)((\.[A-Z0-9][A-Z0-9_-]*)+.(com|org|net|dk|at|us|tv|info|uk|co.uk|biz|se)$)(:(\d+))?\/?/i";
//    if (preg_match($pattern_1, $URL)) {
//        return true;
//    } else {
//        return false;
//    }

    return filter_var(trim($URL), FILTER_VALIDATE_URL); //使用PHP内置的方法验证URL是否合法



}


/**
 * 将日志写入mongodb中(如果有的话,)
 */
function mglog($detail ='')
{
    if(empty($detail)) return;
    //定义默认的data
    $action = \think\facade\Request::module() . '/' . \think\facade\Request::controller().'/'.\think\facade\Request::action();
    $sessioninfo = \think\facade\Session::get('alluserinfo');
    $default_data = [
        'action' => $action,
        'alluserinfo' => json_encode($sessioninfo),
        'uid' => $sessioninfo['userid'],
        'createtime' => date('Y-m-d H:i:s'),
        'detail' => $detail,
    ];

    $table_name  = 'sys_log_'.date('Ym'); //根据月份分表存储日志信息
//    $finnaldata = array_merge($default_data,$data); //将数组合并
    try{
        //尝试写入MongoDB中,如果失败就直接返回
        $mongodb = \think\Db::connect(\think\facade\Config::get('mongodb.'));
        $res = $mongodb->table($table_name)->insert($default_data);
    }catch (Exception $e){
        return;
    }
    //return $res;

}


/**
 * @name: getfirstchar
 * @description: 获取汉子首字母
 * @param: string
 **/
function getfirstchar($s0){
    $fchar = ord($s0{0});
    if($fchar >= ord("A") and $fchar <= ord("z") )return strtoupper($s0{0});
    //$s1 = iconv("UTF-8","gb2312//IGNORE", $s0);
    // $s2 = iconv("gb2312","UTF-8//IGNORE", $s1);
    $s1 = get_encoding($s0,'GB2312');
    $s2 = get_encoding($s1,'UTF-8');
    if($s2 == $s0){$s = $s1;}else{$s = $s0;}
    $asc = ord($s{0}) * 256 + ord($s{1}) - 65536;
    if($asc >= -20319 and $asc <= -20284) return "A";
    if($asc >= -20283 and $asc <= -19776) return "B";
    if($asc >= -19775 and $asc <= -19219) return "C";
    if($asc >= -19218 and $asc <= -18711) return "D";
    if($asc >= -18710 and $asc <= -18527) return "E";
    if($asc >= -18526 and $asc <= -18240) return "F";
    if($asc >= -18239 and $asc <= -17923) return "G";
    if($asc >= -17922 and $asc <= -17418) return 'H';
    if($asc >= -17922 and $asc <= -17418) return "I";
    if($asc >= -17417 and $asc <= -16475) return "J";
    if($asc >= -16474 and $asc <= -16213) return "K";
    if($asc >= -16212 and $asc <= -15641) return "L";
    if($asc >= -15640 and $asc <= -15166) return "M";
    if($asc >= -15165 and $asc <= -14923) return "N";
    if($asc >= -14922 and $asc <= -14915) return "O";
    if($asc >= -14914 and $asc <= -14631) return "P";
    if($asc >= -14630 and $asc <= -14150) return "Q";
    if($asc >= -14149 and $asc <= -14091) return "R";
    if($asc >= -14090 and $asc <= -13319) return "S";
    if($asc >= -13318 and $asc <= -12839) return "T";
    if($asc >= -12838 and $asc <= -12557) return "W";
    if($asc >= -12556 and $asc <= -11848) return "X";
    if($asc >= -11847 and $asc <= -11056) return "Y";
    if($asc >= -11055 and $asc <= -10247) return "Z";
    return null;
}
/**
 * @name: get_encoding
 * @description: 自动检测内容编码进行转换
 * @param: string data
 * @param: string to  目标编码
 * @return: string
 **/
function get_encoding($data,$to){
    $encode_arr=array('UTF-8','ASCII','GBK','GB2312','BIG5','JIS','eucjp-win','sjis-win','EUC-JP');
    $encoded=mb_detect_encoding($data, $encode_arr);
    $data = mb_convert_encoding($data,$to,$encoded);
    return $data;
}


/**
 * 提取中文拼音的首字母
 * @param $zh
 * @return string
 */
function pinyin1($zh){
    $ret = "";
    $s1 = iconv("UTF-8","gb2312", $zh);
    $s2 = iconv("gb2312","UTF-8", $s1);
    if($s2 == $zh){$zh = $s1;}
    for($i = 0; $i < strlen($zh); $i++){
        $s1 = substr($zh,$i,1);
        $p = ord($s1);
        if($p > 160){
            $s2 = substr($zh,$i++,2);
            $ret .= getfirstchar($s2);
        }else{
            $ret .= $s1;
        }
    }
    return $ret;
}



/**
 * 简单验证接口请求的身份(废弃)
 */
function authApiToken($timestamp,$apitoken)
{
    //怎么进行身份验证
    //根据时间戳,自定的token,进行MD5然后进行验证
    if(!empty($timestamp) && !empty($apitoken)){
        $token = 'wechatbak'; //自定义的
        $str = $timestamp.$token;
        $res = md5($str);
        if(strcasecmp($res,$apitoken) == 0){
            //验证通过
            return true;
        }else{
            //验证失败
            return false;
        }
    }
    return false;

}


/**
 * 处理时间显示
 * @param $date
 */
function handleTime($date,$now = '')
{


    //时间在一天内


    //时间超过一天,昨天


    //时间超过两天未超过本周 ,周四


    //时间超过一周  上周四


    //超过2周
    

    //日期超过年




}


/**
 * 处理时间显示
 * @param $targetTime
 * @return string
 */
function get_last_time($targetTime)
{
    // 今天最大时间
    $todayLast   = strtotime(date('Y-m-d 23:59:59'));
    $agoTimeTrue = time() - $targetTime;
    $agoTime     = $todayLast - $targetTime;
    $agoDay      = floor($agoTime / 86400);

    if ($agoTimeTrue < 60) {
//        $result = '刚刚';
        $result = date('H:i');
    } elseif ($agoTimeTrue < 3600) {
        $result = (ceil($agoTimeTrue / 60)) . '分钟前';
    } elseif ($agoTimeTrue < 3600 * 12) {
        $result = (ceil($agoTimeTrue / 3600)) . '小时前';
    } elseif ($agoDay == 0) {
        $result = '今天 ' . date('H:i', $targetTime);
    } elseif ($agoDay == 1) {
        $result = '昨天 ' . date('H:i', $targetTime);
    } elseif ($agoDay == 2) {
        $result = '前天 ' . date('H:i', $targetTime);
    } elseif ($agoDay > 2 && $agoDay < 16) {
        $result = $agoDay . '天前 ' . date('H:i', $targetTime);
    } else {
        $format = date('Y') != date('Y', $targetTime) ? "Y-m-d H:i" : "m-d H:i";
        $result = date($format, $targetTime);
    }
    return $result;
}


