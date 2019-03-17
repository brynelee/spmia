	  var http = require('http');		//require��������ģ��http
	  var url = require('url');		//require��������ģ��url
	  var fs = require('fs');		//require��������ģ��fs
	  var path = require('path');		//require��������ģ��path
	  var msgOf404 = require('./22-5.json');	//require�����Զ���ģ��
	  var MIME = require('./22-8.MIME.json');	//require�����Զ���ģ��
	  var cfg = require('./22-11.config.js');	//require�����Զ���ģ��
 var formidable = require('formidable');	//require���õ�����ģ��
	  var on404 = function(req,res){
	       fs.readFile("server/404.html", "utf-8", function (err, file) {		        //������fs�����ȡ�ļ�
		        res.writeHead(404, {'Content-Type': 'text/html'});//�����ļ�ͷ��Ϣ
		        res.write(file
			  .replace(/<!--{url}-->/g,req.url)//ͨ���滻�ķ�ʽ��������ַ��ʾ����
			  .replace(/<!--{msg}-->/g,msgOf404[1+parseInt(Math.random()*3)])
           //ͨ���滻�����ʾһ������
			  , "utf-8");	//��utf-8�������������Ϊ�˺�ǰ��readFile�ı���һ��
			  res.end();	//�������
		    });
	   };
	   var upload = function(req,res){
		var form = new formidable.IncomingForm()
		var fields=[],files=[],fieldsDATA={},filesDATA={}
			form.uploadDir = cfg.root;			//ָ��Ŀ¼
		form.keepExtensions=true;			//�����ϴ��ļ��ĺ�׺
			form.maxFieldsSize = 2 * 1024 * 1024;	//�������2MB
			form.on('field', function(field, value) {	//����������ʱ
	                fields.push([field, value]);		//��ȡ���ֶ���Ϣ
			})
				.on('file', function(field, file) {	//�������ϴ��ļ�ʱ
					files.push([field, file]);		//��ȡ���ϴ��ļ���Ϣ
				})
				.on('end', function() {			//�������ʱ
					console.log('-> upload done');	//����̨�����ʾ����ȥ��
					for (var i=0; i<fields.length;i++){
						fieldsDATA[fields[i][0]] = fields[i][1];	
                              //����ת����
					}
					for (var i=0; i<files.length;i++){
						filesDATA[files[i][0]]=files[i][1];//����ת����
					}
					var oldf = filesDATA.upfile.path;
					var newf = oldf.replace(/(\w+)\./,"z3f.").replace
                       (/\\/g,"/");
				fs.renameSync(oldf,newf);		//�첽�޸��ļ���
					res.writeHead(200, {'content-type': 'text/html'});
				res.write('TEMP Name:'+oldf+'<br />');
					res.write('NEW Name:'+newf+'<br />');
					res.write('<br /><img src="'+newf.substr(newf. 
                       lastIndexOf("/"))+'"/>');
				res.end('ok');
			});
		form.parse(req);					//��Ҫ����
   };
	   var onFiles = function(req,res){
	var pathname = url.parse(req.url).pathname;	//��������ַ����url������
		pathname = path.normalize(pathname.replace(/\.\./g, ""));	      
          //����·��
			if(pathname==="\\"){			//����Ǹ�Ŀ¼�������õ�Ĭ����ҳ
			pathname = cfg.index;
			}
			if(pathname==="\\upload" && req.method.toLowerCase() == 'post'){
				upload(req,res);
				return;
			}
	var filepath = cfg.root+pathname;			//�ҵ���ʵ��ַ
	path.exists(filepath,function(exists){		//����Ƿ���ڸ��ļ�
			if(!exists){
				on404(req,res);			//��������ھ���ʾ404
		}else{
			fs.readFile(filepath,"binary",function(err,file){//��ȡ�ļ�
					if(err){	//�����ȡ����ʧ���򷵻�500����˳������
					res.writeHead(500,{"Content-Type": 
                              "text/plain"});
					res.end(err);
					return;
					}
				var ext = path.extname(filepath);		//��ȡ�ļ���׺
					ext = ext ? ext.slice(1) : 'unknown';	
                       //ȥ�㣬����û�к�׺�ĵ���δ֪�ļ�
				var contentType = MIME[ext]||"application/octet-stream";	//��û����ĵ��������ƴ���
				res.writeHead(200,{"Content-Type":contentType});
				res.write(file,"binary");
					res.end();			//������������������������
		});
		}
		});
	};
		http.createServer(function (req, res) {
			res.setHeader("Server","z3f nodejs web server/0.1");
		  	onFiles(req,res);
		}).listen(9527, '127.0.0.1');				//��IP�Ͷ˿�
console.log('Server running at http://127.0.0.1:9527/');	//����̨�����ʾ
