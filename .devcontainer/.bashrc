. /usr/share/bash-completion/completions/git
. /etc/bash_completion.d/git-prompt
PS1='\[\033[01;32m\]\u@devctr\[\033[00m\] \[\033[01;34m\]\W\[\033[00m\]$(__git_ps1 " (%s)")]\$ '
GIT_PS1_SHOWDIRTYSTATE="true"
GIT_PS1_SHOWUNTRACKEDFILES="true"
echo "See /usr/lib/git-core/git-sh-prompt for prompt details."