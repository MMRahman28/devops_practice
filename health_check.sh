#!/bin/bash

# === CONFIG ===
LOG="/tmp/health.log"
EMAIL="mashuk.pro@gmail.com"
MSMTP="/usr/bin/msmtp"
MSMTPRC="/home/mashuk/.msmtprc"
THRESHOLD_DISK=90  # % full
THRESHOLD_MEM=90  # % used

# === FUNCTIONS ===
timestamp=$(date)
send_alert() {
	local msg="$1"
	local host=$(/usr/bin/hostnamectl --static)
    {
		BODY="ALERT!\n$1\n$host\n$timestamp"
		echo "From: $EMAIL"
		echo "To: $EMAIL"
		echo "Subject: [ALERT] $msg"
		echo "Content-Type: text/plain; charset=UTF-8"
		#echo "ALERT: $msg"
		echo -e "$BODY"
	} | MSMTP_CONFIG="$MSMTPRC" "$MSMTP" -a gmail "$EMAIL"
	
}

# === CHECKS ===
echo "=== HEALTH CHECK $timestamp ===" >> "$LOG"

#1.DISK
DISK=$(df /| tail -1 | awk '{print $5}' | tr -d '%')
[[ $DISK -gt $THRESHOLD_DISK ]] && send_alert "Disk >${THRESHOLD_DISK}% ($DISK%)"

#2. MEMORY
MEM=$(free | awk '/Mem/{printf "%.0f", $3/$2 * 100}')
[[ $MEM -gt $THRESHOLD_MEM ]] && send_alert "Memory >${THRESHOLD_MEM}% ($MEM%)"

#3. LOAD
LOAD=$(uptime | awk -F 'load average:' '{print $2}' | cut -d, -f1 | xargs)
[[ $(echo "$LOAD > 2" | bc -l) -eq 1 ]] && send_alert "High load: $LOAD"

echo "Check complete" >> "$LOG"
