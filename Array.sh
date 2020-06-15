#!/bin/bash

#**************************************************
# Determine if the array contains a special value
#  eg: Incoming array and judgment value
#    array=(1 2 1) 10
#  invoke
#    contains ${array[*]} 1
#  or
#    contains 1 2 3 4 -3
#***********************************
contains(){
  i=0;size="$#";last=${!#}
  for t in "$@"; do
     (( i = $i + 1 ))
     if [ $i -lt $size ];then
         if [ $t -eq $last ];then
              echo 1;
              return;
           fi
     fi
  done
  if [ $i -eq $size ];then
        echo 0;
    fi
}

#***********************************
#  get length of array
#  eg
#    size ${array[*]}
#***********************************
size(){
  echo "$#"
}

#***********************************
# 数组遍历
#***********************************
tranfer(){
  echo "$@";
}

#***********************************
#  extand array
#  eg
#
#***********************************
add(){
  echo "hello";
}

#***********************************
# Array Sort
#   Bubble sort
#     echo $(bubbleSort ${array[*]})
#***********************************

bubbleSort(){
  local newArray=($(echo "$@"))
  size=$[ "$#" - 1 ];
  for(( i=0; i <= $size; i++ )){
    for(( j=$[ $i + 1 ]; j <= $size; j++ )){
      if [ ${newArray[$i]} -gt ${newArray[$j]} ];then
          t=${newArray[$i]};
          newArray[$i]=${newArray[$j]};
          newArray[$j]=$t;
        fi
    }
  }
  echo ${newArray[*]}
}

array=(1 3 2 1)

tranfer ${array[*]}

sleep 10s