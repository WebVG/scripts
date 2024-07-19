CD Downloads
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
install-script Get-WindowsAutopilotinfo -Force

Get-WindowsAutoPilotInfo.ps1 -OutputFile "intunehash.csv"

$filePath = "intunehash.csv"
$fileContent = Get-Content -Path $filePath -Raw
set FILE_PATH=%USERPROFILE%\Downloads\intunehash.csv
curl -X POST -d "api_dev_key=fIM05J0hZe7YWUNgIZ0aDiUvoiaDnRda" -d "api_option=paste" --data-urlencode "api_paste_code@$filepath" https://pastebin.com/api/api_post.php



