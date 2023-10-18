. ./tools/command_exist.sh

command_name=rustup

if [ $(command_exist $command_name) == "false" ]; then
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
	source "$HOME/.cargo/env"
else
	echo $command_name" has already been installed"
fi
