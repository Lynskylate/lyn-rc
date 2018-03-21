$root=$(cd $(dirname 0) && pwd)


mv ~/.vimrc ~/.vimrc.bk
cp $root/rcs/.vimrc ~/.vimrc
cp $root/rcs/.tmux.conf ~/.tmux.conf

if [ -e ~/.vim/colors ];then
        cp $root/rcs/vimcolors/inkpot_modified.vim
else
        mkdir -p ~/.vim/colors
        cp $root/rcs/vimcolors/inkpot_modified.vim
fi


