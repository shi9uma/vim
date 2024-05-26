#env bash

dirs=(
    $HOME/.vim $HOME/.vim/tmp $HOME/.vim/autoload $HOME/.vim/colors
)

do for dir in ${dirs[@]}; do
    if [ ! -d $dir ]; then
        mkdir -p $dir
    fi
done

curl \
    -fLo ~/.vimrc \
    https://raw.githubusercontent.com/shi9uma/vim/main/diy/unix_vimrc

curl \
    -fLo ~/.vim/autoload/plug.vim \
    --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl \
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