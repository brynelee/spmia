 var http = require('http'); //require��������ģ��http
 var url = require('url'); //require��������ģ��url
 http.createServer(function (req, res) {
    res.writeHead(200, {'Content-Type': 'text/plain'});	//����ͷ��Ϣ
	  var pathname = url.parse(req.url).pathname;	//��������ַ����url������
	  var bodyStr ="";	//����һ�����������洢Ҫ���������
	  if(pathname==="/"){ //�������ҳ
	  	bodyStr = 'Hello World\n';
	  }else{
	  	bodyStr = req.url; 	//���������·��
	  }
	  res.end(bodyStr);		//�������
	}).listen(9527, '127.0.0.1');	//��IP�Ͷ˿�
  console.log('Server running at http://127.0.0.1:9527/');//����̨�����ʾ
