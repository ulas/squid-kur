#!/bin/bash

# Squid kurulum betiği
# 
# 
if cat /etc/os-release | grep PRETTY_NAME | grep "Ubuntu 20.04"; then
    /usr/bin/apt update && apt upgrade -y
    /usr/bin/apt -y install apache2-utils squid
    touch /etc/squid/passwd
    /bin/rm -f /etc/squid/squid.conf
    /usr/bin/touch /etc/squid/blacklist.acl
    /usr/bin/wget --no-check-certificate -O /etc/squid/squid.conf https://raw.githubusercontent.com/ulas/squid-kur/master/squid.conf
    /sbin/iptables -I INPUT -p tcp --dport 8080 -j ACCEPT
    /sbin/iptables-save
    service squid restart
    systemctl enable squid
elif cat /etc/os-release | grep PRETTY_NAME | grep "Ubuntu 18.04"; then
    /usr/bin/apt update
    /usr/bin/apt -y install apache2-utils squid3
    touch /etc/squid/passwd
    /bin/rm -f /etc/squid/squid.conf
    /usr/bin/touch /etc/squid/blacklist.acl
    /usr/bin/wget --no-check-certificate -O /etc/squid/squid.conf https://raw.githubusercontent.com/ulas/squid-kur/master/squid.conf
    /sbin/iptables -I INPUT -p tcp --dport 8080 -j ACCEPT
    /sbin/iptables-save
    service squid restart
    systemctl enable squid
elif cat /etc/os-release | grep PRETTY_NAME | grep "Ubuntu 16.04"; then
    /usr/bin/apt update
    /usr/bin/apt -y install apache2-utils squid3
    touch /etc/squid/passwd
    /bin/rm -f /etc/squid/squid.conf
    /usr/bin/touch /etc/squid/blacklist.acl
    /usr/bin/wget --no-check-certificate -O /etc/squid/squid.conf https://raw.githubusercontent.com/ulas/squid-kur/master/squid.conf
    /sbin/iptables -I INPUT -p tcp --dport 8080 -j ACCEPT
    /sbin/iptables-save
    service squid restart
    update-rc.d squid defaults
elif cat /etc/*release | grep DISTRIB_DESCRIPTION | grep "Ubuntu 14.04"; then
    /usr/bin/apt update
    /usr/bin/apt -y install apache2-utils squid3
    touch /etc/squid3/passwd
    /bin/rm -f /etc/squid3/squid.conf
    /usr/bin/touch /etc/squid3/blacklist.acl
    /usr/bin/wget --no-check-certificate -O /etc/squid3/squid.conf https://raw.githubusercontent.com/ulas/squid-kur/master/squid.conf
    /sbin/iptables -I INPUT -p tcp --dport 8080 -j ACCEPT
    /sbin/iptables-save
    service squid3 restart
    ln -s /etc/squid3 /etc/squid
    #update-rc.d squid3 defaults
    ln -s /etc/squid3 /etc/squid
elif cat /etc/os-release | grep PRETTY_NAME | grep "jessie"; then
    # OS = Debian 8
    /bin/rm -rf /etc/squid
    /usr/bin/apt update
    /usr/bin/apt -y install apache2-utils squid3
    touch /etc/squid3/passwd
    /bin/rm -f /etc/squid3/squid.conf
    /usr/bin/touch /etc/squid3/blacklist.acl
    /usr/bin/wget --no-check-certificate -O /etc/squid3/squid.conf https://raw.githubusercontent.com/ulas/squid-kur/master/squid.conf
    /sbin/iptables -I INPUT -p tcp --dport 8080 -j ACCEPT
    /sbin/iptables-save
    service squid3 restart
    update-rc.d squid3 defaults
    ln -s /etc/squid3 /etc/squid
elif cat /etc/os-release | grep PRETTY_NAME | grep "stretch"; then
    # OS = Debian 9
    /bin/rm -rf /etc/squid
    /usr/bin/apt update
    /usr/bin/apt -y install apache2-utils squid
    touch /etc/squid/passwd
    /bin/rm -f /etc/squid/squid.conf
    /usr/bin/touch /etc/squid/blacklist.acl
    /usr/bin/wget --no-check-certificate -O /etc/squid/squid.conf https://raw.githubusercontent.com/ulas/squid-kur/master/squid.conf
    /sbin/iptables -I INPUT -p tcp --dport 8080 -j ACCEPT
    /sbin/iptables-save
    systemctl enable squid
    systemctl restart squid
elif cat /etc/os-release | grep PRETTY_NAME | grep "buster"; then
    # OS = Debian 10
    /bin/rm -rf /etc/squid
    /usr/bin/apt update
    /usr/bin/apt -y install apache2-utils squid
    touch /etc/squid/passwd
    /bin/rm -f /etc/squid/squid.conf
    /usr/bin/touch /etc/squid/blacklist.acl
    /usr/bin/wget --no-check-certificate -O /etc/squid/squid.conf https://raw.githubusercontent.com/ulas/squid-kur/master/squid.conf
    /sbin/iptables -I INPUT -p tcp --dport 8080 -j ACCEPT
    /sbin/iptables-save
    systemctl enable squid
    systemctl restart squid
elif cat /etc/os-release | grep PRETTY_NAME | grep "bullseye"; then
    # OS = Debian 11
    /bin/rm -rf /etc/squid
    /usr/bin/apt update
    /usr/bin/apt -y install apache2-utils squid
    touch /etc/squid/passwd
    /bin/rm -f /etc/squid/squid.conf
    /usr/bin/touch /etc/squid/blacklist.acl
    /usr/bin/wget --no-check-certificate -O /etc/squid/squid.conf https://raw.githubusercontent.com/ulas/squid-kur/master/squid.conf
    /sbin/nftables -I INPUT -p tcp --dport 8080 -j ACCEPT
    /sbin/nftables-save
    systemctl enable squid
    systemctl restart squid
else
    echo "Bu işletim sistemi desteklenmiyor.\n"
    echo "Şimdilik sadece ubuntu ve debian desteği var."
    exit 1;
fi

#/usr/bin/htpasswd -b -c /etc/squid/passwd KullaniciAdi ParoLA
