$stack = New-Object System.Collections.Stack
#Load first level
Get-ChildItem -Path "YOUR-PATH-HERE" | ForEach-Object { $stack.Push($_) }
#Recurse
while($stack.Count -gt 0 -and ($item = $stack.Pop())) {
    if ($item.PSIsContainer)
    {
        Write-Host "Recursing on item $($item.FullName)"
        Get-ChildItem -Path $item.FullName | ForEach-Object { $stack.Push($_) }
    } else {
        Write-Host "Processing item $($item.FullName)"
    }
}