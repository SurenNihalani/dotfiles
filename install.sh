#!/bin/bash
set -x

# on an average, setup should be reproducble
rm -f ~/.zshrc
cp zshrc ~/.zshrc

# fzf is pretty key
rm -rf ~/.fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install


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


