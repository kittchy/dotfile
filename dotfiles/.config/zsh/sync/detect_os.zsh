
if [[ `uname` == 'Darwin' ]]; then
  OS='mac'
elif [[ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]] then
  RELEASE_FILE=/etc/os-release
  if grep '^NAME="CentOS' $RELEASE_FILE >/dev/null; then
    OS='centos'
  elif grep '^NAME="Ubuntu' $RELEASE_FILE >/dev/null; then
    OS='ubuntu'
  else
    echo "Your platform is not supported."
    exit 1
  fi
elif [[ "$(expr substr $(uname -s) 1 6)" == 'CYGWIN' ]]; then
  OS='cygwin'
else
  echo "Your platform is not supported."
  exit 1
fi
