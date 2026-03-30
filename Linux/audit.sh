#!/bin/bash
# Loberia Tactical Group - Security Audit Tool
# Version: 1.0.0
# Description: Quick security assessment for Linux servers.

echo "--- LOBERIA TACTICAL GROUP: SYSTEM AUDIT ---"
echo "Checking security posture..."

# 1. Verificar Firewall
if systemctl is-active --quiet ufw; then
    echo "[OK] Firewall (UFW) is active."
else
    echo "[!] WARNING: Firewall (UFW) is DISABLED."
fi

# 2. Verificar SSH Root Login
SSH_ROOT=$(grep "^PermitRootLogin" /etc/ssh/sshd_config)
if [[ $SSH_ROOT == *"no"* ]]; then
    echo "[OK] SSH Root Login is disabled."
else
    echo "[!] WARNING: SSH Root Login is ENABLED (Critical)."
fi

# 3. Verificar Fail2Ban
if systemctl is-active --quiet fail2ban; then
    echo "[OK] Fail2Ban is protecting against brute force."
else
    echo "[!] WARNING: Fail2Ban is not installed or inactive."
fi

# 4. Verificar actualizaciones pendientes
UPDATES=$(apt list --upgradable 2>/dev/null | grep -c upgradable)
if [ "$UPDATES" -eq "0" ]; then
    echo "[OK] System is up to date."
else
    echo "[!] WARNING: There are $UPDATES pending security updates."
fi

echo "--- AUDIT COMPLETE ---"
