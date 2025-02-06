#!/bin/sh
steamcmd +@sSteamCmdForcePlatformType linux +force_install_dir $HOME/Unturned +login anonymous +app_update 1110390 validate +quit #install game server files from steam
mv $HOME/Unturned/Extras/Rocket.Unturned $HOME/Unturned/Modules/ #Move Rocket from Extras to Modules (enables autosave)
mkdir $HOME/.config/systemd/ $HOME/.config/systemd/user



echo "[Unit]
Description=Unturned Server
After=network.target

[Service]
Restart=on-failure
RestartSec=1s
PrivateTmp=true
Type=simple
User=ubuntu
WorkingDirectory=/home/ubuntu/Steam/steamapps/common/U3DS
ExecStart=/home/ubuntu/Steam/steamapps/common/U3DS/ServerHelper.sh

[Install]
WantedBy=multi-user.target
EOL" > $HOME/.config/systemd/user/Unturned.service #make the service file for systemd

sudo echo"[Unturned]
title=Unturned profile
description=Ports to open for unturned dedicated game server
ports=27015,27016/tcp|27015,27016/udp" > /etc/ufw/applications.d/Unturned #make profile for ufw
sudo ufw allow Unturned

mkdir $HOME/Unturned/Servers/Myserver
echo "
Map PEI
Name servername
Password pass
Perspective Both
Cheats False" >  $HOME/Unturned/Servers/Myserver/Commands.dat

systemctl daemon-reload
systemctl start Unturned

