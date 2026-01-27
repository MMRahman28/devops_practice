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


## Today's Progress (26 January, 2026)

- **Unix and Linux System Admin Handbook Chapter 16 - DNS Part 1**

	- To lookup name is DNS: configure DNS clients, Tell system when to use DNS
	- Client side resolver: `/etc/resolv.conf` (auto if DHCP used)
	- Two important files: `/etc/resolv.conf`, `/etc/nsswitch.conf`
	- If no server running hosts file is used (e.g. during booting).
	- Name server: answer queries, caches answer, communicates with othe name servers.
	- Serveral types of name servers: Authoritative, master, slave, recursive, nonrecursive, caching etc
	- Local servers are recursive, and authoritative are nonrecursive.
	- dig and drill are DNS query tools.
	- nslookup, host, delv,dig and drill can be used for debugging.
	- caching use TTL (time to live), negative value to stop repitition of query for no host, no response etc(until TTL expires).

	#### notes.md (learning log)
 ---

## Files in this Repo
- `notes.md` -> Daily learning log
- `*.sh` -> Bash scripts
- permission.txt

---

*Last updated: 26 January, 2026*

