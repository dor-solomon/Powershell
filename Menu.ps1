# PowerShell Scripts
# Copyright © 2022 Dor Solomon
# SPDX-License-Identifier: GPL-3.0-only
    
$Test = Read-Host "Type the AD group you require"
function Show-Menu
{
     param (
           [string]$Title = 'My Menu'
     )
     Clear-Host
     Write-Host "================ $Title ================"
    
     Write-Host "1: Press '1' for full names in a text file."
     Write-Host "2: Press '2' for usernames in a csv file."
     Write-Host "Q: Press 'Q' to quit."
}

do
{
     Show-Menu
     $selection = Read-Host "Please make a selection"
     switch ($selection)
     {
           '1' {
                Clear-Host
                'You chose option #1 for full names in a text file.'
                Get-ADGroupMember -Identity "$Test" | Select-Object @{Name="ùí îìà";Expression={$_.Name}} | Sort-Object "ùí îìà" | Out-File $home\Desktop\Names.txt
                'Completed.'
           } '2' {
                Clear-Host
                'You chose option #2 for usernames in a csv file.'
                Get-ADGroupMember -Identity "$Test" | Select-Object @{Name="User Name";Expression={$_.SamAccountName}} | Sort-Object "User Name" | Export-CSV -NoTypeInformation -Path $home\Desktop\Names.csv -Encoding UTF8
                'Completed.'
           } 'q' {
                return
           }
     }
     pause
}
until ($input -eq 'q')
