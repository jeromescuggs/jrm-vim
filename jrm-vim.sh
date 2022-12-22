#!/bin/bash

NVIM_PLUG=$1

# store the current dir
CUR_DIR=$(dirname $(readlink -f $0))

echo "VIMCONFIG"
echo "remember to run :PlugInstall after starting vim to complete the setup."



if [[ -z $NVIM_PLUG ]]; then 
    echo "installing vim configs in $HOME/.vim..."
    mkdir -p $HOME/.vim/autoload 
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    cp $CUR_DIR/vimrc $HOME/.vim
    echo "done! to also setup neovim to source the same file,"
    echo "rerun this script with 'nvim' as an argument"
    echo "e.g. ./vim-plug nvim"
fi


if [[ $NVIM_PLUG == "nvim" ]]; then
	if [[ -a $HOME/.config/nvim/init.vim ]]; then 
		mv $HOME/.config/nvim/init.vim $HOME/.config/nvim/init.vimold
	fi 
    mkdir -p $HOME/.config/nvim
    echo "adding config file for neovim..."
    touch $HOME/.config/nvim/init.vim
    echo "set runtimepath^=~/.vim runtimepath+=~/.vim/after" >> $HOME/.config/nvim/init.vim
    echo "let &packpath=&runtimepath" >>  $HOME/.config/nvim/init.vim
    echo "source ~/.vim/vimrc" >> $HOME/.config/nvim/init.vim
    echo "all done! neovim will now look for and use your vim rc dir and config."
    nvim +PlugInstall
fi

