# Este script configura Neovim y F# autocomplete para el desarrollo en .NET en Windows
# utilizando Scoop y .NET CLI.

Write-Host " "
Write-Host "Este script configura Neovim y F# autocomplete para desarrollo en .NET"
Write-Host " "

# Actualizar Scoop y las herramientas disponibles
Write-Host "Actualizando Scoop ..."
scoop update

# Instalar curl, neovim si no están instalados
Write-Host "Instalando curl y Neovim ..."
scoop install curl neovim

# Instalar vim-plug para Neovim
Write-Host "Instalando vim-plug para Neovim ..."
Invoke-Expression 'curl -fLo "$env:LOCALAPPDATA/nvim-data/site/autoload/plug.vim" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Instalar fsautocomplete con dotnet tool
Write-Host "Instalando F# autocomplete ..."
dotnet tool install -g fsautocomplete

# Crear la carpeta de configuración de Neovim si no existe
$neovimConfigDir = "$HOME\AppData\Local\nvim"
if (-not (Test-Path $neovimConfigDir)) {
    New-Item -ItemType Directory -Force -Path $neovimConfigDir
}

# Configurar init.vim para Neovim
Write-Host "Configurando init.vim ..."
$initVimPath = "$neovimConfigDir\init.vim"
$sourceInitVim = Get-Content "Sources/_init.vim" -Raw
$sourceInitVim | Set-Content $initVimPath

Write-Host " "
Write-Host "Neovim ha sido configurado correctamente para el desarrollo en .NET"
Write-Host " "

