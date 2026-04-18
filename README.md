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


## Today's Progress (April 18, 2026)

- **Kubernetes Concepts and lab - part 3**
	**Init Containers**
	
	- An Init Container is a special type of container that runs to completion before the main application containers start.
	- Init Containers run sequentially.
	- They share the same network and volume as the main containers.
	- The pod will not proceed to start the main containers until all the Init Containers complete successfully. If any Init Containers fail, pod goes to a failed state.
	- They are useful for: database migration, downloading config files and secrets, wait for dependencies, performing setup or security checks, populating empty directories with data etc. before the main app starts
	- The pod stays in pending state (0/1 or 0/2 etc), then once all the Init Containers complete successfully, status changes to running.
	- `watch -n 2 "kubectl get pod init-pod -o wide" ` command should show the pending state if a longer sleep time is specified in the Init Containers command section (just to test). See the file below:
	
	**key file**
	`Kubernetes_lab_files/init-pod.yaml`

	#### notes.md (learning log)
 ---
				
## Files in this Repo
- `notes.md` -> Daily learning log
- `*.sh` -> Bash scripts
- `Kubernetes_lab_files/*.yaml`
- permission.txt

---

*Last updated: April 18, 2026*

