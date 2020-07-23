$path = "E:\"
$stack = New-Object System.Collections.Stack
#Load first level
Get-ChildItem -Force -Path $path | ForEach-Object { $stack.Push($_) }
#Recurse
while($stack.Count -gt 0 -and ($item = $stack.Pop())) {
    if ($item.PSIsContainer)
    {
        Write-Host "Recursing on item $($item.FullName)"
        Get-ChildItem -Force -Path $item.FullName | ForEach-Object { $stack.Push($_) }
    } else {
        Write-Host "Processing item $($item.FullName)"
        $item | Set-FileIntegrity -Enable $True -Enforce $False 
    }
}
