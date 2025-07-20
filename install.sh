#!/bin/bash

set -e

# Clean up targets
rm -rf $HOME/.vim* $HOME/.zsh* $HOME/.tmux* $HOME/.fonts

# Symlink files
ln -s $PWD/zshrc $HOME/.zshrc
# ln -s $PWD/p10k.zsh $HOME/.p10k.zsh
ln -s $PWD/starship.toml $HOME/.config/starship.toml
ln -s $PWD/tmux.conf $HOME/.tmux.conf
ln -s $PWD/vimrc $HOME/.vimrc
