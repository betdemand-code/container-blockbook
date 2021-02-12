#!/bin/bash

dir=$DIR
testnet=$TESTNET

apt-get update
apt-get install -y wget curl

if [[ "$testnet" == "" ]]; then
    testnet="false"
fi

if [[ "$testnet" == "true" ]]; then
    if [ -e "$dir/bsc_testnet/genesis.json" ]; then
        exit 0
    fi
    wget --no-check-certificate $(curl -s https://api.github.com/repos/binance-chain/bsc/releases/latest | grep browser_ | grep testnet | cut -d\" -f4)
    unzip testnet.zip
    mkdir -p "$dir/bsc_testnet"
    cp testnet/config.yaml "$dir/bsc_testnet/config.yaml"
    cp testnet/genesis.json "$dir/bsc_testnet/genesis.json"
    DIR=$dir docker-compose run bsc --datadir /home/geth init /home/geth/genesis.json 
fi
if [[ "$testnet" == "false" ]]; then
    if [ -e "$dir/bsc_mainnet/genesis.json" ]; then
        exit 0
    fi
    wget --no-check-certificate $(curl -s https://api.github.com/repos/binance-chain/bsc/releases/latest | grep browser_ | grep mainnet | cut -d\" -f4)
    unzip mainnet.zip
    mkdir -p "$dir/bsc_mainnet"
    cp mainnet/config.yaml "$dir/bsc_mainnet/config.yaml"
    cp mainnet/genesis.json "$dir/bsc_mainnet/genesis.json"
fi
