#!/bin/bash

DEBUG=$1

# 未定義な変数があったら途中で終了する
set -euo

# 今のディレクトリ
# dotfileディレクトリに移動する
BASEDIR=$(dirname $0)
cd $BASEDIR

# get OS name
. ./tools/detect_os.sh

if [ $OS == "mac" ] || [ $OS == "ubuntu" ]; then
	echo "OS is $OS"
else
	echo "this os is not supported!"
	exit 1
fi

# paste symboric link
if [ -z "$DEBUG" ]; then
	echo "Stage 1 paste link"
	for f in $PWD/dotfiles/.??*; do
		ln -snfv "$f" ~/
	done
else
	echo "Skip make symboric link"
fi

echo "Stage 2 : package upgrade"
. ./tools/command_exist.sh
if [ $OS == 'mac' ]; then
	if [ $(command_exist "brew") == "false" ]; then
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
		eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
	else
		echo "brew has already been installed"
	fi
	brew update
	brew upgrade
elif [ $OS == 'ubuntu' ]; then
	sudo apt-get update -y
	sudo apt-get upgrade -y
	sudo apt-get install -y software-properties-common
	export PKG_CONFIG_PATH=/usr/lib/x86_64-linux-gnu/pkgconfig
fi

echo "Stage 3 : isntall packages"
. ./tools/command_exist.sh
if [ $OS == 'mac' ]; then
	brew install $(cat install_list/mac/brew.list | tr '\n' ' ')
	brew install --cask $(cat install_list/mac/brew_cask.list | tr '\n' ' ')
	brew autoremove
elif [ $OS == 'ubuntu' ]; then
	for ppa in $(cat install_list/ubuntu/ppa.list | tr '\n' ' '); do
		sudo add-apt-repository -y $ppa
	done
	sudo apt-get -y update
	sudo apt-get -y install $(cat install_list/ubuntu/apt.list | tr '\n' ' ')
	sudo apt -y autoremove
fi

echo "Stage 4 Install package without package manager"
# if tool doesn't distribute with package manager
# please use installer/
for f in $(ls installer/*.sh); do
	echo "INSTALL : ${f%.*}"
	. ./$f
done

echo "Stage 5 cargo package install"
cargo install cargo-update
cargo install-update -a
cargo install $(cat install_list/cargo.list | tr '\n' ' ')

echo "Stage 5 GO package install"
go install $(cat install_list/cargo.list | tr '\n' ' ')
