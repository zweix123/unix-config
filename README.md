+ 本配置配套教程：[zweix的Linux配置指南](https://github.com/zweix123/CS-notes/blob/master/Missing-Semester/LinuxConfigGuide.md)

## Result
我统一了自己的win和linux的命令行主题样式，所以效果和win上的命令行效果一致
>我的[win终端配置](https://github.com/zweix123/posh-config)

## QuickStart

+ 按照我的教程配置Linux机器，即下载好zsh、oh-my-zsh和两个插件

+ 下载：
    ```bash
    git clone https://github.com/zweix123/linux-config.git
    cd linux-config/
    ```
+ 备份：
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

+ `.vimrc`是vim的配置文件
+ `.tmux.conf`是tmux的配置文件
+ 脚本`changekey.sh`为改键脚本，个人习惯使用`Caps`来使用历史命令补全

## Log

+ [ ] bug:[2023.02.04]命令历史补全中补全部分和已经输入部分颜色相同
+ [ ] bug:[2023.02.04]使用`git clone ...`语句时的语法高亮有bug
    解决[2023.02.15]：[教程](https://blog.csdn.net/HideOnLie/article/details/107661295)
+ [x] better:[2023.02.15]添加改键脚本，将Caps改为Right用于zsh历史命令补全
+ [x] bug:在容器中使用zsh自动补全自动出现两个无法删除的字符
    解决[2023.02.15]：[教程](https://blog.csdn.net/LittleSeedling/article/details/125193572)
+ [x] debug:[2023.02.16]主题用于root用户会出现用户名渲染错误
