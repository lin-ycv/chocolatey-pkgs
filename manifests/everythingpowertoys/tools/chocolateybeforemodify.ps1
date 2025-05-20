$ErrorActionPreference = 'Stop'
stop-process -Name "PowerToys" -ErrorAction SilentlyContinue > $null