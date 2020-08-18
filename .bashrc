#!/bin/bash
export GITAWAREPROMPT=$HOME/.config/bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"

stty -ixon # Disable ctrl-s and ctrl-q.
shopt -s autocd #Allows you to cd into directory merely by typing the directory name.
HISTSIZE= HISTFILESIZE= # Infinite history.
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ \[$(tput sgr0)\]"

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
