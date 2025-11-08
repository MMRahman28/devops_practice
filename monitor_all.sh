CONFIG="/home/mashuk/Documents/Journals/devops_learning/services.conf"
LOG="/home/mashuk/Documents/Journals/devops_learning/monitor.log"
SCRIPT_NAME="$(basename "$0")"

log(){
	logger -i -t "$SCRIPT_NAME" -p user.info "$1"
	echo "[$(date)] [$$] $1" >> "$LOG"
}

[[ -f "$CONFIG" ]] || { log "Config $CONFIG missing"; exit 1; }

while IFS=: read -r name unit cmd; do 
	# Trim
	name=$(echo "$name" | xargs)
	unit=$(echo "$unit" | xargs)

	if systemctl is-active --quiet "$unit" 2>/dev/null; then
		log "$name ($unit) is ACTIVE"
	else
		log "$name ($unit) is DOWN - restarting with $cmd"
		$cmd & # systemctl restart $unit (systemctl powered)
		sleep2
		if pgrep -x "$(basename "$cmd")" > /dev/null; then # same -if systemctl is-active --quiet "$unit"; then
			log "$name restarted"
		else
			log "$name Failed"
		fi
	fi
done < "$CONFIG"