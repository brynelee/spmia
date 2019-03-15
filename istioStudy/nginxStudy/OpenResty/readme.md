# quick reference

* should add files from trafficmanagement/intioIngress/all-ssl to the "conf" folder
* copy nginx.conf to the "conf" fold
* copy index.html to the "html" folder

## for starting openresty

```aidl
echo "start nginx server @ /home/xiaodong/tools/server1-nginx"
/home/xiaodong/tools/server1-nginx/nginx/sbin/nginx -p /home/xiaodong/tools/server1-nginx/nginx -c /home/xiaodong/tools/server1-nginx/nginx/conf/nginx.conf

```

## for reload openresty

```aidl
echo "reload nginx server ..."
/home/xiaodong/tools/server1-nginx/nginx/sbin/nginx -s reload


```