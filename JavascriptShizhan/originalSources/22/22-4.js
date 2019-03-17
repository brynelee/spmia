var http = require('http');	//require��������ģ��http
  var url = require('url');	//require��������ģ��url
  var fs = require('fs');	//require��������ģ��fs
  var webPath = {			//��ɵ�·��
	   "/":"Hello World\n",
	   "/about":"ID:z3f\nQQ:10590916"
  }
  var on200 = function(req,res,bodyStr){
	   res.writeHead(200, {'Content-Type': 'text/plain'});//�����ļ�ͷ��Ϣ
	   res.end(bodyStr);			//�Կͻ���������ݺ����
  }
  var on404 = function(req,res){
	   fs.readFile("server/404.html", "binary", function (err, file) {	
		res.writeHead(404, {'Content-Type': 'text/html'});//�����ļ�ͷ��Ϣ
		res.write(file, "binary");	 //����ȡ������������ͻ���
		res.end();			//�������
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
