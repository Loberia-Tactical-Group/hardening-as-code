<p align="center">
  <img src="assets/logo_300.png" width="300" alt="Loberia Tactical Group Logo">
</p>

# 🛡️ Loberia Hardening-as-Code (HAC)

> **"Secure by design, tactical by execution."**

This repository contains automated scripts designed by **Loberia Tactical Group** to establish high-security baselines on production servers. Our goal is to reduce the attack surface by automating the implementation of **CIS Benchmarks** and industry best practices.

### 🚀 Key Features
* **Automated Firewalling:** Strict inbound/outbound rules.
* **SSH Lockdown:** Disabling root access and enforcing key-based auth.
* **Network Hardening:** Protection against IP spoofing and man-in-the-middle attacks.
* **Intrusion Prevention:** Built-in integration with Fail2Ban.
* **Security Auditing:** Quick diagnostic tool to check system vulnerabilities.
* **Active Deception:** Tactical Honeypot script to detect and log early-stage network reconnaissance.

## 🛠️ Usage & Deployment

To use the **Loberia Tactical Suite**, follow these steps:

1. **Clone the repository:**
   ```bash
   git clone [https://github.com/Loberia-Tactical-Group/hardening-as-code.git](https://github.com/Loberia-Tactical-Group/hardening-as-code.git)
   cd hardening-as-code

2. **Grant execution permissions:**

chmod +x Linux/*.sh

3. **Run the tools (Recommended Order):**

Step 1: Audit (Diagnose vulnerabilities):
sudo ./Linux/audit.sh

Step 2: Harden (Apply security fixes):
sudo ./Linux/ubuntu-22-04-harden.sh

Step 3: Monitor & Trap (Start the sentinel and honeypot):

sudo ./Linux/loberia-eye.sh &

sudo ./Linux/loberia-trap.sh &

Step 4: Report (Generate an executive summary):

sudo ./Linux/loberia-report.sh
   
   **Executive Reporting Engine: A dedicated loberia-report.sh tool to generate high-level security summaries.**

### ⚠️ Disclaimer
These scripts are intended for **Ethical Hacking** and professional security environments. Always test in a staging environment before applying to production.

---

### ⚠️ Legal Disclaimer
*This project is for educational and ethical security purposes only. Usage of these scripts for attacking targets without prior mutual consent is illegal. **Loberia Tactical Group** is not responsible for any misuse of this tool.*

---
* *Need advanced security consulting? Contact us through our GitHub Organization profile.*
---
*Developed by Loberia Tactical Group | 2026*
