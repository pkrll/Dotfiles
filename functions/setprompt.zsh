# TODO: Make it possible to choose different prompts

function setprompt() {
  if [[ -x /usr/bin/git ]]; then
    GITPROMPT="$(git_branch)"

    if [[ ! -n $GITPROMPT ]]; then
      GITPROMPT="%B%~%b%f%F{white}"
      STSPROMPT=""
    else
      GITPROMPT="%B$(git_remote_name)%b%f%F{white} ${GITPROMPT}"
      STSPROMPT="$(git_status)"
    fi
  fi

  export PROMPT='%F{magenta}at ${GITPROMPT}
%F{magenta}%B❯%b%F{white} '
  export RPROMPT='$STSPROMPT'
}
