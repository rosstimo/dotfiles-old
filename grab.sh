#!/bin/sh

## backup shell configs. Note: -n opton is dryrun
rsync -ravzlhP ~/.config/shell/ ~/dotfiles/shell/
rsync -ravzlhP ~/.bash_profile ~/dotfiles/shell/
rsync -ravzlhP ~/.bashrc ~/dotfiles/shell/

