#!/bin/bash
#=============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=============================================================

#distfeeds-use-mirrors.bfsu.edu.cn.patch
diff --git a/package/lean/default-settings/files/zzz-default-settings b/package/lean/default-settings/files/zzz-default-settings
index a52a824f..7c417e4d 100755
--- a/package/lean/default-settings/files/zzz-default-settings
+++ b/package/lean/default-settings/files/zzz-default-settings
@@ -19,6 +19,7 @@ sed -i 's/\"services\"/\"nas\"/g' /usr/lib/lua/luci/controller/aria2.lua
 sed -i 's/services/nas/g' /usr/lib/lua/luci/view/aria2/overview_status.htm
 sed -i 's/\"services\"/\"nas\"/g' /usr/lib/lua/luci/controller/hd_idle.lua
 sed -i 's/\"services\"/\"nas\"/g' /usr/lib/lua/luci/controller/samba.lua
+sed -i 's/\"services\"/\"nas\"/g' /usr/lib/lua/luci/controller/samba4.lua
 sed -i 's/\"services\"/\"nas\"/g' /usr/lib/lua/luci/controller/minidlna.lua
 sed -i 's/\"services\"/\"nas\"/g' /usr/lib/lua/luci/controller/transmission.lua
 sed -i 's/\"services\"/\"nas\"/g' /usr/lib/lua/luci/controller/mjpg-streamer.lua
@@ -29,10 +30,12 @@ sed -i 's/services/nas/g'  /usr/lib/lua/luci/view/minidlna_status.htm
 
 ln -sf /sbin/ip /usr/bin/ip
 
-sed -i 's/downloads.openwrt.org/openwrt.proxy.ustclug.org/g' /etc/opkg/distfeeds.conf
+sed -i 's/downloads.openwrt.org/mirrors.bfsu.edu.cn\/openwrt/g' /etc/opkg/distfeeds.conf
 sed -i 's/http:/https:/g' /etc/opkg/distfeeds.conf
 sed -i 's/root::0:0:99999:7:::/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.:0:0:99999:7:::/g' /etc/shadow
 
+sed -i '/Lienol/d' /etc/opkg/distfeeds.conf
+sed -i '/helloworld/d' /etc/opkg/distfeeds.conf
 sed -i "s/# //g" /etc/opkg/distfeeds.conf
 sed -i '/openwrt_luci/ { s/snapshots/releases\/18.06.8/g; }'  /etc/opkg/distfeeds.conf

# Add a feed source
sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default
#sed -i '$a src-git helloworld https://github.com/fw876/helloworld' feeds.conf.default
git clone https://github.com/tuanqing/install-program package/install-program
