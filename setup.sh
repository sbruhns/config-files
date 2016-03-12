current_dir=$(pwd)
ln -sf $current_dir/vimrc ~/.vimrc
ln -sf $current_dir/tmux.conf ~/.tmux.conf 

# install powerline
sudo apt-get install python-pip
pip install --user git+git://github.com/Lokaltog/powerline

# install powerline fonts
exec fonts/install.sh
