#!/bin/bash
GREEN='\033[0;32m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m'
yl='\e[32;1m'
bl='\e[36;1m'
gl='\e[32;1m'
rd='\e[31;1m'
mg='\e[0;95m'
blu='\e[34m'
op='\e[35m'
or='\033[1;33m'
bd='\e[1m'
color1='\e[031;1m'
color2='\e[34;1m'
color3='\e[0m'
clear

echo -e ""
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
DOMAIN=$(cat /etc/xray/domain)
MYIP=$(curl -s ipinfo.io/ip )
CITY=$(curl -s ipinfo.io/city )
up=$(uptime|awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }')
tram=$( free -m | awk 'NR==2 {print $2}' )
echo -e ""
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m                     ⇱ INFORMASI VPS ⇲                        \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e " ⚡$bd ISP Name          ${color1} •${color3}$bd $ISP"
echo -e " ⚡$bd City              ${color1} •${color3}$bd Singapore"
echo -e " ⚡$bd Total RAM         ${color1} •${color3}$bd $tram MB"
echo -e " ⚡$bd IP VPS            ${color1} •${color3}$bd $MYIP"
echo -e " ⚡$bd DOMAIN VPS        ${color1} •${color3}$bd $DOMAIN"
echo -e " ⚡$bd Waktu Aktif       ${color1} •${color3}$bd $up"
echo -e " ⚡$bd Client Name       ${color1} •${color3}$bd FAHMI STORE"
echo -e " ⚡$bd Expiry script     ${color1} •${color3}$bd LIFETIME"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m                     ⇱ MENU  SSH ⇲                                 \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "
[${green}01${NC}]${color1} •${color3}$bd Add User SSH  (${color2}menu-ssh${color3})
[${green}02${NC}]${color1} •${color3}$bd SSH WS Enable (${color2}menu-sshws${color3})
[${green}03${NC}]${color1} •${color3}$bd Cek User SSH (${color2}menu-cekssh${color3})
[${green}04${NC}]${color1} •${color3}$bd Delete User SSH (${color2}menu-delssh${color3})
[${green}05${NC}]${color1} •${color3}$bd Renew SSH Account (${color2}menu-renewssh${color3})
[${green}06${NC}]${color1} •${color3}$bd Check User Login (${color2}menu-userlogin${color3})
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m                     ⇱ XRAY MENU ⇲                              \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "
[${green}07${NC}]${color1} •${color3}$bd Add Vmess Account (${color2}add-vmess${color3})
[${green}8${NC}]${color1} •${color3}$bd Add Vless Account (${color2}add-vless${color3})
[${green}9${NC}]${color1} •${color3}$bd Add Trojan Account (${color2}add-trojan${color3})
[${green}10${NC}]${color1} •${color3}$bd Add Shadowsock (${color2}add-shadowsock${color3})
[${green}11${NC}]${color1} •${color3}$bd Cek User Xray (${color2}cek-user${color3})
[${green}12${NC}]${color1} •${color3}$bd Dell User Xray (${color2}dell-user${color3})
[${green}13${NC}]${color1} •${color3}$bd Renew User Xray (${color2}cek-user${color3})
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m                     ⇱ MENU  OPTIONS ⇲                        \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "
[${green}14${NC}]${color1} •${color3}$bd Tambahkan Domain (${color2}add-host${color3})
[${green}15${NC}]${color1} •${color3}$bd Generate SSL (${color2}gen-ssl${color3})
[${green}16${NC}]${color1} •${color3}$bd Backup Account (${color2}bckup-user${color3})
[${green}17${NC}]${color1} •${color3}$bd Restore Account (${color2}restore-data${color3})
[${green}18${NC}]${color1} •${color3}$bd PANEL BOT (${color2}panel${color3})

[${green}00${NC}]${color1} •${color3}$bd UNTUK KEMBALI KE MENU \033[1;32m<\033[1;33m<\033[1;31m<\033[1;31m"
echo ""
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m                     ⇱ FAHMI STORE ⇲                       \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e  ""
 read -p "  Select menu :  " menu
echo -e   ""
case $menu in
1)
usernew
;;
2)
sshws
;;
3)
cek
;;
4)
hapus
;;
5)
renew
;;
6)
member
;;
7)
add-ws
;;
8)
add-vless
;;
9)
add-tr
;;
10)
add-ssws
;;
11)
cek-user
;;
12)
del-user
;;
13)
renew-xray
;;
14)
add-host
;;
15)
crtv2ray
;;
16)
bckp
;;
17)
restore
;;
18)
xolpanel
0 | 00)
menu
;;
*)
exit
;;
esac
