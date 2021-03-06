#!/bin/bash
set -e

root=$(cd `dirname $0` && pwd)

if [ -e ~/.vimrc ];then
	mv ~/.vimrc ~/.vimrc.bk
fi

if [ -e ~/.tmux.conf ];then
        mv ~/.tmux.conf ~/.tmux.conf.bk
fi

if ! [ -e ~/.vim/autoload/plug.vim ]; then
    echo "Now Install vim-plug"
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

cp "$root/rcs/.vimrc" ~/.vimrc
cp "$root/rcs/.tmux.conf" ~/.tmux.conf

if [ -e ~/.vim/colors ];then
        cp $root/rcs/vimcolors/inkpot_modified.vim ~/.vim/colors/
else
        mkdir -p ~/.vim/colors
        cp $root/rcs/vimcolors/inkpot_modified.vim ~/.vim/colors/
fi

cp "$root/.ycm_extra_conf.py" ~/.vim/

sh "$root/base_sw.sh"

echo "Please vim a file and input PlugInstall"
