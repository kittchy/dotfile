. ./tools/command_exist.sh

command_name=uv

if [ $(command_exist $command_name) == "false" ]; then
  curl -LsSf https://astral.sh/uv/install.sh | sh
else
  echo $command_name" has already been installed"
fi
