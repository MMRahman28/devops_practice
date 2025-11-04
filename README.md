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
	- tar -czf with timestamp
	- safe checks => [[ -d ]], mkdir -p
	- Clean output with 2>/dev/null
	
	`./backup.sh`

- **System Health Monitor**
	- Checks disk, memory, load
	- Email alerts via msmtp
	- Cron every 15 min

    `./health_check.sh`



## Today's Progress (4 November, 2025)
- **System Health Check**:
	- `df /`, `free`, `uptime` -> metrics
	- `awk`, `bc` -> math
	-`msmtp` -> email on threshold
	- Cron every 15 min
	- **Github**: Daily commit + `notes.md` updated
---

## Files in this Repo
- `notes.md` -> Daily learning log
- `*.sh` -> Bash scripts from labex
- permission.txt

---

*Last updated: 4 November, 2025*