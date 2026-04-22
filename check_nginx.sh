#!/bin/bash

echo " ========================="
echo " Nginx Status Checker"
echo " ========================"

if systemctl is-active --quiet nginx; then
echo " Nginx is RUNNING"
else 
echo " Nginx is stopped"
fi
echo " "
echo " cehcking config file..."
if [ -f /etc/nginx/nginx.conf ]; then
echo " nginx.conf EXISTS"
else 
echo " nginx.conf NOT FOUND"
fi
echo " "
echo " cehcking current user..."
if [ "$USER" == "ubuntu" ]; then
echo "running as correct user : $USER"
else 
echo " running as unexpected user: $USER"
fi
