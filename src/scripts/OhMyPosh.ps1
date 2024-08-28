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

# Configurar el perfil desde el archivo en la carpeta 'files'
$filesDir = "$PSScriptRoot\..\files"  # Ajusta la ruta según la estructura de tu proyecto
$profileSource = Join-Path -Path $filesDir -ChildPath "Microsoft.PowerShell_profile.ps1"

if (Test-Path $profileSource) {
    $sourceProfile = Get-Content $profileSource -Raw
    $sourceProfile | Set-Content $profilePath -Force
} else {
    Write-Host "El archivo de perfil no se encuentra en la carpeta 'files'."
}

# Crear el archivo de configuración ohmyposhv3-v2.json
$jsonPath = "$HOME\Documents\PowerShell\ohmyposhv3-v2.json"
$jsonSource = Join-Path -Path $filesDir -ChildPath "ohmyposhv3-v2.json"

if (-not (Test-Path $jsonPath)) {
    if (Test-Path $jsonSource) {
        Copy-Item -Path $jsonSource -Destination $jsonPath -Force
    } else {
        Write-Host "El archivo JSON de oh-my-posh no se encuentra en la carpeta 'files'."
    }
}

Write-Host "La configuración de la terminal se ha completado. Por favor, reinicia PowerShell para aplicar los cambios."

