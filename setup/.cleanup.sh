#!/bin/bash
#############################
# .cleanup.sh
#
# Removes the dotfiles backup
# directory
#############################

backdir=~/.dotfiles_backup

if [ -d $backdir ]; then
    rm -rf $backdir
    echo "Deleted $backdir"
else
    echo "$backdir does not exist!"
fi
