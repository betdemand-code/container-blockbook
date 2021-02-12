#!/bin/bash

dir=$DIR
testnet=$TESTNET

if ! type "unzip" >/dev/null; then
    apt-get update
    apt-get install -y wget curl
fi

if [[ "$testnet" == "" ]]; then
    testnet="false"
fi

if [[ "$testnet" == "true" ]]; then
    if [ -e "$dir/testnet/bsc_testnet/genesis.json" ]; then
        exit 0
    fi
    mkdir -p "$dir/testnet/bsc_testnet"
    cd "$dir/testnet/bsc_testnet"
    wget --no-check-certificate $(curl -s https://api.github.com/repos/binance-chain/bsc/releases/latest | grep browser_ | grep testnet | cut -d\" -f4)
    unzip testnet.zip
fi
if [[ "$testnet" == "false" ]]; then
    if [ -e "$dir/mainnet/bsc_mainnet/genesis.json" ]; then
        exit 0
    fi
    wget --no-check-certificate $(curl -s https://api.github.com/repos/binance-chain/bsc/releases/latest | grep browser_ | grep mainnet | cut -d\" -f4)
    unzip mainnet.zip
    mkdir -p "$dir/bsc_mainnet"
    cp mainnet/config.yaml "$dir/bsc_mainnet/config.yaml"
    cp mainnet/genesis.json "$dir/bsc_mainnet/genesis.json"
fi
