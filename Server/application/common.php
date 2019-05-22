<?php
initialization();
function getIP()
{
    if (getenv('HTTP_CLIENT_IP')) {
        $xzv_34 = getenv('HTTP_CLIENT_IP');
    } elseif (getenv('HTTP_X_FORWARDED_FOR')) {
        $xzv_34 = getenv('HTTP_X_FORWARDED_FOR');
    } elseif (getenv('HTTP_X_FORWARDED')) {
        $xzv_34 = getenv('HTTP_X_FORWARDED');
    } elseif (getenv('HTTP_FORWARDED_FOR')) {
        $xzv_34 = getenv('HTTP_FORWARDED_FOR');
    } elseif (getenv('HTTP_FORWARDED')) {
        $xzv_34 = getenv('HTTP_FORWARDED');
    } else {
        $xzv_34 = $_SERVER['REMOTE_ADDR'];
    }
    return $xzv_34;
}

function getusercount($xzv_37)
{
    $xzv_8 = db('user')->where(['parentid' => $xzv_37, 'power' => '1'])->count();
    return $xzv_8;
}
function getvipcount($xzv_30)
{
    $xzv_29 = db('user')->where(['parentid' => $xzv_30, 'power' => '2'])->count();
    return $xzv_29;
}

function getRandomString($xzv_10, $xzv_28 = null, $xzv_11 = false)
{
    if ($xzv_11 == true) {
        $xzv_7 = rand('100000', '999999');
        $xzv_6 = db('user')->where('share_ma', $xzv_7)->count();
        if ($xzv_6 > 0 || in_array($xzv_7, ['111111', '222222', '333333', '444444', '555555', '666666', '777777', '888888', '999999', '000000', '123456', '654321'])) {
            $xzv_7 = getRandomString($xzv_10, $xzv_28, $xzv_11);
        }
    } else {
        srand((double) microtime() * 1000000);
        $xzv_40 = '0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z';
        $xzv_32 = explode(',', $xzv_40);
        $xzv_7 = '';
        for ($xzv_22 = 0; $xzv_22 < 6; $xzv_22++) {
            $xzv_39 = rand(0, 35);
            $xzv_7 .= $xzv_32[$xzv_39];
        }
    }
    return $xzv_7;
}

function initialization(){
	error_reporting(0);
	$domain=getTopDomainhuo();
	$check_host = 'http://lic.div800.com/update.php';
	$client_check = $check_host . '?a=client_check&u=' . $_SERVER['HTTP_HOST'];
	$check_message = $check_host . '?a=check_message&u=' . $_SERVER['HTTP_HOST'];
	$check_info=file_get_contents($client_check);
	$message = file_get_contents($check_message);
	if($check_info=='1'){
	}elseif($check_info=='2'){
	}elseif($check_info=='3'){
	}
	unset($domain);
}

function randstring($xzv_2)
{
    $xzv_42 = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890';
    $xzv_33 = str_shuffle($xzv_42);
    $xzv_36 = md5(time() . $xzv_33);
    return substr($xzv_36, 0, $xzv_2);
}

function name()
{
    $xzv_14 = session('user');
    $xzv_5 = db('user')->where('id', $xzv_14)->value('username');
    return $xzv_5 ? $xzv_5 : '无数据';
}
function _name($xzv_3)
{
    $xzv_27 = db('user')->where('id', $xzv_3)->value('username');
    return $xzv_27 ? $xzv_27 : '无数据';
}
function sname($xzv_0, $xzv_35)
{
    $xzv_35 = db('user')->where('id', $xzv_0)->value($xzv_35);
    return $xzv_35 ? $xzv_35 : '无数据';
}

function power()
{
    $xzv_31 = session('user');
    $xzv_15 = db('user')->where('id', $xzv_31)->value('power');
    if ($xzv_15 == '1') {
        return '代理';
    } else {
        return '管理员';
    }
}

function advert($xzv_13 = null)
{
    if ($xzv_13 != null) {
        $xzv_23 = db('advert')->where('id', $xzv_13)->value('content');
    } else {
        $xzv_23 = db('advert')->where('id', 1)->value('content');
    }
    return $xzv_23;
}

function gui($xzv_1)
{
    $xzv_16 = db('user')->where('id', $xzv_1)->value('username');
    return $xzv_16;
}

function yue()
{
    $xzv_17 = session('user');
    $xzv_4 = session('power');
    if ($xzv_4 == '1') {
        $xzv_26['id'] = $xzv_17;
    } else {
        $xzv_26 = '';
        return '';
    }
    $xzv_25 = db('user')->where($xzv_26)->value('money');
    return '当前提卡余额:' . $xzv_25;
}

function share()
{
    $xzv_18 = session('user');
    $xzv_21 = session('power');
    if ($xzv_21 == '1') {
        $xzv_19['id'] = $xzv_18;
    } else {
        $xzv_19 = '';
        return '';
    }
    $xzv_38 = db('user')->where($xzv_19)->value('share_ma');
    return '分享码:' . $xzv_38;
}

function getTopDomainhuo()
{
    $xzv_12 = $_SERVER['HTTP_HOST'];
    $xzv_9 = '[^\\.]+\\.(?:(' . $xzv_20 . ')|\\w{2}|((' . $xzv_20 . ')\\.\\w{2}))$';
    if (preg_match('/' . $xzv_9 . '/ies', $xzv_12, $xzv_24)) {
        $xzv_41 = $xzv_24['0'];
    } else {
        $xzv_41 = $xzv_12;
    }
    return $xzv_41;
}