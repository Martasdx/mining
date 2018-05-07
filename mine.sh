#!/bin/bash

# usage - run this with one parameter - coin name based on your config file
# example: ./mine.sh xmr
# run if needed: sudo chmod -X mine.sh

COIN=$1

if [ ! -f "configs/$COIN" ]
then
    echo "Config file pro coin $COIN does not exists"
    exit 0
fi

echo "Copying default configuration"
cp configs/head.conf local.conf

echo "Adding configuration for coin $COIN"
cat configs/$COIN >> local.conf

echo "Restarting miner"
putconf && minestop

echo "All done, mining of $COIN started"
exit 0
