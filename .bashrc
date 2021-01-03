#!/bin/bash
export GITAWAREPROMPT=$HOME/.config/bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"

stty -ixon # Disable ctrl-s and ctrl-q.
shopt -s autocd #Allows you to cd into directory merely by typing the directory name.
HISTSIZE= HISTFILESIZE= # Infinite history.

# Set PS1 for terminals. Displays time, directory and git branch if in git folder
RED="\[$(tput setaf 1)\]"
GREEN="\[$(tput setaf 6)\]"
BLUE="\[$(tput setaf 4)\]"
WHITE="\[$(tput sgr0)\]"
BOLD="\[$(tput bold)\]"
export GITAWAREPROMPT=$HOME/.config/bash/git-aware-prompt
source "$HOME/.config/bash/git-aware-prompt/main.sh"
export PS1="${BOLD}${RED}[${WHITE}\t ${BOLD}${BLUE}\W${RED}]${GREEN}\$git_branch ${WHITE}"

[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

# Save current working dir
PROMPT_COMMAND='pwd > "${HOME}/.cwd" && find_git_branch; history -a'
# Change to saved working dir on load
[[ -f "${HOME}/.cwd" ]] && cd "$(< ${HOME}/.cwd)"

# Automatically start and stop ssh-agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
        ssh-agent > ~/.ssh-agent-thing
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
        eval "$(<~/.ssh-agent-thing)"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# Dart stagehand
export PATH="$PATH":"$HOME/.pub-cache/bin"
# Flutter
export PATH="$PATH":"/opt/flutter/bin";
# Android studio
export ANDROID_HOME="/opt/android-studio/bin/";
