. ./tools/command_exist.sh

if [ ! -e ~/.pyenv ]; then
	git clone https://github.com/pyenv/pyenv.git ~/.pyenv
	pyenv install 3.10
	pyenv rehash
	pyenv global 3.10
else
	echo "pyenv has already been installed"
fi
