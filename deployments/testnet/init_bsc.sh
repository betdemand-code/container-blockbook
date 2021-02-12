#!/bin/bash

DIR=$DIR docker-compose run --rm bsc --datadir /home/geth init /home/geth/genesis.json
