#!/bin/bash
shopt -s nullglob dotglob
files=(./datadir/*)
if ! [ ${#files[@]} -gt 0 ]
then
    geth --datadir=./datadir init genesis.json
fi
geth --datadir=./datadir console

