#!/bin/bash

echo " "
echo "This script sets up Neovim for developing with C# and F# from the terminal"
echo " "

# Obtener el directorio donde está el script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FILES_DIR="$SCRIPT_DIR/../files"

# Detectar el sistema operativo
if [ -f /etc/debian_version ]; then
    # Para Ubuntu
    sudo apt update 
    sudo apt install curl neovim tmux -y
elif [ -f /etc/fedora-release ]; then
    # Para Fedora
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
echo "Configuring .tmux.conf and init.vim ..."
echo " "

# Crear el archivo .tmux.conf
TMUX_CONF_PATH="$FILES_DIR/_tmux.conf"
if [ -f "$TMUX_CONF_PATH" ]; then
    cat "$TMUX_CONF_PATH" | sudo tee ~/.tmux.conf
else
    echo "Source file for .tmux.conf not found."
fi

# Comando para recargar el archivo de configuración de Tmux
echo "To reload the Tmux configuration, run: 'tmux source-file ~/.tmux.conf'"

mkdir -p ~/.config/nvim

echo " "
INIT_VIM_PATH="$FILES_DIR/_init.vim"
if [ -f "$INIT_VIM_PATH" ]; then
    cat "$INIT_VIM_PATH" | sudo tee ~/.config/nvim/init.vim
else
    echo "Source file for init.vim not found."
fi
echo " "

echo " "
echo "Your Neovim and Tmux have been successfully configured ..."
echo " "
