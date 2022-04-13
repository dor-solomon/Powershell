# PowerShell Scripts
# Copyright © 2022 Dor Solomon
# SPDX-License-Identifier: GPL-3.0-only

$csvfile = Read-Host "Enter the csv file's path ($home\Desktop\list.csv)"
$column = Read-Host "Enter the column's name"
$ADattribute = Read-Host "Enter the Active Directory attribute"
$csv = Import-Csv $csvfile
$headers = $csv | Get-Member -MemberType NoteProperty | Select-Object -Expand Name
$output =
   foreach ($data in $csv.$column) {
        $activedata = $data.Substring(0,$data.Length-1)
        Get-ADUser -Filter '$ADattribute -like $activedata' -Properties $ADattribute | Select-Object SamAccountName
      }
$ofile = Read-Host "Enter the output file ($home\Desktop\output.txt)"
$output | Out-File $ofile
