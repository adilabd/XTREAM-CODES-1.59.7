#!/bin/bash
###############################
#         Here You can Edit Your Data                  #
###############################
LOG_LOCATION=/tmp
##########################################
##############END EDIT DATA###############
##########################################
txtrst=$(tput sgr0) # Text reset
txtred=$(tput setab 1) # Red Background
textpurple=$(tput setab 5) #Purple Background
txtblue=$(tput setab 4) #Blue Background
txtgreen=$(tput bold ; tput setaf 2) # GreenBold
txtyellow=$(tput bold ; tput setaf 3) # YellowBold
arch=$(getconf LONG_BIT)
iplocal=$(ifconfig  | grep 'inet addr' | awk '{print $2}' | cut -d ':' -f2 |grep -v 127)
echo "${txtblue}Preparing System, please wait ........................ ${txtrst}"
echo "${txtgreen}....................................................................${txtrst}"
apt-get update -y
apt-get install sudo -y
sudo apt-get install dialog pv cron nano aptitude mlocate -y
apt-get update -y
sleep 1
apt-get install lsb-release nscd curl php5 php5-mysql php5-cli php5-curl unzip nano -y 
sleep 1
apt-get install php5-mcrypt -y
sleep 1
php5enmod mcrypt
sleep 1
cd /var/www/html
wget irdetto.com/160.zip #>/dev/null 2>&1
sleep 1
unzip -o 160.zip >/dev/null 2>&1
sleep 1
wget irdetto.com/whatismyip.php #>/dev/null 2>&1
sleep 1
cd /tmp
sleep 1
wget irdetto.com/170/iptv_panel_pro.zip.ZIP #>/dev/null 2>&1
sleep 1
cd /var/www/html/downloads/
sleep 1
wget irdetto.com/downloads/IPTV_PLATFORM.zip #>/dev/null 2>&1
sleep 1
cd /root
sleep 1
wget irdetto.com/170/install_iptv_pro.zip #>/dev/null 2>&1
sleep 1
unzip -o install_iptv_pro.zip >/dev/null 2>&1
sleep 1
ip tuntap add tun0 mode tun
sleep 1
ip addr add 149.202.206.51 dev tun0
sleep 1
ip addr add 185.73.239.7 dev tun0
sleep 1
ip addr add 62.210.244.122 dev tun0
sleep 1
ip addr add 123.103.255.87 dev tun0
sleep 1
ip addr add 104.27.137.168 dev tun0
sleep 1
service apache2 restart >/dev/null 2>&1
php install_iptv_pro.php
sleep 1
chown -R xtreamcodes:xtreamcodes /sys/
echo 'ip tuntap add tun0 mode tun' >> /etc/init.d/xtreamcodes_pro_panel
echo 'ip addr add 149.202.206.51 dev tun0' >> /etc/init.d/xtreamcodes_pro_panel
echo 'ip addr add 185.73.239.7 dev tun0' >> /etc/init.d/xtreamcodes_pro_panel
echo 'ip addr add 62.210.244.122 dev tun0' >> /etc/init.d/xtreamcodes_pro_panel
echo 'ip addr add 123.103.255.87 dev tun0' >> /etc/init.d/xtreamcodes_pro_panel
echo 'ip addr add 104.27.137.168 dev tun0' >> /etc/init.d/xtreamcodes_pro_panel
echo 'chown -R xtreamcodes:xtreamcodes /sys/' >> /etc/init.d/xtreamcodes_pro_panel