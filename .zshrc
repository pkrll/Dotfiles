setopt prompt_subst

zstyle ':completion:*:*:git:*' script ~/.dotfiles/_git/.git-completion.bash
fpath=(~/.dotfile/_git ~/.dotfiles/functions $fpath)
autoload -Uz clean gitprompt compinit && compinit

PS1='%F{red}%n:%f %B%F{green}%~%b%F{white}$(gitprompt branch)
%# '
RPROMPT='$(gitprompt status)'
