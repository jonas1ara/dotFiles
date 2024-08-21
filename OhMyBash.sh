#!/bin/bash

# Verificar si curl o wget están instalados
if command -v curl >/dev/null; then
    INSTALL_CMD="curl -fsSL"
    INSTALL_URL="https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh"
elif command -v wget >/dev/null; then
    INSTALL_CMD="wget -O -"
    INSTALL_URL="https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh"
else
    echo "Error: Necesitas tener instalado curl o wget para continuar."
    exit 1
fi

# Instalar Oh My Bash
bash -c "$INSTALL_CMD $INSTALL_URL" 

# Cambiar el tema a 'modern' en .bashrc
BASHRC="$HOME/.bashrc"
if grep -q 'OSH_THEME=' "$BASHRC"; then
    sed -i 's|OSH_THEME="90210"|OSH_THEME="modern"|' "$BASHRC"
else
    echo 'OSH_THEME="modern"' >> "$BASHRC"
fi

# Recargar la configuración de la terminal
source "$BASHRC"

echo "La instalación de Oh My Bash se ha completado y el tema se ha configurado como 'modern'."
echo "Por favor, reinicia tu terminal o ejecuta 'source ~/.bashrc' para aplicar los cambios."
