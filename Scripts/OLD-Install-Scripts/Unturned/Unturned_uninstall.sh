#!/bin/bash
steamcmd +force_install_dir $HOME/Unturned +login anonymous +app_uninstall 1110390
sudo rm -rf /etc/ufw/applications.d/Unturned $HOME/Unturned /usr/lib/systemd/system/Unturned.service