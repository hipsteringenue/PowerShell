$pattern1 = "\(?[a-z]*?\s?(\d{1})[\.-]{1}(\d{1})[\.-]{1}(2\d{1})\)?(\s.*)(\.pdf)"
$pattern2 = "\(?[a-z]*?\s?(\d{1})[\.-]{1}(\d{1})[\.-]{1}(20\d{2})\)?(\s.*)(\.pdf)"
$pattern3 = "\(?[a-z]*?\s?(\d{2})[\.-]{1}(\d{2})[\.-]{1}(2\d{1})\)?(\s.*)(\.pdf)"
$pattern4 = "\(?[a-z]*?\s?(\d{2})[\.-]{1}(\d{2})[\.-]{1}(20\d{2})\)?(\s.*)(\.pdf)"
Get-ChildItem -Path . -File |
    ForEach-Object {
        if ($_.Name -match $pattern1) {
            Rename-Item -Path $_.FullName -NewName $($_.Name -replace $pattern1, '20$3.0$1.0$2$4$5') 
        }
    
      if ($_.Name -match $pattern2) {
            Rename-Item -Path $_.FullName -NewName $($_.Name -replace $pattern2, '$3.0$1.0$2$4$5') 
        }
      if ($_.Name -match $pattern3) {
            Rename-Item -Path $_.FullName -NewName $($_.Name -replace $pattern3, '20$3.$1.$2$4$5') 
        }
      if ($_.Name -match $pattern4) {
            Rename-Item -Path $_.FullName -NewName $($_.Name -replace $pattern4, '$3.$1.$2$4$5') 
        }
    }
