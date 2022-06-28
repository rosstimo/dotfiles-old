#!/bin/bash

## backup shell configs. Note: -n opton is dryrun

if [[ -r $PWD/paths.csv ]]; then
  input=$PWD/paths.csv
	
  while IFS="," read -r path filename remarks
  do
    src=$path/$filename
		dst=$PWD/$HOSTNAME
   if [[ -r "$src" ]]; then
		echo "$src exists" 
	  if [[ -e $dst ]]; then
		 mkdir -pv $dst
	   mkdir -pv $dst/bkp
	  fi
		rsync -vabhP --suffix=~ --backup-dir=$dst/bkp $src $dst/$filename # add n to optons here for dry run
		else
		  echo "oops, can't find $src"
  fi
  done < $input
  unset input
	unset path
	unset filename
	unset remarks
  unset src
	unset dst
else
  echo "oops, cant find paths.csv!" && exit 1
fi
