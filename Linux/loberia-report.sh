#!/bin/bash
# Loberia Tactical Group - Executive Report Generator
# Description: Consolidates system audits into a single professional report.

REPORT_FILE="Loberia_Security_Report_$(date +%Y%m%d_%H%M).txt"

{
    echo "====================================================="
    echo "       LOBERIA TACTICAL GROUP - SECURITY REPORT       "
    echo "====================================================="
    echo "Date: $(date)"
    echo "Hostname: $(hostname)"
    echo "Uptime: $(uptime -p)"
    echo "-----------------------------------------------------"
    echo ""
    
    echo "[+] SYSTEM AUDIT SUMMARY:"
    # Llamamos a tu script de auditoría (asumiendo que está en el mismo directorio)
    bash ./Linux/audit.sh
    echo ""
    
    echo "[+] NETWORK STEALTH & TRAPS:"
    if pgrep -f loberia-trap.sh > /dev/null; then
        echo "Status: Tactical Honeypot is ACTIVE."
    else
        echo "Status: Tactical Honeypot is OFFLINE."
    fi
    echo ""
    
    echo "[+] CRITICAL LOGS (Last 5 Sentinel Alerts):"
    if [ -f /var/log/loberia_sentinel.log ]; then
        tail -n 5 /var/log/loberia_sentinel.log
    else
        echo "No sentinel logs found."
    fi
    echo ""
    
    echo "====================================================="
    echo "       END OF REPORT - SECURE BY EXECUTION           "
    echo "====================================================="
} > "$REPORT_FILE"

echo "[OK] Report generated successfully: $REPORT_FILE"
