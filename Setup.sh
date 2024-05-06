#!/bin/bash

echo " "
echo "This script configures your machine with these vim and tmux settings for .NET development"
echo " "

sudo apt update 

sudo apt install curl neovim tmux -y

echo " "
echo "Installing vim plug for neovim ..."
echo " "

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo " "
echo "Installing fsharp autocomplete ..."
echo " "

dotnet tool install -g fsautocomplete

echo " "
echo "Configuring .tmux.conf and .init.vim ..."
echo " "
echo "$(cat Sources/_tmux.conf)" |  sudo tee  ~/.tmux.conf

# reload config file (change file location to your the tmux.conf you want to use)
bind r source-file ~/.tmux.conf

mkdir ~/.config/nvim

echo " "
echo "$(cat Sources/_init.vim)" | sudo tee ~/.config/nvim/init.vim
echo " "

echo " "
echo "Your neovim and tmux has been successfully configured ..."
echo " "

