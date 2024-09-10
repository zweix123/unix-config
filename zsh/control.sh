#!/bin/bash

function install() {
    cp ./.zshrc ~/
    cp ./zweix.zsh-theme ~/.oh-my-zsh/themes/
    echo "install zsh"
}

function backup() {
    cp ~/.zshrc ~/.zshrc.backup
    # ~/.oh-my-zsh/themes/
    echo "backup zsh"
}

function collect() {
    cp ~/.zshrc ./
    cp ~/.oh-my-zsh/themes/zweix.zsh-theme ./
    echo "collect zsh"
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
