function Set-ChocoConfig {
    <#
        .SYNOPSIS
        Sets the specified configuration item to the provided value

        .DESCRIPTION
        Wraps 'choco config' to make setting configuration values easier. Dynamically generates name values from chocolatey config file.

        .PARAMETER Value
        The value to set of the Name of the configuration item.

        .PARAMETER Name
        Name of the configuration item. Dynamically generated from the configuration file for tab-completion.

        .EXAMPLE

        Set-ChocoConfig -Name proxy -Value 'https://awesome.proxy.local'
    #>
    [cmdletBinding(SupportsShouldProcess,ConfirmImpact="High",HelpUri="https://github.com/steviecoaster/PSChocoConfig/blob/master/docs/Set-ChocoConfig.md")]
    Param (

        [Parameter(Mandatory,Position=0,ValueFromPipelineByPropertyName,ValueFromPipeline)]
        [ArgumentCompleter({
            param($Command,$Parameter,$WordTocomplete,$CommandAst,$FakeBoundParams)
            $results = Get-ChocoConfig | Select -ExpandProperty key

            If($WordTocomplete){

                $results.Where{ $_ -match "^$WordTocomplete"}
                
            }

            Else {

                $results

            }
        })]
        [String]
        $Name,

        [Parameter(Mandatory,Position=1)]
        [AllowEmptyString()]
        [String]
        $Value
    )

    

    process {

        If($PSCmdlet.ShouldProcess("$Name","Setting value: $Value")){
        
            $choco = choco config set --name="'$Name'" --value="'$Value'"
            Write-Host "$($choco[-1])"-ForegroundColor Yellow
        
        }
    }

}