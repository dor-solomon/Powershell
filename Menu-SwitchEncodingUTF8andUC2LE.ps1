# Powershell Scripts
# Copyright © 2023 Dor Solomon
# SPDX-License-Identifier: AGPL-3.0-only

function Show-Menu
{
     param (
           [string]$Title = 'Choose an Option'
     )
     cls
     Write-Host "================ $Title ================"
    
     Write-Host "1: Press '1' for UTF8 to UC2 LE / UTF16 LE."
     Write-Host "2: Press '2' for UC2 LE / UTF16 LE to UTF8."
     Write-Host "q: Press 'q' to quit."
}

do
{
     Show-Menu
     $input = Read-Host "Please make a selection"
     switch ($input)
     {
           '1' {
                cls
                'You chose option #1 for UTF8 to UC2 LE / UTF16 LE.'
				$name = Read-Host "Type the full name of the file (Example: test.htm)"
                $inputfile = "$home\Desktop\$name"
                Get-Content $inputfile -encoding utf8 | Out-File $home\Desktop\OUT-$name -Encoding unicode
                'Completed.'
           } '2' {
                cls
                'You chose option #2 for UC2 LE / UTF16 LE to UTF8.'
				$name = Read-Host "Type the full name of the file (Example: test.htm)"
                $inputfile = "$home\Desktop\$name"
                Get-Content $inputfile | Out-File $home\Desktop\OUT-$name -Encoding utf8
                'Completed.'
           } 'q' {
                return
           }
     }
     pause
}
until ($input -eq 'q')
