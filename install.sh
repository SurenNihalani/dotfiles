#!/bin/bash
set -xe
cp git-message.txt ~/.gitmessage.txt
git config --global commit.template ~/.gitmessage.txt
OLDDIR=`pwd`

# install ag
sudo apt-get install silversearcher-ag

# on an average, setup should be reproducble
rm -f ~/.zshrc
cp zshrc ~/.zshrc

# fzf is pretty key
rm -rf ~/.fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
yes | ~/.fzf/install

rm -rf ~/.vim/bundle/Vundle.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
rm -rf ~/.vimrc
cp vimrc ~/.vimrc

# fasd is game changer
curl -L -o a.zip https://github.com/clvv/fasd/zipball/1.0.1
unzip a.zip
rm -rf 1.0.1

cd clvv-fasd*
# it'd be useful to install for everyone 
# but it's worth dealing with permission stuff
sudo make install
cd ..
rm -rf clvv*

cd $OLDDIR
git clean -f -f -d
rm -rf ~/.vim/bundle/Vundle.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
rm -rf ~/.vimrc
cp vimrc ~/.vimrc


sudo apt-get update
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt-get update
sudo apt-get install ansible
