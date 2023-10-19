set -eu

if [ $OS == 'ubuntu' ]; then
	sudo apt-get update -y -dv
	sudo apt-get upgrade -y -dv
fi

brew update
brew upgrade
