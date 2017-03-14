# TODO: Make it possible to choose different prompts

function setprompt() {
  if [[ -x /usr/bin/git ]]; then
    GITPROMPT="$(gitprompt branch)"

    if [[ ! -n $GITPROMPT ]]; then
      GITPROMPT="%~%b%f%F{white}"
      STSPROMPT=""
    else
      STSPROMPT="$(gitprompt status)"
    fi
  fi

  export PROMPT='%F{blue}at%B $GITPROMPT
%F{magenta}%B❯%b%F{white} '
  export RPROMPT='$STSPROMPT'
}
