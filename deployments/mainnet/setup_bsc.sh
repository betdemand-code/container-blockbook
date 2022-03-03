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
wget https://github.com/bnb-chain/bsc/releases/download/v1.1.8/mainnet.zip
unzip -o mainnet.zip
mv mainnet/genesis.json ./genesis.json
mv mainnet/config.toml ./config.toml
rm -f mainnet.zip
rm -f mainnet.zip.*
rm -rf __MACOSX

sed -i '/HTTPHost/d' "$dir/mainnet/bsc/config.toml"

sed -i '/Node.LogConfig/,+4 d' "$dir/mainnet/bsc/config.toml"

sed -i '/GraphQLPort/d' "$dir/mainnet/bsc/config.toml"
sed -i '/GraphQLVirtualHosts/d' "$dir/mainnet/bsc/config.toml"
