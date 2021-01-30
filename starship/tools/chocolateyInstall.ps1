$packageName = 'starship'
$url = 'https://github.com/starship/starship/releases/download/v'+$env:ChocolateyPackageVersion+'/starship-x86_64-pc-windows-msvc.zip'
$checksum = 'b9f1ef3830591e4a36a786fb276c508c6a7e3b97e35413e82293fad2e287bf25'
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
