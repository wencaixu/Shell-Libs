
is_root(){
  if [ -f /etc/passwd ]
  then
     is=$(cat /etc/passwd | grep "root" | awk -F ":" '{if($3==0){print "YES"}}')
     if test $is
     then
        echo $is
     else
        echo "NO"
    fi
  fi
}

main(){
  sleep 10s;
  is_root 'root'
  sleep 10s;
}