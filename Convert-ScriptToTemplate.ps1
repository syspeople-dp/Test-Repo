
function Add-Dollar {
param(
        [Parameter(ValueFromPipeline=$True)]
        $string
    )
    if($string -like "*$*"){
        $string=$string.Replace('$','$$')
    }
return $string
}

$path="C:\Users\Daniel\Desktop\"
Remove-Item $path\output.txt
Get-Content -Path $path\input.txt | ForEach-Object -Process {
    if (([string]$_).TrimStart() -match '^"' ){
        ($_).replace('"','""') | Add-Dollar | Out-File -FilePath $path\output.txt -Append
    }
    else{
    ("`""+(($_).replace('"','""'))+"`",") | Add-Dollar | Out-File -FilePath $path\output.txt -Append
    }
    #("`""+$_+"`",").Replace("$","$$") | Out-File -FilePath C:\Users\Daniel\Desktop\output.txt -Append
}
$test='"ej'
$test -match '^"'