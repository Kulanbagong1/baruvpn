#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"

clear
echo -e "$COLOR1┌────────────────────────────────────────────────────────────┐${NC}"
echo -e "                     << XRAY VLESS MENU >>                    \E[0m"
echo -e "$COLOR1└────────────────────────────────────────────────────────────┘${NC}"
echo -e ""
echo -e "$COLOR1┌────────────────────────────────────────────────────────────┐${NC}"
echo -e " [\e[36m•1\e[0m] Create Account XRAY Vless Websocket "
echo -e " [\e[36m•2\e[0m] Trial Account XRAY Vless "
echo -e " [\e[36m•3\e[0m] Extending Account XRAY Vless Active Life "
echo -e " [\e[36m•4\e[0m] Delete Account XRAY Vless Websocket "
echo -e " [\e[36m•5\e[0m] Check User Login XRAY Vless "
echo -e "$COLOR1└────────────────────────────────────────────────────────────┘${NC}"
echo -e ""
echo -e "$COLOR1┌────────────────────────────────────────────────────────────┐${NC}"
echo -e " [\e[31m•0\e[0m] \e[31mBACK TO MENU\033[0m"
echo -e ""
echo -e   "Press x or [ Ctrl+C ] • To-Exit"
echo ""
echo -e "$COLOR1└────────────────────────────────────────────────────────────┘${NC}"
echo -e ""
read -p " Select menu :  "  opt
echo -e ""
case $opt in
1) clear ; add-vless ; exit ;;
2) clear ; trialvless ; exit ;;
3) clear ; renew-vless ; exit ;;
4) clear ; del-vless ; exit ;;
5) clear ; cek-vless ; exit ;;
0) clear ; menu ; exit ;;
x) exit ;;
*) echo "Anda salah tekan " ; sleep 1 ; menu-ssh ;;
esac
