#!/bin/bash

# === CONFIG ===
SRC="/home/$(whoami)/Documents/Journals/devops_learning" # what to back up
DEST="/tmp/backups" # where to save
DATE=$(date +%Y%m%d_%H%M%S) # Timestamp
BACKUP_FILE="$DEST/backup_$DATE.tar.gz"

# === SAFETY ===
[[ -d "$SRC" ]] || { echo "Error: Source not found"; exit 1; }
mkdir -p "$DEST" || { echo "Error: Cannot create $DEST"; exit 1;}

# === BACKUP ===
tar -czf "$BACKUP_FILE" "$SRC" 2>/dev/null

# === RESULT ===
if [[ $? -eq 0 ]]; then
	echo "Backup saved: $BACKUP_FILE"
	ls -lh "$BACKUP_FILE"
else
	echo  "Backup failed"
	exit 1
fi