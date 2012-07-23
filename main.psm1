# list all ps1 files and dot source them
ls $PSScriptRoot -Recurse *.ps1 | foreach { . $_.fullName }