# This script configures Neovim and F# autocomplete for .NET development on Windows
# using Scoop and .NET CLI.

Write-Host " "
Write-Host "This script configures Neovim and F# autocomplete for .NET development"
Write-Host " "

# Update Scoop and available tools
Write-Host "Updating Scoop ..."
scoop update

# Install curl, neovim if not already installed
Write-Host "Installing curl and Neovim ..."
scoop install curl neovim

# Install vim-plug for Neovim
Write-Host "Installing vim-plug for Neovim ..."
Invoke-Expression 'curl -fLo "$env:LOCALAPPDATA/nvim-data/site/autoload/plug.vim" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install fsautocomplete with dotnet tool
Write-Host "Installing F# autocomplete ..."
dotnet tool install -g fsautocomplete

# Create Neovim configuration folder if it doesn't exist
$neovimConfigDir = "$HOME\AppData\Local\nvim"
if (-not (Test-Path $neovimConfigDir)) {
    New-Item -ItemType Directory -Force -Path $neovimConfigDir
}

# Configure init.vim for Neovim
Write-Host "Configuring init.vim ..."

# Use $PSScriptRoot to point to the correct path relative to this script
$sourceInitVimPath = Join-Path -Path $PSScriptRoot -ChildPath "..\files\_init.vim"

if (Test-Path $sourceInitVimPath) {
    $sourceInitVim = Get-Content $sourceInitVimPath -Raw
    $sourceInitVim | Set-Content "$neovimConfigDir\init.vim"
} else {
    Write-Host "The _init.vim file is not located in the expected path."
}

Write-Host " "
Write-Host "Neovim has been successfully configured for .NET development"
Write-Host " "
