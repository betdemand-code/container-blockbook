#!/bin/bash

if ! [ -d "$DIR/mainnet/bsc/data" ]; then
    DIR=$DIR docker-compose run --rm bsc --datadir /home/geth/data init /home/geth/genesis.json
fi
