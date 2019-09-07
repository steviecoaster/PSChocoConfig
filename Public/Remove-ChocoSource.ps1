function Remove-ChocoSource {
    <#
    .SYNOPSIS
    Removes the specified choco source
    
    .DESCRIPTION
    Removes the specified choco source
    
    .PARAMETER Source
    The friendly name of the source to remove
    
    .EXAMPLE
    Remove-ChocoSource -Source bob
    #>
    
    [cmdletBinding(ConfirmImpact="High",SupportsShouldProcess)]
    Param(
        [Parameter(Mandatory,Position=0)]
        [String]
        $Source
    )

    process{

        If($PSCmdlet.ShouldProcess("$Source","Setting value: Enabled")){
            
            $choco = choco source remove --name="'$source'"
            Write-Verbose -Message "$($choco[-1])"
    
        }

    }

}