alias cl="clear"
alias g="git"
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"
alias ls="ls -l"
alias resource=". ~/.zshrc"

if [ -x /usr/local/bin/gpg2 ]; then
  function gpg {
    gpg2
  }
fi
