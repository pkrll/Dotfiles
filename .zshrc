setopt prompt_subst

if [[ -f ~/.dotfiles/aliases/alias.zsh ]]; then
  source ~/.dotfiles/aliases/alias.zsh
fi

zstyle ':completion:*:*:git:*' script ~/.dotfiles/completion/.git-completion.zsh
fpath=(~/.dotfiles/completion ~/.dotfiles/functions $fpath)
autoload -Uz clean gitprompt compinit && compinit

PS1='%F{blue}at %B%~%b%f%F{white} $(gitprompt branch)
%F{magenta}%B❯%b%F{white} '
RPROMPT='$(gitprompt status)'

export CLICOLOR=1
export LSCOLORS=exCxCxdxbxegedabagacad
