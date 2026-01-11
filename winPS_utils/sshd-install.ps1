# Install sshd on Windows 10

Add-WindowsCapability -Online -Name OpenSSH.Server

Start-Service sshd

Set-Service -Name sshd -StartupType 'Automatic'

Get-Service sshd