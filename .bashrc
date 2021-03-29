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

# Taskwarrior config location
export TASKRC=~/.config/taskwarrior/.taskrc
export TASKDATA=~/.config/taskwarrior/.task
export TIMEWARRIORDB=~/.config/taskwarrior/.timewarrior

# This is the list for lf icons:
export LF_ICONS="di=📁:\
fi=📃:\
tw=🤝:\
ow=📂:\
ln=⛓:\
or=❌:\
ex=🎯:\
*.txt=✍:\
*.mom=✍:\
*.me=✍:\
*.ms=✍:\
*.png=🖼:\
*.webp=🖼:\
*.ico=🖼:\
*.jpg=📸:\
*.jpe=📸:\
*.jpeg=📸:\
*.gif=🖼:\
*.svg=🗺:\
*.tif=🖼:\
*.tiff=🖼:\
*.xcf=🖌:\
*.html=🌎:\
*.xml=📰:\
*.gpg=🔒:\
*.css=🎨:\
*.pdf=📚:\
*.djvu=📚:\
*.epub=📚:\
*.csv=📓:\
*.xlsx=📓:\
*.tex=📜:\
*.md=📘:\
*.r=📊:\
*.R=📊:\
*.rmd=📊:\
*.Rmd=📊:\
*.m=📊:\
*.mp3=🎵:\
*.opus=🎵:\
*.ogg=🎵:\
*.m4a=🎵:\
*.flac=🎼:\
*.wav=🎼:\
*.mkv=🎥:\
*.mp4=🎥:\
*.webm=🎥:\
*.mpeg=🎥:\
*.avi=🎥:\
*.mov=🎥:\
*.mpg=🎥:\
*.wmv=🎥:\
*.m4b=🎥:\
*.flv=🎥:\
*.zip=📦:\
*.rar=📦:\
*.7z=📦:\
*.tar.gz=📦:\
*.z64=🎮:\
*.v64=🎮:\
*.n64=🎮:\
*.gba=🎮:\
*.nes=🎮:\
*.gdi=🎮:\
*.1=ℹ:\
*.nfo=ℹ:\
*.info=ℹ:\
*.log=📙:\
*.iso=📀:\
*.img=📀:\
*.bib=🎓:\
*.ged=👪:\
*.part=💔:\
*.torrent=🔽:\
*.jar=♨:\
*.java=♨:\
"
