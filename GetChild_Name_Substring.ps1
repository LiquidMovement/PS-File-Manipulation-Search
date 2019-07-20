$dest = '\\<NETWORK PATH>\'
$source = '\\<NETWORK PATH>\'

Get-ChildItem -Path $dest -Directory | foreach{
    
    $folder = $_
    $name = ($_.Name).Substring(1)
    $name
    
    Get-ChildItem -Path $source -directory | foreach{
        if($_.name -eq $name){
            Move-item "$source\$_" -Destination "$dest\$folder" -Force
        }
        
    }

}
