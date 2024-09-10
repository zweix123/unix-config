#!/bin/bash

function install() {
    cp ./.vimrc ~/

    rm -rf ~/.vim
    mkdir ~/.vim
    mkdir ~/.vim/colors
    curl -o ~/.vim/colors/gruvbox.vim https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim

    echo "install vim"
}

function backup() {
    cp ~/.vimrc ~/.vimrc.backup
    cp -r ~/.vim ~/.vim.backup
    echo "backup vim"
}

function collect() {
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
