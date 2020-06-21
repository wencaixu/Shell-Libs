#!/usr/bin/env bash

if [[ -f ./config/util_config.cfg ]]
then
    source ./config/util_config.cfg
fi


# shell集合实现,数组元素唯一性,暂时支持数字和字符串
set_collect(){
   local tmp=($(echo "$@"))
   local len="$#"
   last=${!#}

   declare -A set_collect;
   declare -i n;

   n=0;

   for ((i=0;i<$[${len}-1];i++))
   do
     if [[ ${last} == ${tmp[$i]} ]]
     then
        n=1
     fi
   done

   if [[ ${n} -eq 0 ]]
   then
        echo ${tmp[*]}
   else
       for((j=0;j<$[${len}-1];j++))
       do
          set_collect[$j]=${tmp[$j]}
       done
       echo ${set_collect[*]}
   fi
}

set_contains(){
    local tmp=($(echo "$@"))
    local last=${!#}

    declare -i n

    n=${INIT_INTEGER}

    for((i=0; i<$["$#"-1];i++))
    do
       if [[ ${tmp[$i]} -eq ${last} ]]
       then
           n=1
       fi
    done
    if [[ ${n} == 1 ]]
    then
       echo ${YES}
    else
       echo ${NO}
    fi
}


main(){
  arr=(1 2 "3")
  set_contains ${arr[*]} "5"
}

main