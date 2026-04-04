param(
    [ValidateSet('onefile', 'onedir')]
    [string]$Mode = 'onefile'
)

$ErrorActionPreference = 'Stop'
Set-Location -LiteralPath $PSScriptRoot

function Get-PyInstallerCommand {
    $pyLauncher = Get-Command py -ErrorAction SilentlyContinue
    if ($pyLauncher) {
        return @{
            Command = $pyLauncher.Source
            Arguments = @('-m', 'PyInstaller')
        }
    }

    $python = Get-Command python -ErrorAction SilentlyContinue
    if ($python) {
        return @{
            Command = $python.Source
            Arguments = @('-m', 'PyInstaller')
        }
    }

    $pyInstaller = Get-Command pyinstaller -ErrorAction SilentlyContinue
    if ($pyInstaller) {
        return @{
            Command = $pyInstaller.Source
            Arguments = @()
        }
    }

    throw 'PyInstaller was not found. Install it first, then run build.ps1 again.'
}

$pyInstaller = Get-PyInstallerCommand
$modeFlag = if ($Mode -eq 'onedir') { '--onedir' } else { '--onefile' }

$arguments = @(
    $pyInstaller.Arguments
    '--noconfirm'
    '--clean'
    $modeFlag
    '--windowed'
    '--name', 'Notepad-X'
    '--icon', 'gfx\Notepad-X.ico'
    '--add-data', 'gfx;gfx'
    '--add-data', 'audio;audio'
    '--add-data', 'Notepad-X-help.txt;.'
    '--add-data', 'cfg\spellcheck;cfg\spellcheck'
    'Notepad-X.py'
)

& $pyInstaller.Command @arguments
