#! /bin/bash

echo "Pulling latest ammo and data"
git fetch --all
git reset --hard origin/main

chmod 777 ./tank.sh
chmod 777 ./startLoad.sh

./startLoad.sh