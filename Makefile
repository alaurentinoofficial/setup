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

machintosh-install:
	sh ./setup-brew.sh
	sh ./setup-nerd-fonts.sh
	sh ./setup-omz.sh
	sh ./setup-neovim.sh
	sh ./setup-tmux.sh
