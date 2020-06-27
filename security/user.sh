#!/usr/bin/env bash


if [[ -r ./config/security_config.cfg ]]
then
    source ./config/security_config.cfg
fi

is_root(){
  if [[ -f /etc/passwd ]]
  then
     is=$(cat /etc/passwd | grep "root" | awk -F ":" '{if($3==0){print "YES"}}')
     if test ${is}
     then
        echo ${is}
     else
        echo "NO"
    fi
  fi
}

is_user(){
  if [[ -f /etc/passwd ]]
  then
    if grep $1 /etc/passwd
    then
       echo "YES"
    else
       echo "NO"
    fi
  else
    echo "NO";
  fi
}

# 需要设置权限
register(){
   if [[ -z $1 ]] || [[ -z $2 ]]
   then
       echo "Username & Password Is None"
       exit
   fi
   contain=`grep $1 ${USER} | awk -F ":" '{print $1}'`
   if [[ ${contain} -eq $1 ]]
   then
       echo "Username Has Contain"
       exit
   fi

   echo "$1:$2" >> ${USER}
}

# 需要设置权限
login(){
  # 判断是否已经登陆
  local pair="$1:$2"
  if [[ -z $1 ]] || [[ -z $2 ]]
  then
     echo "Username & Password Is None"
     exit
  fi
  if test $(grep ${pair} ${USER})
  then
     # 登陆信息记录
     status=1
     user_status="$1:$2:$status"
     if test $(grep ${user_status} ${LOGIN})
     then
       echo 1
       exit
     fi
     echo ${user_status} >> ${LOGIN}
     echo 1
  else
     echo 0
  fi
}

log_out(){
   # 判断是否已经登陆
   local status="$1:$2:1"
   if test $(grep ${status} ${LOGIN})
   then
     sed -i '/'${status}'/d' ${LOGIN}
     echo 1
     exit
   fi
   echo 0
}


main(){
  # sleep 10s;
  # is_root 'root'
  # sleep 10s;
  # login 4 2
  log_out 4 2
}

main