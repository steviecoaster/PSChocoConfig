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
    
    [cmdletBinding(ConfirmImpact="High",SupportsShouldProcess,HelpUri="https://github.com/steviecoaster/PSChocoConfig/wiki/Remove-ChocoSource")]
    Param(
        [Parameter(Mandatory,Position=0)]
        [String]
        $Source
    )

    process{

        If($PSCmdlet.ShouldProcess("$Source","Setting value: Enabled")){
            
            $StartInfo = [System.Diagnostics.ProcessStartInfo]::new()
            $source = 'dumb'
            $args = @('source','remove',"-n=$source")
            $StartInfo.CreateNoWindow = $true
            $StartInfo.UseShellExecute = $false
            $StartInfo.RedirectStandardOutput = $true
            $StartInfo.RedirectStandardError = $true
            $StartInfo.FileName = 'choco'
            $StartInfo.Arguments = $args

            $process = [System.Diagnostics.Process]::new()
            $process.StartInfo = $StartInfo
            [void]$process.Start()

            $output = $process.StandardOutput.ReadToEnd()
            $process.WaitForExit()

            Write-Verbose $output
    
        }

    }

}