#!/bin/bash
#basic backup script will make nice later

#Prefix allows you to put all game servers in one dir and back them all up at once
Prefix=""
Names=("Project-Zomboid" "Minecraft-Modded" "Minecraft-Vanilla" "Satisfactory" "Terraria")
Dirs=("$Prefix/PZ/data/Saves/Multiplayer/" "$Prefix" "$Prefix" "$Prefix/Satisfactory/config/" "$Prefix/Terraria/")
Dirs2=("./servertest/" "./Minecraft-Modded/" "./Minecraft-Vanilla/" "./saved/" "./world/")
Date=$(date +'%H:%M:%S')

Time=$(date +'%H:%M:%S')
echo "$Time - Starting script." >> Logs/$Date.log
for i in ${!Dirs[@]}; do
  tar -c --use-compress-program="pigz -p 8" -f ${Names[i]}/$Date.tar.gz -C ${Dirs[i]} ${Dirs2[i]} >> Logs/$Date.log
  Time=$(date +'%H:%M:%S')
  echo "$Time - Compressed ${Names[i]} to ./Backups/${Names[i]} as $Date.tar.gz" >> Logs/$Date.log
done

#remove tar files that are 30 days old
Time=$(date +'%H:%M:%S')
echo "$Time - Old Backups Getting Removed:" >> Logs/$Date.log
find /home/noah/Backups/ -mtime +0 -type f -name \*.tar.gz >> Logs/$Date.log
find /home/noah/Backups/ -mtime +0 -type f -name \*.tar.gz -delete
