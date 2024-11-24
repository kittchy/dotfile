. ./tools/command_exist.sh

command_name=volta

if [ $(command_exist $command_name) == "false" ]; then

	sudo curl https://get.volta.sh | bash
else
	echo $command_name" has already been installed"
fi
