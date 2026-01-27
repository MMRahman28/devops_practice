# DevOps Learning Journey

**Self-taught | Linux | Bash | Git**
> "I learn by doing - every day."

---

## Open to Junior DevOps Roles
- Available: Immediate
- Location: UK (Remote/Hybrid)
- Email: mashuk.pro@gmail.com

---

## Live Project: Log Monitoring System

- **Build a log monitor bash script**:
	- Email alert added, now a real-time log monitoring system
	- Cron job added to send email alert every 5 minutes
	- Scripts: `log_monitor.sh`

	```bash
	./log_monitor.sh /var/log/syslog ERROR
	```
- **Automated Backup**
	- `tar -czf` with timestamp
	- safe checks => `[[ -d ]]`, `mkdir -p`
	- Clean output with `2>/dev/null`
	
	`./backup.sh`

- **System Health Monitor**
	- Checks disk, memory, load
	- Email alerts via msmtp
	- Cron every 15 min

    `./health_check.sh`

- **Log Rotation**
	- Prevents disk full, keeps recent data
	- find /path -type f -name "*.tar.gz" -mtime +7 -print0
	- `-print0` use null separator,`xargs -0` handles null separated input
	- Use `-print0` with `xargs -0` -> safe

	`rotates_logs.sh`

- **Monitor Service**
	- sleep-walking-service is being used to test monitor_service.sh
	- Auto restart
	- `pkill -f` to stop

	`monitor_service.sh`

- **Parse Configuration**

	- `declare -A` = associative array
	- `IFS='='` + with `read -r` get key value
	- `xargs` trim whitespace
	- `IFS=','` `read -ra` split list and put them in an array
	- With regex skip comment (#) and empty lines

	`parse_config.sh` , `app.conf`


## Today's Progress (27 January, 2026)

- **Unix and Linux System Admin Handbook Chapter 16 - DNS Part 2**

	- $ORIGIN, $INCLUDE, $TTL are more common commands found in zone files.
	- name can be either relative or absolute (ends with a dot)
	- Do not forget the dot for an absolute name, the software adds origin and a dot in its absence.
	- Increasing TTL value reduces the network traffic and DNS load.
	- Cached records cannot be discarded outside the local network.
	- If any renumbering required, first decrease the TTL to be sure of that all old records have been discarded.
	- After update, TTL can be set to a higher value again.
	- DNS record types: Zone (SOA, NS), Basics (A, AAAA, PTR, MX), Security (DS, DNSKEY, NSEC, NSEC3, RRSIG), Optional (CNAME, SRV, TXT)

	#### notes.md (learning log)
 ---

## Files in this Repo
- `notes.md` -> Daily learning log
- `*.sh` -> Bash scripts
- permission.txt

---

*Last updated: 27 January, 2026*

