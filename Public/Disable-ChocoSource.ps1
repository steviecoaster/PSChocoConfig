function Disable-ChocoSource {
    <#
    .SYNOPSIS
    Disables the specified choco source
    
    .DESCRIPTION
    Sets the disabled property of the specified source to true.
    
    .PARAMETER Source
    The friendly name of the source to disable.
    
    .EXAMPLE
    Disable-ChocoSource -Source bob
    #>
    
    [cmdletBinding(ConfirmImpact="High",SupportsShouldProcess,HelpUri="https://github.com/steviecoaster/PSChocoConfig/wiki/Disable-ChocoSource")]
    Param(
        [Parameter(Mandatory,Position=0)]
        [String]
        $Source
    )

    process{

        If($PSCmdlet.ShouldProcess("$Source","Setting value: Disabled")){
            
            $choco = Start-Process choco -ArgumentList 'source', 'disable', '--name="'$source'"' -PassThru -Wait
            If($choco.ExitCode -ne 0){

                Write-Error "An error occured in operation"

            }

            Else {

                Write-Verbose -Message "Disabled source $Source"
            }
    
        }

    }

}