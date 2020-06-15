#!/bin/bash

#***************************************************************
# Determine if the array contains a special value
#  eg: Incoming array and judgment value
#    array=(1 2 1) 10
#  invoke
#    contains ${array[*]} 1
#  or
#    contains 1 2 3 4 -3
#***************************************************************
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

#***************************************************************
#  Get length of array
#  @param array to be calculate
#***************************************************************
getLength(){
  echo "$#"
}

#***************************************************************
#  fetch value by index from array
#  @param array the array to be fetch
#  @param index to be fetched index
#****************************************************************
get(){
  last=${!#}
  local newArray=($(echo "$@"))
  len=$(getLength ${newArray[*]});
  if [ $last -gt $len ]
  then
    echo "None"
  fi
  for ((i=0;i<$len;i++))
  do
    if [ $i -eq $last ]
    then
        echo ${newArray[$i]};
      fi
  done
}

#**************************************************************
# array tranfer
# @param array the array to be tranfered
#**************************************************************
tranfer(){
  echo "$@";
}

#**************************************************************
#  append array from tail
#  @param  original the array to be append
#  @param  value  the value to be append
#**************************************************************
append(){
  tmp=$(tranfer "$@")
  echo ${tmp[*]}
}

#***************************************************************
# Sorts the specified range of the array into ascending order
#   By bubble sort
#     echo $(sort_bubble ${array[*]})
#***************************************************************

sort_bubble(){
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

#***************************************************************
# Sorts the specified range of the array into ascending order
#   By Quick Sort
#     echo $(sort_bubble ${array[*]})
#***************************************************************
sort_quick(){

}

#************************************************************************
# copy array to destinate array
# @param original the array to be copied
# @param newLength the length of the copy to be returned
# @return a copy of the original array, truncated or padded with nulls
#  to obtain the specified length
#************************************************************************
copyOf(){
   local newArray=($(echo "$@"))
   local res=()
   size=$[ "$#" - 1 ];
   last=${!#}
   for ((i=0;i<$last;i++))
   do
      res[$i]=${newArray[$i]};
   done
   echo ${res[@]}
}

# array=(1 3 2 1)
# copyOf ${array[*]}

sleep 10s