#!/usr/bin/env bash

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


main(){
  sleep 10s;
  is_root 'root'
  sleep 10s;
}