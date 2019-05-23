#!/bin/bash

set -o errexit
set -o nounset

readonly SELF_DIR=$(cd $(dirname $0) && pwd)

[[ $(uname -s) == Darwin ]] || {
    echo "Skipped (not on Mac OS X)"
    exit 0
}

# Show "Quit Finder" Menu Item
defaults write com.apple.finder QuitMenuItem -bool true && killall Finder

# Show Full Path in Finder Title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Show All File Extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Use Plain Text Mode as Default
defaults write com.apple.TextEdit RichText -int 0
