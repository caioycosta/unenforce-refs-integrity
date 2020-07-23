$path = "YOUR-PATH-HERE"
$stack = New-Object System.Collections.Stack
#Load first level
$stack.Push($(Get-Item -Force -Path $path))
#Recurse
while($stack.Count -gt 0 -and ($item = $stack.Pop())) {
    if ($item.PSIsContainer)
    {
        Write-Host "Recursing on item $($item.FullName)"
        $item | Set-FileIntegrity -Enable $True -Enforce $False
        Get-ChildItem -Force -Path $item.FullName | ForEach-Object { $stack.Push($_) }
    } else {
        Write-Host "Processing item $($item.FullName)"
        $item | Set-FileIntegrity -Enable $True -Enforce $False
    }
}
