$packageName = 'starship'
$url = 'https://github.com/starship/starship/releases/download/v0.33.0/starship-x86_64-pc-windows-msvc.zip'
$checksum = '5edb5e97305ce0fe283785c1a48cb0f04c9f3df1b8cc66ca5aa1b67e161f99cf'
$checksumType = 'sha256'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$installFile = Join-Path $toolsDir "starship.exe"

Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum" `
                             -ChecksumType "$checksumType"

# Add to Profile
Write-Host "Add the following to the end of ~\Documents\PowerShell\Microsoft.PowerShell_profile.ps1 'Invoke-Expression (&starship init powershell)'"