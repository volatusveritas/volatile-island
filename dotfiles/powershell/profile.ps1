# Modules and packages
Import-Module posh-git


# Functions
function Vlt-Prompt
{
    $drive = $PWD.drive.name
	$current = Split-Path -Leaf $PWD
	$parent = Split-Path -Parent $PWD

	if (-Not $parent.Length.Equals(0))
    {
		$parent = Split-Path -Leaf $parent

        # When a drive root is the parent of the current directory, it already
        # comes with a backslash, and adding another one would look like 'X:\\'
		if (-Not $parent.EndsWith("\")) { $parent += "\" }
	}
	
	$env:VLTPROMPT = " ${drive}:  $parent$current"
}


# Single commands
Set-Location ~\Documents\

Set-Alias dtr tree
Set-Alias out Out-String


# Prompt configuration
Set-Alias -Scope Global -Force -Name "Set-PoshContext" -Value "Vlt-Prompt"
$env:POSH_GIT_ENABLED = $true
$GitPromptSettings.BeforeStatus.Text = "`e[96m `e[39m"
$GitPromptSettings.AfterStatus.Text = ""

oh-my-posh --init --shell pwsh --config ~\AppData\Local\Programs\oh-my-posh\themes\volatile.omp.json | Invoke-Expression


winfetch
