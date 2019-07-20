$dest = "\\<NETWORK PATH>\"
#$dest = "C:\temp\Test"
Get-ChildItem "$dest\*.pdf" -Recurse | foreach{
    $currName = $_.Name
    $split = $_.Name -split '-'
    $front = $split[1]
    $mid = $split[0]
    $back = $split[2]
    $back2 = $split[3]

    $rename = "$mid-$front-$back-$back2"

    Rename-Item $_ -NewName $rename
    }