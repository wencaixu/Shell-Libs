#!/usr/bin/env bash

# 服务开启

if [[ -r ./security/user.sh ]] && [[ -r ./view/menu.sh ]]
then
  echo "123"
  sh ./security/user.sh
fi

main(){
  echo "123"
}