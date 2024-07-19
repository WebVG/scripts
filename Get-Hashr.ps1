# ::::::::::::::::USER INPUTS INTO CMD AS BATCH/CMD:::::::::::::::::::::
# this will automate the steps to gen intune hash on machine, then upload to secure pastebin and output the url
#   in case curl isn't installed on older win versions, use 2
#		1.	curl -o hash.ps1 'shorturl' | pwsh sxp bypass
#		2.	Invoke-WebRequest -Uri $url -OutFile $outputFile
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

CD Downloads
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
install-script Get-WindowsAutopilotinfo -Force

Get-WindowsAutoPilotInfo.ps1 -OutputFile "intunehash.csv"

$filePath = "intunehash.csv"
$fileContent = Get-Content -Path $filePath -Raw

cmd
set FILE_PATH=%USERPROFILE%\Downloads\intunehash.csv
# Upload the file content to termbin.com
curl -X POST -d "api_dev_key=fIM05J0hZe7YWUNgIZ0aDiUvoiaDnRda" -d "api_option=paste" --data-urlencode "api_paste_code@$filepath" https://pastebin.com/api/api_post.php



