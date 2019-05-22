
开发日志

2019年4月5日20:03:17
今天写完了安装器，和管理员数据写入
还差install下的站点名称、站点域名统一修改没做完！！！！


笔记：
//问题1
Q => {
	在 php 中 return array();里面的值是怎么获取的？怎么获取多个值？
}

A => {
	例如下方数组
	return array("a"=>"1","b"=>"2","c"=>"3","d"=>"4","e"=>"5","f"=>"6","g"=>"7","h"=>"8","i"=>"9","j"=>"10","k"=>"11");
	存放在文件config.php;
	可以用include的方式获取文件内容的数组内容并赋值给变量;
	首先要定义变量，并将需要引入的内容引入;
	$config = include('./config.php');
	输出试一下:
	echo $config;
}

//问题2
Q => {
	如何获取站点绝对目录？
}

A => {
	使用realpath(".")函数获取站点绝对路径,但输出是反斜杠;
	例如：
	define('BASE_PATH',str_replace('\\','/',realpath(dirname(__FILE__).'/'))."/");
	echo BASE_PATH;
} 

//问题3
Q => {
	如何获取当前站点协议、域名以及URL?
}

A => {
	使用下方代码获取:{
		echo $_SERVER["REQUEST_SCHEME"].'://'.$_SERVER["SERVER_NAME"].$_SERVER["REQUEST_URI"];
			其中$_SERVER["REQUEST_SCHEME"]为协议;
			$_SERVER["SERVER_NAME"]为站点域名;
			$_SERVER["REQUEST_URI"]为当前文件URL;
		如果下次再遇到获取当前站点域名的话，就可以直接使用语句:{
			$_SERVER["REQUEST_SCHEME"].'://'.$_SERVER["SERVER_NAME"];
		}
	}
	其他扩展:{
		如果要获取当前的请求信息，可以使用\think\Request类，
		除了下文中的
		$request = Request::instance();
		也可以使用助手函数
		$request = request();
			$request = Request::instance();
			// 获取当前域名
			echo 'domain: ' . $request->domain() . '<br/>';
			// 获取当前入口文件
			echo 'file: ' . $request->baseFile() . '<br/>';
			// 获取当前URL地址 不含域名
			echo 'url: ' . $request->url() . '<br/>';
			// 获取包含域名的完整URL地址
			echo 'url with domain: ' . $request->url(true) . '<br/>';
			// 获取当前URL地址 不含QUERY_STRING
			echo 'url without query: ' . $request->baseUrl() . '<br/>';
			// 获取URL访问的ROOT地址
			echo 'root:' . $request->root() . '<br/>';
			// 获取URL访问的ROOT地址
			echo 'root with domain: ' . $request->root(true) . '<br/>';
			// 获取URL地址中的PATH_INFO信息
			echo 'pathinfo: ' . $request->pathinfo() . '<br/>';
			// 获取URL地址中的PATH_INFO信息 不含后缀
			echo 'pathinfo: ' . $request->path() . '<br/>';
			// 获取URL地址中的后缀信息
	}
}

//问题4
Q => {
	输出的问题又来了！
	echo输出无法格式化，因此要使用什么方法输出带格式的文本呢？
}

A => {
	1.使用printf输出格式化字符串;
	2.使用sprintf创建$out变量;
	3.使用定界符<<<声明,比如(结尾标识必须顶行写！！！){
$zifu = <<<申明字符
这是定界符内容
申明字符;
	}
		使用定界符<<< 的注意事项
		定界符标识必须前后一致
		可以任意定义定界符标识，比如 echo html div ，尽量选用有意义的标识符，并遵循某类命名规范。
		开头标识后不能跟任何字符，空格也不可以，换行后再跟要输出的文本。
		*结束标识（其后紧跟一个分号;）前后都不可有任何字符，即结束标识要顶头写，且独占一行！！！其后除紧跟分号外，不能有任何字符（空格也不可以）
		*最后要注意的是，结束标识所在行不能成为脚本的最后一行，其下必须有空行或者其他代码行，否则报错。
}

//问题5
Q => {
	
}

A => {
	
}