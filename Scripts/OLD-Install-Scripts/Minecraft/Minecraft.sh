#!/bin/bash

mkdir $HOME/Minecraft
wget https://api.papermc.io/v2/projects/paper/versions/1.19.2/builds/138/downloads/paper-1.19.2-138.jar -O $HOME/Minecraft
sudo apt install openjdk-17-jre-headless

touch eula.txt
echo "eula=true" > eula.txt



