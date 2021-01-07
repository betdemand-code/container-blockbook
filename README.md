# docker-blockbook
The docker container packages for setup swingby node.
## Requirements
- docker
- docker-compose

## Install docker&docker compose via script
```
$ chmod +x ./setup_docker.sh && ./setup_docker.sh
```
## Setup containers
```
$ cd deployments/{network}
$ DIR=/var/swingby docker-compose up -d {geth, bitcoind, bb_btc, bb_geth}
```

