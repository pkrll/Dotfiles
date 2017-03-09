# SHELL PROMPT
export PATH="~/.composer/vendor/bin:/usr/local/mysql/bin:/usr/local/mysql/support-files:/usr/local/bin:/Users/ardalansamimi/Public/Git/Bash/AMPStart:/Users/ardalansamimi/Library/Haskell/bin:~/.dotfiles/setup:$PATH"

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
export PS1="\[\033[1;31m\]\u: \[\033[01;32m\]\w\[\033[00m\] $ "
force_color_prompt=yes

############
# Non-MacOS
# related
###########

# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Enable color support of ls
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls -o --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi
