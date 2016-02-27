$file = New-Item -Path c:\AzureLog.txt -ItemType File
get-date | Out-File $file