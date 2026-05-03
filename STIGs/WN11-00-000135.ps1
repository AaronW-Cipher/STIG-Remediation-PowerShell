<#
.SYNOPSIS
    Remediates Windows 11 STIG finding WN11-00-000135 by enabling Windows Defender Firewall for all profiles.

.DESCRIPTION
    This script enables Windows Defender Firewall for the Domain, Private, and Public profiles.
    Enabling the firewall helps reduce unauthorized inbound network access and limits exposure to network-based attacks.

.NOTES
    Author          : Aaron Welsh
    LinkedIn        : https://www.linkedin.com/in/aaronswelsh/
    GitHub          : https://github.com/AaronW-Cipher
    Date Created    : 2026-05-02
    Last Modified   : 2026-05-02
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-00-000135

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run PowerShell as Administrator.

    Example:
    PS C:\> .\WN11-00-000135.ps1
#>

Write-Host "Applying STIG WN11-00-000135..." -ForegroundColor Cyan

# Enable Windows Defender Firewall for all profiles
Set-NetFirewallProfile -Profile Domain,Private,Public -Enabled True

Write-Host "`nVerifying configuration..." -ForegroundColor Yellow

$profiles = Get-NetFirewallProfile | Select-Object Name, Enabled
$profiles

if (($profiles | Where-Object { $_.Enabled -eq $false }).Count -eq 0) {
    Write-Host "`n[PASS] Windows Defender Firewall is enabled for all profiles." -ForegroundColor Green
} else {
    Write-Host "`n[FAIL] One or more Windows Defender Firewall profiles are disabled." -ForegroundColor Red
}

Write-Host "`nRemediation complete. Perform Tenable rescan to confirm compliance." -ForegroundColor Cyan
