function Set-ChocoFeature {
     <#
        .SYNOPSIS
        Sets the specified feature to the provided state.

        .DESCRIPTION
        Wraps 'choco config' to make setting configuration values easier. Dynamically generates name values from chocolatey config file.

        .PARAMETER Value
        The value to set of the Name of the configuration item.

        .PARAMETER Name
        Name of the feature. Dynamically generated from the configuration file for tab-completion.
    #>
    [cmdletBinding(SupportsShouldProcess,ConfirmImpact="High")]
    Param (
        
        [Parameter(Mandatory,Position=0,ValueFromPipelineByPropertyName,ValueFromPipeline)]
        [ArgumentCompleter({
            param($Command,$Parameter,$WordTocomplete,$CommandAst,$FakeBoundParams)
            Get-Chocofeature | Select -ExpandProperty Name
        })]
        [String]
        $Name,

        [Parameter(Mandatory,Position=1)]
        [String]
        [ValidateSet('Enabled','Disabled')]
        $State
    )

    process {

        Switch($State){

            'Enabled' { $command = "enable" }
            'Disabled' { $command = "disable" }

        }

        If($PSCmdlet.ShouldProcess("Ensuring feature $Name is set to $State")){
        
            $choco = choco feature $command --name="'$Name'"
            Write-Host "$($choco[-1])"-ForegroundColor Yellow
        
        }
    }

}