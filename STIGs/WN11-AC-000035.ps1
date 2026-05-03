<#
.SYNOPSIS
    Remediates Windows 11 STIG finding WN11-AC-000035 by configuring the minimum password length to 14 characters.

.DESCRIPTION
    This script enforces the DISA STIG requirement for minimum password length by setting it to 14 characters.
    Longer passwords increase resistance against brute-force, guessing, and credential-cracking attacks.

.NOTES
    Author          : Aaron Welsh
    LinkedIn        : https://www.linkedin.com/in/aaronswelsh/
    GitHub          : https://github.com/AaronW-Cipher
    Date Created    : 2026-05-02
    Last Modified   : 2026-05-02
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AC-000035

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run PowerShell as Administrator.

    Example:
    PS C:\> .\WN11-AC-000035.ps1
#>

Write-Host "Applying STIG WN11-AC-000035..." -ForegroundColor Cyan

net accounts /minpwlen:14

Write-Host "`nVerifying configuration..." -ForegroundColor Yellow

$accountSettings = net accounts
$accountSettings

if ($accountSettings -match "Minimum password length:\s+14") {
    Write-Host "`n[PASS] Minimum password length is correctly set to 14 characters." -ForegroundColor Green
} else {
    Write-Host "`n[FAIL] Minimum password length is NOT set correctly." -ForegroundColor Red
}

Write-Host "`nRemediation complete. Perform Tenable rescan to confirm compliance." -ForegroundColor Cyan
