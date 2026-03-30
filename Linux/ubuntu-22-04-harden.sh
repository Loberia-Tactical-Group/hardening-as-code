#!/bin/bash
# Loberia Tactical Group - Server Hardening Script
# Version: 1.0.0 | Target: Ubuntu 22.04 LTS
# Description: Automated security baseline for critical assets.

echo "--- LOBERIA TACTICAL GROUP: STARTING HARDENING ---"

# 1. Actualización de Seguridad
echo "[+] Updating system packages..."
sudo apt-get update && sudo apt-get upgrade -y

# 2. Configuración de Firewall (UFW)
echo "[+] Configuring Firewall: Allowing only SSH (22), HTTP (80), HTTPS (443)..."
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw --force enable

# 3. Hardening de SSH (Evitar Brute Force)
echo "[+] Securing SSH configuration..."
# Desactiva el login de Root y contraseñas vacías
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config
sudo sed -i 's/#MaxAuthTries 6/MaxAuthTries 3/' /etc/ssh/sshd_config
sudo systemctl restart ssh

# 4. Protección de Red (Sysctl)
echo "[+] Hardening Network Stack (Anti-Spoofing & ICMP Redirects)..."
cat <<EOF | sudo tee -a /etc/sysctl.conf
net.ipv4.conf.all.rp_filter = 1
net.ipv4.conf.all.accept_redirects = 0
net.ipv4.icmp_echo_ignore_broadcasts = 1
EOF
sudo sysctl -p

# 5. Instalación de Fail2Ban (Detección de Intrusos)
echo "[+] Installing Fail2Ban for automated IP blocking..."
sudo apt-get install fail2ban -y
sudo systemctl enable fail2ban
sudo systemctl start fail2ban

echo "--- HARDENING COMPLETE. SYSTEM REBOOT RECOMMENDED ---"
