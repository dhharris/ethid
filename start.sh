#!/bin/bash
shopt -s nullglob dotglob
DATADIR=./datadir
if [ ! -d $DATADIR/geth/chaindata ]
then
    echo 'Initializing genesis block'
    geth --datadir=./datadir init genesis.json
fi
geth --datadir=$DATADIR --unlock db0fe2107383d64a120652f63162e11780eb46db console
