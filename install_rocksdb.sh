#!/bin/bash

git clone https://github.com/facebook/rocksdb.git
cd rocksdb
CFLAGS=-fPIC CXXFLAGS=-fPIC make release

export CGO_CFLAGS="-I/path/to/rocksdb/include"
export CGO_LDFLAGS="-L/path/to/rocksdb -lrocksdb -lstdc++ -lm -lz -lbz2 -lsnappy -llz4"