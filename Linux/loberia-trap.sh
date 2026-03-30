#!/bin/bash
# Loberia Tactical Group - Tactical Honeypot (v1.0)
# Description: Opens a fake port to detect and log unauthorized scans.

TRAP_PORT=2323  # Puerto señuelo (común para ataques Telnet)
LOG_FILE="/var/log/loberia_trap.log"

echo "--- LOBERIA TACTICAL GROUP: HONEYPOT ACTIVATED ---"
echo "[+] Monitoring Ghost Port: $TRAP_PORT"
echo "[+] Audit Log: $LOG_FILE"
echo "--------------------------------------------------"

# Función para capturar la intrusión
while true; do
    # Usamos 'nc' (netcat) para escuchar en el puerto y capturar la IP del atacante
    intrusion=$(nc -lvp $TRAP_PORT 2>&1 | grep "connect to")
    
    if [ ! -z "$intrusion" ]; then
        timestamp=$(date "+%Y-%m-%d %H:%M:%S")
        echo "[!!!] ALERT: Unauthorized connection detected at $timestamp" | tee -a $LOG_FILE
        echo "Details: $intrusion" | tee -a $LOG_FILE
        echo "--------------------------------------------------" >> $LOG_FILE
    fi
done
