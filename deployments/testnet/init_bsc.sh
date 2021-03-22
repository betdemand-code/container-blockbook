#!/bin/bash

if ! [ -e "$DIR/testnet/bsc_testnet/genesis.json" ]; then
    DIR=$DIR docker-compose run --rm bsc --datadir /home/geth init /home/geth/genesis.json
fi
