#!/bin/bash
#************************************************************************
# 函数计算库，暂时仅支持整数计算（不支持浮点数计算）
#************************************************************************
if [ -r ./global/global_config.cfg ];then
      source ./global/global_config.cfg
fi

pow(){
  local delta=$2;
  local result=1;
  while [ $delta -gt 0 ]
  do
    result=$[ $result * $1 ]
    if [ $result -ge $MAX_VALUE ]
    then
      echo $NAN
      break;
    fi
    ((delta=$delta-1))
  done;
  if [ $delta -eq 0 ]
  then
    echo $result
  fi
}

abs(){
  if [ $1 -gt $MAX_VALUE ] || [ $1 -lt $MIN_VALUE ]
  then
    echo $NAN
  fi
  if [ $1 -gt 0 ]
  then
    echo $1
  else
      echo $[ -$1 ]
    fi
}

sqrt(){
  if [ $1 -lt 0 ]
  then
    echo $NAN
  else
    local mid=$[ $1 / 2 ]
    while [ $[$1-$mid*$mid] -gt 1 ]
    do
    if [ $[$mid*$mid] -gt $1 ]
    then
      mid=$[ $mid / 2 ]
    fi
    echo $mid
  done
  fi
}

main(){
  sqrt -2
  sleep 10s;
}
main