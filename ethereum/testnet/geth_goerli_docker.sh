#/bin/bash

docker run -d -v /var/geth:/home/geth \
    -p 8545:8545 \
    -p 8546:8546 \
    -p 30303:30303 \
    -p 30303:30303/udp \
    --name geth_host ethereum/client-go \
    --rpc \
    --rpcaddr "0.0.0.0" \
    --ws \
    --wsaddr "0.0.0.0" \
    --rpccorsdomain "*" \
    --wsorigins "*" \
    --datadir /home/geth \
    --nousb \
    --goerli
