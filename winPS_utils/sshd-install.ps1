# Install sshd on Windows and Windows Server

Add-WindowsCapability -Online -Name OpenSSH.Server

Start-Service sshd

Set-Service -Name sshd -StartupType 'Automatic'

Get-Service sshd