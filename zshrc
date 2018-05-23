# :: Zplug - ZSH plugin manager
export ZPLUG_HOME=$HOME/.zplug

# Locale settings (utf-8)
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Check if zplug is installed
if [[ ! -d $ZPLUG_HOME ]]; then
  #git clone https://github.com/zplug/zplug $ZPLUG_HOME
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
  source $ZPLUG_HOME/init.zsh && zplug update --self
fi

# Essential
source $ZPLUG_HOME/init.zsh

# Zplug plugins
zplug "zplug/zplug", hook-build:"zplug --self-manage"

zplug "modules/tmux",       from:prezto
zplug "modules/history",    from:prezto
zplug "modules/utility",    from:prezto
#zplug "modules/ssh",        from:prezto
zplug "modules/terminal",   from:prezto
zplug "modules/editor",     from:prezto
zplug "modules/directory",  from:prezto
zplug "modules/completion", from:prezto

# zsh users
#--自動完成
zplug "zsh-users/zsh-completions",              defer:0
#--智慧提示
zplug "zsh-users/zsh-autosuggestions",          defer:2, on:"zsh-users/zsh-completions"
#--標示可以使用的指令
zplug "zsh-users/zsh-syntax-highlighting",      defer:3, on:"zsh-users/zsh-autosuggestions"
#--輸入歷史搜尋
zplug "zsh-users/zsh-history-substring-search", defer:3, on:"zsh-users/zsh-syntax-highlighting"

# Plugins from oh my zsh
#--整合系統剪貼簿
zplug "lib/clipboard", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"
#zplug "plugins/vi-mode", from:oh-my-zsh
#--增加git的指令提示
zplug "plugins/git", from:oh-my-zsh
#--增加Docker的指令提示
zplug "plugins/docker", from:oh-my-zsh
#--增加docker-compose的指令提示
zplug "plugins/docker-compose", from:oh-my-zsh

# Laravel
#--增加Composer的指令提示
zplug "plugins/composer", from:oh-my-zsh
#--增加Laravel的指令提示
zplug "plugins/laravel5", from:oh-my-zsh

#--超強cd指令補完工具
zplug "b4b4r07/enhancd", use:init.sh

# Bookmarks and jump
#zplug "jocelynmallon/zshmarks"

#--檔案列表中增加git特徵資訊
zplug "supercrabtree/k"

# Tips for aliases
zplug "djui/alias-tips"


# Load theme
zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme

# Theme setup
#POWERLEVEL9K_MODE='awesome-fontconfig'
POWERLEVEL9K_PROMPT_ON_NEWLINE=false
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="❱ "
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status docker_machine virtualenv background_jobs time history)
POWERLEVEL9K_DISABLE_RPROMPT=false
POWERLEVEL9K_ALWAYS_SHOW_CONTEXT=false

POWERLEVEL9K_STATUS_VERBOSE=true
POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=false

POWERLEVEL9K_SHORTEN_DIR_LENGTH=5
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"

POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND="black"
POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND="blue"
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND="black"
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND="yellow"
POWERLEVEL9K_STATUS_ERROR_FOREGROUND="black"
POWERLEVEL9K_STATUS_ERROR_BACKGROUND="red"
POWERLEVEL9K_STATUS_OK_FOREGROUND="black"
POWERLEVEL9K_STATUS_OK_BACKGROUND="green"
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND="black"
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND="yellow"
POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND="black"
POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND="red"
POWERLEVEL9K_NODE_VERSION_BACKGROUND="red"
POWERLEVEL9K_NODE_VERSION_FOREGROUND="white"

export ZSH_PLUGINS_ALIAS_TIPS_TEXT=' alias hint: '

# User configuration
export PATH="$HOME/.dotfiles/bin:$HOME/.bin:/usr/local/bin:$PATH"
export LANG=en_US.UTF-8
export EDITOR='vim'
export TERM="xterm-256color"
[[ -n "$SSH_CLIENT" ]] || export DEFAULT_USER="tuvix"
export KEYTIMEOUT=1

# Multiline/Singleline
alias multi_line="export POWERLEVEL9K_PROMPT_ON_NEWLINE=true"
alias single_line="export POWERLEVEL9K_PROMPT_ON_NEWLINE=false"

# Findfile and find content
function f() { find . -iname "*$1*" ${@:2} }
function r() { grep "$1" ${@:2} -R . }

# Docker VMs
#alias dev=ubuntu-dev
#function ubuntu-dev {
#  id=$(uuidgen | cut -c 1-4)
#  name=$USER-ubuntu-dev-$id
#  docker run -ti --rm --name $name --hostname $name --volumes-from dev-volumes -w $PWD -u dev drahosp/ubuntu-dev "$@"
#}

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Load everything
zplug load

if zplug check "zsh-users/zsh-syntax-highlighting"; then
    # To have paths colored instead of underlined
    ZSH_HIGHLIGHT_STYLES[path]='fg=cyan'
fi


# :: Aliases and functions
alias ls="ls --color=auto"
alias ll="ls -alF"
alias kk="k -a"
alias c="clear"
alias python="python3"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
