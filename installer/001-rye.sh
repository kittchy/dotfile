. ./tools/command_exist.sh

command_name=rye

if [ $(command_exist $command_name) == "false" ]; then
	curl -sSf https://rye.astral.sh/get | RYE_NO_AUTO_INSTALL=1 RYE_INSTALL_OPTION="--yes" bash
	source "$HOME/.rye/env"
	# install poetry in rye
	# rye install poetry black ruff isort
else
	echo $command_name" has already been installed"
fi
