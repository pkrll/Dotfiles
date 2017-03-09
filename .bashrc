# SHELL PROMPT
export PATH="~/.composer/vendor/bin:/usr/local/mysql/bin:/usr/local/mysql/support-files:/usr/local/bin:/Users/ardalansamimi/Public/Git/Bash/AMPStart:/Users/ardalansamimi/Library/Haskell/bin:/Users/ardalansamimi/.dotfiles/setup:$PATH"

# Don't put duplicate lines or lines starting with space in the history
export HISTCONTROL=erasedups:ignorespace
HISTSIZE=500
HISTFILESIZE=500

#############
# COLORS
#############
export CLICOLOR=1
export LSCOLORS=cxfxdxdxBxegEgAgAcAd

#############
# ALIASES
############
if [ -f ~/.dotfiles/aliases/alias.bash ]; then
	. ~/.dotfiles/aliases/alias.bash
fi

if [ -f ~/.dotfiles/aliases/common ]; then
	. ~/.dotfiles/aliases/common
fi

#############
# FUNCTIONS
############
if [ -f ~/.dotfiles/functions/clean ]; then
	. ~/.dotfiles/functions/clean
fi

#############
# The prompt
#############
export PS1="\[\033[31m\]\u: \[\033[01;32m\]\w\[\033[00m\] $ "
force_color_prompt=yes
