#!/bin/bash

echo " "
echo "This script configures your machine with Neovim and F# autocomplete settings for .NET development"
echo " "

# Detect the OS
if [ -f /etc/debian_version ]; then
    # For Ubuntu
    sudo apt update 
    sudo apt install curl neovim tmux -y
elif [ -f /etc/fedora-release ]; then
    # For Fedora
    sudo dnf install curl neovim tmux -y
else
    echo "Unsupported operating system. Please use Ubuntu or Fedora."
    exit 1
fi

echo " "
echo "Installing vim plug for Neovim ..."
echo " "

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo " "
echo "Installing F# autocomplete ..."
echo " "

dotnet tool install -g fsautocomplete

echo " "
echo "Configuring .tmux.conf and .init.vim ..."
echo " "

# Create the .tmux.conf file
if [ -f Sources/_tmux.conf ]; then
    cat Sources/_tmux.conf | sudo tee ~/.tmux.conf
else
    echo "Source file for .tmux.conf not found."
fi

# Reload config file command (for Tmux, user needs to run this manually)
echo "To reload the Tmux configuration, run: 'tmux source-file ~/.tmux.conf'"

mkdir -p ~/.config/nvim

echo " "
if [ -f Sources/_init.vim ]; then
    cat Sources/_init.vim | sudo tee ~/.config/nvim/init.vim
else
    echo "Source file for init.vim not found."
fi
echo " "

echo " "
echo "Your Neovim and Tmux have been successfully configured ..."
echo " "

