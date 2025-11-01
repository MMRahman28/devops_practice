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

# Email Alert (31 October 2025)

if [ "$ERROR_COUNT" -gt 0 ]; then
	SUBJECT="Log Alert: $ERROR_COUNT errors in '$LOG_FILE'"
	BODY="ALERT: $ERROR_COUNT '$ERROR_PATTERN' (s) found in '$LOG_FILE'\n\nLast 5 lines:
	\n$(grep "$ERROR_PATTERN" "$LOG_FILE" | tail -5)"
	echo -e "$BODY" | msmtp -a gmail mashuk.pro@gmail.com
	echo "Email alert sent via msmtp"
else
	echo "All good - no '$ERROR_PATTERN' in '$LOG_FILE'"
fi

# Alternative email alert with curl (vpn proof)

#if ["$ERROR_COUNT" -gt 0 ]; then
#	BODY="ALERT: $ERROR_COUNT '$ERROR_PATTERN' (s) found in '$LOG_FILE'\n\nLast 5 lines:
#	\n$(grep "$ERROR_PATTERN" "$LOG_FILE" | tail -5)"

#	curl -s \
#		--url 'smtps://smtp.gmail.com:465' \
#		--ssl-reqd \
#		--mail-from 'you@gmail.com' \
#		--mail-rcpt 'you@gmail.com' \
#		--user 'you@gmail.com:APP_PASSWORD' \
#		-T <(echo -e "From: you@gmail.com\nTo: you@gmail.com\nSubject: Log Alert\n\n$BODY")
	
#	echo "Email sent via curl"
#fi	

2025-11-01 14:00:00 ERROR FINAL TEST
2025-11-01 14:01:00 ERROR FINAL TEST
2025-11-01 14:01:00 ERROR FINAL TEST
