#!/bin/bash
set -x

# on an average, setup should be reproducble
rm -f ~/.zshrc
cp zshrc ~/.zshrc

# fzf is pretty key
rm -rf ~/.fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
