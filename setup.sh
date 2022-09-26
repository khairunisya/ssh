#!/bin/bash

sysctl -w net.ipv6.conf.all.disable_ipv6=1

sysctl -w net.ipv6.conf.default.disable_ipv6=1

apt update

# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
IZIN=$(wget -qO- ipinfo.io/ip);

rm -f setup.sh
clear
if [ -f "/home/domain" ]; then
echo "Script Already Installed"
exit 0
fi

apt install -y bzip2 gzip coreutils screen curl
apt install python -y
mkdir /var/lib/premium-script;

echo "IP=" >> /var/lib/premium-script/ipvps.conf

wget https://raw.githubusercontent.com/khairunisya/ssh/main/cfo.sh && chmod +x cfo.sh && ./cfo.sh

wget https://raw.githubusercontent.com/khairunisya/ssh/main/ssh-vpn.sh && chmod +x ssh-vpn.sh && ./ssh-vpn.sh

wget https://raw.githubusercontent.com/khairunisya/ssh/main/websock.sh && chmod +x websock.sh && ./websock.sh

rm -f cfo.sh
rm -f ssh-vpn.sh
rm -f websock.sh

cat > /usr/bin/bersih << END
#!/bin/bash
echo 1 > /proc/sys/vm/drop_caches
echo 2 > /proc/sys/vm/drop_caches
echo 3 > /proc/sys/vm/drop_caches
swapoff -a
swapon -a
ban
clear-log
END
chmod +x /usr/bin/bersih

cat <<EOF> /etc/systemd/system/autosett.service

[Unit]

Description=autosetting

Documentation=https://www.jrtunnel.com

[Service]

Type=oneshot

ExecStart=/bin/bash /etc/set.sh

RemainAfterExit=yes

[Install]

WantedBy=multi-user.target

EOF

systemctl daemon-reload

systemctl enable autosett

wget -O /etc/set.sh "https://raw.githubusercontent.com/Afdhan/sc/main/set.sh"

chmod +x /etc/set.sh

echo "1.1.1" > /home/ver

wget -O /usr/bin/addssh https://raw.githubusercontent.com/khairunisya/ssh/main/addssh.sh && chmod +x /usr/bin/addssh

clear

figlet -f slant Jrtunnel - Fastnet | lolcat

echo " "

echo " "

echo "=================================-[ AUTOSCRIPT PREMIUM ]-===========================" | tee -a log-install.txt

echo "" | tee -a log-install.txt

echo "   >>> Service Port" | tee -a log-install.txt

echo "   - OpenSSH                 : 22"  | tee -a log-install.txt

echo "   - OpenVPN                 : TCP 1194, UDP 2200, SSL 442"  | tee -a log-install.txt

echo "   - Stunnel4                : 443, 171"  | tee -a log-install.txt

echo "   - Dropbear                : 109, 143"  | tee -a log-install.txt

echo "   - WebSocket Dropbear      : 8880, 80"  | tee -a log-install.txt

echo "   - WebSocket OpenVPN       : 2082"  | tee -a log-install.txt

echo "   - WebSocket TLS           : 443"  | tee -a log-install.txt

echo "   - SSLH Multiplexer        : 443"  | tee -a log-install.txt

echo "   - Squid Proxy             : 3128, 8080 (limit to IP SSH)"  | tee -a log-install.txt

echo "   - Badvpn                  : 7100, 7200, 7300"  | tee -a log-install.txt

echo "   - Nginx                   : 81"  | tee -a log-install.txt

echo "   - Wireguard               : 7070"  | tee -a log-install.txt

echo ""  | tee -a log-install.txt

echo "   >>> Server Information & Other Features"  | tee -a log-install.txt

echo "   - Timezone                : Asia/Jakarta (GMT +7)"  | tee -a log-install.txt

echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt

echo "   - Dflate                  : [ON]"  | tee -a log-install.txt

echo "   - IPtables                : [ON]"  | tee -a log-install.txt

echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt

echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt

echo "   - Autoreboot On 00.00-12.00 GMT +7" | tee -a log-install.txt

echo "   - Autobackup Data" | tee -a log-install.txt

echo "   - Restore Data" | tee -a log-install.txt

echo "   - Auto Delete Expired Account" | tee -a log-install.txt

echo "   - Full Orders For Various Services" | tee -a log-install.txt

echo "   - White Label" | tee -a log-install.txt

echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt

echo ""  | tee -a log-install.txt

echo "=================================-[ AUTOSCRIPT PREMIUM ]-===========================" | tee -a log-install.txt

echo "- Mod By Jrtunnel" | tee -a log-install.txt

echo ""

sleep 1

  echo -e "Setup Install Sukses!" | lolcat

rm -f setup.sh
sleep 5
reboot
