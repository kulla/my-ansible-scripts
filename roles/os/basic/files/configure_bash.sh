HISTSIZE=1000
HISTFILESIZE=0
HISTIGNORE=history*

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;30m\]\W\[\033[01;32m\]$(__git_ps1 " (%s)")\[\033[01;30m\]\$\[\033[00m\] '
