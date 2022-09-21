# Reset contents
Remove-Item -Force -Recurse dotfiles\

# Neovim folder
New-Item -ItemType Directory dotfiles\neovim\
# PowerShell folder
New-Item -ItemType Directory dotfiles\powershell\

# Neovim's init
Copy-Item -Force -Recurse ~\AppData\Local\nvim\* dotfiles\neovim\

# PowerShell profile
Copy-Item -Force `
    ~\Documents\PowerShell\profile.ps1 dotfiles\powershell\profile.ps1
