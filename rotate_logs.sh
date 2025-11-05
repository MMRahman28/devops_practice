#!/bin/bash

# === CONFIG ===

LOG_DIR="/tmp/backups"
KEEP_DAYS=7
SCRIPT_PID="$$"

# === SAFETY ===
[[ -d "$LOG_DIR" ]] || { echo "[$SCRIPT_PID] ERROR: $LOG_DIR not found"; exit 1;}

# === ROTATE ===
echo "[$SCRIPT_PID] Rotating logs older than $KEEP_DAYS days in $LOG_DIR"

find "$LOG_DIR" -type f -name "*.tar.gz" -mtime +$KEEP_DAYS -print0 | xargs -0 rm -f

# === RESULT ===
if [[ $? -eq 0 ]]; then
	echo "[$SCRIPT_PID] Rotation complete"
else
	echo "[$SCRIPT_PID] Rotation failed"
	exit
fi
