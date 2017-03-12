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
export LSCOLORS=exCxCxdxbxegedabagacad

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
fpath=(~/.dotfiles/completion ~/.dotfiles/functions $fpath)
autoload -Uz clean compinit && compinit

# Set PWD as terminal title
precmd () {print -Pn "\e]0;\a\e]1;`PWD`\a"}

autoload -U gitprompt
RPROMPT='$(gitprompt status)'

# For hyper term
if [[ $TERM_PROGRAM == "Hyper" ]]; then
  autoload -Uz promptinit; promptinit
  prompt pure
else
  PS1='%F{blue}at %B%~%b%f%F{white} $(gitprompt branch)
%F{magenta}%B❯%b%F{white} '
fi
