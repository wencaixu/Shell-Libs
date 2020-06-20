#!/usr/bin/env bash
if [[ -r swap.sh ]];then
      . ./swap.sh
  fi

main(){
  var=123;
  echo ${var}
}

main