function Get-ChocoConfig {
    <#
        .SYNOPSIS
        Converts choco's configuration file into a powershell object
        
        .PARAMETER ChocolateyConfig
        The chocolatey config to load. Defaults to $Env:ChocolateyInstall\config\chocolatey.config
        
        .PARAMETER ConfigurationItem
        Return only specified Configuration Item(s).
        
        .EXAMPLE
        Get-ChocoConfig
        
        .EXAMPLE 
        Get-ChocoConfig -ConfigurationItem proxy
        
    #>
    [cmdletBinding(HelpUri="https://github.com/steviecoaster/PSChocoConfig/blob/master/docs/Get-ChocoConfig.md")]
    Param(
        [Parameter(ValueFromPipeline,Position=0)]
        [string]
        [ValidateScript({Test-Path $_})]
        $ChocolateyConfig = "$env:ChocolateyInstall\config\chocolatey.config",

        [Parameter(Position=1)]
        [String[]]
        $ConfigurationItem
    
    )

    process {
        
        [xml]$Config = Get-Content $ChocolateyConfig
        
        if($ConfigurationItem){
            Foreach($c in $ConfigurationItem){

                $config.chocolatey.config.add | Where-Object { $_.Key -eq $c }
            
            }

        }

        else{

            $config.chocolatey.config.add

        }
    }

}