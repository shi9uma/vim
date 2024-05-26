#!/usr/bin/env bash

dirs=(
    $HOME/.vim $HOME/.vim/tmp $HOME/.vim/autoload $HOME/.vim/plugins
)

for dir in ${dirs[@]}; do
    if [ ! -d $dir ]; then
        mkdir -p $dir
    fi
done

mkdir $HOME/.vim/share/
ln -s /usr/share/vim/* $HOME/.vim/share/
if [ -d $HOME/.vim/colors ]; then
    rm -rf $HOME/.vim/colors
    ln -s $(find /usr/share/vim/ -name colors) $HOME/.vim/colors
fi


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

sudo chown -R $USER:$USER $HOME/.vim
vim -c PlugInstall