# OhMyPosh.ps1

# Check if winget is installed

if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Host "Winget are not installed, make sure you have it available."
    exit
}

# Install PowerShell

winget install --id Microsoft.Powershell --source winget

# Install Scoop if it is not installed 

if (-not (Get-Command scoop -ErrorAction SilentlyContinue)) {
    Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
    iex (new-object net.webclient).downloadstring('https://get.scoop.sh')
}

# Add the nerd-fonts bucket and install Cascadia Code

scoop bucket add nerd-fonts
scoop install Cascadia-Code

# Create or modify the file Microsoft.PowerShell_profile

$profilePath = "$HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"

if (-not (Test-Path $profilePath)) {
    New-Item -Path $profilePath -ItemType File -Force
}

# Configure the profile from the file in the 'files' folder

$filesDir = Join-Path -Path $PSScriptRoot -ChildPath "..\files"
$filesDir = Resolve-Path $filesDir

$profileSource = Join-Path -Path $filesDir -ChildPath "Microsoft.PowerShell_profile.ps1"

if (Test-Path $profileSource) {
    $sourceProfile = Get-Content $profileSource -Raw
    $sourceProfile | Set-Content $profilePath -Force
} else {
    Write-Error "The profile file is not located in the 'files' folder. Check the route: $profileSource"
}

# Create the configuration file ohmyposhv3-v2.json

$jsonPath = "$HOME\Documents\PowerShell\ohmyposhv3-v2.json"
$jsonSource = Join-Path -Path $filesDir -ChildPath "ohmyposhv3-v2.json"

if (-not (Test-Path $jsonPath)) {
    if (Test-Path $jsonSource) {
        Copy-Item -Path $jsonSource -Destination $jsonPath -Force
        Write-Host "File ohmyposhv3-v2.json successfully copied"
    } else {
        Write-Error "Oh-my-posh's JSON file is not in the 'files' folder. Check the route: $jsonSource"
    }
}

# Check if oh-my-posh is installed and configure it

if (-not (Get-Command oh-my-posh -ErrorAction SilentlyContinue)) {
    Write-Host "oh-my-posh is not installed. Installing it now..."
    winget install --id JanDeDobbeleer.OhMyPosh --source winget
}

Write-Host "Terminal setup with Oh My Posh successfully completed!"

