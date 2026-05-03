<#
.SYNOPSIS
    Remediates Windows 11 STIG finding WN11-AC-000040 by enabling Microsoft password complexity requirements.

.DESCRIPTION
    This script enables the built-in Microsoft password complexity filter using local security policy.
    Password complexity requirements help reduce weak password usage and defend against brute-force,
    password spraying, and credential-cracking attacks.

.NOTES
    Author          : Aaron Welsh
    LinkedIn        : https://www.linkedin.com/in/aaronswelsh/
    GitHub          : https://github.com/AaronW-Cipher
    Date Created    : 2026-05-02
    Last Modified   : 2026-05-02
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AC-000040

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run PowerShell as Administrator.

    Example:
    PS C:\> .\WN11-AC-000040.ps1
#>

Write-Host "Applying STIG WN11-AC-000040..." -ForegroundColor Cyan

$cfgPath = "C:\Windows\Temp\WN11-AC-000040.cfg"
$dbPath  = "C:\Windows\Security\Database\WN11-AC-000040.sdb"

secedit /export /cfg $cfgPath | Out-Null

$config = Get-Content $cfgPath

$config = $config | ForEach-Object {
    if ($_ -match "^\s*PasswordComplexity\s*=") {
        "PasswordComplexity = 1"
    } else {
        $_
    }
}

if (-not ($config -match "^\s*PasswordComplexity\s*=")) {
    $updatedConfig = @()

    foreach ($line in $config) {
        $updatedConfig += $line

        if ($line -match "^\[System Access\]") {
            $updatedConfig += "PasswordComplexity = 1"
        }
    }

    $config = $updatedConfig
}

$config | Set-Content $cfgPath -Encoding Unicode

secedit /configure /db $dbPath /cfg $cfgPath /areas SECURITYPOLICY | Out-Null

gpupdate /force | Out-Null

Write-Host "`nVerifying configuration..." -ForegroundColor Yellow

$verifyPath = "C:\Windows\Temp\WN11-AC-000040-verify.cfg"

secedit /export /cfg $verifyPath | Out-Null

$result = Select-String -Path $verifyPath -Pattern "PasswordComplexity"

$result

if ($result -match "PasswordComplexity\s*=\s*1") {
    Write-Host "`n[PASS] Password complexity is enabled." -ForegroundColor Green
} else {
    Write-Host "`n[FAIL] Password complexity is NOT enabled." -ForegroundColor Red
}

Write-Host "`nRemediation complete. Perform Tenable rescan to confirm compliance." -ForegroundColor Cyan
