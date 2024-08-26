Import-Module posh-git
Import-Module oh-my-posh
Import-Module -Name Terminal-Icons

Set-PoshPrompt -Theme "$HOME\Documents\PowerShell\ohmyposhv3-v2.json"
Export-PoshTheme -FilePath "$HOME\Documents\PowerShell\ohmyposhv3-v2.json" -Format json

# Importar el perfil de Chocolatey
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

