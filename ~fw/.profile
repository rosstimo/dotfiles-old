#!/bin/sh

echo "start .profile"
# load keyring 
#if [ -n "$DESKTOP_SESSION" ];then
#   eval $(gnome-keyring-daemon --start)
#   export SSH_AUTH_SOCK
#fi

## exports ##
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="brave"

# #XDG environment variables ##
## see https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html

#There is a single base directory relative to which user-specific data files should be written. This directory is defined by the environment variable $XDG_DATA_HOME.$XDG_DATA_HOME defines the base directory relative to which user-specific data files should be stored. If $XDG_DATA_HOME is either not set or empty, a default equal to $HOME/.local/share should be used. 
#export XDG_DATA_HOME=$HOME/.local/share/

#There is a single base directory relative to which user-specific configuration files should be written. This directory is defined by the environment variable $XDG_CONFIG_HOME. $XDG_CONFIG_HOME defines the base directory relative to which user-specific configuration files should be stored. If $XDG_CONFIG_HOME is either not set or empty, a default equal to $HOME/.config should be used.
#export XDG_CONFIG_HOME=$HOME/.config/

#There is a single base directory relative to which user-specific state data should be written. This directory is defined by the environment variable $XDG_STATE_HOME. $XDG_STATE_HOME defines the base directory relative to which user-specific state files should be stored. If $XDG_STATE_HOME is either not set or empty, a default equal to $HOME/.local/state should be used. The $XDG_STATE_HOME contains state data that should persist between (application) restarts, but that is not important or portable enough to the user that it should be stored in $XDG_DATA_HOME. 
#It may contain: 
# actions history (logs, history, recently used files, …)
# current state of the application that can be reused on a restart (view, layout, open files, undo history, 
#User-specific executable files may be stored in $HOME/.local/bin. Distributions should ensure this directory shows up in the UNIX $PATH environment variable, at an appropriate place.
#Since $HOME might be shared between systems of different achitectures, installing compiled binaries to $HOME/.local/bin could cause problems when used on systems of differing architectures. This is often not a problem, but the fact that $HOME becomes partially achitecture-specific if compiled binaries are placed in it should be kept in mind..
#export XDG_STATE_HOME=$HOME/.local/state/

#There is a single base directory relative to which user-specific executable files may be written.
# add scripts dir to path
[ -d ~/.local/bin ] && export PATH="~/.local/bin:$PATH"
[ -d ~/.local/shell ] && export PATH="~/.local/shell:$PATH"

#There is a set of preference ordered base directories relative to which data files should be searched. This set of directories is defined by the environment variable $XDG_DATA_DIRS. $XDG_DATA_DIRS defines the preference-ordered set of base directories to search for data files in addition to the $XDG_DATA_HOME base directory. The directories in $XDG_DATA_DIRS should be seperated with a colon ':'. If $XDG_DATA_DIRS is either not set or empty, a value equal to /usr/local/share/:/usr/share/ should be used.
#export XDG_DATA_DIRS=$HOME/.local/share/:/usr/local/share/:usr/share/

#There is a set of preference ordered base directories relative to which configuration files should be searched. This set of directories is defined by the environment variable $XDG_CONFIG_DIRS. $XDG_CONFIG_DIRS defines the preference-ordered set of base directories to search for configuration files in addition to the $XDG_CONFIG_HOME base directory. The directories in $XDG_CONFIG_DIRS should be seperated with a colon ':'. If $XDG_CONFIG_DIRS is either not set or empty, a value equal to /etc/xdg should be used. The order of base directories denotes their importance; the first directory listed is the most important. When the same information is defined in multiple places the information defined relative to the more important base directory takes precedent. The base directory defined by $XDG_DATA_HOME is considered more important than any of the base directories defined by $XDG_DATA_DIRS. The base directory defined by $XDG_CONFIG_HOME is considered more important than any of the base directories defined by $XDG_CONFIG_DIRS.
#export XDG_CONFIG_DIRS=/etc/xdg/

#There is a single base directory relative to which user-specific non-essential (cached) data should be written. This directory is defined by the environment variable $XDG_CACHE_HOME. $XDG_CACHE_HOME defines the base directory relative to which user-specific non-essential data files should be stored. If $XDG_CACHE_HOME is either not set or empty, a default equal to $HOME/.cache should be used.
#export XDG_CACHE_HOME=$HOME/.cache/

#There is a single base directory relative to which user-specific runtime files and other file objects should be placed. This directory is defined by the environment variable $XDG_RUNTIME_DIR. $XDG_RUNTIME_DIR defines the base directory relative to which user-specific non-essential runtime files and other file objects (such as sockets, named pipes, ...) should be stored. The directory MUST be owned by the user, and he MUST be the only one having read and write access to it. Its Unix access mode MUST be 0700. The lifetime of the directory MUST be bound to the user being logged in. It MUST be created when the user first logs in and if the user fully logs out the directory MUST be removed. If the user logs in more than once he should get pointed to the same directory, and it is mandatory that the directory continues to exist from his first login to his last logout on the system, and not removed in between. Files in the directory MUST not survive reboot or a full logout/login cycle. The directory MUST be on a local file system and not shared with any other system. The directory MUST by fully-featured by the standards of the operating system. More specifically, on Unix-like operating systems AF_UNIX sockets, symbolic links, hard links, proper permissions, file locking, sparse files, memory mapping, file change notifications, a reliable hard link count must be supported, and no restrictions on the file name character set should be imposed. Files in this directory MAY be subjected to periodic clean-up. To ensure that your files are not removed, they should have their access time timestamp modified at least once every 6 hours of monotonic time or the 'sticky' bit should be set on the file. If $XDG_RUNTIME_DIR is not set applications should fall back to a replacement directory with similar capabilities and print a warning message. Applications should use this directory for communication and synchronization purposes and should not place larger files in it, since it might reside in runtime memory and cannot necessarily be swapped out to disk. NOTE: This is handled by systemd logind.sevice (I think..) It should use the following: XDG_RUNTIME_DIR=/run/user/$UID

#All paths set in these environment variables must be absolute. If an implementation encounters a relative path in any of these variables it should consider the path invalid and ignore it.


## sources

# load all files listed in .bash_sources
# TODO load sources only if .bash_sources file exsts
#sourcefiles=$(cat ~/.config/shell/.bash_sources)
#for file in $sourcefiles; do
#    [ -r "$file" ] && [ -f "$file" ] && source "$file";
#done;
#unset file;
#unset sourcefiles;

# [ -f ~/.local/shell/aliasrc ] && source "$HOME/.local/shell/aliasrc"
# read prompt settings if exists
[[ -f /home/tim/.config/shell/.bash_prompt ]] && . /home/tim/.config/shell/.bash_prompt
[[ -f /home/tim/.config/shell/aliasrc ]] && . /home/tim/.config/shell/aliasrc
echo "end .profile"
