#!/bin/bash

echo "=== SYSTEM MENU ==="
echo "1) Check disk space"
echo "2) Check memory"
echo "3) Check uptime"
echo "4) Exit"

read -p "Choose [1-4]: " choice

case $choice in 
1) df -h | grep -E "Use%|/dev/";;
2) free -h ;;
3) uptime ;;
4) echo "Bye!"; exit 0;;
*) echo "Invalid! Try 1-4" ; exit 1 ;;
esac
