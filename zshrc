# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
#--Laravel Artisan 指令
zplug "jessarcher/zsh-artisan"

#--超強cd指令補完工具
zplug "b4b4r07/enhancd", use:init.sh

# Bookmarks and jump
#zplug "jocelynmallon/zshmarks"

#--檔案列表中增加git特徵資訊
zplug "supercrabtree/k"

# Tips for aliases
zplug "djui/alias-tips"

# python-poetry
zplug "darvid/zsh-poetry"

# Load theme
# zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme
zplug romkatv/powerlevel10k, as:theme, depth:1

# Prompt at the bottom of the terminal
printf '\n%.0s' {1..100}

# Theme setup
# move theme config to p10k.zsh file

export ZSH_PLUGINS_ALIAS_TIPS_TEXT=' alias hint: '

# pyenv
export PYENV_ROOT="$HOME/.pyenv"

# User configuration
export PATH="$HOME/.dotfiles/bin:$HOME/.poetry/bin:$HOME/.bin:/usr/local/bin:$PYENV_ROOT/bin:$PATH"
export LANG=en_US.UTF-8
export EDITOR='vim'
export TERM="xterm-256color"
[[ -n "$SSH_CLIENT" ]] || export DEFAULT_USER="tuvix"
export KEYTIMEOUT=1

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

# Pyenv initialize
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
