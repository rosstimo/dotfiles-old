#!/bin/sh

## deploy configs. Note: -n opton is dryrun
#TODO - add a test/dryrun argument
#TODO - move back up files to ./bkp folder after rsync creates them

if [[ -r $PWD/paths.csv ]]; then
  input=$PWD/paths.csv
else
  echo "oops, cant find paths.csv!" && exit 1
fi
echo
  while IFS="," read -r path filename remarks
  do
    dst=$path
    src=$PWD/$HOSTNAME/$filename
    if [[ -r "$src" ]]; then
      if [[ ! -e $dst ]]; then
        echo "*** directory $dst does not yet exist. creating..."
        mkdir -pv $dst
			fi
    echo "deploying $src to $dst" 
    rsync -abhqP $src $dst # add n to optons here for dry run
    else
			[[ $path = "path" ]] || echo "oops, can't find $src. skipping..."
    fi
  done < $input
  unset input
  unset path
  unset filename
  unset remarks
  unset src
  unset dst
  echo
	exit 0
