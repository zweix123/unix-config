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
    echo "install vscode"
}

function backup() {
    locate
    echo "backup vscode"
}

function collect() {
    locate
    echo "collect vscode"
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
