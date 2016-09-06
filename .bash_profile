export PATH="~/.composer/vendor/bin:/usr/local/mysql/bin:/usr/local/mysql/support-files:/usr/local/bin:/Users/ardalansamimi/Public/Git/Bash/AMPStart:$PATH"

# Don't put duplicate lines or lines starting with space in the history
export HISTCONTROL=erasedups:ignorespace
export CLICOLOR=1
export LSCOLORS=ExGxCxdxBxegEgAgAcAd

PS1="\[\033[01;31m\]\u: \[\033[01;33m\]\w \[\033[00m\]$ \[\033[01;33m\]\`parse_git_branch\`\[\033[00m\] "

HISTSIZE=500
HISTFILESIZE=500

force_color_prompt=yes

if [ -f ~/.dotfiles/.bash_aliases ]; then
	. ~/.dotfiles/.bash_aliases
fi

if [ -f ~/.dotfiles/.gitprompt ]; then
	. ~/.dotfiles/.gitprompt
fi
