#!/usr/bin/env bash
# set -x
# 服务开启
current_path=$(pwd)
if [[ -r ./security/user.sh ]] && [[ -r ./view/menu.sh ]]
then
  source ./lang/math.sh
  source ./security/user.sh
fi

main(){
  echo "123"
}