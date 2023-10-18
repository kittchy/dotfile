#!/usr/bin/env bash

. ./tools/command_exist.sh
. ./tools/detect_os.sh
command_name=zsh

if [ $(command_exist $command_name) == "false" ]; then
	if [ $OS == 'mac' ]; then
		brew install zsh --ignore-dependencies
	elif [ $OS == 'ubuntu' ]; then
		sudo apt install zsh
	else
		echo "this os is not supported!"
		exit
	fi
	sudo sh -c "which zsh > /etc/shells"
	chsh -s $(which zsh)
	echo "installed zsh, please reboot terminal"
else
	echo $command_name" has already been installed"
fi
