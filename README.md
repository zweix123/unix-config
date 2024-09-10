# Unix Config

+ 本配置配套教程：[zweix's Linux配置指南](https://github.com/zweix123/CS-notes/blob/master/Missing-Semester/LinuxConfigGuide.md) | [zweix's macOS配置教程](https://github.com/zweix123/CS-notes/blob/master/Missing-Semester/macOSConfigGuide.md)

## Content

+ [tmux](./tmux): tmux配置
+ [vim](./vim): vim配置
+ [vscode](./vscode): vscode配置
+ [zsh](./zsh): zsh配置

+ [script](./script): (杂项)脚本

以上这部分的目录下都有对应的README

## Usage

项目根目录下有`control.sh`脚本, 执行查看

```bash
> ./control.sh        
用法: ./control.sh {install|backup|collect}
```

三个选项分别用于

+ install: 下载, 将项目中的配置复制覆盖到本地
+ backup: 备份, 为本地的原本的配置做备份
+ collect: 归档, 将本地的对应的配置归档回项目中

强烈建议在install之前backup!!!

control.sh脚本有三个函数分别对应上面三个选项,
在每个函数中, 则是调用对应子目录下的control.sh脚本,
而子目录下的control.sh脚本与项目根目录下的control.sh结构上是完全一致的,
所以假如不想使用所有的配置, 可以到对应的目录下执行其对应的control.sh脚本.
