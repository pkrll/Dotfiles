#!/bin/bash
############################
# .makesym.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/.dotfiles
#
# This is a heavily modified version of Michael Smalleys script found at
# https://github.com/michaeljsmalley/dotfiles
############################

#TODO: Fix setup for zsh

##########
# The .dotfiles and backup directories, as well as
# the list of files and folders to symlink in homedir
##########
syncdir=~/.dotfiles
backdir=~/.dotfiles_backup
files=".hyper.js .zshrc .inputrc .bashrc .bash_profile .vimrc .vim .emacs.d .gitconfig .atom/snippets.cson .atom/keymap.cson .atom/init.coffee"

##########
# Setup
#########
mkdir -p $backdir
cd $syncdir

echo "--------------------------------"
echo "Running makesym.sh..."
echo ""
echo "Retrieving latest changes from the repository"
echo ""
git pull

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
    fileName=$1-`date +%Y-%m-%d-%H%M%S`
  else
    fileName=$1
  fi

  # Need to create subdirectories
  dirName=`dirname $1`
  if [ ! $dirName == "." ] && [ ! -d $2/$dirName ]; then
    mkdir $2/$dirName
  fi

  mv ~/$1 $2/$fileName
}

echo "--------------------------------"
echo ""
for file in $files; do
  if fileExists $file; then

    if fileExists ~/$file; then
      backupFile $file $backdir
    fi

    echo "Creating symlink to $syncdir/$file in home directory."
    ln -s $syncdir/$file ~/$file
  fi
done

echo ""
echo "Done linking."
echo ""
echo "Use the command resource to update"
echo "your settings."
echo "--------------------------------"
