#!/bin/bash

# install vundel
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# link files
current_dir=$(pwd)
ln -sf $current_dir/vimrc ~/.vimrc
ln -sf $current_dir/tmux.conf ~/.tmux.conf 

# install powerline
if [[ "$1" == "mac" ]]
then brew install python
else sudo apt-get install python-pip
fi

pip install --user git+git://github.com/Lokaltog/powerline

# install powerline fonts
exec fonts/install.sh
