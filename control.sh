#!/bin/bash

sub=(
    "vim"
    "tmux"
    "zsh"
    "vscode"
)

function install() {
    for sub in ${sub[@]}; do
        echo "install $sub"
        ./$sub/control.sh install
    done
}

function backup() {
    for sub in ${sub[@]}; do
        echo "backup $sub"
        ./$sub/control.sh backup
    done
}

function collect() {
    for sub in ${sub[@]}; do
        echo "collect $sub"
        ./$sub/control.sh collect
    done
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
