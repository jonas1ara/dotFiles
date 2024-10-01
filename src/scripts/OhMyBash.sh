#!/bin/bash

# Check if curl or wget are installed
if command -v curl >/dev/null; then
    INSTALL_CMD="curl -fsSL"
    INSTALL_URL="https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh"
elif command -v wget >/dev/null; then
    INSTALL_CMD="wget -O -"
    INSTALL_URL="https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh"
else
    echo "Error: You need to have curl or wget installed to continue"
    exit 1
fi

# Install Oh My Bash
bash -c "$INSTALL_CMD $INSTALL_URL" 

# Change theme to 'modern' in .bashrc
BASHRC="$HOME/.bashrc"
if grep -q 'OSH_THEME=' "$BASHRC"; then
    sed -i 's|OSH_THEME="90210"|OSH_THEME="modern"|' "$BASHRC"
else
    echo 'OSH_THEME="modern"' >> "$BASHRC"
fi

echo "The installation of Oh My Bash has been completed and the theme has been set to 'Modern'"
echo "Please restart your terminal or run 'source ~/.bashrc' to apply the changes"
