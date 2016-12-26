#!/bin/bash
# 2016/12/16 pdd

clear

# linux shell color support.
RED="\\033[31m"
GREEN="\\033[32m"
YELLOW="\\033[33m"
BLACK="\\033[0m"

netstat -tpln | grep -q -w 80 && { echo -e "${RED}端口已被占用\t\t[退出安装]${BLACK}\n"; exit 1; }

function download () {
    [ -f /usr/local/src/nginx-1.8.1.tar.gz ] && { echo -e "${YELLOW}nginx文件已下载${BLACK}\n"; } || wget http://nginx.org/download/nginx-1.8.1.tar.gz -P /usr/local/src
}

function install () {
    cd /usr/local/src
    echo -e "${GREEN}解压缩nginx文件${BLACK}\n"
    tar -zx -f nginx-1.8.1.tar.gz
    cd nginx-1.8.1
    local CPU_NUM=$(grep -c processor /proc/cpuinfo)
    ./configure --prefix=/usr/local/nginx --user=www --group=www --with-http_stub_status_module --with-http_sub_module --with-http_ssl_module
    [ "$CPU_NUM" -gt 1 ] && make -j$CPU_NUM || make
    make install
    ln -sf /usr/local/nginx/sbin/nginx /usr/local/bin/nginx
    [ -d /usr/local/nginx/conf/conf.d ] || mkdir /usr/local/nginx/conf/conf.d
}

function add_iptables () {
	local iptables_conf=/etc/sysconfig/iptables
    grep -q -w 80 "$iptables_conf"
    if [ ! $? = 0 ];then
        sed -i '/-i lo/a -A INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT' "$iptables_conf"
        /etc/init.d/iptables reload
    fi
}

function self_boot () {
    local boot_conf=/etc/rc.local
	grep -q -w "#nginx" "$boot_conf"
    if [ ! $? = 0 ];then
cat >>"$boot_conf"<<EOF
#nginx
/usr/local/nginx/sbin/nginx
EOF
fi
}

if [ ! -f /usr/local/nginx/sbin/nginx ];then
    download
    install
    echo -e "${YELLOW}服务安装完成\t\t[success]${BLACK}\n"
else
    echo -e "${YELLOW}服务已安装！${BLACK}\n"
fi
add_iptables
self_boot
/usr/local/nginx/sbin/nginx
