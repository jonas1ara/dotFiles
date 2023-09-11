#!/bin/bash

echo " "
echo "This script configures your machine with these vim and tmux settings for .NET development"
echo " "

sudo apt update 

sudo apt install curl vim tmux libuv1-dev -y

echo " "
echo "Installing oh my bash ..."
echo " "

bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

echo " "
echo "Installing vim plug ..."
echo " "

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim    
    
echo " "
echo "Installing fsharp autocomplete ..."
echo " "

dotnet tool install -g fsautocomplete

echo " "
echo "Configuring the clipboard in vim ..."
echo " "

sudo ./Sources/CopyPasteVim.sh

echo " "
echo "Configuring .tmux.conf and .vimrc ..."
echo " "
echo "$(cat Sources/_tmux.conf)" |  sudo tee  ~/.tmux.conf

# reload config file (change file location to your the tmux.conf you want to use)
bind r source-file ~/.tmux.conf

echo " "
echo "$(cat Sources/_vimrc)" | sudo tee ~/.vimrc
echo " "

echo " "
echo "Your vim and tmux has been successfully configured ..."
echo " "

