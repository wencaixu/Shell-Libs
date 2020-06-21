#!/usr/bin/env bash

if [[ -r ../../util/set.sh ]]
then
    source ../../util/set.sh
fi

# 数组操作：
#   数组长度    ${#array_name[@]}
#             ${#array_name[*]}
#   字符串长度  ${#string_name}
#
# 切换并在某一目录下创建文件
generate_uuf(){

   current_dir=$(pwd)
   files_name=($(ls ${current_dir}))
   len=${#files_name[*]}

   declare -a list; # 列表
   declare -A map ; # 关联数组
   declare -A set ; # 集合

   list=();
   map=();
   set_value=();

   files_name[${len}]=$1
   for f in ${files_name[*]}
   do
     if [[ $(set_contains ${set_value[*]} f ) -eq "NO" ]]
     then
        suffix=${f#*.}
        prefix=${f%%.${suffix}*}
        # set_value=$(set_collect ${set_value[*]} ${prefix})
        echo ${set_value[*]}
     else
        echo "hi"
     fi
   done
   # 文件重命名
   # new_file_name=$
   # mv
}

main(){
  generate_uuf hello.sh
}

main
