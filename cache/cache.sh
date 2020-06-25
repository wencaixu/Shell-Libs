#!/usr/bin/env bash
if [[ -r ../config/global_config.cfg ]];then
      . ../config/global_config.cfg
  fi

cache(){
  echo "hello"
}

main(){
  cache
  echo ${CACHE_PATH}
}

main