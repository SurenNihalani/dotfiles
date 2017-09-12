#!/bin/bash
set -x

# install ag
sudo apt-get install silversearcher-ag

# on an average, setup should be reproducble
rm -f ~/.zshrc
cp zshrc ~/.zshrc

# fzf is pretty key
rm -rf ~/.fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
yes | ~/.fzf/install


# fasd is game changer
wget https://github.com/clvv/fasd/zipball/1.0.1
unzip 1.0.1
rm -rf 1.0.1

cd clvv-fasd*
# it'd be useful to install for everyone 
# but it's worth dealing with permission stuff
sudo make install
cd ..
rm -rf clvv*

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
rm -rf ~/.vimrc
cp vimrc ~/.vimrc
