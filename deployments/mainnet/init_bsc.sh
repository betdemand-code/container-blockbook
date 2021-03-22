#!/bin/bash

if ! [ -e "$DIR/mainnet/bsc/genesis.json" ]; then
    DIR=$DIR docker-compose run --rm bsc --datadir /home/geth init /home/geth/genesis.json
fi
