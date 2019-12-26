#!/bin/sh
#set -o xtrace

mkdir -p ~/.config/nvim
mkdir -p ~/.zfunc
mkdir -p ~/.config/Code/User

ln -srf ./nvim/init.vim ~/.config/nvim/init.vim
ln -srf ./zshrc ~/.zshrc
ln -srf ./gitconfig ~/.gitconfig
ln -srf ./starship.toml ~/.config/starship.toml

for file in $(ls ./vscode/)
do
    ln -srf ./vscode/$file ~/.config/Code/User/$file
done

# TODO:
# * vscode extensions
# * alacritty config
# * tmux config

rustup completions zsh > ~/.zfunc/_rustup

# install gnome-terminal theme
#curl https://raw.githubusercontent.com/sonph/onehalf/master/gnome-terminal/onehalfdark.sh -sSf | sh
#curl https://raw.githubusercontent.com/sonph/onehalf/master/gnome-terminal/onehalflight.sh -sSf | sh
