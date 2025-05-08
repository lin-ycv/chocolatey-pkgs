$ErrorActionPreference = 'Stop'
Stop-Process -Name "EverythingCmdPal" -ErrorAction SilentlyContinue > $null