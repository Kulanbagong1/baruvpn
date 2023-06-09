#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################




cekray=`cat /root/log-install.txt | grep -ow "XRAY" | sort | uniq`
if [ "$cekray" = "XRAY" ]; then
domen=`cat /etc/xray/domain`
else
domen=`cat /etc/v2ray/domain`
fi
portsshws=`cat ~/log-install.txt | grep -w "SSH Websocket" | cut -d: -f2 | awk '{print $1}'`
wsssl=`cat /root/log-install.txt | grep -w "SSH SSL Websocket" | cut -d: -f2 | awk '{print $1}'`

clear
IP=$(curl -sS ifconfig.me);
ossl=`cat /root/log-install.txt | grep -w "OpenVPN" | cut -f2 -d: | awk '{print $6}'`
opensh=`cat /root/log-install.txt | grep -w "OpenSSH" | cut -f2 -d: | awk '{print $1}'`
db=`cat /root/log-install.txt | grep -w "Dropbear" | cut -f2 -d: | awk '{print $1,$2}'`
ssl="$(cat ~/log-install.txt | grep -w "Stunnel4" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"

OhpSSH=`cat /root/log-install.txt | grep -w "OHP SSH" | cut -d: -f2 | awk '{print $1}'`
OhpDB=`cat /root/log-install.txt | grep -w "OHP DBear" | cut -d: -f2 | awk '{print $1}'`
OhpOVPN=`cat /root/log-install.txt | grep -w "OHP OpenVPN" | cut -d: -f2 | awk '{print $1}'`

Login=trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
hari="1"
Pass=1
echo Ping Host
echo Create Akun: $Login
sleep 0.5
echo Setting Password: $Pass
sleep 0.5
clear
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
PID=`ps -ef |grep -v grep | grep sshws |awk '{print $2}'`

