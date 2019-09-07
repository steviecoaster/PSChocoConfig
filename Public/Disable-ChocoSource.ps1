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
            
            $StartInfo = [System.Diagnostics.ProcessStartInfo]::new()
            $source = 'dumb'
            $args = @('source','disable',"-n=$source")
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