# dotfiles for zsh, vim and tmux

## Install on ubuntu

### Requirment:
- zsh
- vim > 7
- php >= 7.2

Clone repositoriy to local folder named .dotfiles.
```
$ git clone https://github.com/ninthday/dotfiles.git ~/.dotfiles
```
### Install
Before running install.sh, please run pre_install.sh for some plug (optional) with zplug.
```bash
$ cd ~/.dotfiles
$ ./pre_install.sh

```

Runing install.sh to clean up old files and build symbolic link
```bash
$ ./install.sh
```

