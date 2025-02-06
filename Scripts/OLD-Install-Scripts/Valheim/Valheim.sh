#!/bin/bash
export templdpath=$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=./linux64:$LD_LIBRARY_PATH
export SteamAppId=892970

./valheim_server.x86_64 -name "server_name" -port 2456 -nographics -batchmode -world "word_name" -password "game-password"
export LD_LIBRARY_PATH=$templdpath