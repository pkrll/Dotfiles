# Prompt
setopt prompt_subst

if [ -f ~/.dotfiles/.gitprompt-zsh ]; then
	. ~/.dotfiles/.gitprompt-zsh
fi

PS1='%F{red}%n:%f %B%F{green}%~%b%F{white}$(git_branch)
%# '
RPROMPT='$(git_status)'

# Can't source this
zstyle ':completion:*:*:git:*' script ~/.dotfiles/_git/.git-completion.bash
fpath=(~/.dotfile/_git $fpath)
autoload -Uz compinit && compinit
