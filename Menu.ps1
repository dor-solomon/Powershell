# Powershell Scripts
# Copyright � 2022 Dor Solomon
# SPDX-License-Identifier: AGPL-3.0-only

$Test = Read-Host "Type the AD group you require"
function Show-Menu
{
     param (
           [string]$Title = 'My Menu'
     )
     cls
     Write-Host "================ $Title ================"
    
     Write-Host "1: Press '1' for a list of full names in a text file."
     Write-Host "2: Press '2' for a list of usernames in a csv file."
     Write-Host "3: Press '3' for a list of full names in a csv file."
	 Write-Host "2: Press '4' for a list of usernames in a text file."
     Write-Host "Q: Press 'Q' to quit."
}

do
{
     Show-Menu
     $input = Read-Host "Please make a selection"
     switch ($input)
     {
           '1' {
                cls
                'You chose option #1 for a list of full names in a text file.'
                Get-ADGroupMember -Identity "$Test" | Select-Object @{Name="�� ���";Expression={$_.Name}} | Sort-Object "�� ���" | Out-File $home\Desktop\Names.txt
                'Completed.'
           } '2' {
                cls
                'You chose option #2 for a list of usernames in a csv file.'
                Get-ADGroupMember -Identity "$Test" | Select-Object @{Name="User Name";Expression={$_.SamAccountName}} | Sort-Object "User Name" | Export-CSV -NoTypeInformation -Path $home\Desktop\Names.csv -Encoding UTF8
                'Completed.'
           } '3' {
                cls
                'You chose option #3 for a list of full names in a csv file.'
                Get-ADGroupMember -Identity "$Test" | Select-Object @{Name="�� ���";Expression={$_.Name}} | Sort-Object "�� ���" | Export-CSV -NoTypeInformation -Path $home\Desktop\Names.csv -Encoding UTF8
                'Completed.'
           } '4' {
                cls
                'You chose option #4 for a list of usernames in a text file.'
                Get-ADGroupMember -Identity "$Test" | Select-Object @{Name="User Name";Expression={$_.SamAccountName}} | Sort-Object "User Name" | Out-File $home\Desktop\Names.txt
                'Completed.'
           } 'q' {
                return
           }
     }
     pause
}
until ($input -eq 'q')
