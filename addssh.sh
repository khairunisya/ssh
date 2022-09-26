#!/bin/bash

bersih
MYIP=$(wget -qO- ipinfo.io/ip);

clear
read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (hari): " masaaktif


source /var/lib/premium-script/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /home/domain)
else
domain=$IP
fi
wstls="$(cat ~/log-install.txt | grep -w "WebSocket TLS" | cut -d: -f2)"
wsdrop="$(cat ~/log-install.txt | grep -w "WebSocket Dropbear" | cut -d: -f2)"
wsssh="$(cat ~/log-install.txt | grep -w "WebSocket OpenSSH" | cut -d: -f2)"
wsovpn="$(cat ~/log-install.txt | grep -w "WebSocket OpenVPN" | cut -d: -f2)"
ssl="$(cat ~/log-install.txt | grep -w "Stunnel4" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
drop="$(cat ~/log-install.txt | grep -w " Dropbear" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
cat > /etc/port-$Login.json <<END
{
      "openssh": "22",
      "dropbear": "${drop}",
      "stunnel": "${ssl}",
      "wstls": "${wstls}",
      "wsdrop": "${wsdrop}",
      "wsssh": "${wsssh}",
      "wsovpn": "${wsovpn}",
      "squid": "${sqd}"
 }
END
clear
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e ""
echo -e "Terima Kasih Telah Menggunakan Layanan Kami"
echo -e "Berikut Detail Akun SSH Dan OpenVPN"
echo -e "==============================="
echo -e "Username       : $Login "
echo -e "Password       : $Pass"
echo -e "Domain         : $domain"
echo -e "==============================="
echo -e "Host           : $MYIP"
echo -e "OpenSSH        : 22"
echo -e "Dropbear       :$drop"
echo -e "Stunnel        :$ssl"
echo -e "WS SSL         :$wstls"
echo -e "WS Non TLS     :$wsdrop"
echo -e "WS OVPN        :$wsovpn"
echo -e "Port Squid     :$sqd"
echo -e "OpenVPN        : TCP 1194 $ovpn http://$MYIP:81/tcp.ovpn"
echo -e "OpenVPN        : UDP 2200 $ovpn2 http://$MYIP:81/udp.ovpn"
echo -e "OpenVPN        : SSL 442 http://$MYIP:81/ssl.ovpn"
echo -e "badvpn         : 7100-7300"
echo -e "==============================="
echo -e "Payload Websocket HHTP :"
echo -e "GET / HTTP/1.1[crlf]Host: $domain[crlf]Connection: Keep-Alive[crlf]User-Agent: [ua][crlf]Upgrade: websocket[crlf][crlf]"
echo -e "===============================" |
echo -e "Payload Websocket SSL :"
echo -e "GET wss://SNI_bughost/ HTTP/1.1[crlf]Host: $domain[crlf]Connection: Upgrade[crlf]User-Agent: [ua][crlf]Upgrade: websocket[crlf][crlf]"
echo -e "==============================="
echo -e "Aktif Selama   : $masaaktif Hari"
echo -e "Berakhir Pada  : $exp"
echo -e "Mod By Jrtunnel"
