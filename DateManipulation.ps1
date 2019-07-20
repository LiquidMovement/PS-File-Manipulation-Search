$Today = Get-Date -format d
$Date = Get-Date
$Yesterday = (Get-date).AddDays(-1)
$YestFolder = $Yesterday.day
$MonthTxtPrev = (Get-Date).AddMonths(-1).ToString('MMM')
$MonthNumPrev = (Get-Date).AddMonths(-1).Month
$MonthTxtCurr = Get-Date -format MMM
$MonthNumCurr = $Date.Month

$Date = (Get-Date)
$DateR2 = $Date.toString()
$DateRevi1 = $Date.day
$2Date = (Get-Date).AddDays(-1).ToShortDateString()

  
WRite-host "MonthPrevNum = $MonthNumPrev"
WRite-Host "MonthPrevTxt = $MonthTxtPrev"
Write-Host "MonthTxtCurr = $MonthTxtCurr"
Write-Host "MonthNumCurr = $MonthNumCurr"
Write-Host "DateRevi1 = $DateRevi1"
Write-Host "YestFolder = $YestFolder"

if($DateRevi1 -eq "1")
{
    $NewFolder = "$MonthNumPrev - $MonthTxtPrev"
}
else
{
    $NewFolder = "$MonthNumCurr - $MonthTxtCurr"
}

$NewFolder