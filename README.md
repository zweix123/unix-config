+ 教程：[zweix的linux配置指南](https://github.com/zweix123/CS-notes/blob/master/Missing-Semester/Linux%E6%9C%BA%E5%99%A8%E9%85%8D%E7%BD%AE%E6%8C%87%E5%8D%97.md)

简约效率风，魔改自官方主题ys

## Result

![](https://cdn.jsdelivr.net/gh/zweix123/linux-config@master/source/mine.png)

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