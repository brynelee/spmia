var http = require('http');	//require��������ģ��http
  var url = require('url');	//require��������ģ��url
  var fs = require('fs');	//require��������ģ��fs
  var msgOf404 = require('./22-5.json');	//require�����Զ���ģ��
  var webPath = {			//��ɵ�·��
	   "/":"Hello World\n",
	   "/about":"ID:z3f\nQQ:10590916"
  }
  var on200 = function(req,res,bodyStr){
	   res.writeHead(200, {'Content-Type': 'text/plain'});//�����ļ�ͷ��Ϣ
	   res.end(bodyStr);			//�Կͻ���������ݺ����
  }
 var on404 = function(req,res){
 fs.readFile("server/404.html", "utf-8", function (err, file) {	
	//������fs�����ȡ�ļ�
	res.writeHead(404, {'Content-Type': 'text/html'});	//�����ļ�ͷ��Ϣ
		res.write(file
		.replace(/<!--{url}-->/g,req.url)	//ͨ���滻�ķ�ʽ��������ַ��ʾ����
		.replace(/<!--{msg}-->/g,msgOf404[1+parseInt(Math.random()*3)])
	//ͨ���滻��ʽ�����ʾ1������
		, "utf-8");	//��utf-8�������������Ϊ�˺�ǰ��readFileʱ�ı���һ��
		res.end();	//�������
	});
};
	http.createServer(function (req, res) {
	    var pathname = url.parse(req.url).pathname;//��������ַ����url������
	    var bodyStr = webPath[pathname];//�������·��û�б�webPathָ��
    if(bodyStr){
  	  on200(req, res,bodyStr);	//�ҵ����·������on200��������
    }else{
  	  on404(req, res);	//û�ҵ�����on404��������
    }
}).listen(9527, '127.0.0.1'); //��IP�Ͷ˿�
console.log('Server running at http://127.0.0.1:9527/');//����̨�����ʾ





