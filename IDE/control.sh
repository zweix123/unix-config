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
    echo "install IDE"
    python3 control.py install
}

function backup() {
    locate
    echo "backup IDE"
    python3 control.py backup
}

function collect() {
    locate
    echo "collect IDE"
    python3 control.py collect
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
