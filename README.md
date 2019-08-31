# PSChocoConfig

PSChocoConfig is a PowerShell module for interacting with Chocolatey's configuration data as PowerShell objects. You can do things like return config and feature details, as well as set those configuration items all via familiar PowerShell cmdlets.
Currently this module only resides here, so in order to use this module, please clone this repository and import the module directly, or copy the folder to your `$env:PSModulePath` somewhere either system-wide, or for the current user.

## Usage Instructions

Installing the module is simple! It's available on the PSGallery, so just run `Install-Module PSChocoConfig`

- Function: Get-ChocoConfig 

```powershell

PS C:\> Get-ChocoConfig

key                            value description
---                            ----- -----------
cacheLocation                        Cache location if not TEMP folder. Replaces `$env:TEMP` value.
containsLegacyPackageInstalls  true  Install has packages installed prior to 0.9.9 series.
commandExecutionTimeoutSeconds 2700  Default timeout for command execution. '0' for infinite (starting in 0.10.4).
proxy                                Explicit proxy location. Available in 0.9.9.9+.
proxyUser                            Optional proxy user. Available in 0.9.9.9+.
proxyPassword                        Optional proxy password. Encrypted. Available in 0.9.9.9+.
webRequestTimeoutSeconds       30    Default timeout for web requests. Available in 0.9.10+.
proxyBypassList                      Optional proxy bypass list. Comma separated. Available in 0.10.4+.
proxyBypassOnLocal             true  Bypass proxy for local connections. Available in 0.10.4+.

```

- Function: Get-ChocoFeature

```powershell

PS C:\> Get-ChocoFeature

name                                   enabled setExplicitly description
----                                   ------- ------------- -----------
checksumFiles                          true    true          Checksum files when pulled in from internet (based on package).
autoUninstaller                        true    false         Uninstall from programs and features without requiring an explicit uninstall...
allowGlobalConfirmation                false   true          Prompt for confirmation in scripts or bypass.
failOnAutoUninstaller                  false   false         Fail if automatic uninstaller fails.
failOnStandardError                    false   false         Fail if install provider writes to stderr. Available in 0.9.10+.
allowEmptyChecksums                    false   false         Allow packages to have empty/missing checksums for downloaded resources from...
allowEmptyChecksumsSecure              true    false         Allow packages to have empty/missing checksums for downloaded resources from...
powershellHost                         true    false         Use Chocolatey's built-in PowerShell host. Available in 0.9.10+.
logEnvironmentValues                   false   false         Log Environment Values - will log values of environment before and after ins...
virusCheck                             false   false         Virus Check - perform virus checking on downloaded files. Available in 0.9.1...
failOnInvalidOrMissingLicense          false   false         Fail On Invalid Or Missing License - allows knowing when a license is expire...
ignoreInvalidOptionsSwitches           true    false         Ignore Invalid Options/Switches - If a switch or option is passed that is no...
usePackageExitCodes                    true    false         Use Package Exit Codes - Package scripts can provide exit codes. With this o...
useFipsCompliantChecksums              false   false         Use FIPS Compliant Checksums - Ensure checksumming done by choco uses FIPS c...
showNonElevatedWarnings                true    false         Show Non-Elevated Warnings - Display non-elevated warnings. Available in 0.1...
showDownloadProgress                   true    false         Show Download Progress - Show download progress percentages in the CLI. Avai...
stopOnFirstPackageFailure              false   false         Stop On First Package Failure - Stop running install, upgrade or uninstall o...
useRememberedArgumentsForUpgrades      false   false         Use Remembered Arguments For Upgrades - When running upgrades, use arguments...
ignoreUnfoundPackagesOnUpgradeOutdated false   false         Ignore Unfound Packages On Upgrade Outdated - When checking outdated or upgr...
removePackageInformationOnUninstall    false   false         Remove Stored Package Information On Uninstall - When a package is uninstall...
logWithoutColor                        false   false         Log without color - Do not show colorization in logging output. Available in...
scriptsCheckLastExitCode               false   false         Scripts Check $LastExitCode (external commands) - Leave this off unless you ...
```

- Function: Set-ChocoConfig

```powershell

PS C:\> Set-ChocoConfigItem -Name cacheLocation -Value C:\temp

Confirm
Are you sure you want to perform this action?
Performing the operation "Setting value: C:\temp" on target "cacheLocation".
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "Y"): y
Updated cacheLocation = C:\temp

```

- Function: Set-ChocoFeature

```powershell

PS C:\> Set-ChocoFeature -Name checksumFiles -State Disabled

Confirm
Are you sure you want to perform this action?
Performing the operation "Set-ChocoFeature" on target "Ensuring feature checksumFiles is set to Disabled".
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "Y"): y
Disabled checksumFiles

```

## Improvements

Find a bug? Have a feature request? Please file an [Issue](/issues)!