---
external help file: PSChocoConfig-help.xml
Module Name: PSChocoConfig
online version:
schema: 2.0.0
---

# Get-ChocoSource

## SYNOPSIS
List currently configured choco sources

## SYNTAX

```
Get-ChocoSource [[-ChocolateyConfig] <String>] [-Source <String[]>] [<CommonParameters>]
```

## DESCRIPTION
Reads the chocolatey config file and returns a list of currently configured choco sources

## EXAMPLES

### EXAMPLE 1
```
Get-ChocoSource
```

Returns all currently configured choco sources

### EXAMPLE 2
```
Get-ChocoSource -Source internal
```

Returns details about the choco source named "internal".

## PARAMETERS

### -ChocolateyConfig
The path the config file to read from

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

### -Source
The friendly name of the source to retrieve

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
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
