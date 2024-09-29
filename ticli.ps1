if (-not ([Security.Principal.WindowsIdentity]::GetCurrent().Groups -match 'S-1-5-32-544')) {
    Clear-Host
    Write-Host "[ - ] please run as administrator" -ForegroundColor Red
    exit 
}

if (-not (Get-Module -ListAvailable -Name NtObjectManager)) {
    Install-Module -Name NtObjectManager
}

Clear-Host
Write-Host " _____ ___    _ _ "
Write-Host "|_   _|_ _|__| (_)"
Write-Host "  | |  | |/ _| | |"
Write-Host "  |_| |___\__|_|_|"
Write-Host "     by roooot.dev"
Write-Host ""

Write-Host "[ i ] elevate yourself to trustedinstaller"
Write-Host "[ ! ] if you continue you might accidentally break your os" -ForegroundColor Yellow
Write-Host ""

$continue = $null
while ($continue -ne 'y') {
    $continue = Read-Host -Prompt "[ ! ] enter 'y' to proceed" | Out-String
    $continue = $continue.Trim().ToLower()

    if ($continue -ne 'y') {
        Clear-Host
        exit
    } else {
        Write-Host ""
    }
}

function Invoke-TrustedInstaller {
    Write-Host "[ + ] importing ntobjectmanager"
    Import-Module NtObjectManager
    Write-Host "[ i ] imported ntobjectmanager"
    Write-Host "[ + ] setting nttokenprivilege"
    Set-NtTokenPrivilege SeDebugPrivilege > $null
    Write-Host "[ i ] set nttokenprivilege to sedebugprivelege"
    Write-Host "[ + ] starting trustedinstaller"
    Start-Service TrustedInstaller
    Write-Host "[ i ] started trustedinstaller"
    Write-Host ""
    Write-Host "[ + ] getting trustedinstaller pid"
    $p = Get-NtProcess -Name TrustedInstaller.exe
    Write-Host "[ i ] got trustedinstaller pid"
    Write-Host "[ + ] spawning shell"
    Write-Host "[ + ] elevating shell to trustedinstaller"
    $proc = New-Win32Process cmd.exe -CreationFlags NewConsole -ParentProcess $p
    Write-Host "[ i ] spawned shell"
    Write-Host "[ i ] elevating shell to trustedinstaller"
    Write-Host ""
    Write-Host "[ ! ] spawned elevated shell"
}

Invoke-TrustedInstaller
