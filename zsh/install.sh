#!/bin/bash

set -o errexit
set -o nounset

readonly SELF_DIR=$(cd $(dirname $0) && pwd)
readonly BACKUP_DIR=~/.zsh.backup
readonly ZSH_FILES=(~/.zshenv ~/.zprofile ~/.zshrc ~/.zlogin)
readonly ZSH_COMPLETION_DIR=~/.zsh-completions

mkdir -p $BACKUP_DIR
for x in ${ZSH_FILES[@]}; do
    [[ ! -f $x ]] || cp $x $BACKUP_DIR/
done

rm -f ${ZSH_FILES[@]}

cp $SELF_DIR/zshrc ~/.zshrc

[[ -d $ZSH_COMPLETION_DIR ]] || {
    git clone https://github.com/zsh-users/zsh-completions.git $ZSH_COMPLETION_DIR
}
