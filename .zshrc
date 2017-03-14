################
# Z Shell Config
#
################

setopt prompt_subst
setopt shwordsplit

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

################
# COLORS
################
export CLICOLOR=1
export LSCOLORS=Cxfxaxdxbxegedabagacad #MacOS only
export LS_COLORS='di=1;32:fi=36:ln=34:so=32:pi=0;33:ex=31:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=1;34:ow=1;34:'

################
# ALIASES
################
if [[ -f ~/.dotfiles/aliases/alias.zsh ]]; then
  source ~/.dotfiles/aliases/alias.zsh
fi

if [[ -f ~/.dotfiles/aliases/common ]]; then
  source ~/.dotfiles/aliases/common
fi

################
# FUNCTIONS AND
# AUTOCOMPLETION
################
zstyle ':completion:*:*:git:*' script ~/.dotfiles/completion/.git-completion.zsh
zstyle ':completion:*' special-dirs true # Fixes completion on ../
zstyle ':completion:*' list-colors ''
fpath=(~/.dotfiles/completion ~/.dotfiles/functions $fpath)
autoload -Uz clean compinit && compinit

autoload -U gitprompt
RPROMPT='$(gitprompt status)'

# Different terminal cases
if [[ $TERM_PROGRAM == "Hyper" ]]; then
  autoload -Uz promptinit; promptinit
  prompt pure
else
  if [[ $TERM_PROGRAM == "Apple_Terminal" ]]; then
    # When on MacOS
    TITLE="\e]1;`PWD`\a"
  else
    if [[ -n $SSH_CONNECTION ]]; then
      IPADR=$SSH_CONNECTION[(ws: :)4]
      TITLE="\e]1;${USER}@${IPADR}\a"
    else
      TITLE="\e]1;Terminal\a"
    fi
  fi

  TITLE="\e]0;\a${TITLE}"
  precmd () {print -Pn $TITLE}
  PS1='%F{blue}at %B%~%b%f%F{white} $(gitprompt branch)
%F{magenta}%B❯%b%F{white} '
fi
