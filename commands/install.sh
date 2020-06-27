main(){
  while [[ -n "$1" ]]
  do
      case "$1" in
      -a)
        echo "Param -a"
        ;;
      -b)
        echo "Param -b"
        ;;
      *)
        echo "None"
        ;;
      esac
      shift
  done
  sleep 10s
}

main -a -b