winget install --id=JoeTaylor.WSJT-X  -e
winget install --id=w1hkj.flrig  -e
winget install --id=VB-Audio.Voicemeeter.Banana  -e
winget install --id=w1hjk.fldigi  -e
winget install --id=FreeDV.FreeDV  -e
winget install --id=Winlink.WinlinkExpress  -e
winget install --id=KN4CRD.JS8Call  -e

winget install --id chocolatey.chocolatey --source winget
choco install mmsstv

#FLE
if ((Get-Package -ProviderName MSI,Programs | Where-Object {$_.Name -eq "Fast Log Entry"} | Measure-Object).Count -eq 0) {
    Invoke-WebRequest "https://df3cb.com/fle/files/FLE3Setup64bit.exe" -OutFile ($env:TEMP + "FLE3Setup64bit.exe")
    Start-Process -wait ($env:TEMP + "FLE3Setup64bit.exe")
}

#EasyPAL
if ((Get-Package -ProviderName MSI,Programs | Where-Object {$_.Name -eq "Fast Log Entry"} | Measure-Object).Count -eq 0) {
    Invoke-WebRequest "https://easypal.org/downloads/EasyPal-07-OCT-2014-Setup.exe" -OutFile ($env:TEMP + "EasyPal-07-OCT-2014-Setup.exe")
    Start-Process -wait ($env:TEMP + "EasyPal-07-OCT-2014-Setup.exe")
}