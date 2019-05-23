#!/bin/bash

set -o errexit
set -o nounset

readonly SELF_DIR=$(cd $(dirname $0) && pwd)

rsync $SELF_DIR/ctags ~/.ctags
