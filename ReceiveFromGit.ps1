
$RepositoryZipUrl = "https://api.github.com/repos/syspeople-dp/Test-Repo/zipball/master" 
$ZipFile = "C:\BIN\Repo.zip" 
$OutputFolder = "C:\BIN\Repo" 
$SnippetsFolder="$env:APPDATA\Code\User\snippets"

if(Test-Path -Path $OutputFolder){
    Remove-Item -Path $OutputFolder -Recurse -Force
}
# download the zip 
Invoke-RestMethod -Uri $RepositoryZipUrl -OutFile $ZipFile

New-Item -Path $OutputFolder -ItemType Directory | Out-Null 
         
[System.Reflection.Assembly]::LoadWithPartialName('System.IO.Compression.FileSystem') | Out-Null 
[System.IO.Compression.ZipFile]::ExtractToDirectory($ZipFile, $OutputFolder) 

# remove zip 
Remove-Item -Path $ZipFile -Force 
     
#output the path to the downloaded repository 
invoke-Item $OutputFolder
Invoke-Item $SnippetsFolder
