function pow(){
  echo $[ $1 * $1 ]
}

dir=/data/v6-logs/$1/$2
sum=0;
for log in $dir/*; do
    records=$(awk -f log.awk -v var='1.6 1.12' 201910231429.00a.impression.log | sort | uniq -c | sort -r | awk '{print $2,$1}')
    val=$(echo $records | sed 's/[[:space:]]//g')
    if test $val
    then
      echo $val;
      # sum=$[ $sum + $val ];
    else
      echo $log
    fi
done
echo $sum;