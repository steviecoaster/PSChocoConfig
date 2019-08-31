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

#Make some variables, shall we?
$innvocationPath = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$PSModuleRoot = Split-Path -Parent $innvocationPath
$TestPath = Join-Path $PSModuleRoot "Tests"

#Do Stuff based on passed Args
Switch($true){

    $Test {

        If(-not (Get-Module Pester)){
            Install-Module -Name Pester -SkipPublisherCheck -Force
        }

        Invoke-Pester -Script $TestPath -OutputFile "$($env:Build_ArtifactStagingDirectory)\PSChocoConfig.Results.xml" -OutputFormat 'NUnitXml'

        #
        Get-ChildItem $env:Build_ArtifactStagingDirectory
    }

    $Build {

        If(Test-Path "$($env:Build_ArtifactStagingDirectory)\PSChocoConfig"){
            Remove-Item "$($env:Build_ArtifactStagingDirectory)\PSChocoConfig" -Recurse -Force
        }

        $null = New-Item "$($env:Build_ArtifactStagingDirectory)\PSChocoConfig" -ItemType Directory

        Get-ChildItem $PSModuleRoot\Public\*.ps1 | Foreach-Object {

            Get-Content $_.FullName | Add-Content "$($env:Build_ArtifactStagingDirectory)\PSChocoConfig\PSChocoConfig.psm1"
        }

        Copy-Item "$PSModuleRoot\PSChocoConfig.psd1" "$($env:Build_ArtifactStagingDirectory)\PSChocoConfig"

        #Verification of contents
        Get-ChildItem -Path "$($env:Build_ArtifactStagingDirectory)\PSChocoConfig" -Recurse

        #Verify we can load the module and see cmdlets
        Import-Module "$($env:Build_ArtifactStagingDirectory)\PSChocoConfig\PSChocoConfig.psd1"
        Get-Command -Module PSChocoConfig

    }

    $Deploy {

        
        Try {
    
            $deployCommands = @{
                Path = (Resolve-Path -Path "$($env:Build_ArtifactStagingDirectory)\PSChocoConfig")
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