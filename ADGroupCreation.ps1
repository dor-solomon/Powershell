# PowerShell Scripts
# Copyright © 2022 Dor Solomon
# SPDX-License-Identifier: GPL-3.0-only

# Create a new security group in AD with a global group scope.
New-ADGroup -Name "NAME" -GroupCategory Security -GroupScope Global -Description "DESCRIPTION" -Path "OU=Groups,OU=Main,DC=SubDomain,DC=Domain,DC=com"

# Get a list of users from an OU and insert them into the newly created group.
$OU = 'OU=OUNAME,OU=Users,OU=Main,DC=SubDomain,DC=Domain,DC=com'
Get-ADUser -Filter * -SearchBase $OU | Select-object "SamAccountName" | ForEach-Object { Add-ADGroupMember -Identity "NAME" -Members $_ }

# Get a list of users from another OU and insert them into the newly created group.
$OU = 'OU=SubDepartment,OU=Department,OU=Departments,OU=Users,OU=Main,DC=SubDomain,DC=Domain,DC=com'
Get-ADUser -Filter * -SearchBase $OU | Select-object "SamAccountName" | ForEach-Object { Add-ADGroupMember -Identity "NAME" -Members $_ }

# Get a list of users from a different group and insert them into the newly created group
Get-ADGroupMember -Identity "GROUP" | Select-Object "SamAccountName" | ForEach-Object { Add-ADGroupMember -Identity "NAME" -Members $_ }
