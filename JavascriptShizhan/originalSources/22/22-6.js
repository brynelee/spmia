 var onFiles = function(req,res){
 var pathname = url.parse(req.url).pathname;  //把请求网址交给url对象处理
 pathname = path.normalize(pathname.replace(/\.\./g, ""));	//处理父路径
 if(pathname==="\\"){	 //如果是根目录就用设置的默认首页
		pathname = cfg.index;
 }
 var filepath = cfg.root+pathname;				//找到真实地址
 path.exists(filepath,function(exists){	 //检查是否存在该文件
		if(!exists){
			on404(req,res); 	//如果不存在就提示404
		}else{
			fs.readFile(filepath,"binary",function(err,file){ //读取文件
			    if(err){ 	//如果读取过程失败则返回500服务端程序错误
				  res.writeHead(500,{"Content-Type":"text/plain"});
				  res.end(err);
				  return;
			    }
			    var ext = path.extname(filepath);	  //获取文件后缀
			    ext = ext ? ext.slice(1) : 'unknown';		
		//对于没有后缀的当做未知文件
			    var contentType =MIME[ext]||"application/octet-stream";
                   //对没定义的当做二进制处理
			    res.writeHead(200,{"Content-Type":contentType});
			    res.write(file,"binary");
			    res.end();
		    });
		}
	});
};
