#!/usr/bin/env bash


substring(){
  # ${string: start :length}
  #   string 被截取字符串
  #   start  截取的起始位置
  #   length 截取的长度
  if [[ ${len} -eq 3 ]]
  then
     string=$1
     start=$2
     length=$3
     # echo ${${string}"": $(${start}): $(${length})}
  fi
}

main(){
  substring 1 2 3
}

main