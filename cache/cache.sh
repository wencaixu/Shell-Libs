#!/usr/bin/env bash
if [[ -r ../config/global_config.cfg ]];then
      . ../config/global_config.cfg
  fi

main(){
  echo ${CACHE_PATH}
}

main