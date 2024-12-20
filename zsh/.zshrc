# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="zweix"
unsetopt prompt_cr prompt_sp

# Display python virtualenv
VIRTUAL_ENV_DISABLE_PROMPT="true"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    # z
    git
    history
    zsh-completions
    colored-man-pages
    command-not-found
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

# emulate bash  # 对bash进行仿真，这样在脚本文件头指明脚本路径的方式可以使用，不然不可以；虽然依然可以。

# de auto-completion bug
# export LC_ALL=en_US.UTF-8
# export LANG=en_US.UTF-8

# modify syntax-highlighting effect
export TERM=xterm-256color

OS_NAME=$(uname -s)

if [[ "$OS_NAME" == "Linux" ]]; then
elif [[ "$OS_NAME" == "Darwin" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
fi

# Programming Language
## Python
if [[ "$OS_NAME" == "Linux" ]]; then
    export PATH = $(brew --prefix python)/libexec/bin:$PATH # macOS会自带一个Python(我当时是3.9), 通过brew install python使用最新版的Python, 个人的开发也使用brew下载的, 故将brew下的python放入路径
elif [[ "$OS_NAME" == "Darwin" ]]; then
else
fi

## Golang
export GOSUMDB=off # fix "dial tcp: lookup xxx.com on 8.8.8.8:53: no such host"
# export GOPROXY=https://goproxy.io,direct                  # 非滴滴
export GOPROXY=http://goproxy.intra.xiaojukeji.com,direct # 滴滴

# Tools
## modern find -> fd
if [[ "$OS_NAME" == "Linux" ]]; then
    RELEASE_VERSION=$(release -s -i)
    if [[ "$RELEASE_VERSION" == "Ubuntu" ]]; then
        alias fd="fdfind"
    fi
elif [[ "$OS_NAME" == "Darwin" ]]; then
else
fi

## modern cat -> tac
if [[ "$OS_NAME" == "Linux" ]]; then
    alias tac='batcat --paging=never -n'
elif [[ "$OS_NAME" == "Darwin" ]]; then
    alias tac='bat --paging=never -n'
else
fi
# --paging=nerver bat对于大文件是默认像less那样的, 添加该参数要求其像cat本身一样直接全部输出
# -n              bat默认输出一个表格, 包括文件名、行数、内容, 使用这个参数表示直接输出本身本身, 但是仍然有行号, 不能像cat本身那样

## modern grep -> ag -> rg
# alias rg='rg --hidden --no-follow --max-columns 255 --no-heading --column -F'
# alias rg='rg --hidden --no-follow --no-heading --column -F'
alias rg='rg --no-follow --no-heading --column -F'

## modern tree -> br
source /Users/didi/.config/broot/launcher/bash/br

# Build Env
## didi
### nuwa
export GOPATH=~/nuwa
export PATH=$GOPATH/bin:$PATH
export PATH=/Users/didi/.rpc-tools:$PATH
## kvrocks
if [[ "$OS_NAME" == "Linux" ]]; then
elif [[ "$OS_NAME" == "Darwin" ]]; then
    export PATH="/opt/homebrew/opt/llvm@14/bin:$PATH"
else
fi
