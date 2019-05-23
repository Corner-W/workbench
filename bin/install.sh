#!/bin/bash

set -o errexit
set -o nounset

readonly SELF_DIR=$(cd $(dirname $0) && pwd)

mkdir -p ~/bin
rsync -a --exclude install.sh --exclude README.md $SELF_DIR/ ~/bin/
