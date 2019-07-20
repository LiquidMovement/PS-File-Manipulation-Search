$a = "<USERNAME>"
$new = $a.SubString(0,5) 
$new.ToUpper()| Tee-Object "H:\My Documents\TestSessionsMove\TestSub.txt"
$i = 1
$i2 = 0
$new2 = "DSP$new$i2$i" 
$new2.ToUpper() | Tee-Object "H:\My Documents\TestSessionsMove\TestConCat.txt"