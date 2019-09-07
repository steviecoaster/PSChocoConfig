function Get-ChocoSource {
    <#
    .SYNOPSIS
    List currently configured choco sources
    
    .DESCRIPTION
    Reads the chocolatey config file and returns a list of currently configured choco sources
    
    .PARAMETER ChocolateyConfig
    The path the config file to read from
    
    .PARAMETER Source
    The friendly name of the source to retrieve
    
    .EXAMPLE
    Get-ChocoSource

    Returns all currently configured choco sources
    
    .EXAMPLE
    Get-ChocoSource -Source internal
    
    Returns details about the choco source named "internal".

    #>
    
    [cmdletBinding()]
    Param(
        
        [Parameter(ValueFromPipeline,Position=0)]
        [string]
        [ValidateScript({Test-Path $_})]
        $ChocolateyConfig = "$env:ChocolateyInstall\config\chocolatey.config",

        [Parameter()]
        [string[]]
        $Source

    )

    process {

        [xml]$config = Get-Content $ChocolateyConfig

        if($Source){
            Foreach($s in $Source){

                $config.chocolatey.sources.source | Where-Object { $_.id -eq $s }
            
            }

        }

        else{

            $config.chocolatey.sources.source

        }
        
    }

}