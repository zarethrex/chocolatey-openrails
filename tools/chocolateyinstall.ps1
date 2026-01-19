
$ErrorActionPreference = 'Stop';
$checksum = "c5698c877dde909ecbcd02474956fa36033ee31ba47e30cc3c733d42b9188507ac7364d870699d34695b9d628b1d7bb4064275c0e809c4108d121049bb744c03"
$repository = "openrails/openrails"
$software_name = "Open Rails"

Write-Host "Fetching version '$env:ChocolateyPackageVersion'"

$download_url = "https://github.com/$repository/releases/download/1.6/Open.Rails.1.6.zip"
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
