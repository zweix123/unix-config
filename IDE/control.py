#! /usr/bin/env python3

import json
import os
import shutil
import sys

from rich import print

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


def merge(a: dict, b: dict) -> dict:
    r = a.copy()
    for k, v in b.items():
        if k in r:
            if isinstance(v, dict):
                r[k] = merge(r[k], v)
            elif isinstance(v, list):
                r[k] = r[k] + v
                r[k] = list(set(r[k]))
            else:
                r[k] = v
        else:
            r[k] = v
    return r


def read_settings():
    content = ""
    with open(SETTINGS, "r", encoding="utf-8") as f:
        for line in f:
            if "//" in line:  #! 假设正文没有//
                line = line[: line.index("//")]
            content += line
    #! json库不能识别重复的键, 需要在settings.json手动的合并
    return json.loads(content)


def install():
    settings = read_settings()
    if os.path.exists(VSCODE_SETTINGS):
        with open(VSCODE_SETTINGS, "r", encoding="utf-8") as f:
            settings = merge(settings, json.load(f))
    if os.path.exists(CURSOR_SETTINGS):
        with open(CURSOR_SETTINGS, "r", encoding="utf-8") as f:
            settings = merge(settings, json.load(f))
    with open(VSCODE_SETTINGS, "w", encoding="utf-8") as f:
        json.dump(settings, f, ensure_ascii=False)
    with open(CURSOR_SETTINGS, "w", encoding="utf-8") as f:
        json.dump(settings, f, ensure_ascii=False)
    print("install IDE")


def backup():
    if os.path.exists(VSCODE_SETTINGS):
        shutil.copy(VSCODE_SETTINGS, VSCODE_SETTINGS + ".backup")
    if os.path.exists(CURSOR_SETTINGS):
        shutil.copy(CURSOR_SETTINGS, CURSOR_SETTINGS + ".backup")
    print("backup IDE")


def collect():
    print("unsupported IDE collect")


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
