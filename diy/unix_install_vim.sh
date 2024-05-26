#!/usr/bin/env bash

vim_root=/usr/share/vim
vim_version_dir_name=$(ls $vim_root | grep '^vim[0-9]\{2\}$')
vim_dir=$vim_root/$vim_version_dir_name

local_vim_root=$HOME/.vim
local_vim_root_ln_share=local_vim_root/share

if [ ! -d $local_vim_root ]; then
    mkdir $local_vim_root
fi

mkdir $local_vim_root_ln_share
ln -s $vim_root $local_vim_root_ln_share
ln -s $vim_dir/autoload $local_vim_root/autoload
ln -s $vim_dir/colors $local_vim_root/colors
ln -s $vim_dir/plugin $local_vim_root/plugin

mkdir -p $HOME/.vim/tmp

sudo chown -R $USER:$USER $HOME/.vim

curl \
    -fLo ~/.vimrc \
    https://raw.githubusercontent.com/shi9uma/vim/main/diy/unix_vimrc
curl \
    -fLo ~/.vim/autoload/plug.vim \
    --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
sudo curl \
    -fLo ~/.vim/colors/gruvbox.vim \
    --create-dirs \
    https://raw.githubusercontent.com/morhetz/gruvbox/master/autoload/gruvbox.vim
curl \
    -fLo ~/.vim/autoload/gruvbox.vim \
    --create-dirs \
    https://raw.githubusercontent.com/morhetz/gruvbox/master/autoload/gruvbox.vim
curl \
    -fLo ~/.vim/autoload/airline/themes/gruvbox.vim \
    --create-dirs \
    https://raw.githubusercontent.com/morhetz/gruvbox/master/autoload/airline/themes/gruvbox.vim
curl \
    -fLo ~/.vim/autoload/lightline/colorscheme/gruvbox.vim \
    --create-dirs \
    https://raw.githubusercontent.com/morhetz/gruvbox/master/autoload/lightline/colorscheme/gruvbox.vim

vim -c PlugInstall
