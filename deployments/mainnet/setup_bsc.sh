#!/bin/bash

dir=$DIR
if ! type "unzip" >/dev/null; then
    apt-get update
    apt-get install -y wget curl unzip
fi

if ! [ -e "$dir/mainnet/bsc/genesis.json" ]; then
    mkdir -p "$dir/mainnet/bsc"
fi
cd "$dir/mainnet/bsc"
wget --no-check-certificate $(curl -s https://api.github.com/repos/binance-chain/bsc/releases/latest | grep browser_ | grep mainnet | cut -d\" -f4)
unzip -o mainnet.zip
rm -f mainnet.zip
rm -f mainnet.zip.*

sed -i '/HTTPHost/d' "$dir/mainnet/bsc/config.toml"
