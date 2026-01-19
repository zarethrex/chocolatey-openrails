
$ErrorActionPreference = 'Stop';
$checksum = "e1fd7d0b5e2f70420b4ef82c61efec0d0d98460fd8db970bab1a1fa7119a0cf5e3a7d1cbd31ecfdb28b1c388723db02b4867c2cf5975935fd620a97362fecd78"
$repository = "openrails/openrails"
$software_name = "Open Rails"

Write-Host "Fetching version '$env:ChocolateyPackageVersion'"

$download_url = "https://github.com/$repository/releases/download/$env:ChocolateyPackageVersion/Open.Rails.$env:ChocolateyPackageVersion.zip"
$toolsDir = "${env:ProgramFiles(x86)}\$software_name"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = $download_url
  softwareName   = $software_name
  checksum       = $checksum
  checksumType   = 'sha512'
  validExitCodes= @(0, 3010, 1605, 1614, 1641)
}

$exe_path = "$toolsDir\OpenRails.exe"
Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyPath -PathToInstall $toolsDir -PathType "User"

Install-ChocolateyShortcut -ShortcutFilePath "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\$software_name.lnk" -TargetPath "$exe_path"

Update-SessionEnvironment
