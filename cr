#! /bin/bash

set -x 

function 01tetragon() {
    echo "Starting tetragon"
    sudo ./tetragon --bpf-lib bpf/objs
}

function 02build() {
    echo "Building with witness and BPF"
    ./witness run -l=debug --step build -o /dev/null --tetragon-address localhost:54321 -k demo-key.pem --enable-archivist -- go build .
}

function 03sign() {
    echo "Signing The Policy"
    ./witness sign -k demo-key.pem -f cr-policy-unsigned.json > cr-policy-signed.json
}

function 04verify() {
    echo "Verifying the Policy against the artifact"
    ./witness -l=debug verify -p cr-policy-signed.json -k demo-pub.pem --enable-archivist -f witness-bpf-demo
}


#if args is "1" then run 01tetragon
if [ "$1" = "1" ]; then
    01tetragon
fi

#if args is "2" then run 02solar
if [ "$1" = "2" ]; then
    02build
fi

#if args is "3" then run 03build
if [ "$1" = "3" ]; then
    03sign
fi

#if args is "4" then run 04show
if [ "$1" = "4" ]; then
    04verify
fi


