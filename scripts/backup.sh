#!/bin/bash

dotfiles=$(cat ~/dotfiles/.dotfile_map)
for file in $dotfiles; do
[ -r "$file" ] && [ -f "$file" ] && backup $file ~/dotfiles/$hostname/$file  	
done;
unset file;
unset dotfiles;

# backup the dirpath $1 within dirpath $2
backup()
{
rsync -azhic $1 $2 2>&1
}
