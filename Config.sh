#!/bin/bash

echo "Este script configura tu máquina con esta configuración de vim y tmux"
echo " "

sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y

sudo apt install vim tmux


echo " "
echo "$(cat Sources/_tmux.conf)" |  sudo tee  ~/.tmux.conf

# reload config file (change file location to your the tmux.conf you want to use)
bind r source-file ~/.tmux.conf


echo " "
echo "$(cat Sources/_vimrc)" | sudo tee ~/.vimrc
echo " "

