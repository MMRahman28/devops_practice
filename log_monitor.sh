#!/bin/bash

# === Config with defaults ===
LOG_FILE=${1:-/tmp/sample.log}
ERROR_PATTERN=${2:-"ERROR"}

# === Input validation ===
if [ ! -f "$LOG_FILE" ]; then
	echo "Error: Log file not found: $LOG_FILE"
	echo "Usage: $0 <log-file> [error-pattern]"
	exit 1
fi

# === Count errors ===
ERROR_COUNT=$(grep -c "$ERROR_PATTERN" "$LOG_FILE")

# === Alert if any found ===
if [ "$ERROR_COUNT" -gt 0 ]; then
	echo "Alert: $ERROR_COUNT '$ERROR_PATTERN' found in '$LOG_FILE'"
	grep "$ERROR_PATTERN" "$LOG_FILE" | tail -5
else
	echo "All good - no '$ERROR_PATTERN' in '$LOG_FILE'"
fi
