#!/bin/bash
# Menu For Script
# Edition : Stable Edition V1.0
# Auther  : Fahmi Store
# (C) Copyright 2021-2022 By Fahmi Hdyt
# =========================================

# // Exporting Language to UTF-8
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'
export LC_CTYPE='en_US.utf8'

# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'

# // Export Banner Status Information
export EROR="[${RED} EROR ${NC}]"
export INFO="[${YELLOW} INFO ${NC}]"
export OKEY="[${GREEN} OKEY ${NC}]"
export PENDING="[${YELLOW} PENDING ${NC}]"
export SEND="[${YELLOW} SEND ${NC}]"
export RECEIVE="[${YELLOW} RECEIVE ${NC}]"

# // Export Align
export BOLD="\e[1m"
export WARNING="${RED}\e[5m"
export UNDERLINE="\e[4m"

# // Exporting URL Host
export Server_URL="autosc.me/aio"
export Server_Port="443"
export Server_IP="underfined"
export Script_Mode="Stable"
export Auther="FsidVPN"

# // Root Checking
if [ "${EUID}" -ne 0 ]; then
		echo -e "${EROR} Please Run This Script As Root User !"
		exit 1
fi

# // Exporting IP Address
export IP=$( curl -s https://ipinfo.io/ip/ )

freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
	tram=$( free -m | awk 'NR==2 {print $2}' )
	swap=$( free -m | awk 'NR==4 {print $2}' )
	ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
#CITY=$(curl -s ipinfo.io/city )

# // Exporting RED BG
export RED_BG='\e[44m'
# ==========================================
MYIP=$(curl -sS ipv4.icanhazip.com)
#########################
IZIN=$(curl -sS https://raw.githubusercontent.com/Fahmiiiiiiii/access/main/ip | awk '{print $4}' | grep $MYIP)
if [ $MYIP = $IZIN ]; then
echo -e "\e[32mPermission Accepted...\e[0m"
else
echo -e "\e[31mPermission Denied!\e[0m";
exit 0
fi
#EXPIRED
expired=$(curl -sS https://raw.githubusercontent.com/Fahmiiiiiiii/access/main/ip | grep $MYIP | awk '{print $3}')
echo $expired > /root/expired.txt
today=$(date -d +1day +%Y-%m-%d)
while read expired
do
	exp=$(echo $expired | curl -sS https://raw.githubusercontent.com/Fahmiiiiiiii/access/main/ip | grep $MYIP | awk '{print $3}')
	if [[ $exp < $today ]]; then
		geo="\033[1;31mExpired\033[0m"
        else
        geo=$(curl -sS https://raw.githubusercontent.com/Fahmiiiiiiii/access/main/ip | grep $MYIP | awk '{print $3}')
	fi
done < /root/expired.txt
rm /root/expired.txt
Name=$(curl -sS https://raw.githubusercontent.com/Fahmiiiiiiii/access/main/ip | grep $MYIP | awk '{print $2}')
clear
# // SSH Websocket Proxy
ssh_ws=$( systemctl status ws-stunnel | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $ssh_ws == "running" ]]; then
    status_ws="${GREEN}ON${NC}"
else
    status_ws="${RED}OFF${NC}"
fi

# // nginx
nginx=$( systemctl status nginx | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $nginx == "running" ]]; then
    status_nginx="${GREEN}ON${NC}"
else
    status_nginx="${RED}OFF${NC}"
fi

# // SSH Websocket Proxy
xray=$( systemctl status xray | grep Active | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' )
if [[ $xray == "running" ]]; then
    status_xray="${GREEN}ON${NC}"
else
    status_xray="${RED}OFF${NC}"
fi

clear
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[0;41;36m                 VPS / System Information                 \E[0m${NC}"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
echo -e "Sever Uptime        = $( uptime -p  | cut -d " " -f 2-10000 ) "
#echo -e "ISP                 = $ISP "
#echo -e "City                = $CITY "
echo -e "Operating System    = $( cat /etc/os-release | grep -w PRETTY_NAME | sed 's/PRETTY_NAME//g' | sed 's/=//g' | sed 's/"//g' ) ( $( uname -m) )"
echo -e "Total Amount RAM    = $tram MB"
echo -e "Current Domain      = $( cat /etc/xray/domain )"
echo -e "Server IP           = ${IP}"
echo -e "Current Time        = $( date -d "0 days" +"%d-%m-%Y | %X" )"

echo -e ""
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " [ SSH WebSocket${NC} : ${status_ws} ]   [ XRAY${NC} : ${status_xray} ]   [ NGINX${NC} : ${status_nginx} ]"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
echo -e "[${GREEN}01${NC}]${RED} •${NC} Add User SSH$NC         [${GREEN}11${NC}]${RED} • ${NC}Renew Xray"
echo -e "[${GREEN}02${NC}]${RED} •${NC} Member SSH $NC          [${GREEN}12${NC}]${RED} • ${NC}Cek User Xray $NC"
echo -e "[${GREEN}03${NC}]${RED} •${NC} Cek User SSH$NC         [${GREEN}13${NC}]${RED} • ${NC}Del User Xray $NC"
echo -e "[${GREEN}04${NC}]${RED} •${NC} Del User SSH$NC         [${GREEN}14${NC}]${RED} • ${NC}Auto Backup $NC"
echo -e "[${GREEN}05${NC}]${RED} •${NC} Renew SSH $NC           [${GREEN}15${NC}]${RED} • ${NC}Add Domain $NC"
echo -e "[${GREEN}06${NC}]${RED} •${NC} Speedtest Server $NC    [${GREEN}16${NC}]${RED} • ${NC}Cert V2ray $NC"
echo -e "[${GREEN}07${NC}]${RED} •${NC} Add Vmess Account $NC   [${GREEN}17${NC}]${RED} • ${NC}Backup Data VPS $NC"
echo -e "[${GREEN}08${NC}]${RED} •${NC} Add Vless Account$NC    [${GREEN}18${NC}]${RED} • ${NC}Restore Data VPS $NC"
echo -e "[${GREEN}09${NC}]${RED} •${NC} Add Trojan Account$NC   [${GREEN}19${NC}]${RED} • ${NC}Running Service$NC"
echo -e "[${GREEN}10${NC}]${RED} •${NC} Cek Bandwidth $NC       [${GREEN}20${NC}]${RED} • ${NC}Reboot Server $NC"
echo -e " ${RED}"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[0;41;36m                      FAHMI STORE                         \E[0m${NC}"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "${GREEN}CLIENT NAME${NC}    ${RED}•$NC $Name"
echo -e "${GREEN}SCRIPT EXPIRED${NC} ${RED}•$NC $exp"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""

read -p "Input Your Choose ( 1-20 ) : " choosemu


case $choosemu in
    1) # >> CREATE SSH
        usernew
    ;;
    2) # >> ON OFF SSH WS
        member
    ;;

    # R
    3) # >> CEK SSH
        cek
    ;;
    4) # >> HAPUS AKUN
        hapus
    ;;
    5) # >> ALL Service
        renew
    ;;
    6) # >> Speedtest
        speedtest
    ;;
    7) # >> Ram Usage
        add-ws
    ;;
    8) # >> Bandiwdth usage
        clear
        add-vless
    ;;
    9) # >> Change Timezone
        add-tr
        ;;
    10) # >> Change Timezone
        bw
    ;;
    11) # // Change License
        renew-xray
    ;;
    12) # >> Change domain
        cek-user
    ;;
    13) # // Renew SSL Cert
        del-user
    ;;
    14) # // Add mail
        autobackup
    ;;
    15) # // Backup
        add-host
    ;;
    16) # // Restore
        certv2ray
    ;;
    17) # // Create SSL For Stunnel
        backup
    ;;
    18) # // OpenVPN
        restore
    ;;
    19) # // Service VPS
        running
    ;;
    20) # >> Change Timezone
        reboot
        ;;
    *) # >> Wrong Select
        echo -e "${EROR} SALAH SAYANG !!!"
        sleep 1
        menu
    ;;
esac
