#!/bin/bash
shopt -s nullglob dotglob
files=(./datadir/geth/*)
if ! [ ${#files[@]} -gt 0 ]
then
    geth --datadir=./datadir init genesis.json
fi
geth --datadir=./datadir --unlock db0fe2107383d64a120652f63162e11780eb46db console
