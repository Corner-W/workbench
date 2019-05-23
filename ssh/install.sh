#!/bin/bash

set -o errexit
set -o nounset

readonly SELF_DIR=$(cd $(dirname $0) && pwd)

mkdir -m 700 -p ~/.ssh
rsync $SELF_DIR/config.sample ~/.ssh/
