<#
.SYNOPSIS
    Remediates Windows 11 STIG finding WN11-00-000175 by disabling the Secondary Logon service.

.DESCRIPTION
    This script disables the Secondary Logon service (seclogon) and attempts to stop it if running.
    Disabling this service helps reduce privilege escalation and alternate credential misuse risk.

.NOTES
    Author          : Aaron Welsh
    LinkedIn        : https://www.linkedin.com/in/aaronswelsh/
    GitHub          : https://github.com/AaronW-Cipher
    Date Created    : 2026-05-02
    Last Modified   : 2026-05-02
    Version         : 1.2
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-00-000175

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run PowerShell as Administrator.

    Example:
    PS C:\> .\WN11-00-000175.ps1
#>

Write-Host "Applying STIG WN11-00-000175..." -ForegroundColor Cyan

# Disable Secondary Logon using registry and sc.exe for reliability
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\seclogon" -Name Start -Value 4
sc.exe config seclogon start= disabled | Out-Null

# Attempt to stop the service if it is running
$service = Get-Service -Name seclogon

if ($service.Status -eq "Running") {
    Write-Host "Stopping Secondary Logon service..." -ForegroundColor Yellow
    sc.exe stop seclogon | Out-Null
    Start-Sleep -Seconds 5
}

# Refresh service state
$serviceInfo = Get-CimInstance -ClassName Win32_Service -Filter "Name='seclogon'"

Write-Host "`nVerifying configuration..." -ForegroundColor Yellow
Write-Host "Service Name : $($serviceInfo.Name)"
Write-Host "Display Name : $($serviceInfo.DisplayName)"
Write-Host "State        : $($serviceInfo.State)"
Write-Host "Startup Type : $($serviceInfo.StartMode)"

if ($serviceInfo.StartMode -eq "Disabled") {
    Write-Host "`n[PASS] Secondary Logon service startup type is disabled." -ForegroundColor Green

    if ($serviceInfo.State -ne "Stopped") {
        Write-Host "[INFO] Service is disabled but still running. Reboot the system, then verify again." -ForegroundColor Yellow
    }
} else {
    Write-Host "`n[FAIL] Secondary Logon service startup type is NOT disabled." -ForegroundColor Red
}

Write-Host "`nRemediation complete. Perform Tenable rescan to confirm compliance." -ForegroundColor Cyan
