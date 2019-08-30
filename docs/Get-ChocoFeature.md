---
external help file: PSChocoConfig-help.xml
Module Name: PSChocoConfig
online version:
schema: 2.0.0
---

# Get-ChocoFeature

## SYNOPSIS
Retrieve feature settings from chocolatey config file

## SYNTAX

```
Get-ChocoFeature [[-ChocolateyConfig] <String>] [[-Feature] <String[]>] [<CommonParameters>]
```

## DESCRIPTION
{{ Fill in the Description }}

## EXAMPLES

### EXAMPLE 1
```
Get-ChocoFeature
```

Returns all features and their values

### EXAMPLE 2
```
Get-ChocoFeature -Feature useBackgroundService
```

Retrieves current setting of useBackgroundService feature

## PARAMETERS

### -ChocolateyConfig
The config file to load.
Defaults to $env:ChocolateyInstall\config\chocolatey.config

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

### -Feature
The feature(s) you with to query for information

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
