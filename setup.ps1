# config
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowFrequent" /t "REG_DWORD" /d "0" /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowRecent" /t "REG_DWORD" /d "0" /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Hidden" /t "REG_DWORD" /d "1" /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HiddenFileExt" /t "REG_DWORD" /d "0" /f
Write-Output ":: Restarting Explorer..."
taskkill /f /im explorer.exe
Start-Sleep 1
Start-Process explorer.exe

# capslock -> ctrl
Set-ItemProperty -path "HKLM:\SYSTEM\CurrentControlSet\Control\Keyboard Layout" -name "Scancode Map" -Value ([byte[]](0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x03,0x00,0x00,0x00,0x1d,0x00,0x3a,0x00,0x3a,0x00,0x3a,0x00,0x00,0x00,0x00,0x00))

# Remove pre-install apps
Get-AppxPackage Microsoft.MicrosoftOfficeHub | Remove-AppxPackage
Get-AppxPackage Microsoft.SkypeApp | Remove-AppxPackage


# Package install
Write-Output ":: Install Chocolatey..."
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
cinst packages.config -y

# Powershell profile
New-Item %USERPROFILE%\Documents\WindowsPowerShell\ -ItemType Directory
Move-Item Microsoft.PowerShell_profile.ps1 %USERPROFILE%\Documents\WindowsPowerShell\