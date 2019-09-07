function Add-ChocoSource {
    <#
    .SYNOPSIS
    Adds a new source to chocolatey
    
    .DESCRIPTION
    Adds a new source with the given name and settings to chocolatey
    
    .PARAMETER Name
    The friendly name of the source
    
    .PARAMETER Source
    The URL or filepath of the source
    
    .PARAMETER Username
    The username used to authenticate to the source
    
    .PARAMETER Password
    The password used to authenticate to the source
    
    .PARAMETER Certificate
    The path to the certificate to use with the source if required
    
    .PARAMETER CertificatePassword
    The certificate's private key
    
    .PARAMETER AllowSelfService
    Enable self-service mode for the source
    
    .PARAMETER BypassProxy
    Bypass any proxy configuration for the specified source
    
    .PARAMETER AdminOnly
    Allow only local administrator group members to use the specified source
    
    .PARAMETER Priority
    The priority to give to the specified source
    
    .EXAMPLE
    Add-ChocoSource -Name bob -s https://reposserver/repository/choco

    .EXAMPLE
    Add-ChocoSource -Name bob -s \\fileserver\chocopackages

    .EXAMPLE
    Add-ChocoSource -Name bill -s https://repositoryserver/repository/choco -Username frank -Password frank1234
    
    .EXAMPLE
    Add-ChocoSource -Name bob -s https://repositoryserver/repository/choco -AllowSelfService
    
    .NOTES
    General notes
    #>
    
    [cmdletBinding(ConfirmImpact="High",SupportsShouldProcess,HelpUri="https://github.com/steviecoaster/PSChocoConfig/wiki/Add-ChocoSource",DefaultParameterSetName="Source")]
    Param(
        [Parameter(Mandatory,Position=0,ParameterSetName="Source")]
        [Alias("FriendlyName")]
        [String]
        $Name,

        [Parameter(Mandatory,Position=1,ParameterSetName="Source")]
        [String]
        $Source,

        [Parameter(Mandatory,Position=2,ParameterSetName="Credential")]
        [String]
        $Username,

        [Parameter(Mandatory,Position=3,ParameterSetName="Credential")]
        [String]
        $Password,

        [Parameter(Mandatory,Position=4,ParameterSetName="Certificate")]
        [ValidateScript({Test-Path $_})]
        [String]
        $Certificate,
        
        [Parameter(Mandatory,Position=5,ParameterSetName="Certificate")]
        [String]
        $CertificatePassword,

        [Parameter(Position=6)]
        [switch]
        $AllowSelfService,

        [Parameter(Position=7)]
        [switch]
        $BypassProxy,

        [Parameter(Position=8)]
        [switch]
        $AdminOnly,

        [Parameter(Position=9)]
        [int]
        $Priority
    )

    process {

        $collection = [System.Collections.Generic.List[string]]::New()

        switch($PSBoundParameters.Keys){

           'Name' {$collection.add("--name=$Name")} 
           'Source' {$collection.add("--source=$Source")}
           'Username' {$collection.add("--user='$Username'")}
           'Password' {$collection.add("--password='$Password'")}
           'Certificate' {$collection.add("--cert='$Certifacate'")}
           'CertificatePassword' {$collection.add("--certifactepassword='$CertifactePassword'")}
           'AllowSelfService' {$collection.add("--allowselfservice")}
           'BypassProxy' {$collection.add("--bypassproxy")}
           'AdminOnly' {$collection.add("--adminonly")}
           'Priority' { $collection.add("--priority=$Priority")}
        }

        $args = $collection -join ' '

        If($PSCmdlet.ShouldProcess($args,"Adding source $Name")){
            
            $choco = Start-Process choco -ArgumentList 'source','add',$args -PassThru -Wait

            If($choco.ExitCode -ne 0){

                Write-Error "An issue occured: $($_.Exception.Message)"
                
            }

            Else {

                Write-Verbose -Message "Added source: $Name"
            
            }
        }
    }

}