#!/bin/bash

set -e

sudo apt install -y build-essential cmake tmux python3-dev curl gawk

# install exfat support
# exfat-utils has been replaced by exfatprogs in Ubuntu 22.04 and later.
# sudo apt install exfat-fuse exfat-utils
sudo apt install exfat-fuse exfatprogs

# Checkout pyenv from GitHub
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

# Install Poetry (Python)
curl -sSL https://install.python-poetry.org | python3 -

# Install for banner when new terminal
sudo apt install figlet screenfetch
