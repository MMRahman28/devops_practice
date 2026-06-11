# DevOps Learning Journey

**Self-taught | Linux | Bash | Git**
> "I learn by doing - every day."

---

## Open to DevOps Roles
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


## Today's Progress (June 11, 2026)

- **Helm**
	- Package manager for Kubernetes.
	- Instead of writing dozens of YAML file manually, with helm charts (pre-packaged applications) install, upgrade, configure and share can be done easily.
	- helm has been installed and chart was created. values.yaml file was modified with a simplified version that came with the chart.
	- Later this file was updated. 
	- helm handled all efficiently with minimal code.
	- See commands in the notes

#### notes.md (learning log)
 ---
				
## Files in this Repo
- `notes.md` -> Daily learning log
- `*.sh` -> Bash scripts
- `Kubernetes_lab_files/*.yaml`
- permission.txt

---

*Last updated: June 11, 2026*

