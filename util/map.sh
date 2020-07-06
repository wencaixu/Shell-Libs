#!/usr/bin/env bash

put(){
  if [[ ! "$#" -eq 2 ]]
  then
     echo "PUT ONLY CONTAIN TWO PARAMS"
  fi
  declare -A map
  map[$1]=$2
}

main(){
  put 1 2
}

main