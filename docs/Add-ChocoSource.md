---
external help file: PSChocoConfig-help.xml
Module Name: PSChocoConfig
online version:
schema: 2.0.0
---

# Add-ChocoSource

## SYNOPSIS
Adds a new source to chocolatey

## SYNTAX

### Credential
```
Add-ChocoSource [-Name] <String> [-Source] <String> [-Username] <String> [-Password] <String>
 [-AllowSelfService] [-BypassProxy] [-AdminOnly] [[-Priority] <Int32>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

### Certificate
```
Add-ChocoSource [-Name] <String> [-Source] <String> [-Certificate] <String> [-CertificatePassword] <String>
 [-AllowSelfService] [-BypassProxy] [-AdminOnly] [[-Priority] <Int32>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Adds a new source with the given name and settings to chocolatey

## EXAMPLES

### EXAMPLE 1
```
Add-ChocoSource -Name bob -s https://reposserver/repository/choco
```

### EXAMPLE 2
```
Add-ChocoSource -Name bob -s \\fileserver\chocopackages
```

### EXAMPLE 3
```
Add-ChocoSource -Name bill -s https://repositoryserver/repository/choco -Username frank -Password frank1234
```

### EXAMPLE 4
```
Add-ChocoSource -Name bob -s https://repositoryserver/repository/choco -AllowSelfService
```

## PARAMETERS

### -Name
The friendly name of the source

```yaml
Type: String
Parameter Sets: (All)
Aliases: FriendlyName

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Source
The URL or filepath of the source

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Username
The username used to authenticate to the source

```yaml
Type: String
Parameter Sets: Credential
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Password
The password used to authenticate to the source

```yaml
Type: String
Parameter Sets: Credential
Aliases:

Required: True
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Certificate
The path to the certificate to use with the source if required

```yaml
Type: String
Parameter Sets: Certificate
Aliases:

Required: True
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CertificatePassword
The certificate's private key

```yaml
Type: String
Parameter Sets: Certificate
Aliases:

Required: True
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AllowSelfService
Enable self-service mode for the source

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -BypassProxy
Bypass any proxy configuration for the specified source

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -AdminOnly
Allow only local administrator group members to use the specified source

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: 9
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Priority
The priority to give to the specified source

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 10
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

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
General notes

## RELATED LINKS
