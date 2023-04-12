$letters= "f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u" #Specifies drive letters to wipe
$drives = $letters.Split(",") #Creates an array from the string of drive letters
For($i=0; $i -lt $drives.length; $i++) { #iterate through the drive letters
    $drives[$i]+=":\*"#append :\ to the drive letters
    Remove-Item $drives[$i] -Recurse #delete the contents of the drive at this letter
}
$drives = $letters.Split(",") #reinitialize drives variable to clear changes in the above For loop
$MFPath = "C:\Geo\Teen Challenge\Marketing\50th Anniversary\USB Master Image" #Specifies Master Folder Path
For($i=0; $i -lt $drives.length; $i++) { #iterate through the drive letters
    $drives[$i]+=":\" #append only the :\ for the file path
    Get-ChildItem $MFPath | ForEach-Object { #Grab the child items so we only pull the contents and not the folder
        Copy-Item $_.FullName -Destination $drives[$i] -Recurse #do the copy
    }
}