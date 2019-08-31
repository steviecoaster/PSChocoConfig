[cmdletBinding()]
Param(
    [Parameter()]
    [Switch]
    $Test,

    [Parameter()]
    [Switch]
    $Build,

    [Parameter()]
    [Switch]
    $Deploy
)


$innvocationPath = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$PSModuleRoot = Split-Path -Parent $innvocationPath
$TestPath = Join-Path $PSModuleRoot "Tests"
Switch($true){

    $Test {

        If(-not (Get-Module Pester)){
            Install-Module -Name Pester -SkipPublisherCheck -Force
        }

        Invoke-Pester -Script $TestPath

    }

    $Build {

        If(Test-Path "$PSModuleRoot\PSChocoConfig"){
            Remove-Item "$PSModuleRoot\PSChocoConfig" -Recurse -Force
        }

        $null = New-Item "$PSModuleRoot\PSChocoConfig" -ItemType Directory

        Get-ChildItem $PSModuleRoot\Public\*.ps1 | Foreach-Object {

            Get-Content $_.FullName | Add-Content "$PSModuleRoot\PSChocoConfig\PSChocoConfig.psm1"
        }

        Copy-Item "$PSModuleRoot\PSChocoConfig.psd1" "$PSModuleRoot\PSChocoConfig"

    }


    $Deploy {

        
        Try {
    
            $deployCommands = @{
                Path = (Resolve-Path -Path "$PSModuleRoot\PSChocoConfig")
                NuGetApiKey = $env:NuGetApiKey
                ErrorAction = 'Stop'
            }
            
            Publish-Module @deployCommands -WhatIf
    
        }

        Catch {

            throw $_
    
        }
    
    }

    default {

        echo "Please Provide one of the following switches: -Test, -Build, -Deploy"
    }
}