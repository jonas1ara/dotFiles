# setup_terminal.ps1

# Verificar si winget está instalado
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Host "winget no está instalado. Asegúrate de tenerlo disponible."
    exit
}

# Instalar PowerShell
winget install --id Microsoft.Powershell --source winget -y

# Instalar Scoop si no está instalado
if (-not (Get-Command scoop -ErrorAction SilentlyContinue)) {
    Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
    iex (new-object net.webclient).downloadstring('https://get.scoop.sh')
}

# Agregar el bucket de nerd-fonts y instalar Cascadia Code
scoop bucket add nerd-fonts
scoop install Cascadia-Code

# Crear o modificar el archivo Microsoft.PowerShell_profile
$profilePath = "$HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"

if (-not (Test-Path $profilePath)) {
    New-Item -Path $profilePath -ItemType File -Force
}

# Configurar el perfil
@"
Import-Module posh-git
Import-Module oh-my-posh
Import-Module -Name Terminal-Icons

Set-PoshPrompt -Theme $HOME\Documents\PowerShell\ohmyposhv3-v2.json
Export-PoshTheme -FilePath $HOME\Documents\PowerShell\ohmyposhv3-v2.json -Format json

$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
    Import-Module "$ChocolateyProfile"
}

# Alias
Set-Alias vim nvim
Set-Alias ll ls
Set-Alias g git
Set-Alias d dotnet
Set-Alias c cls
Set-Alias grep findstr
"@ | Set-Content $profilePath -Force

# Crear el archivo de configuración ohmyposhv3-v2.json
$jsonPath = "$HOME\Documents\PowerShell\ohmyposhv3-v2.json"

if (-not (Test-Path $jsonPath)) {
    @"
{
  "$schema": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json",
  "blocks": [
    {
      "alignment": "left",
      "horizontal_offset": 0,
      "segments": [
        {
          "background": "#ff479c",
          "foreground": "#ffffff",
          "invert_powerline": false,
          "leading_diamond": "",
          "powerline_symbol": "",
          "properties": {
            "prefix": "  ",
            "style": "folder"
          },
          "style": "diamond",
          "trailing_diamond": "",
          "type": "path"
        },
        {
          "background": "#fffb38",
          "foreground": "#193549",
          "invert_powerline": false,
          "leading_diamond": "",
          "powerline_symbol": "",
          "properties": {
            "display_stash_count": true,
            "display_status": true,
            "display_upstream_icon": true
          },
          "style": "powerline",
          "trailing_diamond": "",
          "type": "git"
        },
        {
          "background": "#6CA35E",
          "foreground": "#ffffff",
          "invert_powerline": false,
          "leading_diamond": "",
          "powerline_symbol": "",
          "properties": {
            "display_version": true,
            "prefix": "  "
          },
          "style": "powerline",
          "trailing_diamond": "",
          "type": "dotnet"
        },
        {
          "background": "#ffff66",
          "foreground": "#ffffff",
          "invert_powerline": false,
          "leading_diamond": "",
          "powerline_symbol": "",
          "properties": null,
          "style": "powerline",
          "trailing_diamond": "",
          "type": "root"
        },
        {
          "background": "#2e9599",
          "foreground": "#ffffff",
          "invert_powerline": false,
          "leading_diamond": "",
          "powerline_symbol": "",
          "properties": {
            "always_enabled": true,
            "color_background": true,
            "display_exit_code": false,
            "error_color": "#f1184c",
            "prefix": " "
          },
          "style": "powerline",
          "trailing_diamond": "",
          "type": "exit"
        }
      ],
      "type": "prompt",
      "vertical_offset": 0
    }
  ],
  "console_title": true,
  "console_title_style": "folder",
  "final_space": true
}
"@ | Set-Content $jsonPath -Force
}

Write-Host "La configuración de la terminal se ha completado. Por favor, reinicia PowerShell para aplicar los cambios."

