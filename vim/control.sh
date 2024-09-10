#!/bin/bash

function locate() {
    CURRENT_FOLDER=$(
        cd "$(dirname "$0")"
        pwd
    )
    cd $CURRENT_FOLDER
}

function install() {
    locate
    cp ./.vimrc ~/

    rm -rf ~/.vim
    mkdir ~/.vim
    mkdir ~/.vim/colors
    curl -o ~/.vim/colors/gruvbox.vim https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim

    echo "install vim"
}

function backup() {
    locate
    cp ~/.vimrc ~/.vimrc.backup
    cp -r ~/.vim ~/.vim.backup
    echo "backup vim"
}

function collect() {
    locate
    cp ~/.vimrc ./
    # ~/.vim/
    echo "collect vim"
}

case "$1" in
install)
    install
    ;;
backup)
    backup
    ;;
collect)
    collect
    ;;
*)
    echo "用法: $0 {install|backup|collect}"
    exit 1
    ;;
esac

exit 0
