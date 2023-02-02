# note：
# 主题指的是每句命令行的样子，一种命令行可以分成左对齐部分和右对齐部分
# PROMPT='左边部分'
# RPROMPT='右边部分'

# 下面是命令行的元素：
# 
# %n - username
# %m - short name of the current host
# %M - name of curent host
# %# - a `%` or a `#`, depending on whether the shell is running as root or not
# %~ - relative path
# %/ or %d - absolute path
# %c or %C - Trailing component of the current working directory.
# %t - time 12hr am/pm format
# %T - time 24hr format
# %w - day and date (day-dd)
# %D - Date (default: yy-mm-dd)
# %D{%f} - day of the month
# %l or %y - The line  (tty)  the user is logged in on, without `/dev/' prefix.

# 下面是颜色的设置：
# 
# %F{237} 256 color number
# %F{red} 8 color name (black, red, green, yellow, blue, magenta, cyan, white)
# $FG[237] (notice the $ sign instead of %) 256 color number
# $fg[red] (notice the $ and lower case fg) 8 color name (black, red, green, yellow, blue, magenta, cyan, white)
# %{$fg_bold[blue]%} bold variants
# %F is Foreground color, $f for resetting foreground color
# %K is bacKground color, %k for resetting background-color
# $reset_color is a Zsh variable that resets the color of the output
# You can use Unicode for symbols
# %E Clear to end of the line.
# %U (%u) to Start (stop) underline mode.

# Ege:
# %{%fg_bold[blue]%}%n%{reset_color%}  # 改成蓝色的用户名字段且不影响其他地方

PROMPT=''  # 开始设计左边
PROMPT+='%{$fg[yellow]%}%n@%m%{$reset_color%}'  # 黄色的`user@hostname`
PROMPT+=':'
PROMPT+='%{$fg[cyan]%}%~%{$reset_color%}'  # 青色的路径
PROMPT+=" "
PROMPT+='$(git_prompt_info)'  # git

PROMPT+="
"
# 换行

PROMPT+="%(?:%{$fg_bold[green]%}➜:%{$fg_bold[red]%}➜)%{$reset_color%}"
PROMPT+=" "

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
