HISTSIZE=1000
HISTFILESIZE=0
HISTIGNORE=history*

# See https://gist.github.com/justintv/168835#gistcomment-1717504
PS1='$(E=$?; if [ $E != 0 ]; then echo "\033[0;35m(Error: $E) "; fi)\[\033[0;32m\]\[\033[0m\033[0;32m\]\u\[\033[0;36m\] @ \[\033[0;36m\]\h \w\[\033[0;32m\]$(__git_ps1)\n\[\033[0;32m\]└─\[\033[0m\033[0;32m\] \$\[\033[0m\033[0;32m\] ▶\[\033[0m\] '
