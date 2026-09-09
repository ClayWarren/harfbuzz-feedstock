param([string]$Subdir)
New-Item -ItemType Directory -Path native-results -Force | Out-Null
Get-ChildItem "C:\harfbuzz-local\$Subdir\*.conda", "C:\harfbuzz-local\$Subdir\sha256.json" -ErrorAction SilentlyContinue | Copy-Item -Destination native-results
