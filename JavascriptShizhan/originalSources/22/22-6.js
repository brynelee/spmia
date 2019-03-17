 var onFiles = function(req,res){
 var pathname = url.parse(req.url).pathname;  //��������ַ����url������
 pathname = path.normalize(pathname.replace(/\.\./g, ""));	//����·��
 if(pathname==="\\"){	 //����Ǹ�Ŀ¼�������õ�Ĭ����ҳ
		pathname = cfg.index;
 }
 var filepath = cfg.root+pathname;				//�ҵ���ʵ��ַ
 path.exists(filepath,function(exists){	 //����Ƿ���ڸ��ļ�
		if(!exists){
			on404(req,res); 	//��������ھ���ʾ404
		}else{
			fs.readFile(filepath,"binary",function(err,file){ //��ȡ�ļ�
			    if(err){ 	//�����ȡ����ʧ���򷵻�500����˳������
				  res.writeHead(500,{"Content-Type":"text/plain"});
				  res.end(err);
				  return;
			    }
			    var ext = path.extname(filepath);	  //��ȡ�ļ���׺
			    ext = ext ? ext.slice(1) : 'unknown';		
		//����û�к�׺�ĵ���δ֪�ļ�
			    var contentType =MIME[ext]||"application/octet-stream";
                   //��û����ĵ��������ƴ���
			    res.writeHead(200,{"Content-Type":contentType});
			    res.write(file,"binary");
			    res.end();
		    });
		}
	});
};
