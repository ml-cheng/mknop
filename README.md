# n1-docker
1. 采用lean源码编译  
2. 当.config更新时编译一次  
3. 本固件包含ssr-plus, passwall
4. 默认管理地址已修改为192.168.1.2  
5. 添加N1作为旁路由的防🔥墙规则 iptables -t nat -I POSTROUTING -o eth0 -j MASQUERADE
# 使用指南
①将docker-img-openwrt-aarch64-latest.gz文件上传至N1的/root目录

②导入软路由docker包：
gzip -dc docker-img-openwrt-aarch64-latest.gz | docker load

③运行容器：
docker run -d --device=/dev/snd:/dev/snd --restart always --network macnet --ip 192.168.1.2 --privileged --name=openwrt	openwrt-aarch64:latest /sbin/init
