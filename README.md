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


## Today's Progress (30 December, 2025)

- **Network and Its Configuration - part 4**

    - Linux TCP implementation is primarily in the kernel
	- Like files, applications handle stream of data
	- NAT - way to share a single IP address with a private network
	- Firewall works on packet level
	- Firewall rules in a series known as a chain.
	- A set of chains makes up a table
	- 3 basic chains: INPUT, OUTPUT and FORWARD
	- Kernel reads a chain from top to bottom
	- Default policy should be DROP not ACCEPT
	- Key idea for firewall: permit only what is acceptable, try not to find and exclude the bad stuff.
	- Be careful running DROP on a remote machine, it can block access immediately

	#### notes.md (learning log)
 ---

## Files in this Repo
- `notes.md` -> Daily learning log
- `*.sh` -> Bash scripts
- permission.txt

---

*Last updated: 30 December, 2025*

