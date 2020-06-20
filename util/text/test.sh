#!/usr/bin/env bash
if [[ -r swap.sh ]];then
      . ./swap.sh
  fi

main(){

  swap 1 2
  sleep 10s;
}

main