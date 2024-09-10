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
    cp ./.tmux.conf ~/
    echo "install tmux"
}

function backup() {
    locate
    cp ~/.tmux.conf ~/.tmux.conf.backup
    echo "backup tmux"
}

function collect() {
    locate
    cp ~/.tmux.conf ./
    echo "collect tmux"
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
