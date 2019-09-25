#!/bin/bash

set -e

sudo apt install -y build-essential cmake tmux python3-dev curl gawk

# install exfat support
sudo apt install exfat-fuse exfat-utils
