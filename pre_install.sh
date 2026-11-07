#!/bin/bash

set -e

sudo apt install -y build-essential cmake tmux python3-dev curl gawk

# Install exfat support
# exfat-utils has been replaced by exfatprogs in Ubuntu 22.04 and later.
# sudo apt install exfat-fuse exfat-utils
sudo apt install exfat-fuse exfatprogs

# Install LSD (LSDeluxe)-enhanced ls command 
sudo apt install lsd

# Checkout pyenv from GitHub
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

# Install Poetry (Python)
curl -sSL https://install.python-poetry.org | python3 -

# Install uv (Python)
curl -LsSf https://astral.sh/uv/install.sh | sh

# Install for banner when new terminal
sudo apt install figlet screenfetch

# Install Starship (Cross-shell Prompt)
curl -sS https://starship.rs/install.sh | sh

# Install JSON and YAML processors
sudo apt install jq yq

# Install ripgrep (fast search tool)
sudo apt install ripgrep

# Install fd (fast alternative to find)
sudo apt install fd-find
ln -s $(which fdfind) ~/.local/bin/fd

# Install tree (directory listing tool)
sudo apt install tree
