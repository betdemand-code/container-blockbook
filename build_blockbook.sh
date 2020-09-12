#!/bin/bash

cd $GOPATH/src
git clone https://github.com/trezor/blockbook.git
cd blockbook
go build