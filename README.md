# Squid-kur
### Squid vekil sunucu kurulum betiği
 Ubuntu 14.04
 Ubuntu 16.04
 Ubuntu 18.04
 Debian 8
 Debian 9
 Debian 10
## Kurulum:
```
apt-get -y install curl && curl  https://raw.githubusercontent.com/ulas/squid-kur/master/squid-kur.sh -o squid-kur.sh && chmod +x squid-kur.sh && ./squid-kur.sh
```
##### Squid için açılan port : 8080

### Squid Kullanıcı ekleme:
#### /usr/bin/htpasswd -b -c /etc/squid/passwd KullaniciAdi ParoLA
### Squid Parola güncelleme:
#### /usr/bin/htpasswd /etc/squid/passwd KullaniciAdi
