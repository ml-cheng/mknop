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
diff --git a/include/package-defaults.mk b/include/package-defaults.mk
index a94f2a4..9567e04 100644
--- a/include/package-defaults.mk
+++ b/include/package-defaults.mk
@@ -5,7 +5,7 @@ 
 # See /LICENSE for more information.
 #
 
-PKG_DEFAULT_DEPENDS = +libc +USE_GLIBC:librt +USE_GLIBC:libpthread
+PKG_DEFAULT_DEPENDS = +libc +SSP_SUPPORT:libssp +USE_GLIBC:librt +USE_GLIBC:libpthread
 
 ifneq ($(PKG_NAME),toolchain)
   PKG_FIXUP_DEPENDS = $(if $(filter kmod-%,$(1)),$(2),$(PKG_DEFAULT_DEPENDS) $(filter-out $(PKG_DEFAULT_DEPENDS),$(2)))

# Add a feed source
sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default
#sed -i '$a src-git helloworld https://github.com/fw876/helloworld' feeds.conf.default
git clone https://github.com/tuanqing/install-program package/install-program
