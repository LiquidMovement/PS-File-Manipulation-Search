$names = Import-CSV "C:\temp\names.csv" -Header c1

$num = (Get-Random -Minimum 0 -Maximum 1) + 1

$new = $names.c1 | Get-Random -Count $num

$new