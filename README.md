+ 本配置配套教程：[zweix的Linux配置指南](https://github.com/zweix123/CS-notes/blob/master/Missing-Semester/LinuxConfigGuide.md)

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

+ 按照我的教程配置Linux机器，即下载好zsh、oh-my-zsh其插件

+ 下载：
    ```bash
    git clone https://github.com/zweix123/linux-config.git
    cd linux-config/
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
+ 脚本`collect.sh`用于将本地的配置归档回项目中
    >这里关于vim的配置除了配置文件外还有相关文件，这些文件我个人保存在另一个项目中，您看一下脚本`collect.sh`就明白了，如果您要做您自己的定制化，要调整这部分。
    >>在之后我关掉了collect脚本的自动push。

+ `.vimrc`是vim的配置文件
    >就像上面说的，关于vim的配置还有一部分在另外的项目中
+ `.tmux.conf`是tmux的配置文件
+ 脚本`changekey.sh`为改键脚本，个人习惯使用`Caps`来使用历史命令补全
