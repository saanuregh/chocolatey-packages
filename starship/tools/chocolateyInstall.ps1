$packageName = 'starship'
$url = 'https://github.com/starship/starship/releases/download/v'+$env:ChocolateyPackageVersion+'/starship-x86_64-pc-windows-msvc.zip'
$checksum = 'e1947d242fd8710038db2e08e99c2439d29ce2b7d4914c189563ea60e41e2c6e'
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
