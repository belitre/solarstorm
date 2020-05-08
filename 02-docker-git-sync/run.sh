#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/.."

mkdir -p $DIR/git_repo

docker run --rm \
    -v $DIR/git_repo:/git \
    -e GIT_SYNC_REPO=https://github.com/ouzi-dev/k8sprimitives1 \
    -e GIT_SYNC_BRANCH=master \
    -e GIT_SYNC_ONE_TIME=true \
    -e GYT_SYNC_DEST=k8sprimitives1 \
    belitre/git-sync:0.1