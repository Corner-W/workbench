#!/bin/bash

set -o errexit
set -o nounset

readonly SELF_DIR=$(cd $(dirname $0) && pwd)
readonly TARGET_PLUG_DIR=~/.vim/autoload/plug.vim

cp -p $SELF_DIR/vimrc ~/.vimrc

[[ -f $TARGET_PLUG_DIR ]] || {
    echo "Installing vim-plug to $TARGET_PLUG_DIR"
    curl -fksSLo $TARGET_PLUG_DIR --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

vim --version | grep -Fq "+lua" || {
    echo "*** Your vim doesn't support lua, highly recommended to" \
         "install 'vim-nox' or rebuild to leverage neocomplete for" \
         "auto completion, see https://github.com/Shougo/neocomplete.vim" >&2
}

type -P ag >& /dev/null || {
    echo "*** 'ag' is not installed, highly recommended to install for" \
         "quick search, see https://github.com/ggreer/the_silver_searcher" >&2
}

readonly LOG_FILE="/tmp/vim-plug-install-$$.log"
trap "rm -f $LOG_FILE" EXIT
vim +PlugInstall +qall >& $LOG_FILE
