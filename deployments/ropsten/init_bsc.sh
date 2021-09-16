#!/bin/bash

if ! [ -d "$DIR/testnet/bsc_testnet/data" ]; then
    DIR=$DIR docker-compose run --rm bsc --datadir /home/geth/data init /home/geth/genesis.json
fi
