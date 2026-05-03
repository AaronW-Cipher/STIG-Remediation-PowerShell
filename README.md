# 🛡️ Windows 11 STIG Remediation (PowerShell)

Hands-on remediation of DISA Windows 11 STIG findings using PowerShell in a Cyber Range environment.  
Focused on vulnerability management, system hardening, and validation aligned with real-world SOC workflows.

---

## 🔧 Skills Demonstrated

- Vulnerability Remediation (DISA STIGs)
- PowerShell Scripting & Automation
- Windows Security Hardening
- Account & Password Policy Enforcement
- Firewall Configuration
- Service Hardening
- Event Logging & Audit Configuration
- Validation & Compliance Verification
- Tenable Vulnerability Scanning

---

## 🧰 Tools & Technologies

- PowerShell
- Windows 11
- Tenable Vulnerability Management
- Local Security Policy (secedit)
- Windows Services & Firewall

---

## 📊 STIGs Remediated

| STIG ID | Description | Status |
|--------|------------|--------|
| WN11-AC-000005 | Account Lockout Duration | ✅ Completed |
| WN11-AC-000010 | Lockout Threshold | ✅ Completed |
| WN11-AC-000015 | Reset Lockout Counter | ✅ Completed |
| WN11-AC-000020 | Password History | ✅ Completed |
| WN11-AC-000030 | Minimum Password Age | ✅ Completed |
| WN11-AC-000035 | Minimum Password Length | ✅ Completed |
| WN11-AC-000040 | Password Complexity | ✅ Completed |
| WN11-00-000175 | Secondary Logon Service | ✅ Completed |
| WN11-00-000135 | Windows Defender Firewall | ✅ Completed |
| WN11-AU-000500 | Application Log Size | ✅ Completed |

---

## 🔍 Example Remediation Workflow

### STIG: WN11-AC-000010 (Lockout Threshold)

**Issue:**  
System allowed excessive failed login attempts, increasing risk of brute-force attacks.

**Remediation (PowerShell):**
```powershell
net accounts /lockoutthreshold:3

**Verification:**
```powershell
net accounts

**Result:**
```
Lockout threshold: 3
```
