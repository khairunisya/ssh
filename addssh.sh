#!/bin/bash


MYIP=$(wget -qO- ipinfo.io/ip);

clear



read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (hari): " masaaktif



wstls="$(cat ~/log-install.txt | grep -w "WebSocket TLS" | cut -d: -f2)"
wsdrop="$(cat ~/log-install.txt | grep -w "WebSocket Dropbear" | cut -d: -f2)"
wsssh="$(cat ~/log-install.txt | grep -w "WebSocket OpenSSH" | cut -d: -f2)"
wsovpn="$(cat ~/log-install.txt | grep -w "WebSocket OpenVPN" | cut -d: -f2)"
ssl="$(cat ~/log-install.txt | grep -w "Stunnel4" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
drop="$(cat ~/log-install.txt | grep -w " Dropbear" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
dnsdomain=$(cat /home/nsdomain)
dnskey=$(cat /root/.dns/server.pub)
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
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}               • SSH PANEL MENU •              ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 $NC  Username   : $Login" 
echo -e "$COLOR1 $NC  Password   : $Pass"
echo -e "$COLOR1 $NC  Expired On : $exp" 
echo -e "$COLOR1──────────────────────────────────────────────────${NC}"
echo -e "$COLOR1 $NC  IP         : $MYIP" 
echo -e "$COLOR1 $NC  Host       : $domain" 
echo -e "$COLOR1 $NC  OpenSSH    : 22"
echo -e "$COLOR1 $NC  Dropbear   : 109, 143" 
echo -e "$COLOR1 $NC  SSH-WS     : 80, 8880" 
echo -e "$COLOR1 $NC  SSH-SSL-WS : 443" 
echo -e "$COLOR1 $NC  SSL/TLS    : 443" 
echo -e "$COLOR1 $NC  UDPGW      : 7100-7300" 
echo -e "$COLOR1 $NC  NS Slowdns : $dnsdomain"
echo -e "$COLOR1 $NC  DNS PubKey : $dnskey" 
echo -e "$COLOR1 $NC  CustomSlow : 1.1.1.1:$dnskey@$Login:$Pass@$dnsdomain"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "  GET wss://bug.com/ HTTP/1.1[crlf]Host: $domen [crlf]Upgrade: websocket[crlf][crlf]"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e "$COLOR1┌────────────────────── BY ───────────────────────┐${NC}"
echo -e "$COLOR1│${NC}              • WWW.JRTUNNEL.COM •            $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}" 
echo -e ""
