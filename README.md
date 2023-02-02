zweix的Linux配置（[Linux配置指南](https://github.com/zweix123/blog/blob/master/Linux%E6%9C%BA%E5%99%A8%E9%85%8D%E7%BD%AE%E6%8C%87%E5%8D%97.md)）
>借鉴了[这个oh-my-zsh的配置](https://github.com/Codesire-Deng/rc)

### 说明

+ 已有的配置：
    + vim配置
    + tmux配置
    + zsh配置
    + oh-my-zsh主题

+ 没有的配置（需要按照教程安装）：
    + oh-my-zsh语法高亮插件
    + oh-my-zsh命令历史补全插件
    >没有的原因，`.oh-my-zsh`下有`.git`目录，我还不知道怎么将这样的子目录完全维护在当前项目的`.git`下，使用`git add submodel`并不能实现内容拷贝般的维护

### 使用

>zsh和oh-my-zsh的按照依照上面的教程

```bash
# git and cd linux-config
zsh install.sh
```

+ 脚本`collect.sh`可用于更新配置后归档所有配置文件

### 后续目标

现在的命令历史补全是全白色，后续尝试修改插件源码使之变成更自然的灰色
