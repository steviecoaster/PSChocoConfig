$public = gci $PSScriptRoot\Public\*.ps1 -Recurse | ForEach-Object {

    . $_.FullName
}

