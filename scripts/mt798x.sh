# sed -i 's/192.168.1.1/192.168.22.1/g' package/base-files/files/bin/config_generate
sed -i 's/ImmortalWrt/OpenWrt/g' package/base-files/files/bin/config_generate

# 编译新版Sing-box和hysteria，尽量使用golang版本1.22以上版本 ，可以用以下命令
rm -rf feeds/packages/lang/golang
git clone https://github.com/kenzok8/golang feeds/packages/lang/golang

# 安装最新版passwall
rm -rf feeds/packages/net/{xray-core,sing-box,hysteria,mosdns}
git clone --depth=1 https://github.com/kenzok8/small.git package/small
mv package/small/luci-app-passwall feeds/luci/applications/luci-app-passwall
mv package/small/xray-core feeds/package/net/xray-core
mv package/small/sing-box feeds/package/net/sing-box
mv package/small/hysteria feeds/package/net/hysteria
mv package/small/mosdns feeds/package/net/mosdns

rm -rf package/small

#安装最新openclash
rm -rf feeds/luci/applications/luci-app-openclash
git clone --depth=1 https://github.com/vernesong/OpenClash.git  package/openclash
mv package/openclash/luci-app-openclash feeds/luci/applications/luci-app-openclash
rm -rf package/openclash

# 添加其它插件
# git clone --depth=1 https://github.com/jerrykuku/luci-theme-argon package/mypackage/luci-theme-argon
# git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config package/mypackage/luci-app-argon-config

# iStore
# git clone --depth=1 -b main https://github.com/linkease/istore.git package/mypackage/istore
# git clone --depth=1 -b master https://github.com/linkease/nas-packages.git package/mypackage/nas-packages
# git clone --depth=1 -b main https://github.com/linkease/nas-packages-luci.git package/mypackage/nas-luci
# mv package/mypackage/nas-packages/network/services/* package/mypackage/nas-packages/
# rm -rf package/mypackage/nas-packages/network
