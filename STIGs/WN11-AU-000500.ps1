<#
.SYNOPSIS
    Remediates Windows 11 STIG finding WN11-AU-000500 by configuring the Application event log size to 32768 KB.

.DESCRIPTION
    This script configures the Windows Application event log maximum size to 32768 KB.
    Increasing event log size helps preserve system and application events needed for auditing,
    troubleshooting, detection, and incident response investigations.

.NOTES
    Author          : Aaron Welsh
    LinkedIn        : https://www.linkedin.com/in/aaronswelsh/
    GitHub          : https://github.com/AaronW-Cipher
    Date Created    : 2026-05-02
    Last Modified   : 2026-05-02
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000500

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run PowerShell as Administrator.

    Example:
    PS C:\> .\WN11-AU-000500.ps1
#>

Write-Host "Applying STIG WN11-AU-000500..." -ForegroundColor Cyan

# Configure Application event log maximum size to 32768 KB
Limit-EventLog -LogName Application -MaximumSize 32768KB

Write-Host "`nVerifying configuration..." -ForegroundColor Yellow

$logConfig = Get-EventLog -List | Where-Object { $_.Log -eq "Application" } | Select-Object Log, MaximumKilobytes

$logConfig

if ($logConfig.MaximumKilobytes -ge 32768) {
    Write-Host "`n[PASS] Application event log size is configured to 32768 KB or greater." -ForegroundColor Green
} else {
    Write-Host "`n[FAIL] Application event log size is below 32768 KB." -ForegroundColor Red
}

Write-Host "`nRemediation complete. Perform Tenable rescan to confirm compliance." -ForegroundColor Cyan
