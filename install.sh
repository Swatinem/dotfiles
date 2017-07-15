#!/bin/sh
#set -o xtrace

mkdir -p ~/.config/nvim
mkdir -p ~/.zfunc

ln -srf ./nvim/init.vim ~/.config/nvim/init.vim
ln -srf ./zshrc ~/.zshrc
ln -srf ./gitconfig ~/.gitconfig

rustup completions zsh > ~/.zfunc/_rustup

# install gnome-terminal theme
#curl https://raw.githubusercontent.com/sonph/onehalf/master/gnome-terminal/onehalfdark.sh -sSf | sh
#curl https://raw.githubusercontent.com/sonph/onehalf/master/gnome-terminal/onehalflight.sh -sSf | sh
