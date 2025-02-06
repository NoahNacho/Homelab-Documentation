#!/bin/bash
steamcmd +force_install_dir $HOME/Valheim +login anonymous +app_uninstall 896660
sudo rm -rf /etc/ufw/applications.d/Valheim $HOME/Valheim/ /usr/lib/systemd/system/Valheim.service