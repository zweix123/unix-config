#!/bin/bash

function install() {
    echo "install vscode"
}

function backup() {
    echo "backup vscode"
}

function collect() {
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
