#!/bin/bash

wget https://golang.org/dl/go1.15.2.linux-amd64.tar.gz && tar xf go1.15.2.linux-amd64.tar.gz

mv go /opt/go
ln -s /opt/go/bin/go /usr/bin/go
# see `go help gopath` for details
mkdir $HOME/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin