#! /usr/bin/env python3


import json
import os
import shutil
import sys

# from rich import print

# 区分Windows、Linux和macOS
IS_WINDOWS = os.name == "nt"
IS_LINUX = os.name == "posix" and os.uname().sysname == "Linux"
IS_MACOS = os.name == "posix" and os.uname().sysname == "Darwin"

if not IS_MACOS:  # 目前只支持macOS
    print("unsupported OS: ", os.name)
    sys.exit(1)

VSCODE_FOLDER = os.path.expanduser("~/Library/Application Support/Code")
CURSOR_FOLDER = os.path.expanduser("~/Library/Application Support/Cursor")

VSCODE_SETTINGS = os.path.join(VSCODE_FOLDER, "User", "settings.json")
CURSOR_SETTINGS = os.path.join(CURSOR_FOLDER, "User", "settings.json")


SETTINGS = "./settings.json"


def setting_corver(corver: dict, be_corvered: dict) -> dict:
    for k, v in corver.items():
        be_corvered[k] = v
    return be_corvered


def read_settings(settings_file: str) -> dict:
    content = ""
    # 手动过滤注释(并不是Json标准的东西)
    with open(settings_file, "r", encoding="utf-8") as f:
        for line in f:
            if "//" in line:  #! 默认正文中没有//
                line = line[: line.index("//")]
            content += line

    try:
        return json.loads(content)
    except json.JSONDecodeError as e:
        print(f"error: {e}")
        print(settings_file)
        print(content)
        raise e


def read_config_settings() -> dict:
    return read_settings(SETTINGS)


def read_vscode_settings() -> dict:
    return read_settings(VSCODE_SETTINGS)


def read_cursor_settings() -> dict:
    return read_settings(CURSOR_SETTINGS)


def write_settings(settings_file: str, settings: dict):
    with open(settings_file, "w", encoding="utf-8") as f:
        json.dump(settings, f, ensure_ascii=False)


def write_config_settings(settings: dict):
    write_settings(SETTINGS, settings)


def write_vscode_settings(settings: dict):
    write_settings(VSCODE_SETTINGS, settings)


def write_cursor_settings(settings: dict):
    write_settings(CURSOR_SETTINGS, settings)


def install():
    print("install IDE")
    settings = read_config_settings()
    if os.path.exists(VSCODE_SETTINGS):
        write_vscode_settings(setting_corver(settings, read_vscode_settings()))
    else:
        print("vscode settings not found")
    if os.path.exists(CURSOR_SETTINGS):
        write_cursor_settings(setting_corver(settings, read_cursor_settings()))
    else:
        print("cursor settings not found")


def backup():
    print("backup IDE")
    if os.path.exists(VSCODE_SETTINGS):
        shutil.copy(VSCODE_SETTINGS, VSCODE_SETTINGS + ".backup")
    else:
        print("vscode settings not found")
    if os.path.exists(CURSOR_SETTINGS):
        shutil.copy(CURSOR_SETTINGS, CURSOR_SETTINGS + ".backup")
    else:
        print("cursor settings not found")


def collect():
    print("IDE collect")
    """
    收集配置中有的键的在本地配置的值,
    但是是选择vscode的还是cursor的呢?
    姑且选择cursor的吧.
    """
    if os.path.exists(CURSOR_SETTINGS):
        write_config_settings(
            setting_corver(read_cursor_settings(), read_config_settings())
        )
    else:
        print("cursor settings not found")


def locate():
    CURRENT_FOLDER = os.path.dirname(os.path.abspath(__file__))
    os.chdir(CURRENT_FOLDER)


if __name__ == "__main__":
    locate()
    if len(sys.argv) != 2:
        print(f"用法: {sys.argv[0]} {{install|backup|collect}}")
        sys.exit(1)

    action = sys.argv[1]
    if action == "install":
        install()
    elif action == "backup":
        backup()
    elif action == "collect":
        collect()
    else:
        print(f"用法: {sys.argv[0]} {{install|backup|collect}}")
        sys.exit(1)


"""
考虑一下行为, VSCode的Setting是允许重复的键的, 但是python json是不允许的(后者覆盖前者)
直接覆盖可以么? 应该是可以的, 估计VSCode也是这样实现的
但是假如一个重复的键, 其值是列表类型, 这个怎么处理呢? 看起来应该将列表合并, 但是除非手动解析, 不然在python json无法实现, 估计VSCode也不实现, 也是后者覆盖前者
首先在配置项中, 我们可以避免这样的情况,
其次是读取本地的配置, 这种情况看起来不能避免, 比如用户就是有两个相同的键, 上面是自带/默认的, 下面是自己的, 并且认为是并列的(但是真的是并列的么?)
不管了, 这样的东西搞不了, 就是配置里有的键会覆盖本地的.
"""
