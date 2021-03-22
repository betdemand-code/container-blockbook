#!/bin/bash

if ! [ -e "$dir/mainnet/bsc/genesis.json" ]; then
    DIR=$DIR docker-compose run --rm bsc --datadir /home/geth init /home/geth/genesis.json
fi
