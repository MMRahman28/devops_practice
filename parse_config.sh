#!/bin/bash

CONFIG="app.conf"
[[ -f "$CONFIG" ]] || {echo "Config not found"; exit 1; }

# === LOAD CONFIG ===
declare -A CFG # Associative array

while IFS='=' read -r key value; do
# Skip comments and empty lines
[[ "$key" =~ ^[[:space:]]*#  ]] && continue
[[ -z "$key" ]] && continue

# Trim white spaces
key=$(echo "$key" | xargs)
value=$(echo "$value" | xargs)

CFG["key"] = "$value"
done < "$CONFIG"

# === USE VALUES ===
echo "Server: ${CFG[SERVER_NAME]}"
echo "Port: ${CFG[PORT]}"
echo "Debug: ${CFG[DEBUG]}"
echo "Log level: ${CFG[LOG_LEVEL]}"
echo "Backup Dir: ${CFG[BACKUP_DIR]}"

# === PARSE COMMA-SEPARATED LIST ===
IFS=',' read -ra RAW_SERVICES <<< "${CFG[ENABLED_SERVICES]}"
SERVICES=()
for svc in "${RAW_SERVICES[@]}"; do
	trimmed=$(echo "$svc" | xargs) # trims whitespace
	SERVICES+=("$trimmed")
done

echo "Enabled services:"
for svc in "${SERVICES[@]}"; do
	echo " -  $svc"
done