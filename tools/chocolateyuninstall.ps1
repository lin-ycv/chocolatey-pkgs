$ErrorActionPreference = 'Stop';

$command = "get-appxpackage VictorLin.EverythingCP* | remove-appxpackage"
Start-ChocolateyProcessAsAdmin "& $command"