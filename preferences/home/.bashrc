# SHELL PROMPT
export PATH="~/.composer/vendor/bin:/usr/local/mysql/bin:/usr/local/mysql/support-files:/usr/local/bin:/Users/ardalansamimi/Public/Git/Bash/AMPStart:/Users/ardalansamimi/Library/Haskell/bin:~/.dotfiles/setup:$PATH"

export PATH="$PATH:$HOME/.cargo/bin"
export JUNIT_HOME="/usr/local/share/java"
export PATH="$PATH:$JUNIT_HOME"
export CLASSPATH="$CLASSPATH:$JUNIT_HOME/junit4-4.12.jar:$JUNIT_HOME/hamcrest-core-1.3.jar"


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

#. ~/.dotfiles/completion

if [ -d /usr/local/etc/bash_completion.d ]; then
	 for f in /usr/local/etc/bash_completion.d/*; do source $f; done
fi

# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
