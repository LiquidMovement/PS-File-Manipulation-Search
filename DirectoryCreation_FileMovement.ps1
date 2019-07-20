remove-item "H:\My Documents\Test" -Recurse
remove-item "H:\My Documents\LogFiles" -Recurse

Write-host "Press any key to continue..."
$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

new-item "H:\My Documents\Test" -type Directory
Copy-Item "H:\My Documents\Time Sheets" -recurse -destination "H:\My Documents\Test"
Get-ChildItem "H:\My Documents\Time Sheets" | out-file "H:\My Documents\Test\test.txt"
Get-ChildItem "H:\My Documents\Test" -recurse | out-file "H:\My Documents\Test\test2.txt"

new-item "H:\My Documents\LogFiles" -type Directory

move-item "H:\My Documents\Test\*.txt" -destination "H:\My Documents\LogFiles"
