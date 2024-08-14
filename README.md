# dotFILES 🖥️

_These files provide a minimal and efficient setup for developing with C# and F# using Neovim and F# autocomplete. This configuration is compatible with Windows, WSL, and Linux environments, making it versatile for various development setups! 😁_

<img src=/src/fsharp-neovim.gif alt="Fsharp in neovim"/>

_PowerShell on Windows 11 (Believe me, if it works on Windows it works on Unix/Linux)_

## Requirements

### Linux (Desktop or WSL)

* [Vim](https://www.vim.org/) - A versatile text editor for coding
* [Tmux](https://github.com/tmux/tmux/wiki) - Terminal multiplexer for managing sessions (only available on Unix/Linux)
* [Ubuntu](https://ubuntu.com/) - A widely used Linux distribution
* [Fedora](https://getfedora.org/) - Another popular Linux distribution

### Windows

> **Note:** Tmux is not available on Windows. For similar functionality, consider using alternatives like Windows Terminal or ConEmu.

* [Scoop](https://scoop.sh/) - Windows package manager
* [Neovim](https://neovim.io/) - Advanced Vim-based text editor
* [.NET SDK](https://dotnet.microsoft.com/) - .NET development tools

## Installation

### Linux (Ubuntu or Fedora)

_Clone this repository and move into it:_

```bash
git clone https://github.com/jonas1ara/dotFiles.git
```

_Run the Setup.sh script (read it first):_
```
cd dotFiles && ./Setup.sh
```

### Windows

To set this up on Windows, you need to install `Scoop` first. Run the following command in PowerShell (preferably as Administrator):

```
Set-ExecutionPolicy RemoteSigned -scope CurrentUser
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
```

_Then, clone this repository and move into it:_

```bash
git clone https://github.com/jonas1ara/dotFiles.git
```

_Run the Setup.sh script (read it first):_
```
cd dotFiles && ./Setup.ps1
```

## Build with 🛠️

* [WSL](https://learn.microsoft.com/en-us/windows/wsl/install) - WSL
* [Ubuntu](https://ubuntu.com/) - Ubuntu
* [Scoop](https://scoop.sh/) - Windows package manager
* [Neovim](https://neovim.io/) - Neovim text editor
* [.NET SDK](https://dotnet.microsoft.com/) - .NET development SDK
* [PowerShell](https://learn.microsoft.com/en-us/powershell/) - PowerShell scripting language
* [Windows 11](https://www.microsoft.com/en-us/windows/windows-11) - Windows 11 operating system

