#!/bin/bash

git config --global alias.st status
git config --global alias.ci commit
git config --global alias.info "remote -v show -n"
git config --global alias.vi \
    "difftool -y -x 'vimdiff -M \"+wincmd l\" \"+set modifiable write\"'"
git config --global alias.mt "mergetool -y --tool vi"
git config --global alias.br "branch --sort=-committerdate"
git config --global alias.co checkout
git config --global alias.ls \
    "log --name-status --pretty=format:'%C(yellow)%h%C(red)%d%Creset %s %C(blue)- %an, %ar%Creset'"
git config --global alias.hist \
    "log --graph --pretty=format:'%C(yellow)%h%C(red)%d%Creset %s %C(blue)- %an, %ar%Creset'"
git config --global alias.tail "log --oneline --decorate --graph -10"
git config --global alias.loggrep "log --decorate --all-match -i --grep"
git config --global alias.pick cherry-pick
git config --global alias.ff "merge --ff-only"
git config --global alias.noff "merge --no-ff"
git config --global alias.tr "branch --set-upstream-to"

# Use https://github.com/ymattw/cdiff
git config --global alias.d '!cdiff -sw0'

git config --global alias.rb \
        '!fn() { git stash && git rebase "$@" && git stash pop; }; fn'

git config --global core.editor vim
git config --global color.ui true
git config --global log.abbrevcommit true
git config --global log.decorate short
git config --global diff.noprefix true

# The layout (REMOTE has patches to apply to BASE version):
#
#   LOCAL | BASE | REMOTE
#   ---------------------
#   MERGED
#
# Note we need to handle filename contains spaces, also note vim '+' command
# treats double quotes as comments so we use single ('\'' denotes a single
# quote in shell)
#
git config --global mergetool.vi.cmd \
    'vimdiff -M "$LOCAL" "$BASE" "$REMOTE" '\''+botright diffsplit '\''"$MERGED" "+set modifiable write"'

git config --global push.default simple

# Leave user.name as per repo setting
# Leave user.email as per repo setting
