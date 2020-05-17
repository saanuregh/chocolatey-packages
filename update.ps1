#REGION STARSHIP
cd starship
$url = "https://api.github.com/repos/starship/starship/releases/latest"
$jsonData = (Invoke-WebRequest $url | ConvertFrom-Json)
$version = '<version>'+$jsonData.name.substring(1)+'</version>'
$sha_url = ($jsonData.assets | where { $_.name -eq "starship-x86_64-pc-windows-msvc.zip.sha256" }).browser_download_url
$sha = "`$checksum = '$((Invoke-WebRequest $sha_url).ToString().Trim())'"
(Get-Content starship.nuspec) -replace '<version>.*</version>',$version | Set-Content -Path starship.nuspec
(Get-Content tools\chocolateyInstall.ps1) -replace '\$checksum = .*',$sha | Set-Content -Path tools\chocolateyInstall.ps1
choco pack
$pkg = 'starship.'+$jsonData.name.substring(1)+'.nupkg'
choco push $pkg -s https://push.chocolatey.org/
rm $pkg 
cd ..
#ENDREGION STARPSHIP