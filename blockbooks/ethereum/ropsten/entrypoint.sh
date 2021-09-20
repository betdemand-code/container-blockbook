#!/bin/bash

cd /opt/coins/blockbook/ethereum_testnet_ropsten/

./bin/blockbook -sync \
    -blockchaincfg=/app/blockchaincfg.json \
    -internal=:9030 \
    -public=:9130 \
    -resyncindexperiod=5000 \
    -resyncmempoolperiod=5000 \
    -blockheight=11069956 \
    -workers=1 \
    -logtostderr
