#!/bin/bash
# get neccessary pip
set -e

HOME_PATH=`cd ~;pwd`
ROOT_PATH=$(cd `dirname $0` && pwd)

if ! [ -x $(command -v python) ]; then
    echo "Please Install python first" >& 2
    exit 1
fi

# pip install
if ! [ -x "$(command -v pip)" ]; then
    echo "Pip is necessary and now install" >& 2
    curl https://bootstrap.pypa.io/get-pip.py -o $ROOT_PATH/get-pip.py
    python $ROOT_PATH/get-pip.py
    rm -f $ROOT_PATH/get-pip.py
    echo "Install finished"
fi

# tldr install
if ! [ -x "$(command -v tldr)" ]; then
    python -m pip install tldr --user
fi

# oh-my-zsh install
if ! [ -d $HOME_PATH/.oh-my-zsh ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    cp "$ROOT_PATH/rcs/.zshrc" $HOME_PATH
    source $HOME_PATH/.zshrc
fi
