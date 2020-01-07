$packageName = 'eartrumpet'
$url = 'https://github.com/Nonononoki/EarTrumpet/releases/download/2.1.5.0/EarTrumpet_2.1.5.0.zip'
$checksum = '3e87acb70ab570a2a4f304f2e67e92e6ae64d9ad88775ee6dcd73810401893c7'
$checksumType = 'sha256'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$exeFile = Join-Path $toolsDir "Release\EarTrumpet.exe"

Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum" `
                             -ChecksumType "$checksumType"

Write-Output "Adding shortcut to Start Menu"
Install-ChocolateyShortcut -ShortcutFilePath "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\EarTrumpet.lnk" -TargetPath $exeFile
Write-Output "Adding shortcut to Startup"
Install-ChocolateyShortcut -ShortcutFilePath "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\EarTrumpet.lnk" -TargetPath $exeFile