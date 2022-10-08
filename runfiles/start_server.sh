#!/bin/bash

## edited by hexagon6 2022-10-08 and optimized for docker usage

export templdpath=$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=./linux64:$LD_LIBRARY_PATH
export SteamAppId=892970

echo "Starting server [${NAME}] with world: ${WORLD} PRESS CTRL-C to exit"

# Tip: Make a local copy of this script to avoid it being overwritten by steam.
# NOTE: Minimum password length is 5 characters & Password cant be in the server name.
# NOTE: You need to make sure the ports 2456-2458 is being forwarded to your server through your local router & firewall.
./valheim_server.x86_64 \
-savedir /data \
-name ${NAME:-"My server"} \
-port ${PORT:-2456} \
-world ${WORLD:-"Dedicated"} \
-password ${SECRET:-"secret"} \
-crossplay

export LD_LIBRARY_PATH=$templdpath

exit 0

