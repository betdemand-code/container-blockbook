# docker-blockbook
The docker container packages for setup swingby node.
## Requirements
- docker
- docker-compose

## Setup containers
```
$ cd deployments/{network}
$ DIR=/var/swingby docker-compose up -d {geth, bitcoind, bb_btc, bb_geth}
```

