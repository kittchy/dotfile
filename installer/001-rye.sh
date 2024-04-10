. ./tools/command_exist.sh

command_name=rye

if [ $(command_exist $command_name) == "false" ]; then
	curl -sSf https://rye-up.com/get | bash
	source "$HOME/.rye/env"
	# install poetry in rye
	rye install poetry black flake8 isort
else
	echo $command_name" has already been installed"
fi
