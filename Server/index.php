<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.qicaistu.com/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 盒子云 | Div800.com< QQ群：116328080 >
// +----------------------------------------------------------------------


//站点名称
$configdata = include(realpath(".")."/install/conf/config.php");
$sitename = $configdata['NAME'];
define("sitename","$sitename");
//站点URL
$siteurl = $_SERVER["REQUEST_SCHEME"].'://'.$_SERVER["SERVER_NAME"];
define("siteurl",$siteurl);
// [ 应用入口文件 ]
define('APP_PATH', __DIR__ . '/application/');
// 加载框架引导文件
require __DIR__ . '/thinkphp/start.php';
