#!/bin/bash

# === CONFIG ===
SERVICE="sleep-walking-server" # process name
SCRIPT_NAME= "$(basename "$0")"
SCRIPT_PID="$$"
LOG="/home/mashuk/Documents/Journals/devops_learning/monitor.log"

# === CHECK PROCESS ===
if  pgrep -x "$SERVICE" > /dev/null; then
	log "$SERVICE is running"
	exit 0
else
	log "$SERVICE is DOWN - restarting..."
	/tmp/sleep-walking-server &
	NEW_PID=$!
	log "$SERVICE restarted with PID: $NEW_PID"
fi

# Monitor multiple services

#CONFIG="/etc/monitor/services.conf"


#while IFS=: read -r name cmd; do
#	if pgrep -x "$name" > /dev/null; then
		log "$name running"
#    else
#		log "$name down - starting $cmd"
#	    $cmd &
#	fi
#done < "$CONFIG"
