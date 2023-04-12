$letters= "f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u"
$drives = $letters.Split(",")
For($i=0; $i -lt $drives.length; $i++) {
    $drives[$i]+=":\*"
    Remove-Item $drives[$i] -Recurse
}

$MFPath = "C:\Geo\Teen Challenge\Marketing\50th Anniversary\USB Master Image"
For($i=0; $i -lt $drives.length; $i++) {
    $drives[$i]+=":\"
    Get-ChildItem $MFPath | ForEach-Object {
        Copy-Item $_.FullName -Destination $drives[$i] -Recurse
    }
}