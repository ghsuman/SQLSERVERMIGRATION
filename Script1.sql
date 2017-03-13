IF (!(Get-Module -Name sqlps))
    {
        Write-Host 'Loading SQLPS Module' -ForegroundColor DarkYellow
        Push-Location
        Import-Module sqlps -DisableNameChecking
        Pop-Location
    }
  
  
$localScriptRoot = "c:\sql\Scripts"
$Server = "LKF-DSQL04\BETA"
$scripts = Get-ChildItem $localScriptRoot | Where-Object {$_.Extension -eq ".sql"}
  
foreach ($s in $scripts)
    {
        Write-Host "Running Script : " $s.Name -BackgroundColor DarkGreen -ForegroundColor White
        $script = $s.FullName
        Invoke-Sqlcmd -ServerInstance $Server -InputFile $script
    }