# Neovim's Init
Copy-Item -Force -Recurse dotfiles\neovim\* ~\AppData\Local\nvim\

# PowerShell profile
Copy-Item -Force `
    dotfiles\powershell\profile.ps1 ~\Documents\PowerShell\profile.ps1
