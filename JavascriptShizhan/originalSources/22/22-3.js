 var http = require('http');	//require��������ģ��http
	  var url = require('url');	//require��������ģ��url
	  var webPath = {		//��ɵ�·��
		  "/":"Hello World\n",
		  "/about":"ID:z3f\nQQ:10590916"
	  }
	  http.createServer(function (req, res) {
	      res.writeHead(200, {'Content-Type': 'text/plain'});//�����ļ�ͷ��Ϣ
		   var pathname = url.parse(req.url).pathname;	 //��������ַ����url������
		   //�������·��û�б�webPathָ������Not found
		   var bodyStr = webPath[pathname] || "Not found! \n"+req.url+" was not found on this server.";	
		   res.end(bodyStr);				//�������
	   }).listen(9527, '127.0.0.1');	//��IP�Ͷ˿�
	   console.log('Server running at http://127.0.0.1:9527/'); //����̨�����ʾ
