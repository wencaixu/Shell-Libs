#!/bin/bash
#************************************************************************
# 函数计算库，暂时仅支持整数计算（不支持浮点数计算）
#************************************************************************
if [[ -r ./config/global_config.cfg ]];then
      source ./config/global_config.cfg
fi

pow(){
  local delta=$2;
  local result=1;
  while [[ ${delta} -gt 0 ]]
  do
    result=$[ $result * $1 ]
    if [[ ${result} -gt ${MAX_VALUE} ]] || [[ ${result} -lt ${MIN_VALUE} ]]
    then
        echo ${NAN}
        break;
    fi
    delta=$[ ${delta}-1 ]
  done
  if [[ ${delta} -eq 0 ]]
  then
    echo ${result}
  fi
}

abs(){
  if [[ $1 -gt ${MAX_VALUE} ]] || [[ $1 -lt ${MIN_VALUE} ]]
  then
    echo ${NAN}
  fi
  if [[ $1 -gt 0 ]]
  then
    echo $1
  else
      echo $[ -$1 ]
    fi
}

sqrt(){
  if [[ $1 -lt 0 ]]
  then
    res=${NAN}
  fi
  local high=$1;
  local low=0;
  mid=$[ $[$high+$low] / 2 ]
  while [[ $(abs $[$1-$mid*$mid]) -gt ${PRECISE} ]]
  do
    if [[ $1 -gt $[$mid*$mid] ]]
      then
         low=$[ ${mid} + 1 ]
    elif  [[ $1 -lt $[$mid*$mid] ]]
      then
         high=${mid}
    else
       echo ${mid}
    fi
    mid=$[ $[$high+$low] / 2 ]
  done
  echo ${mid}
}

tan(){
  echo "TAN"
}

cos(){
  echo "COS"
}

sin(){
  echo "SIN"
}

main(){
  sqrt 24
}
main