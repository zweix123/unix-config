+ 教程：[zweix的linux配置指南](https://github.com/zweix123/CS-notes/blob/master/Missing-Semester/Linux%E6%9C%BA%E5%99%A8%E9%85%8D%E7%BD%AE%E6%8C%87%E5%8D%97.md)

简约效率风，魔改自官方主题ys

### 效果

![](https://cdn.jsdelivr.net/gh/zweix123/linux-config@master/source/mine.png)

### 使用

+ 脚本`install.sh`用于将项目中的配置覆盖到本地上
+ 脚本`backup.sh`用于为本地的配置做备份
+ 脚本`collect.sh`用于将本地的配置归档回项目中

1. 按照我的教程配置Linux，即下载好zsh、oh-my-zsh和两个插件
2. 将该项目clone到本地并进入
3. 运行项目下的`install.sh`

### Log

+ [ ] 命令历史补全中补全部分和已经输入部分颜色相同
+ [ ] 使用`git clone ...`语句时的语法高亮有bug
+ [x] 添加改键脚本，将Caps改为Right用于zsh历史命令补全
