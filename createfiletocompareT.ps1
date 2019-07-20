$today = Get-Date -format MMddyy
$yesterday = (Get-Date).AddDays(-1).ToString('MMddyy')
$yesterdayf= $yesterday  

$adcomp = "CompName"#,"CompName2" #Get-ADComputer -Filter {OperatingSystem -like "*server*"} | Select-Object name -ExpandProperty name | sort name
$rootfolder = "\\CompName2\c$\temp"
$todayfolder = "$rootfolder\$today"
$yesterfolder = "$rootfolder\$yesterdayf"
$tocompare = ""

 $adcomp | Export-Csv -Path "\\CompName2\C$\temp\test.csv" 




$gethash = {
    Function gethash {
        $createfile = "$Using:todayfolder\$Using:comp-$Using:today.csv"
        $test = "hello"
        
        Get-ChildItem "\\CompName\c$\windows" -File | Get-FileHash -Algorithm MD5 | Export-Csv "\\CompName\C$\temp\012418\file.csv" -Append
        Get-ChildItem "\\CompName\c$\windows\system32" -File | Get-FileHash -Algorithm MD5 | Export-Csv "\\CompName\C$\temp\012418\file.csv" -Append    
        $test | Export-Csv -Path "\\CompName2\C$\temp\test2.csv"    
    }
}

Function comparehash {
        $comparefile = "$Using:yesterfolder\$Using:comp-$Using:yesterday.csv"
        $comparescript = "$rootfolder\Compare-FileHashesList.ps1 -ReferenceFile $comparefile -DifferenceFile $createfile"
            "`n$comp`n" | Out-File $todayfolder\$today-changes.csv -Append
            Invoke-Expression $comparescript | Out-File $todayfolder\$today-changes.csv -Append
}


if (!(Test-Path $todayfolder)) { 
    New-Item -ItemType Directory $todayfolder
     
    foreach ($comp in $adcomp) { 
        if (!(Test-Path "$todayfolder\$comp-$today.csv")) {
            if (test-connection -ComputerName $comp -Count 1 -Quiet ) {
                
                Invoke-Command -ComputerName $comp -ScriptBlock {$gethash} -AsJob
                
                #Enter-PSSession -ComputerName $comp
                #Start-Job -ScriptBlock {gethash}
                #Exit-PSSession

                #comparehash
            } else {
                "server not responding - $comp" | Out-File $createfile -Append
                Write-Host "$comp not responding"
                }
        } else {
        "File $comp already exists.  Why?" | Out-File "$todayfolder\errors.txt" -Append
        Write-Host "file exists, delete it!"
        }
    }
} Else {
"Folder already exists.  Why?" | Out-File "$todayfolder\errors.txt" -Append
Write-Host "Folder exists, delete it!!"
}