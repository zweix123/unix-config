+ 本配置配套教程：[zweix's Linux配置指南](https://github.com/zweix123/CS-notes/blob/master/Missing-Semester/LinuxConfigGuide.md) | [zweix's macOS配置教程](https://github.com/zweix123/CS-notes/blob/master/Missing-Semester/macConfigGuide.md)

## Content

+ tmux配置
    >默认prefix key为`Ctrl + b`，我目前使用`Ctrl + x`
    >>最开始我个人使用`Ctrl + a`, 但是和qemu冲突, 无奈改成这个
+ vim配置
  + 基础是Acwing提供的配置
  + 配色使用最经典的gruvbox
  + 功能性插件不断扩展中
+ zsh配置（核心是主题和插件）
  + 主题魔改自官方主题`ys`，简约效率风
  + 插件即常用插件

## Use

+ 按照我的教程配置Unix机器，即下载好zsh、oh-my-zsh其插件

+ 下载：
    ```bash
    git clone https://github.com/zweix123/unix-config.git
    cd unix-config/
    ```
+ 备份（一定要进行备份，下面的下载脚本会删除本来的一些文件或目录）：
    ```bash
    bash backup.sh
    ```
+ 下载：
    ```bash
    bash install.sh
    ```
+ 查看：
    ```bash
    source ~/.zshrc
    ```

## Intro

+ 脚本`install.sh`用于将项目中的配置覆盖到本地上
+ 脚本`backup.sh`用于为本地的配置做备份
+ 脚本`collect.sh`用于将本地的配置归档回项目中（不包含`.vim`目录下的文件）
+ `.vimrc`是vim的配置文件
+ `.tmux.conf`是tmux的配置文件
+ 脚本`changekey.sh`为改键脚本，个人习惯使用`Caps`来使用历史命令补全
  >仅保证Linux发行版可行，不保证macOS可行