if [[ ! -z "${PID}" ]]; then
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}               • SSH PANEL MENU •              ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "Username    : $Login" | tee -a /etc/log-create-user.log
echo -e "Password    : $Pass" | tee -a /etc/log-create-user.log
echo -e "Expired On  : $exp" | tee -a /etc/log-create-user.log
echo -e "$COLOR1─────────────────────────────────────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "IP          : $IP" | tee -a /etc/log-create-user.log
echo -e "Host        : $domen" | tee -a /etc/log-create-user.log
echo -e "$COLOR1─────────────────────────────────────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "NsDomain    : $dnsdomain" | tee -a /etc/log-create-user.log
echo -e "PubKey      : $dnskey" | tee -a /etc/log-create-user.log
echo -e "$COLOR1─────────────────────────────────────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "SlowDNS     : 443,53,22" | tee -a /etc/log-create-user.log
echo -e "OpenSSH     : $opensh" | tee -a /etc/log-create-user.log
echo -e "Dropbear    : $db" | tee -a /etc/log-create-user.log
echo -e "SSH-WS      : $portsshws" | tee -a /etc/log-create-user.log
echo -e "SSH-SSL-WS  : $wsssl" | tee -a /etc/log-create-user.log
echo -e "SSL/TLS     : $ssl" | tee -a /etc/log-create-user.log
echo -e "UDPGW       : 7100-7300" | tee -a /etc/log-create-user.log
echo -e "OpenVPN-TCP : $ovpn" | tee -a /etc/log-create-user.log
echo -e "OpenVPN-UDP : $ovpn2" | tee -a /etc/log-create-user.log
echo -e "OpenVPN-SSL : 443,990" | tee -a /etc/log-create-user.log
echo -e "$COLOR1─────────────────────────────────────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "OVPN TCP    : http://$IP:81/tcp.ovpn" | tee -a /etc/log-create-user.log
echo -e "OVPN UDP    : http://$IP:81/udp.ovpn" | tee -a /etc/log-create-user.log
echo -e "OVPN SSL    : http://$IP:81/ssl.ovpn" | tee -a /etc/log-create-user.log
echo -e "$COLOR1─────────────────────────────────────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1─────────────────────────────────────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "\E[0;41;36m            SET SLOWDNS            \E[0m" | tee -a /etc/log-create-user.log
echo -e "$COLOR1─────────────────────────────────────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "1.1.1.1:${dnskey}@${Login}:${Pass}@${dnsdomain}" | tee -a /etc/log-create-user.log
echo -e "8.8.8.8:${dnskey}@${Login}:${Pass}@${dnsdomain}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1─────────────────────────────────────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "
GET / [protocol][crlf]Host: [host][crlf]Connection: Keep-Alive[crlf]Connection: Upgrade[crlf]Upgrade: websocket[crlf][crlf]
" | tee -a /etc/log-create-user.log
echo -e "$COLOR1─────────────────────────────────────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "
GET wss://bug.com/ [protocol][crlf]Host: [host][crlf]Connection: Keep-Alive[crlf]Connection: Upgrade[crlf]Upgrade: websocket[crlf][crlf]
" | tee -a /etc/log-create-user.log
echo -e "$COLOR1─────────────────────────────────────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "
GET / [protocol][crlf]Host: $domen[crlf]Connection: Keep-Alive[crlf]Connection: Upgrade[crlf]Upgrade: websocket[crlf][crlf]
" | tee -a /etc/log-create-user.log
echo -e "$COLOR1─────────────────────────────────────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "
GET wss://bug.com/ [protocol][crlf]Host: $domen[crlf]Connection: Keep-Alive[crlf]Connection: Upgrade[crlf]Upgrade: websocket[crlf][crlf]
" | tee -a /etc/log-create-user.log
echo -e "$COLOR1─────────────────────────────────────────────────${NC}" | tee -a /etc/log-create-user.log
else
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1│${NC} ${COLBG1}               • SSH PANEL MENU •              ${NC} $COLOR1│$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "Username    : $Login" | tee -a /etc/log-create-user.log
echo -e "Password    : $Pass" | tee -a /etc/log-create-user.log
echo -e "Expired On  : $exp" | tee -a /etc/log-create-user.log
echo -e "$COLOR1─────────────────────────────────────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "IP          : $IP" | tee -a /etc/log-create-user.log
echo -e "Host        : $domen" | tee -a /etc/log-create-user.log
echo -e "$COLOR1─────────────────────────────────────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "NsDomain    : $dnsdomain" | tee -a /etc/log-create-user.log
echo -e "PubKey      : $dnskey" | tee -a /etc/log-create-user.log
echo -e "$COLOR1─────────────────────────────────────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "SlowDNS     : 443,53,22" | tee -a /etc/log-create-user.log
echo -e "OpenSSH     : $opensh" | tee -a /etc/log-create-user.log
echo -e "Dropbear    : $db" | tee -a /etc/log-create-user.log
echo -e "SSH-WS      : $portsshws" | tee -a /etc/log-create-user.log
echo -e "SSH-SSL-WS  : $wsssl" | tee -a /etc/log-create-user.log
echo -e "SSL/TLS     : $ssl" | tee -a /etc/log-create-user.log
echo -e "UDPGW       : 7100-7300" | tee -a /etc/log-create-user.log
echo -e "OpenVPN-TCP : $ovpn" | tee -a /etc/log-create-user.log
echo -e "OpenVPN-UDP : $ovpn2" | tee -a /etc/log-create-user.log
echo -e "OpenVPN-SSL : 443,990" | tee -a /etc/log-create-user.log
echo -e "$COLOR1─────────────────────────────────────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "OVPN TCP    : http://$IP:81/tcp.ovpn" | tee -a /etc/log-create-user.log
echo -e "OVPN UDP    : http://$IP:81/udp.ovpn" | tee -a /etc/log-create-user.log
echo -e "OVPN SSL    : http://$IP:81/ssl.ovpn" | tee -a /etc/log-create-user.log
echo -e "$COLOR1─────────────────────────────────────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1─────────────────────────────────────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "\E[0;41;36m            SET SLOWDNS            \E[0m" | tee -a /etc/log-create-user.log
echo -e "$COLOR1─────────────────────────────────────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "1.1.1.1:${dnskey}@${Login}:${Pass}@${dnsdomain}" | tee -a /etc/log-create-user.log
echo -e "8.8.8.8:${dnskey}@${Login}:${Pass}@${dnsdomain}" | tee -a /etc/log-create-user.log
echo -e "$COLOR1─────────────────────────────────────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "
GET / [protocol][crlf]Host: [host][crlf]Connection: Keep-Alive[crlf]Connection: Upgrade[crlf]Upgrade: websocket[crlf][crlf]
" | tee -a /etc/log-create-user.log
echo -e "$COLOR1─────────────────────────────────────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "
GET wss://bug.com/ [protocol][crlf]Host: [host][crlf]Connection: Keep-Alive[crlf]Connection: Upgrade[crlf]Upgrade: websocket[crlf][crlf]
" | tee -a /etc/log-create-user.log
echo -e "$COLOR1─────────────────────────────────────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "
GET / [protocol][crlf]Host: $domen[crlf]Connection: Keep-Alive[crlf]Connection: Upgrade[crlf]Upgrade: websocket[crlf][crlf]
" | tee -a /etc/log-create-user.log
echo -e "$COLOR1─────────────────────────────────────────────────${NC}" | tee -a /etc/log-create-user.log
echo -e "
GET wss://bug.com/ [protocol][crlf]Host: $domen[crlf]Connection: Keep-Alive[crlf]Connection: Upgrade[crlf]Upgrade: websocket[crlf][crlf]
" | tee -a /etc/log-create-user.log
echo -e "$COLOR1─────────────────────────────────────────────────${NC}" | tee -a /etc/log-create-user.log
fi
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
trial-menu
