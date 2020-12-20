#!/bin/bash
oldHeight=0
errCount=0
if [ -f "check_height" ]; then
    oldHeight=$(cat check_height)
fi
if [ -f "error_count" ]; then
    errCount=$(cat error_count | wc -l)
fi
json=$(curl -s http://localhost:9130/api/)
height=$(echo $json | jq '.blockbook.bestHeight')
echo "$oldHeight"
echo "$height"

if [ "$height" = "$oldHeight" ]; then
    if [ $errCount -ge 20 ]; then
        echo "err -- removed all data"
        rm -rf /opt/coins/blockbook/ethereum/data
        kill -9 1
        exit 1
    fi
    echo "1" >>error_count
    exit 0
fi

if [ -f "error_count" ]; then
    rm error_count
fi
echo "$height" >check_height
exit 0
