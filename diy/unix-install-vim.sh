#/usr/bin/env bash

vim_root=/usr/share/vim
vim_version_dir_name=$(ls $vim_root | grep '^vim[0-9]\{2\}$')
vim_dir=$vim_root/$vim_version_dir_name

local_vim_root=$HOME/.vim
if [ ! -d $local_vim_root ]; then
    mkdir $local_vim_root
fi

sudo ln -s $vim_dir/autoload $local_vim_root/autoload
sudo ln -s $vim_dir/colors $local_vim_root/colors

mkdir -p $local_vim_root/tmp

sudo chown -R $USER:$USER $local_vim_root

curl \
    -x $all_proxy \
    -fLo ~/.vimrc \
    https://raw.githubusercontent.com/shi9uma/vim/main/diy/unix-vimrc
sudo curl \
    -x $all_proxy \
    -fLo $local_vim_root/autoload/plug.vim \
    --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim -c PlugInstall
