#************************************************************************
# swap two element function
# @param element1
# @param element2
# @return index
#************************************************************************

swap(){
  # local t1=$1; //local can only use in inner function
  local t1=$1;
  local t2=$2;
  t1=$[ $t1 ^ $t2 ];
  t2=$[ $t1 ^ $t2 ];
  t1=$[ $t1 ^ $t2 ];
  echo $t1,$t2;
}
swap 1 2
sleep 10s