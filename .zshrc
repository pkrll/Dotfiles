################
# ZSH Config
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
export LS_COLORS='fi=01;36:rs=0:di=01;32:ln=01;34:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:';

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
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|?=** r:|?=**' # autocomplete on lowercase etc
fpath=(~/.dotfiles/completion ~/.dotfiles/functions ~/.dotfiles/functions/gitprompt $fpath)
autoload -Uz gitls clean git_prompt git_remote_name git_root_level compinit && compinit

if [[ -f ~/.dotfiles/functions/setprompt.zsh ]]; then
  source ~/.dotfiles/functions/setprompt.zsh
fi

# Different terminal cases
if [[ $TERM_PROGRAM == "Hyper" ]]; then
  autoload -Uz promptinit; promptinit
  prompt pure
else
  TITLE="\e]0;Terminal: `pwd`\a"
  if [[ $TERM_PROGRAM == "Apple_Terminal" ]]; then
    # When on MacOS
    TITLE="\e]0;\a\e]1;`pwd`\a"
  else
    if [[ -n $SSH_CONNECTION ]]; then
      IPADR=$SSH_CONNECTION[(ws: :)3]
      TITLE="\e]0;${USER}@${IPADR}: `pwd`\a"
    fi
  fi

  precmd () {
    print -Pn $TITLE
    setprompt
  }
fi
