#!/bin/bash

echo "This script configures your machine with these vim and tmux settings"
echo " "

sudo apt update 

sudo apt install curl vim tmux -y

echo "Install oh my bash"
echo " "

bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

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
echo "$(cat Sources/_vimrc2)" | sudo tee ~/.vimrc
echo " "
