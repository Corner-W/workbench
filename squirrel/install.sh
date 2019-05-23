#!/bin/bash

set -o errexit
set -o nounset

readonly SELF_DIR=$(cd $(dirname $0) && pwd)

if [[ $(uname -s) == Darwin ]]; then
    mkdir -p $HOME/Library/Rime
    cp squirrel.custom.yaml $HOME/Library/Rime/
fi
