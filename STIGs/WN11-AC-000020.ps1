<#
.SYNOPSIS
    Remediates Windows 11 STIG finding WN11-AC-000020 by configuring password history to 24 passwords remembered.

.DESCRIPTION
    This script enforces the DISA STIG requirement for password history by setting the system to remember 24 previous passwords.
    This helps prevent users from cycling through passwords and reusing previously used credentials.

.NOTES
    Author          : Aaron Welsh
    LinkedIn        : https://www.linkedin.com/in/aaronswelsh/
    GitHub          : https://github.com/AaronW-Cipher
    Date Created    : 2026-05-02
    Last Modified   : 2026-05-02
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AC-000020

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run PowerShell as Administrator.

    Example:
    PS C:\> .\WN11-AC-000020.ps1
#>

Write-Host "Applying STIG WN11-AC-000020..." -ForegroundColor Cyan

net accounts /uniquepw:24

Write-Host "`nVerifying configuration..." -ForegroundColor Yellow

$accountSettings = net accounts
$accountSettings

if ($accountSettings -match "Length of password history maintained:\s+24") {
    Write-Host "`n[PASS] Password history is correctly set to 24 passwords remembered." -ForegroundColor Green
} else {
    Write-Host "`n[FAIL] Password history is NOT set correctly." -ForegroundColor Red
}

Write-Host "`nRemediation complete. Perform Tenable rescan to confirm compliance." -ForegroundColor Cyan
