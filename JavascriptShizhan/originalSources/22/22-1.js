var http = require('http');	//require引用内置模块http
 http.createServer(function (req, res) {
    res.writeHead(200, {'Content-Type': 'text/plain'});		//设置头信息
	  res.end('Hello World\n');	//输出内容
 }).listen(1337, '127.0.0.1');	//绑定IP和端口
 console.log('Server running at http://127.0.0.1:1337/'); //控制台输出提示
