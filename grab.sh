#!/bin/sh

## backup shell configs. Note: -n opton is dryrun

 if [[ -r $PWD/paths.csv ]]; then
   input=$PWD/paths.csv
 else
   echo "oops, cant find paths.csv!" && exit 1
 fi
 echo
   while IFS="," read -r path filename remarks
   do
     src=$path/$filename
     dst=$PWD/$HOSTNAME
     if [[ -r "$src" ]]; then
       if [[ ! -e $dst ]]; then
        echo "this may be the first run..."
				echo "creating directory $dst and $dst/bkp" 
        mkdir -pv $dst
        mkdir -pv $dst/bkp
				echo
      fi
      echo "backing up $src to $dst"
      rsync -abhqP $src $dst/$filename # add n to optons here for dry run
    else
        # notify missing file, skip if csv header
        [[ $path = "path" ]] || echo "oops, can't find $src"
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
