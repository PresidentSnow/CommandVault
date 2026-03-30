# CLEAR HISTORY IN POWERSHELL

* **INFO:** [shellback](https://www.shellhacks.com/clear-history-powershell/)

## Get the PowerShell command history file location

* (Get-PSReadlineOption).HistorySavePath

## Show the contents of the PowerShell command history file

* cat (Get-PSReadlineOption).HistorySavePath

## Clear the command history in PowerShell by deleting the history file

* Remove-Item (Get-PSReadlineOption).HistorySavePath

## Change how PowerShell command history is saved

* Set-PSReadlineOption -HistorySaveStyle SaveIncrementally # default
* Set-PSReadlineOption -HistorySaveStyle SaveAtExit
* Set-PSReadlineOption -HistorySaveStyle SaveNothing
