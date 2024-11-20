#!/bin/sh

if [ -z "$all_proxy" ]; then
    echo "set \$all_proxy"
    exit 1
fi

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
# sudo curl \
#     -x $all_proxy \
#     -fLo $local_vim_root/colors/gruvbox.vim \
#     --create-dirs \
#     https://raw.githubusercontent.com/morhetz/gruvbox/master/autoload/gruvbox.vim
# sudo curl \
#     -x $all_proxy \
#     -fLo$local_vim_root/autoload/gruvbox.vim \
#     --create-dirs \
#     https://raw.githubusercontent.com/morhetz/gruvbox/master/autoload/gruvbox.vim
# sudo curl \
#     -x $all_proxy \
#     -fLo$local_vim_root/autoload/airline/themes/gruvbox.vim \
#     --create-dirs \
#     https://raw.githubusercontent.com/morhetz/gruvbox/master/autoload/airline/themes/gruvbox.vim
# sudo curl \
#     -x $all_proxy \
#     -fLo$local_vim_root/autoload/lightline/colorscheme/gruvbox.vim \
#     --create-dirs \
#     https://raw.githubusercontent.com/morhetz/gruvbox/master/autoload/lightline/colorscheme/gruvbox.vim

vim -c PlugInstall
