#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mkdir -p $DIR/git_repo

docker run --name gitsync \
    -v $DIR/git_repo:/git \
    -e GIT_SYNC_REPO=https://github.com/belitre/solarstorm \
    -e GIT_SYNC_BRANCH=master \
    -e GIT_SYNC_ONE_TIME=true
    --rm belitre/git-sync:0.1