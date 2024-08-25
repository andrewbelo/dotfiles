# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation. 
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$HOME/dotfiles/zsh-custom"
[ -z "$TMUX" ] && export TERM=xterm-256color
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="lucklaster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

autoload -U compinit
compinit -i

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"


plugins=(
    git colorize ubuntu vi-mode pdm python pip kubectl kubectx
    docker docker-compose helm fzf
)
source $ZSH/oh-my-zsh.sh

# User configuration
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


### Set manpager "bat" as manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export PATH=$PATH:$HOME/bin
export MANPATH="/usr/local/man:$MANPATH"
export PATH=/home/belo/.local/bin:$PATH
# You may need to manually set your language environment
export LANG=en_GB.UTF-8
export LC_ALL=en_GB.UTF-8
export PYTHONBREAKPOINT="pudb.set_trace"

# Editor aliases
export EDITOR=nvim $f
export VISUAL=nvim
# Shortcuts to config files
alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"
alias vi=nvim
export VIMCOFIG=~/.config/nvim
export VIMDATA=~/.local/share/nvim
export MYVIMRC=$VIMCOFIG/init.lua
# Python Shortcuts & virtualenvwrapper config
alias py=python
alias pyso='source .venv/bin/activate'
alias zshso='source ~/.zshrc'
alias pip=pip3
alias ktx=kubectx
alias stg="kubectx a.belo@staging"
alias prd="kubectx a.belo@prod"
alias ams="kubectx a.belo@ams"
kubectx_mapping[a.belo@staging]="${COLOR_GREEN}STG"
kubectx_mapping[a.belo@prod]="${COLOR_RED}PRD"
kubectx_mapping[a.belo@ams]="${COLOR_LUSTER}AMS"
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
alias back='cd $(git rev-parse --show-toplevel)'
alias glb='git log --graph --simplify-by-decoration --pretty=format:'%d' --all'
alias gl='git log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate'
alias gs='git status'
alias jme='jira issue list \
    -q "Sprint in openSprints()  AND resolution = Unresolved AND assignee in (currentUser())" \
    --order-by updated --columns key,summary,status,reporter'

alias day='gcalcli agenda --details conference $(date +%m-%d) $(date -d '+1 day' +%m-%d)'

source ~/dotfiles/fzf/completion.zsh
source ~/dotfiles/fzf/key-bindings.zsh
bindkey -s ^k "tmux-sessionizer\n"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/.config/picum/build/src:$PATH"
export PATH="$HOME/work/datagrip/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:${HOME}/go/bin
export PATH=$PATH:/home/a.belo/.cargo/bin
export PATH="${PATH}:${HOME}/.krew/bin"
export PATH="${PATH}:${HOME}/dotfiles/scripts"
export PATH="${PATH}:~/.local/share/coursier/bin"
export PATH="${PATH}:${HOME}/bin"
export PATH="${PATH}:${HOME}/personal/Discord"
export PATH="${PATH}:/home/linuxbrew/.linuxbrew/bin"
export PATH="${PATH}:${HOME}/dotfiles/i3-battery-popup"
export PATH="${PATH}:${HOME}/bin/XpdfReader-linux64-4.04/"
fpath=(~/.my-completions $fpath)


export SHAPE="200,200,200"
export MILVUSDM_PATH='/home/a.belo/milvusdm'
export LOGS_NUM=0

# Turso
export PATH="/home/a.belo/.turso:$PATH"

# LETS
source <(lets completion -s zsh)

autoload -U compinit; compinit

eval $(thefuck --alias f)
eval $(thefuck --alias)

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/a.belo/personal/bootdotdev-cicd/google-cloud-sdk/path.zsh.inc' ]; then . '/home/a.belo/personal/bootdotdev-cicd/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/a.belo/personal/bootdotdev-cicd/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/a.belo/personal/bootdotdev-cicd/google-cloud-sdk/completion.zsh.inc'; fi
source "$HOME/.rye/env"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/a.belo/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/a.belo/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/a.belo/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/a.belo/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
