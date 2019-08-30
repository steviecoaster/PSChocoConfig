function Get-ChocoFeature {
    <#
        .SYNOPSIS
        Retrieve feature settings from chocolatey config file

        .PARAMETER ChocolateyConfig
        The config file to load. Defaults to $env:ChocolateyInstall\config\chocolatey.config

        .PARAMETER Feature
        The feature(s) you with to query for information

        .EXAMPLE
        Get-ChocoFeature

        Returns all features and their values

        .EXAMPLE
        Get-ChocoFeature -Feature useBackgroundService

        Retrieves current setting of useBackgroundService feature
    #>
    [cmdletBinding()]
    Param(
        [Parameter(ValueFromPipeline,Position=0)]
        [String]
        [ValidateScript({Test-Path $_})]
        $ChocolateyConfig = "$env:ChocolateyInstall\config\chocolatey.config",

        [Parameter(Position=1)]
        [String[]]
        $Feature
    )

    process {

        [xml]$config = Get-Content $ChocolateyConfig
        
        if($Feature){

            Foreach($f in $Feature) {

                $config.chocolatey.features.feature | Where-Object { $_.Name -eq $f } 

            }

        }

        else{

            $config.chocolatey.features.feature

        }

    }

}