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
### Manual font installation 
Manual font installation for Powerlevel10k use.
Download these four ttf files:
   - [MesloLGS NF Regular.ttf](
       https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf)
   - [MesloLGS NF Bold.ttf](
       https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf)
   - [MesloLGS NF Italic.ttf](
       https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf)
   - [MesloLGS NF Bold Italic.ttf](
       https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf)

Double-click on each file and click "Install". This will make `MesloLGS NF` font available to all applications on your system.


## Configration

### Prompt at the bottom of the terminal
If you want Fix prompt at the bottom of the terminal window, UnComment this line: `printf '\n%.0s' {1..100}`
```shell
# Prompt at the bottom of the terminal
# printf '\n%.0s' {1..100}
```
