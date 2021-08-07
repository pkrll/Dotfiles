#!/bin/bash

##########
# Script for linking dotfiles and other preferences.
##########

syncdir=~/.dotfiles
backdir=~/.dotfiles_backup

fileExists() {
  if [ -f "$1" ] || [ -d "$1" ]; then
    return 0
  else
    return 1
  fi
}

linkFilesInFolder() {
    cd "${syncdir}/${1}"
    FILES="* .[^.]*"
    for file in $FILES; do
        [ -e "$file" ] || continue
        
        echo "----------------------------------"
        echo "Processing $file"
        
        if fileExists "${file}"; then
            backupFile $file $2 $backdir/$1
        fi
        
        echo ""
        echo "Creating symlink"
        echo "Source: $syncdir/$1/$file"
        echo "Target: $2/$file"
        
        mkdir -p $2
        ln -sf $syncdir/$1/$file $2/$file
    done
}

backupFile () {
    echo ""
    echo "Moving file..."
    echo "Source: $2/$1"
    echo "Target: $3/$1"
    
    if fileExists $3/$1; then
        fileName=$1-`date +%Y-%m-%d-%H%M%S`
    else
        fileName=$1
    fi

    mkdir -p $3
    mv $2/$1 $3/$fileName
}

mkdir -p $backdir
linkFilesInFolder "preferences/home" ~
linkFilesInFolder "preferences/xcode/CodeSnippets" ~/Library/Developer/Xcode/UserData/CodeSnippets
linkFilesInFolder "preferences/xcode/FontAndColorThemes" ~/Library/Developer/Xcode/UserData/FontAndColorThemes
linkFilesInFolder "preferences/xcode/KeyBindings" ~/Library/Developer/Xcode/UserData/KeyBindings

echo ""
echo "Done linking."
echo ""
echo "Use the command resource to update"
echo "your settings."
echo "----------------------------------"
