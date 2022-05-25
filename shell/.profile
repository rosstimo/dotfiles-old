#!/bin/sh

echo "start .profile"
# load keyring 
if [ -n "$DESKTOP_SESSION" ];then
   eval $(gnome-keyring-daemon --start)
   export SSH_AUTH_SOCK
fi

## exports

# add scripts dir to path
[ -d ~/.local/bin ] && export PATH="~/.local/bin:$PATH"
[ -d ~/.local/shell ] && export PATH="~/.local/shell:$PATH"

## sources

# load all files listed in .bash_sources
# TODO load sources only if .bash_sources file exsts
sourcefiles=$(cat ~/.config/shell/.bash_sources)
for file in $sourcefiles; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;
unset sourcefiles;

# [ -f ~/.local/shell/aliasrc ] && source "$HOME/.local/shell/aliasrc"
# read prompt settings if exists
[[ -f /home/tim/.config/shell/.bash_prompt ]] && . /home/tim/.config/shell/.bash_prompt
[[ -f /home/tim/.config/shell/aliasrc ]] && . /home/tim/.config/shell/aliasrc
echo "end .profile"
