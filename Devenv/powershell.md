## Keyword
`powershell`

## Reference
- [Using Powershell I want to Forcefully Copy Folder/files Without Erasing Extra Files in Existing Destination Folder:](https://stackoverflow.com/questions/14819205/using-powershell-i-want-to-forcefully-copy-folder-files-without-erasing-extra-fi)
- [MS PowerShell Copy-Item](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/copy-item?view=powershell-5.1)

## 상황/ 궁금증
- [x] 왜 powershell에서는 ""붙여야 할까? -> powershell 자체 parsing rule에 의해 command와 expression을 구분함. 
  - [When to Quote in PowerShell](https://www.red-gate.com/simple-talk/sysadmin/powershell/when-to-quote-in-powershell/) : 
  - [PowerShell’s help page - About_Quoting_Rules](https://technet.microsoft.com/en-us/library/hh847740.aspx)


## 정리
- Overwirte copy directory
`Copy-Item -Force -Recurse  –Verbose $releaseDirectory -Destination $sitePath`