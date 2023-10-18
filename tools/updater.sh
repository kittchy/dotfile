set -eu

if [ $OS == 'ubuntu' ]; then
	sudo apt-get update -y -dv
	sudo apt-get upgrade -y -dv
else
	echo "this os is not supported!"
fi

brew update
brew upgrade
