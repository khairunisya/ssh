#!/bin/bash
clear
m="\033[0;1;36m"
y="\033[0;1;37m"
yy="\033[0;1;32m"
yl="\033[0;1;33m"
wh="\033[0m"

echo -e "$y-------------------------------------------------------------$wh"
echo -e "$y             Telegram : jrtunnelssh $wh"
echo -e "$y           Premium Auto Script By Jrtunnel $wh"
echo -e "$y-------------------------------------------------------------$wh"
echo ""
echo -e "$y SSH & OpenVPN $wh"
echo -e "$y-------------------------------------------------------------$wh"
echo -e "$yy 1$y.Create SSH & OpenVPN Account"
echo -e "$yy 2$y.Check User Login SSH & OpenVPN"
echo -e "$yy 3$y.Daftar Member SSH & OpenVPN"
echo -e "$yy 4$y.Delete SSH & OpenVpn Account"
echo -e "$yy 5$y.Delete User Expired SSH & OpenVPN"
echo -e ""
echo -e "$y L2TP $wh"
echo -e "$y-------------------------------------------------------------$wh"
echo -e "$yy 6$y.Create Account L2TP"
echo -e "$yy 7$y.Delete Account L2TP"
echo -e ""
echo -e "$y WIREGUARD $wh"
echo -e "$y-------------------------------------------------------------$wh"
echo -e "$yy 8$y.Create Account Wireguard"
echo -e "$yy 9$y.Delete Account Wireguard"
echo -e ""
echo -e "$y-------------------------------------------------------------$wh"
echo -e ""
read -p "Select From Options [ 1 - 11 ] : " menu
echo -e ""
case $menu in
1)
addssh
;;
2)
cekssh
;;
3)
member
;;
4)
delssh
;;
5)
delexp
;;
6)
addl2tp
;;
7)
dell2tp
;;
8)
addwg
;;
9)
delwg
;;
*)
clear
menu
;;
esac
