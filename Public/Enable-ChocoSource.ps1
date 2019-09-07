function Enable-ChocoSource {
    <#
    .SYNOPSIS
    Enables the specified choco source
    
    .DESCRIPTION
    Sets the disabled property of the specified source to false
    
    .PARAMETER Source
    The friendly name of the source to enable
    
    .EXAMPLE
    Enable-ChocoSource -Source bob
    #>
    
    [cmdletBinding(ConfirmImpact="High",SupportsShouldProcess,HelpUri="https://github.com/steviecoaster/PSChocoConfig/wiki/Enable-ChocoSource")]
    Param(
        [Parameter(Mandatory,Position=0)]
        [String]
        $Source
    )

    process{

        If($PSCmdlet.ShouldProcess("$Source","Setting value: Enabled")){
            
            $choco = Start-Process choco -ArgumentList 'source', 'enable', '--name="'$source'"' -PassThru -Wait
            If($choco.ExitCode -ne 0){

                Write-Error "An error occured in operation"

            }

            Else {

                Write-Verbose -Message "Enabled source $Source"
            }
        }

    }

}