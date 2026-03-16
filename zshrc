# zmodload zsh/datetime
# setopt PROMPT_SUBST
# PS4='+$EPOCHREALTIME %N:%i> '
#
# logfile=$(mktemp zsh_profile.XXXXXXXX)
# echo "Logging to $logfile"
# exec 3>&2 2>$logfile
#
# setopt XTRACE # If you come from bash you might have to change your $PATH.
# # export PATH=$HOME/bin:/usr/local/bin:$PATH

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
    git colorize ubuntu vi-mode python kubectl kubectx
    docker docker-compose helm fzf
)
source $ZSH/oh-my-zsh.sh

if [ -f "$HOME/dotfiles/.secrets.sh" ] && [ -r "$HOME/dotfiles/.secrets.sh" ]; then
    source "$HOME/dotfiles/.secrets.sh"
else
    echo "Warning: ~/.secrets.sh not found or not readable. Secrets not loaded." >&2
fi

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
# alias lynx='lynx -vikeys -cookies -accept_all_cookies -cookie_file=~/dotfiles/cookies.txt'
alias \?=duck
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
alias stg2="kubectx a.belo@olympus-new"
alias prd="kubectx a.belo@prod"
alias ams="kubectx a.belo@ams"
kubectx_mapping[a.belo@staging]="${COLOR_GREEN}STG"
kubectx_mapping[a.belo@prod]="${COLOR_RED}PRD"
kubectx_mapping[a.belo@ams]="${COLOR_LUSTER}AMS"
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
alias back='cd $(git rev-parse --show-toplevel)'
alias jme='jira issue list \
    -q "Sprint in openSprints()  AND resolution = Unresolved AND assignee in (currentUser())" \
    --order-by status --reverse --columns key,summary,status,reporter'
alias jopen='jira issue list \
    -q "status not in ("Closed", "Done", "Resolved", \"On hold\", "Backlog") \
    AND assignee in (currentUser())" \
    --order-by updated --columns key,summary,status,reporter'
alias jhold='jira issue list \
    -q "status in ( \"On hold\", "Backlog") AND assignee in (currentUser())" \
    --order-by updated --columns key,summary,status,reporter'
alias jwait='jira issue list \
    -q "status in ( \"In test\", "Requirements") AND assignee in (currentUser())" \
    --order-by updated --columns key,summary,status,reporter'

alias day='gcalcli agenda --details conference $(date +%m-%d) $(date -d '+1 day' +%m-%d)'
alias l='ls -lah --group-directories-first'

source ~/dotfiles/fzf/completion.zsh
source ~/dotfiles/fzf/key-bindings.zsh
bindkey -s ^k "tmux-sessionizer\n"

export FLYCTL_INSTALL="/home/a.belo/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/.config/picum/build/src:$PATH"
export PATH="$HOME/work/datagrip/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:${HOME}/go/bin
export PATH=$PATH:/home/a.belo/.cargo/bin:$HOME/.cargo/env
export PATH=$PATH:${HOME}/.cargo/bin
export PATH="${PATH}:${HOME}/.krew/bin"
export PATH="${PATH}:${HOME}/dotfiles/scripts"
export PATH="${PATH}:~/.local/share/coursier/bin"
export PATH="${PATH}:${HOME}/bin"
export PATH="${PATH}:${HOME}/personal/Discord"
export PATH="${PATH}:/home/linuxbrew/.linuxbrew/bin"
export PATH="${PATH}:${HOME}/dotfiles/i3-battery-popup"
export PATH="${PATH}:${HOME}/bin/XpdfReader-linux64-4.04/"
export PATH="${PATH}:${HOME}/work/zen/zen"
export PATH="$HOME/.cargo/bin:$PATH"

export XDG_CONFIG_HOME='/home/a.belo/.config/'
# Turso
export PATH="/home/a.belo/.turso:$PATH"

# LETS
source <(lets completion -s zsh)

autoload -U compinit; compinit

fpath=(~/.my-completions $fpath)

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"


. "$HOME/.cargo/env"
eval "$(uv generate-shell-completion zsh)"
# unsetopt XTRACE
# exec 2>&3 3>&-

# opencode
export PATH=/home/a.belo/.opencode/bin:$PATH
