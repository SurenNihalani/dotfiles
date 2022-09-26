#!/bin/bash
set -xe
cp git-message.txt ~/.gitmessage.txt
git config --global commit.template ~/.gitmessage.txt
OLDDIR=`pwd`
if [ ! -d $(readlink -f ~/.asdf) ]; then
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.2
fi

# install ag
if hash apt-get 2>/dev/null; then
    sudo apt-get install silversearcher-ag
    sudo apt-get update
    sudo apt-get install software-properties-common curl git
    sudo apt-add-repository ppa:ansible/ansible -y
    sudo apt-get update
    sudo apt-get install ansible
fi

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
if ! az > /dev/null; then
    brew update && brew install azure-cli
fi
git config --global user.name "Suren Nihalani"
git config --global user.email "1093911+SurenNihalani@users.noreply.github.com"
FILE=$(readlink -f ~/.ssh/id_ed25519)
if [ ! -f $FILE ]; then
    ssh-keygen -t ed25519 -C "1093911+SurenNihalani@users.noreply.github.com"
fi
./osx.zsh
