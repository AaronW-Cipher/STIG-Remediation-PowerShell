<#
.SYNOPSIS
    Remediates Windows 11 STIG finding WN11-AC-000010 by configuring the account lockout threshold to 3 invalid logon attempts.

.DESCRIPTION
    This script enforces the DISA STIG requirement for account lockout threshold by setting the number of allowed bad logon attempts to 3.
    This helps reduce brute-force password attack risk by locking accounts after repeated failed authentication attempts.

.NOTES
    Author          : Aaron Welsh
    LinkedIn        : https://www.linkedin.com/in/aaronswelsh/
    GitHub          : https://github.com/AaronW-Cipher
    Date Created    : 2026-05-02
    Last Modified   : 2026-05-02
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AC-000010

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run PowerShell as Administrator.

    Example:
    PS C:\> .\WN11-AC-000010.ps1
#>

Write-Host "Applying STIG WN11-AC-000010..." -ForegroundColor Cyan

# Set account lockout threshold to 3 invalid logon attempts
net accounts /lockoutthreshold:3

Write-Host "`nVerifying configuration..." -ForegroundColor Yellow

$accountSettings = net accounts
$accountSettings

if ($accountSettings -match "Lockout threshold:\s+3") {
    Write-Host "`n[PASS] Lockout threshold is correctly set to 3 invalid logon attempts." -ForegroundColor Green
} else {
    Write-Host "`n[FAIL] Lockout threshold is NOT set correctly." -ForegroundColor Red
}

Write-Host "`nRemediation complete. Perform Tenable rescan to confirm compliance." -ForegroundColor Cyan
