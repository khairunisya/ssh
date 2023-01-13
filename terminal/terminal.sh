#!/bin/bash
# ==========================================
# Color

function import_string() {
    export SCRIPT_URL='https://raw.githubusercontent.com/khairunisya/ssh/main/terminal/'
    export RED="\033[0;31m"
    export GREEN="\033[0;32m"
    export YELLOW="\033[0;33m"
    export BLUE="\033[0;34m"
    export PURPLE="\033[0;35m"
    export CYAN="\033[0;36m"
    export LIGHT="\033[0;37m"
    export NC="\033[0m"
    export ERROR="[${RED} ERROR ${NC}]"
    export INFO="[${YELLOW} INFO ${NC}]"
    export FAIL="[${RED} FAIL ${NC}]"
    export OKEY="[${GREEN} OKEY ${NC}]"
    export PENDING="[${YELLOW} PENDING ${NC}]"
    export SEND="[${YELLOW} SEND ${NC}]"
    export RECEIVE="[${YELLOW} RECEIVE ${NC}]"
    export RED_BG="\e[41m"
    export BOLD="\e[1m"
    export WARNING="${RED}\e[5m"
    export UNDERLINE="\e[4m"
}

echo -e "${NC}${GREEN}Waiting Memuat File Tambahan...${NC}"
sleep 5

echo -e "${NC}${RED}Menghapus File${NC}"
sleep 4
## hapus
rm -rf /var/www/html/info.php
rm -rf /var/www/html/vn
rm -rf /var/www/html/vpnmon
rm -rf /root/sshovpn.sh
sleep 2
echo -e "${NC}${GREEN}Menghapus File Success${NC}"
sleep 5
echo -e "${NC}${PENDING}Import File Tunggu...${NC}"
# // Download menu
cd 
  
wget -O /usr/bin/sshws "https://raw.githubusercontent.com/khairunisya/ssh/main/terminal/sshws"
wget -O /etc/stunnel/stunnel.pem "https://raw.githubusercontent.com/khairunisya/ssh/main/terminal/stunnel.pem"
wget -O /var/www/html/index.html "https://raw.githubusercontent.com/khairunisya/ssh/main/terminal/index.html"
wget -O /etc/squid/squid.conf "https://raw.githubusercontent.com/khairunisya/ssh/main/terminal/squid.conf"
wget -O /home/banner "https://raw.githubusercontent.com/khairunisya/ssh/main/terminal/banner"

#cd /root/
#dpkg --configure -a
#apt install nginx -y
#wget -O /etc/nginx/nginx.conf "https://raw.githubusercontent.com/khairunisya/global/main/nginx.conf"
#wget -O /etc/nginx/conf.d/xray.conf "https://raw.githubusercontent.com/khairunisya/ssh/main/terminal/xray.conf"
#rm -rf /etc/nginx/conf.d/default.conf
#systemctl enable nginx
#mkdir -p /home/vps/public_html
#chown -R www-data:www-data /home/vps/public_html
#chmod -R g+rw /home/vps/public_html
#echo "<pre>Setup BY Jrtunnel</pre>" >/home/vps/public_html/index.html
#systemctl start nginx
#cd /var/www/html/
#cp openvpn-tcp.ovpn /home/vps/public_html/tcp.ovpn
#cp openvpn-udp.ovpn /home/vps/public_html/udp.ovpn
cd /root
mv openvpn-tcp.ovpn /var/www/html/tcp.ovpn
mv openvpn-udp.ovpn /var/www/html/udp.ovpn

echo -e "${NC}${GREEN}Success${NC}"
sleep 5

cd
systemctl enable stunnel4
systemctl start stunnel4
systemctl restart stunnel4
cd /root
rm -rf terminal.sh
reboot

rm terminal.sh

clear
