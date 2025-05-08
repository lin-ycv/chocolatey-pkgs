$ErrorActionPreference = 'Stop';

Start-ChocolateyProcessAsAdmin -ExeToRun "powershell.exe" -Statements "-Command `"get-appxpackage VictorLin.EverythingCP* | remove-appxpackage`""