#!/bin/bash
############################
# .makesym.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/.dotfiles
#
# This is a heavily modified version of Michael Smalleys script found at
# https://github.com/michaeljsmalley/dotfiles
############################

##########
# The .dotsfiles and backup directories, as well as
# the list of files and folders to symlink in homedir
##########
syncdir=~/.dotfiles
backdir=~/.dotfiles_backup
files=".inputrc .bashrc .bash_profile .vimrc .vim .gitconfig" # .atom/snippets.cson .atom/keymap.cson"

##########
# Setup
#########
mkdir -p $backdir
cd $syncdir

fileExists() {
  if [ -f "$1" ] || [ -d "$1" ]; then
    return 0
  else
    return 1
  fi
}

backupFile () {
  echo "Moving $1 from ~ to $2"
  if fileExists $2/$1; then
    fileName=$1-`date +%Y-%m-%d`
  else
    fileName=$1
  fi

  mv ~/$1 $2/$fileName
}

for file in $files; do
  if fileExists $file; then

    if fileExists ~/$file; then
      backupFile $file $backdir
    fi

    echo "Creating symlink to $file in home directory."
    ln -s $syncdir/$file ~/$file
  fi
done
