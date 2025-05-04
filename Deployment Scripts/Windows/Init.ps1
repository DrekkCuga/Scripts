winget install --id chocolatey.chocolatey --source winget

#check for GPUs
$gpus = Get-CimInstance Win32_VideoController | Select-Object AdapterCompatibility
if (($gpus | Where-Object {$_.AdapterCompatibility -eq "NVIDIA"} | Measure-Object).Count -gt 0) {
    Write-Output "Found NVIDIA GPU, Installing NVIDIA drivers"
    choco install geforce-experience
}

if (($gpus | Where-Object {$_.AdapterCompatibility -eq "Advanced Micro Devices, Inc."} | Measure-Object).Count -gt 0) {
    Write-Output "Found AMD GPU, Windows should install this."
}

#GPD WM2 2024 Drivers, need a mirror for this later
if (((Get-WmiObject Win32_BaseBoard).Product -eq "G1619-04" ) -and ((Get-WmiObject Win32_BaseBoard).Manufacturer -eq "GPD" )) {
    Write-Output "Found HW GPD Win Max 2 2024, Downloading Drivers"
    Invoke-WebRequest "https://drive.usercontent.google.com/download?id=19MALLPUxRZHsXjcP-VP3synRRxTwBc19&export=download&authuser=0&confirm=t&uuid=b7fc1932-40a2-4bb8-9084-2711165155ed&at=APcmpozzQa6aPynFbpchzlJ5eesQ%3A1746364282178" -OutFile ($env:TEMP + "gpdwm22024drivers.zip")
    Expand-Archive -Path ($env:TEMP + "gpdwm22024drivers.zip") -DestinationPath ($env:TEMP + "gpdwm22024drivers")
    Start-Process -wait ($env:TEMP + "gpdwm22024drivers" + "/AutoInstallDrivers.bat")
}

winget install --id=Python.Python.3.10  -e
winget install --id=Tailscale.Tailscale  -e
winget install --id=7zip.7zip  -e
winget install --id=Mozilla.Firefox  -e
winget install --id=Obsidian.Obsidian  -e
winget install --id=Git.Git  -e
winget install --id=IrfanSkiljan.IrfanView  -e
winget install --id=Notepad++.Notepad++  -e
winget install --id=Microsoft.VisualStudioCode  -e
winget install --id=dotPDN.PaintDotNet  -e