var http = require('http');	//require��������ģ��http
 http.createServer(function (req, res) {
    res.writeHead(200, {'Content-Type': 'text/plain'});		//����ͷ��Ϣ
	  res.end('Hello World\n');	//�������
 }).listen(1337, '127.0.0.1');	//��IP�Ͷ˿�
 console.log('Server running at http://127.0.0.1:1337/'); //����̨�����ʾ
