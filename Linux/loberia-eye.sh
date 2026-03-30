#!/bin/bash
# Loberia Tactical Group - The Sentinel (v1.0)
# Monitoring critical system changes.

LOG_FILE="/var/log/loberia_sentinel.log"

echo "[$(date)] --- LOBERIA SENTINEL ACTIVATED ---" | tee -a $LOG_FILE

# 1. Monitorear conexiones SSH activas
echo "Current SSH Connections:"
who | grep "pts" | tee -a $LOG_FILE

# 2. Alertar sobre cambios en archivos de sistema (Check de Integridad)
# Compara el estado actual con un snapshot previo
if [ ! -f "/tmp/passwd_snap" ]; then
    cp /etc/passwd /tmp/passwd_snap
    echo "Initial password snapshot created."
else
    diff /etc/passwd /tmp/passwd_snap > /dev/null
    if [ $? -ne 0 ]; then
        echo "[!!!] ALERT: /etc/passwd has been MODIFIED!" | tee -a $LOG_FILE
    else
        echo "System integrity verified: OK."
    fi
fi

# 3. Revisar puertos sospechosos
echo "Listening ports (TCP/UDP):"
ss -tulpn | grep "LISTEN" | tee -a $LOG_FILE

echo "[$(date)] --- MONITORING CYCLE COMPLETE ---"
