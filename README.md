# STIG-Remediation-PowerShell

Remediated DISA Windows 11 STIG findings using PowerShell with validation, Tenable rescans, and security documentation aligned to SOC analyst workflows.

---

## STIGs Remediated

| STIG ID | Description | Status |
|--------|------------|--------|
| WN11-AC-000005 | Account Lockout Duration | ✅ Completed |

---

## Example Remediation

### WN11-AC-000005

**Title:** Account Lockout Duration must be configured to 15 minutes or greater  

**Severity:** Medium  

---

### Issue

The system was non-compliant with STIG requirements:
- Lockout duration was set below 15 minutes
- This increases risk of brute-force password attacks

---

### Fix Implemented

```powershell
net accounts /lockoutduration:15
