#!/bin/bash

echo "This script configures your machine with these vim and tmux settings"
echo " "

sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y

sudo apt install vim tmux -y

echo "Install vim plug"
echo " "

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    
    
echo "Install FSharp autocomplete"
echo " "

# dotnet tool install -g fsautocomplete

echo " "
echo "$(cat Sources/_tmux.conf)" |  sudo tee  ~/.tmux.conf

# reload config file (change file location to your the tmux.conf you want to use)
bind r source-file ~/.tmux.conf


echo " "
echo "$(cat Sources/_vimrc)" | sudo tee ~/.vimrc
echo " "
