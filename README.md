# Windows環境構築
## PowerShell関連
1. PowerShellを管理者権限で実行し、以下を実行

   ```
   Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
   ```

2. Microsoft.PowerShell_profile.ps1を`%USERPROFILE%\Documents\WindowsPowerShell\`に配置

## Chocolatey
1. 管理者でPowerShellを実行し、以下を実行してChocolateyをインストールする

   ```
   Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
   ```

2. 以下のコマンドでパッケージを一括インストール

   ```
   cinst packages.config -y

   ```
