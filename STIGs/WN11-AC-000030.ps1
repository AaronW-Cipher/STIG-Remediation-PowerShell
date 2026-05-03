<#
.SYNOPSIS
    Remediates Windows 11 STIG finding WN11-AC-000030 by configuring the minimum password age to 1 day.

.DESCRIPTION
    This script enforces the DISA STIG requirement for minimum password age by setting it to 1 day.
    This helps prevent users from rapidly cycling through password changes to bypass password history controls.

.NOTES
    Author          : Aaron Welsh
    LinkedIn        : https://www.linkedin.com/in/aaronswelsh/
    GitHub          : https://github.com/AaronW-Cipher
    Date Created    : 2026-05-02
    Last Modified   : 2026-05-02
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AC-000030

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run PowerShell as Administrator.

    Example:
    PS C:\> .\WN11-AC-000030.ps1
#>

Write-Host "Applying STIG WN11-AC-000030..." -ForegroundColor Cyan

net accounts /minpwage:1

Write-Host "`nVerifying configuration..." -ForegroundColor Yellow

$accountSettings = net accounts
$accountSettings

if ($accountSettings -match "Minimum password age \(days\):\s+1") {
    Write-Host "`n[PASS] Minimum password age is correctly set to 1 day." -ForegroundColor Green
} else {
    Write-Host "`n[FAIL] Minimum password age is NOT set correctly." -ForegroundColor Red
}

Write-Host "`nRemediation complete. Perform Tenable rescan to confirm compliance." -ForegroundColor Cyan
