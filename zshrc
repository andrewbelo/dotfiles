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
ZSH_THEME="refined"

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
    git colorize ubuntu vi-mode
    pdm python pip lets kubectl kubectx
    docker docker-compose
    helm fzf spaceship-vi-mode
)

source $ZSH/oh-my-zsh.sh

# User configuration
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


### Set manpager
### "bat" as manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

### "vim" as manpager
# export MANPAGER='/bin/bash -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'

### "nvim" as manpager
# export MANPAGER="nvim -c 'set ft=man' -"

export PATH=$PATH:$HOME/bin
export MANPATH="/usr/local/man:$MANPATH"
export PATH=/home/belo/.local/bin:$PATH
# You may need to manually set your language environment
export LANG=en_GB.UTF-8
export LC_ALL=en_GB.UTF-8
export PYTHONBREAKPOINT="pudb.set_trace"

# Editor aliases
export EDITOR=/usr/bin/nvim.appimage
export VISUAL=/usr/bin/nvim.appimage
# Shortcuts to config files
alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"
alias vi="/usr/bin/nvim.appimage"
alias nvim="/usr/bin/nvim.appimage"
export VIMCOFIG=~/.config/nvim
export VIMDATA=~/.local/share/nvim
export MYVIMRC=$VIMCOFIG/init.lua
# Python Shortcuts & virtualenvwrapper config
alias py='/usr/bin/python3.11'
alias pyso='source .venv/bin/activate'
alias zshso='source ~/.zshrc'
alias pip=pip3
alias ktx=kubectx
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
alias glb='git log --graph --simplify-by-decoration --pretty=format:'%d' --all'
alias gl='git log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate'
alias gs='git status'
alias jme='jira issue list \
    -q "Sprint in openSprints() AND Sprint not in futureSprints() AND resolution = Unresolved AND assignee in (currentUser())" \
    --order-by updated --columns key,summary,status,reporter'

alias day='gcalcli agenda --details conference $(date +%m-%d) $(date -d '+1 day' +%m-%d)'

source ~/dotfiles/fzf/completion.zsh
source ~/dotfiles/fzf/key-bindings.zsh
bindkey -s ^k "tmux-sessionizer\n"
bindkey -s ^p "ranger\n"

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


export MILVUSDM_PATH='/home/a.belo/milvusdm'
export LOGS_NUM=0
export JIRA_API_TOKEN='MTQxMTY5Mzc0MzMyOlZYynUsksq9DSY9I5gHKW/tLIsR'
export JIRA_AUTH_TYPE='bearer'

autoload -U compinit && compinit

# Turso
export PATH="/home/a.belo/.turso:$PATH"

autoload -U compinit; compinit

eval $(thefuck --alias f)
