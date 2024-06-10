#!/bin/bash

[[ "$XDG_CONFIG_HOME" != "" ]] && export XDG_CONFIG_HOME=$HOME/.config
[[ "$XDG_DATA_HOME" != "" ]] && export XDG_DATA_HOME=$HOME/.local/share
[[ "$XDG_CACHE_HOME" != "" ]] && export XDG_CACHE_HOME=$HOME/.cache
[[ "$XDG_RUNTIME_DIR" != "" ]] && export XDG_RUNTIME_DIR=/run/user/$(id -u)

distribution=$(lsb_release -i | awk '{print $3}')
current_shell=$(echo $SHELL | awk -F '/' '{print $NF}')

case $distribution in
	Arch)
		sudo pacman -Syu --needed --noconfirm \
			exuberant-ctags \
			wget \
			curl \
			git \
			nvm \
			nodejs \
			npm \
			ripgrep \
			fd \
			tree \
			neovim \
			python3 \
			python-pip \
			gnupg

		clear
	;;
	Debian)

		sudo apt-get update
		sudo apt-get install -y \
			wget \
			git \
			curl \
			fzf \
			unzip \
			zip \
			gcc \
			ripgrep \
			fd-find \
			tree \
			python3 \
			python3-pip \
			gnupg

		clear

		if ! command -v node > /dev/null; then
			curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

			clear

			[[ -f $XDG_CONFIG_HOME/nvm/nvm.sh ]] && source $XDG_CONFIG_HOME/nvm/nvm.sh
			[[ $(command -v nvm) != "" ]] && nvm install --lts

			clear

		fi

		if ! command -v nvim > /dev/null; then
			curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
			tar xzvf nvim-linux64.tar.gz
			rm nvim-linux64.tar.gz
			sudo mv nvim-linux64/ /opt
			sudo ln -s /opt/nvim-linux64/bin/nvim /usr/local/bin/nvim

			clear
		fi

		;;
esac

[[ -d $XDG_CONFIG_HOME ]] && pack=$XDG_CONFIG_HOME/local || pack=$HOME/.local
pack=$pack/share/nvim/site/pack
echo $pack
[[ -d $pack ]] && rm -rf $pack

[[ -d $XDG_CONFIG_HOME ]] && destination=$XDG_CONFIG_HOME || destination=$HOME/.config
destination=$destination/nvim

if [[ -d $destination ]]; then
	backup=$destination.backup
	i=1
	while [[ -d $backup ]]; do
		backup=$destination.backup-$i
		i=$((i+1))
	done
	mv $destination $backup
fi

git clone https://github.com/valentingorr/nvim-config $destination

nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync' && nvim && exit 0
