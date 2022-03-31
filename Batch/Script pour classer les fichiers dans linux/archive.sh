#!/bin/bash

regexp="[^_]+_([0-9]{4})([0-9]{2})([0-9]{2})[^\.]*\..*$"

for file in *.txt; do
  if [[ $file =~ $regexp ]]; then
    folder="${BASH_REMATCH[1]}/${BASH_REMATCH[2]}"
    if [ ! -d $folder ]; then
      echo "create folder $folder"
      mkdir -p $folder
    fi
    echo "Moving file $file into $folder"
    mv $file $folder
  fi
done

