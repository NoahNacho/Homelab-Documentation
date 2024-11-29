#!/bin/bash
Prefix="/home/noah/Games"
Names=("Project-Zomboid" "Minecraft-Modded" "Minecraft-Vanilla" "Satisfactory" "Terraria")
Dirs=("$Prefix/PZ/data/Saves/Multiplayer/" "$Prefix" "$Prefix" "$Prefix/Satisfactory/config/" "$Prefix/Terraria/")
Dirs2=("./servertest/" "./Minecraft-Modded/" "./Minecraft-Vanilla/" "./saved/" "./world/")
Date=$(date +'%H:%M:%S')

Time=$(date +'%H:%M:%S')
echo "$Time - Starting script." >> Logs/$Date.log
for i in ${!Dirs[@]}; do
  tar --zstd -cf ${Names[i]}/$Date.tar.zst -C ${Dirs[i]} ${Dirs2[i]} >> Logs/$Date.log
  Time=$(date +'%H:%M:%S')
  echo "$Time - Compressed ${Names[i]} to ./Backups/${Names[i]} as $Date.tar.zst" >> Logs/$Date.log
done

#remove tar files that are 30 days old
Time=$(date +'%H:%M:%S')
echo "$Time - Old Backups Getting Removed:" >> Logs/$Date.log
find /home/noah/Backups/ -mtime +0 -type f -name \*.tar.zst >> Logs/$Date.log
find /home/noah/Backups/ -mtime +0 -type f -name \*.tar.zst -delete

