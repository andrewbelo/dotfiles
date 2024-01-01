#!/usr/bin/env zsh

# ------------------------------------------------------------------------------
#
# Pure - A minimal and beautiful theme for oh-my-zsh
#
# Based on the custom Zsh-prompt of the same name by Sindre Sorhus. A huge
# thanks goes out to him for designing the fantastic Pure prompt in the first
# place! I'd also like to thank Julien Nicoulaud for his "nicoulaj" theme from
# which I've borrowed both some ideas and some actual code. You can find out
# more about both of these fantastic two people here:
#
# Sindre Sorhus
#   GitHub:   https://github.com/sindresorhus
#   Twitter:  https://twitter.com/sindresorhus
#
# Julien Nicoulaud
#   GitHub:   https://github.com/nicoulaj
#   Twitter:  https://twitter.com/nicoulaj
#
# ------------------------------------------------------------------------------

# Set required options
#
setopt prompt_subst

# Load required modules
#
autoload -Uz vcs_info

# Set vcs_info parameters
#
zstyle ':vcs_info:*' enable hg bzr git
zstyle ':vcs_info:*:*' unstagedstr '!'
zstyle ':vcs_info:*:*' stagedstr '+'
zstyle ':vcs_info:*:*' formats "$FX[bold]%r$FX[no-bold]/%S" "%s:%b" "%%u%c"
zstyle ':vcs_info:*:*' actionformats "$FX[bold]%r$FX[no-bold]/%S" "%s:%b" "%u%c (%a)"
zstyle ':vcs_info:*:*' nvcsformats "%~" "" ""

# Fastest possible way to check if repo is dirty
#
git_dirty() {
    # Check if we're in a git repo
    command git rev-parse --is-inside-work-tree &>/dev/null || return
    # Check if it's dirty
    command git diff --quiet --ignore-submodules HEAD &>/dev/null; [ $? -eq 1 ] && echo "*"
}

SPACESHIP_KUBECTL_CONTEXT_SHOW="${SPACESHIP_KUBECTL_CONTEXT_SHOW=true}"
SPACESHIP_KUBECTL_CONTEXT_ASYNC="${SPACESHIP_KUBECTL_CONTEXT_ASYNC=true}"
SPACESHIP_KUBECTL_CONTEXT_PREFIX="${SPACESHIP_KUBECTL_CONTEXT_PREFIX=""}"
SPACESHIP_KUBECTL_CONTEXT_SUFFIX="${SPACESHIP_KUBECTL_CONTEXT_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_KUBECTL_CONTEXT_COLOR="${SPACESHIP_KUBECTL_CONTEXT_COLOR="cyan"}"
SPACESHIP_KUBECTL_CONTEXT_SHOW_NAMESPACE="${SPACESHIP_KUBECTL_CONTEXT_SHOW_NAMESPACE=true}"
SPACESHIP_KUBECTL_CONTEXT_COLOR_GROUPS=(${SPACESHIP_KUBECTL_CONTEXT_COLOR_GROUPS=})
spaceship_kubectl_context() {
  [[ $SPACESHIP_KUBECTL_CONTEXT_SHOW == false ]] && return

  local kube_context=$(kubectl config current-context 2>/dev/null)
  [[ -z $kube_context ]] && return

  if [[ $SPACESHIP_KUBECTL_CONTEXT_SHOW_NAMESPACE == true ]]; then
    local kube_namespace=$(kubectl config view --minify --output 'jsonpath={..namespace}' 2>/dev/null)
    [[ -n $kube_namespace && "$kube_namespace" != "default" ]] && kube_context="$kube_context ($kube_namespace)"
  fi

  local len=${#SPACESHIP_KUBECTL_CONTEXT_COLOR_GROUPS[@]}
  local it_to=$((len / 2))
  local section_color 'i'
  for ((i = 1; i <= $it_to; i++)); do
    local idx=$(((i - 1) * 2))
    local color="${SPACESHIP_KUBECTL_CONTEXT_COLOR_GROUPS[$idx + 1]}"
    local pattern="${SPACESHIP_KUBECTL_CONTEXT_COLOR_GROUPS[$idx + 2]}"
    if [[ "$kube_context" =~ "$pattern" ]]; then
      section_color=$color
      break
    fi
  done

  [[ -z "$section_color" ]] && section_color=$SPACESHIP_KUBECTL_CONTEXT_COLOR

  echo "%F{red}$kube_context"
}

# Display information about the current repository
#
repo_information() {
    echo "%F{yellow}${vcs_info_msg_0_%%/.} %F{8}$vcs_info_msg_1_`git_dirty` $vcs_info_msg_2_%f"
}

# Displays the exec time of the last command if set threshold was exceeded
#
cmd_exec_time() {
    local stop=`date +%s`
    local start=${cmd_timestamp:-$stop}
    let local elapsed=$stop-$start
    [ $elapsed -gt 5 ] && echo ${elapsed}s
}

# Get the initial timestamp for cmd_exec_time
#
preexec() {
    cmd_timestamp=`date +%s`
}

# Output additional information about paths, repos and exec time
#
precmd() {
    setopt localoptions nopromptsubst
    vcs_info # Get version control info before we start outputting stuff
    print -P "\n$(repo_information)$(spaceship_kubectl_context) %F{yellow}$(cmd_exec_time)%f"
    unset cmd_timestamp #Reset cmd exec time.
}

# Define prompts
#
PROMPT="%(?.%F{magenta}.%F{red})❯%f " # Display a red prompt char on failure
RPROMPT="%F{8}${SSH_TTY:+%n@%m}%f"    # Display username if connected via SSH

# ------------------------------------------------------------------------------
#
# List of vcs_info format strings:
#
# %b => current branch
# %a => current action (rebase/merge)
# %s => current version control system
# %r => name of the root directory of the repository
# %S => current path relative to the repository root directory
# %m => in case of Git, show information about stashes
# %u => show unstaged changes in the repository
# %c => show staged changes in the repository
#
# List of prompt format strings:
#
# prompt:
# %F => color dict
# %f => reset color
# %~ => current path
# %* => time
# %n => username
# %m => shortname host
# %(?..) => prompt conditional - %(condition.true.false)
#
# ------------------------------------------------------------------------------
