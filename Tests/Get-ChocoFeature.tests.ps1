if (-not $PSScriptRoot) { $PSScriptRoot = Split-Path $MyInvocation.MyCommand.Path -Parent }

$PSVersion = $PSVersionTable.PSVersion.Major
$Root = "$PSScriptRoot\..\"
$Module = 'PSChocoConfig'

If (-not (Get-Module $Module)) { Import-Module "$Root\$Module" -Force }

Describe "Get-ChocoConfig PS$PSVersion" {
    
    InModuleScope $Module {

        Mock Get-Content {
            @'
<?xml version="1.0" encoding="utf-8"?>
<chocolatey xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <config>
    <add key="cacheLocation" value="" description="Cache location if not TEMP folder. Replaces `$env:TEMP` value." />
    <add key="containsLegacyPackageInstalls" value="true" description="Install has packages installed prior to 0.9.9 series." />
    <add key="commandExecutionTimeoutSeconds" value="2700" description="Default timeout for command execution. '0' for infinite (starting in 0.10.4)." />
    <add key="proxy" value="" description="Explicit proxy location. Available in 0.9.9.9+." />
    <add key="proxyUser" value="" description="Optional proxy user. Available in 0.9.9.9+." />
    <add key="proxyPassword" value="" description="Optional proxy password. Encrypted. Available in 0.9.9.9+." />
    <add key="webRequestTimeoutSeconds" value="30" description="Default timeout for web requests. Available in 0.9.10+." />
    <add key="proxyBypassList" value="" description="Optional proxy bypass list. Comma separated. Available in 0.10.4+." />
    <add key="proxyBypassOnLocal" value="true" description="Bypass proxy for local connections. Available in 0.10.4+." />
    </config>
    <sources>
    <source id="chocolatey" value="https://chocolatey.org/api/v2/" disabled="false" bypassProxy="false" selfService="false" adminOnly="false" priority="0" />
    </sources>
    <features>
    <feature name="checksumFiles" enabled="true" setExplicitly="false" description="Checksum files when pulled in from internet (based on package)." />
    <feature name="autoUninstaller" enabled="true" setExplicitly="false" description="Uninstall from programs and features without requiring an explicit uninstall script." />
    <feature name="allowGlobalConfirmation" enabled="false" setExplicitly="false" description="Prompt for confirmation in scripts or bypass." />
    </features>
    <apiKeys />
</chocolatey>
'@
        }

        Context 'Return all Features' {

            $GetChocoConfig = Get-ChocoFeature

            It 'Should invoke Get-Content 1 time' {
                Assert-MockCalled Get-Content -Times 1 -Exactly
            }

            It 'Should return a System.Xml.XmlElement object' {
                $GetChocoConfig | Should -BeOfType [System.Xml.XmlElement]
            }

            It 'Should return 9 properties' {
                $GetChocoConfig.count | Should -Be 3
            }
        }

        Context 'Return the value for a specified single Feature: checksumFiles' {

            $GetChocoConfig = Get-ChocoFeature -Feature 'checksumFiles'

            It 'Should invoke Get-Content 1 time' {
                Assert-MockCalled Get-Content -Times 1 -Exactly
            }

            It 'Should return a System.Xml.XmlElement object' {
                $GetChocoConfig | Should -BeOfType [System.Xml.XmlElement]
            }

            It 'Should return 1 property' {
                @($GetChocoConfig).count | Should -Be 1
            }

            It 'Should be True' {
                $GetChocoConfig.enabled | Should -Be 'true'
            }
        }

        Context 'Return the value for multiple specified Features: checksumFiles,autoUninstaller' {

            $GetChocoConfig = Get-ChocoFeature -Feature checksumFiles,autoUninstaller

            It 'Should invoke Get-Content 1 time' {
                Assert-MockCalled Get-Content -Times 1 -Exactly
            }

            It 'Should return a System.Xml.XmlElement object' {
                $GetChocoConfig | Should -BeOfType [System.Xml.XmlElement]
            }

            It 'Should return 2 properties' {
                @($GetChocoConfig).count | Should -Be 2
            }

            It 'checksumFiles should be Enabled' {
                ($GetChocoConfig | Where-Object {$_.Name -eq 'checksumFiles'}).enabled | Should -Be "true"
            }

            It 'autoUninstaller should be Enabled' {
                ($GetChocoConfig | Where-Object {$_.Name -eq 'autoUninstaller'}).enabled | Should -Be 'true'
            }
        }
    }
}