#!/bin/bash

set -e

function check_command() {
    if ! command -v $1 &>/dev/null; then
        echo "需要安装 $1"
        exit 1
    fi
}

check_command python3

function check_python_lib() {
    if ! python3 -c "import $1" &>/dev/null; then
        echo "需要安装 $1 库, 可执行 python3 -m pip install $1"
        exit 1
    fi
}

# check_python_lib rich
# check_python_lib commentjson

python3 -m venv venv
venv_python="./venv/bin/python3"

function check_and_install_venv_python_lib() {
    if ! ${venv_python} -c "import $1" &>/dev/null; then
        ${venv_python} -m pip install $1
    fi
}

check_and_install_venv_python_lib rich
check_and_install_venv_python_lib commentjson

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
    ${venv_python} control.py install
}

function backup() {
    locate
    echo "backup IDE"
    ${venv_python} control.py backup
}

function collect() {
    locate
    echo "collect IDE"
    ${venv_python} control.py collect
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
