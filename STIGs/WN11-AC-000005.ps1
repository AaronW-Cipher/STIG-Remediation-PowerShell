<#
.SYNOPSIS
    Remediates Windows 11 STIG finding WN11-AC-000005 by configuring the account lockout duration to 15 minutes.

.DESCRIPTION
    This script enforces the DISA STIG requirement for account lockout duration by setting the value to 15 minutes.
    This helps mitigate brute-force password attacks by ensuring locked accounts remain inaccessible for a defined period.

.NOTES
    Author          : Aaron Welsh
    LinkedIn        : https://www.linkedin.com/in/aaronswelsh/
    GitHub          : https://github.com/AaronW-Cipher
    Date Created    : 2026-05-02
    Last Modified   : 2026-05-02
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AC-000005

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run PowerShell as Administrator.

    Example:
    PS C:\> .\WN11-AC-000005.ps1

#>

# WN11-AC-000005
# Set account lockout duration to 15 minutes

net accounts /lockoutduration:15
