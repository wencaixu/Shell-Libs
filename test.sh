#!/usr/bin/env bash

cat "2020070616-1.log" | while read line
do
   declare -A map_collect;
   rta_lines=$(echo ${line} | awk '{print $1,$2,$3,$4,$5}')
   fields=(`echo ${rta_lines[0]} | tr '\t' ' '`)
   key=""
   for((i=1;i<${#fields[@]};i++)){
      field=${fields[$i]}
      if [ ${field:0:1} !=  "[" ];then
        key+=${field}
      fi
   }
   map_collect[$key]+=${fields[0]}
   for key_one in ${!map_collect[@]}
   do
      if [ $key = ${key_one} ];then
        map_collect[$key]=$[ map_collect[$key]+${fields[0]} ]
      fi
   done
   for k in ${!map_collect[@]}
   do
     echo $k,${map_collect[$k]}
   done
done
