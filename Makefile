ifeq ($(OS),Windows_NT)     # is Windows_NT on XP, 2000, 7, Vista, 10...
    detected_OS := Windows
else
    detected_OS := $(shell uname)  # same as "uname -s"
endif

os:
	echo $(detected_OS)

copy-current-files:
	cp ~/.zshrc ./dotfiles/
	cp ~/.p10k.zsh ./dotfiles/
	cp ~/.tmux.conf ./dotfiles/

install-current-files:
	cp ./dotfiles/.zshrc ~/
	cp ./dotfiles/.p10k.zsh ~/
	cp ./dotfiles/.tmux.conf ~/

machintosh-brew-install:
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

machintosh-install-dependencies-old:
	brew install git zsh neovim wget
	brew install qemu colima docker docker-completion docker-compose kubernetes-cli helm terraform terragrunt
	brew install go node yarn rustup-init python@3.12 openjdk@11 maven sbt scala@2.12

machintosh-install-dependencies:
	xargs brew install < brew.txt

neovim-configure:
	mv ~/.config/nvim{,.bak}
	git clone https://github.com/alaurentinoofficial/nvim ~/.config/nvim

oh-my-zsh:
	sudo chsh -s $(which zsh) $USER
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	cp dotfiles/.zshrc ~/.zshrc
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
	cp dotfiles/.p10k.zsh ~/.p10k.zsh
	git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions 
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

tmux:
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	tmux source ~/.tmux.conf

machintosh-install: machintosh-brew-install machintosh-install-dependencies oh-my-zsh neovim-configure

