if [ ! -d ~/.tmux/plugins/tpm ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

cp ./dotfiles/.tmux.conf ~/
tmux source ~/.tmux.conf
