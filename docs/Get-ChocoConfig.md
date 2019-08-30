---
external help file: PSChocoConfig-help.xml
Module Name: PSChocoConfig
online version:
schema: 2.0.0
---

# Get-ChocoConfig

## SYNOPSIS
Converts choco's configuration file into a powershell object

## SYNTAX

```
Get-ChocoConfig [[-ChocolateyConfig] <String>] [[-ConfigurationItem] <String[]>] [<CommonParameters>]
```

## DESCRIPTION
{{ Fill in the Description }}

## EXAMPLES

### EXAMPLE 1
```
Get-ChocoConfig
```

### EXAMPLE 2
```
Get-ChocoConfig -ConfigurationItem proxy
```

## PARAMETERS

### -ChocolateyConfig
The chocolatey config to load.
Defaults to $Env:ChocolateyInstall\config\chocolatey.config

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: "$env:ChocolateyInstall\config\chocolatey.config"
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -ConfigurationItem
Return only specified Configuration Item(s).

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
