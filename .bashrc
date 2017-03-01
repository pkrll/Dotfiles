# SHELL PROMPT
export PATH="~/.composer/vendor/bin:/usr/local/mysql/bin:/usr/local/mysql/support-files:/usr/local/bin:/Users/ardalansamimi/Public/Git/Bash/AMPStart:/Users/ardalansamimi/Library/Haskell/bin:/Users/ardalansamimi/.dotfiles/setup:$PATH"

# Don't put duplicate lines or lines starting with space in the history
export HISTCONTROL=erasedups:ignorespace
HISTSIZE=500
HISTFILESIZE=500

# The prompt
export PS1="\[\033[01;31m\]\u: \[\033[01;33m\]\w\[\033[01;36m\]\`parse_git_branch\`\[\033[00m\] $ "
force_color_prompt=yes

#############
# The Git prompt
#############
if [ -f ~/.dotfiles/.gitprompt ]; then
	. ~/.dotfiles/.gitprompt
fi

#############
# ALIASES
############
if [ -f ~/.dotfiles/.bash_aliases ]; then
	. ~/.dotfiles/.bash_aliases
fi

#############
# FUNCTIONS
############
if [ -f ~/.dotfiles/.functions ]; then
	. ~/.dotfiles/.functions
fi

#############
# COLORS
#############
export CLICOLOR=1
export LSCOLORS=cxfxdxdxBxegEgAgAcAd
