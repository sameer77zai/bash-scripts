#!/bin/bash

# ==========================================
# SERVER HEALTH CHECKER
# by DevOps Engineer in training
# ==========================================

# --- Reusable Functions ---

function print_header() {
    echo ""
    echo "=========================================="
    echo "   $1"
    echo "=========================================="
}

function check_service() {
    if systemctl is-active --quiet $1; then
        echo "  ✅ $1 is RUNNING"
    else
        echo "  ❌ $1 is STOPPED"
    fi
}

function get_memory() {
    TOTAL=$(free -m | awk 'NR==2 {print $2}')
    USED=$(free -m | awk 'NR==2 {print $3}')
    echo "  🧠 Memory    : ${USED}MB / ${TOTAL}MB"
}

function get_disk() {
    USAGE=$(df -h / | awk 'NR==2 {print $5}')
    echo "  💾 Disk      : $USAGE"
}

function get_cpu() {
    LOAD=$(uptime | awk -F'load average:' '{print $2}')
    echo "  ⚡ CPU Load  :$LOAD"
}

function get_last_login() {
    LOGIN=$(sudo grep "Accepted" /var/log/auth.log | grep "sshd\[" | tail -1 | awk '{print $9}')
    echo "  👤 Last login: from $LOGIN"
}

# --- Main Script ---

print_header "🖥️  SERVER HEALTH REPORT"
echo "  🏠 Hostname  : $(hostname)"
echo "  📅 Date      : $(date)"
echo "  ⏱️  Uptime    : $(uptime -p)"

print_header "📊 RESOURCE USAGE"
get_disk
get_memory
get_cpu

print_header "⚙️  SERVICE STATUS"
SERVICES="nginx ssh docker cron rsyslog"
for SERVICE in $SERVICES; do
    check_service $SERVICE
done

print_header "🔐 SECURITY CHECK"
get_last_login

echo ""
echo "=========================================="
echo "  ✅ Health check complete!"
echo "=========================================="
echo ""
