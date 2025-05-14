#!/bin/sh

# if [ -z "$all_proxy" ]; then
#     echo "set \$all_proxy"
#     exit 1
# fi

if [ "$(id -u)" -ne 0 ]; then
	echo "run script with sudo"
	exit 1
fi

# export all_proxy="http://192.168.9.2:7890"

vim_root=/usr/share/vim
vim_version_dir_name=$(ls $vim_root | grep '^vim[0-9]\{2\}$')
vim_dir=$vim_root/$vim_version_dir_name

local_vim_root=$HOME/.vim
if [ ! -d $local_vim_root ]; then
    mkdir $local_vim_root
fi

ln -s $vim_dir/autoload $local_vim_root/autoload
ln -s $vim_dir/colors $local_vim_root/colors

mkdir -p $local_vim_root/tmp

chown -R $USER:$USER $local_vim_root

curl \
    -fLo ~/.vimrc \
    https://raw.githubusercontent.com/shi9uma/vim/main/diy/unix-vimrc
curl \
    -fLo $local_vim_root/autoload/plug.vim \
    --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim -c PlugInstall -c qa
