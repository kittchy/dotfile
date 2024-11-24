function command_exist(){
  if type $1 > /dev/null 2>&1; then
    echo true
  else 
    echo false
  fi
}
