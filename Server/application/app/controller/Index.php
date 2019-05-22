<?php
namespace app\app\controller;
use app\XDeode;
use think\Controller;
initialize();
function initialize(){
	error_reporting(0);
	$domain=getTopDomain();
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
function getTopDomain()
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
class Index extends Controller
{
    function getIP()
    {
        if (getenv('HTTP_CLIENT_IP')) {
            $ip = getenv('HTTP_CLIENT_IP');
        } elseif (getenv('HTTP_X_FORWARDED_FOR')) {
            $ip = getenv('HTTP_X_FORWARDED_FOR');
        } elseif (getenv('HTTP_X_FORWARDED')) {
            $ip = getenv('HTTP_X_FORWARDED');
        } elseif (getenv('HTTP_FORWARDED_FOR')) {
            $ip = getenv('HTTP_FORWARDED_FOR');
        } elseif (getenv('HTTP_FORWARDED')) {
            $ip = getenv('HTTP_FORWARDED');
        } else {
            $ip = $_SERVER['REMOTE_ADDR'];
        }
        return $ip;
    }
    public function qudao()
    {
        $uid = base64_decode(input('uid'));
        $sid = input('uid');
        $num = db('user')->where('id', $uid)->count();
        if ($num > 0) {
            $ip = $this->getIP();
            $ipnum = db('share')->where('ip', $ip)->count();
            if ($ipnum == '0') {
                db('share')->insert(['uid' => $uid, 'ip' => $ip]);
            }
            $data = db('user')->where('id', $uid)->find();
            if ($data['power'] == '2') {
                $share_ma = db('user')->where('id', $data['parentid'])->value('share_ma');
            } else {
                $share_ma = $data['share_ma'];
                $data['parentid'] = $data['id'];
            }
        } else {
            if ($uid == null) {
                $share_ma = '000001';
            }
        }
        return view('qudao', ['code' => $share_ma, 'uid' => $uid, 'sid' => $data['parentid']]);
    }
    public function m()
    {
        $uid = base64_decode(input('uid'));
        $sid = input('uid');
        $num = db('user')->where('id', $uid)->count();
        if ($num > 0) {
            $ip = $this->getIP();
            $ipnum = db('share')->where('ip', $ip)->count();
            if ($ipnum == '0') {
                db('user')->where('id', $uid)->setInc('sign');
                db('share')->insert(['uid' => $uid, 'ip' => $ip]);
            }
            $data = db('user')->where('id', $uid)->find();
            if ($data['power'] == '2') {
                $share_ma = '注册邀请码：' . db('user')->where('id', $data['parentid'])->value('share_ma');
            } else {
                $share_ma = '注册邀请码：' . $data['share_ma'];
            }
        } else {
            if ($uid == null) {
                $share_ma = '使用手机自带浏览器下载！';
            }
        }
        return view('m', ['share' => $share_ma, 'sid' => $sid]);
    }
    public function index()
    {
		header("Content-type:text/html;charset=utf-8");
		define("ROOT_PATH",str_replace("\\","/",dirname(__FILE__)));
		if(!is_file("./install/install/lock") && is_file("./install/install/index.php")){
			@header("location:install/index.php");
		}else{
			$uid = base64_decode(input('uid'));
			$num = db('user')->where('id', $uid)->count();
			$sid = input('uid');
			if ($num > 0) {
				$ip = $this->getIP();
				$ipnum = db('share')->where('ip', $ip)->count();
				if ($ipnum == '0') {
					db('user')->where('id', $uid)->setInc('sign');
					db('share')->insert(['uid' => $uid, 'ip' => $ip]);
				}
				$data = db('user')->where('id', $uid)->find();
				if ($data['power'] == '2') {
					$share_ma = '注册邀请码：' . db('user')->where('id', $data['parentid'])->value('share_ma');
				} else {
					$share_ma = '注册邀请码：' . $data['share_ma'];
				}
			} else {
				if ($uid == null) {
					$share_ma = '使用手机自带浏览器下载！';
				}
			}
			return view('index', ['share' => $share_ma, 'sid' => $sid]);	
		}
	}
    public function jiexi()
    {
        $url = input('url');
        return view('jiexi', ['url' => $url]);
    }
    public function mm()
    {
        $url = input('url');
        return view('mm', ['url' => $url]);
    }
    public function ios()
    {
        return view('ios');
    }
    public function validcode()
    {
        $insert['username'] = input('phone');
        $uid = input('uid');
        $insert['parentid'] = input('sid');
        $insert['password'] = md5(sha1(input('passwd')));
        $insert['power'] = 2;
        $insert['status'] = 1;
        $insert['ctime'] = time();
        $insert['lasttime'] = date(strtotime('+2880minute'));  //这里是设置分享下载的注册时间
        if ($insert['username'] && $uid && $insert['parentid']) {
            $re = db('user')->where('id', $uid)->setInc('sign');
            $re2 = db('user')->insert($insert);
            if (!empty($re) && !empty($re2)) {
                return jsonp(['code' => 1, 'state' => '200']);
            } else {
                return jsonp(['code' => 401]);
            }
            return jsonp(['code' => 200]);
        } else {
            return jsonp(['code' => 401]);
        }
    }
    public function checkusername()
    {
        $phone = input('phone');
        $re = db('user')->where('username', $phone)->find();
        if ($re) {
            return jsonp(['code' => 500]);
        } else {
            return jsonp(['code' => 200]);
        }
    }
}