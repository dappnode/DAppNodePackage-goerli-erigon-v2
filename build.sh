#!/bin/bash

source envs.source

git clone ${MASTER_REPO} master_repo

for SRC in $(find master_repo -name "*-build*")
do
    echo $SRC
    DST=${SRC/master_repo/.}
    DST=${DST/-build}
    echo $DST
    if [ ! -f $DST ];then
        envsubst '$_BUILD_NETWORK $_BUILD_PACKAGE_NAME $_BUILD_UPSTREAM_VERSION $_BUILD_P2P_PORT $_BUILD_BITTORRENT_PORT $_BUILD_CONSENSUS_PREFIX' < $SRC > $DST
    fi
done