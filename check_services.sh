#!/bin/bash

echo "========================="
echo "  Service Status Checker"
echo "========================="
echo ""

SERVICES="nginx ssh docker cron rsyslog"

for SERVICE in $SERVICES; do
    if systemctl is-active --quiet $SERVICE; then
        echo "  ✅ $SERVICE is RUNNING"
    else
        echo "  ❌ $SERVICE is STOPPED"
    fi
done

echo ""
echo "========================="
echo "  Check complete!"
echo "========================="
