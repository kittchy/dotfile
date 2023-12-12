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

# update and upgrade
echo "Stage 2 : package upgrade"

. ./tools/command_exist.sh
if [ $(command_exist "brew") == "false" ]; then
	if [ $OS == 'mac' ]; then
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
		eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
	elif [ $OS == 'ubuntu' ]; then
		sudo apt-get update -y
		sudo apt-get install -y procps curl file gcc git build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev libbz2-dev lzma liblzma-dev libbz2-dev
		sudo apt-get upgrade -y
		export PKG_CONFIG_PATH=/usr/lib/x86_64-linux-gnu/pkgconfig
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
		eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
	fi
else
	echo "brew has already been installed"
fi
if [ -z $DEBUG ]; then
	. ./tools/updater.sh
else
	echo "Skip update tools"
fi

echo "Stage 3 : isntall packages"
# install some tools
. ./tools/command_exist.sh
brew install $(cat install_list/brew.list | tr '\n' ' ')
if [ $OS == 'mac' ]; then
	brew install $(cat install_list/brew_only_mac.list | tr '\n' ' ')
	brew install --cask $(cat install_list/brew_cask.list | tr '\n' ' ')
fi
brew autoremove

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
