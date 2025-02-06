#!/bin/sh
#install dir $home/Valheim
#valheim automated install script
ServerName=$(cat config.txt | grep ServerName | awk '{print $3}')
WorldName=$(cat config.txt | grep WorldName | awk '{print $3}')
Password=$(cat config.txt | grep Password | awk '{print $3}')
home=$HOME  
echo "Downloading Server to $home/Valheim/"
steamcmd +@sSteamCmdForcePlatformType linux +force_install_dir $HOME/Valheim +login anonymous +app_update 896660 validate +quit > /dev/null #steamcmd install valheim for linux forcing install dir and validates install
cp $home/Valheim/start_server.sh $home/Valheim/Valheim.sh 


echo "[Unit]
Description=Valheim server
After=network.target

[Service]
Restart=on-failure
RestartSec=1s
PrivateTmp=true
Type=simple
User=ubuntu
WorkingDirectory=/home/User/Valheim
ExecStart=/home/User/Valheim/Valheim.sh

[Install]
WantedBy=multi-user.target
EOL" > $home/Valheim/Valheim.service

sudo echo "[Valheim]
title=Valheim ports
description=Ports to open for Valheim dedicated game server
ports=2456,2457/tcp|2456,2457/udp" > /etc/ufw/applications.d/Valheim

sudo sed -i "s,/home/User,$home,g" $home/Valheim.service #replace paths 
sed -i "s,server_name,$ServerName,g; s,world_name,$WorldName,g; s,game-password,$Password,g" $home/Valheim/Valheim.sh  # this needs testing

sudo systemctl daemon-reload 
sudo systemctl start Valheim 
sudo ufw allow Valheim