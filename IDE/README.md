# IDE

我的主要开发环境是 VSCode, AI 时代来临, Cursor 横空出世, 特别是 Cursor 在操作、配置、插件完全兼容 VSCode, 所以我很自然的转到 Cursor,
但是问题在于, 这两个软件仍然是独立的, 当 Cursor 在初始化将配置与插件拷贝过去之后, 两者就独立了;
但我个人是很习惯鼓捣工具的, 这种分裂我是无法接受的.

有没有解决办法或者曲线救国的方式呢?

对于 VSCode 需要的配置

- settings.json
- 快捷键
- 插件

最核心的插件和快捷键基本定型, 实际上, 由于 Cursor 对 AI 相关的快捷键的占用, 以及两个软件的定位的不同, 这两项的分裂是必然的;
所以我只需要维护好 settings.json 即可.

## Usage

目前只能用于 mac 上的 VSCode 和 Curosr

```bash
git clone https://github.com/zweix123/unix-config.git
cd unix-config
cd IDE && bash control.sh install && cd ..
```
