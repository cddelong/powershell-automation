# Enables the WSL
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart

# Enable the VM feature
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

Restart-Computer

$file = $env:HOMEPATH + "\wsl_update_x64.msi"
$WebClient = New-Object System.Net.WebClient
$WebClient.DownloadFile(
    "https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi",
    $file)
msiexec.exe /I .\wsl_update_x64.msi /passive

wsl --set-default-version 2