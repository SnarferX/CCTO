Import-CSV -Path "c:\DNS=Entries.csv" |
ForEach-Object {
  dnscmd.exe $_.dnsserver /RecordAdd $_.zone $_.name /createPTR $_.type $_.IP
}