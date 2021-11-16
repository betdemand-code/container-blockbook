#!/bin/bash

cd /server/coins/blockbook/bsc/

./bin/blockbook -sync \
    -blockchaincfg=/app/blockchaincfg.json \
    -internal=:9030 \
    -public=:9130 \
    -resyncindexperiod=5000 \
    -resyncmempoolperiod=5000 \
    -blockheight=12585103 \
    -workers=1 \
    -logtostderr
