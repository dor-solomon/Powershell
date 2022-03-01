$Test = Read-Host "Type the AD group you require"
function Show-Menu
{
     param (
           [string]$Title = 'My Menu'
     )
     cls
     Write-Host "================ $Title ================"
    
     Write-Host "1: Press '1' for full names in a text file."
     Write-Host "2: Press '2' for usernames in a csv file."
     Write-Host "3: Press '3' for no option."
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
                'You chose option #1 for full names in a text file.'
                Get-ADGroupMember -Identity "$Test" | Select-Object @{Name="שם מלא";Expression={$_.Name}} | Sort-Object "שם מלא" | Out-File $home\Desktop\Names.txt
                'Completed.'
           } '2' {
                cls
                'You chose option #2 for usernames in a csv file.'
                Get-ADGroupMember -Identity "$Test" | Select-Object @{Name="User Name";Expression={$_.SamAccountName}} | Sort-Object "User Name" | Export-CSV -NoTypeInformation -Path $home\Desktop\Names.csv -Encoding UTF8
                'Completed.'
           } '3' {
                cls
                'You chose option #3 which does nothing.'
           } 'q' {
                return
           }
     }
     pause
}
until ($input -eq 'q')