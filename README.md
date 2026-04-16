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


## Today's Progress (April 16, 2026)

- **Kubernetes Concepts - Part 2**

	**Kubernetes phases**
	- Pending: Pod accepted by the cluster, but not yet running.Reason: Image pull in progress, no node available, scheduling delays, init Containers running
	- Running: The pod has been bound to a node, all containers created, and at least one conatainer is still running or restarting. Reason: Normal operation
	- Succeeded: All containers in the pod terminated successfully (exit code 0) and will not be restarted. For Jobs, one-time tasks that finish cleanly. Reason: Batch job completed.
	- Failed: All containers have terminated, and at least one terminated with a failure (non-zero exit code). Reason: Crash, out-of-memory, error in app.
	- Unknown: The state of the pod could not be obtained, usually due to communication problems with the node. Node not responding.
	
	**Key files**
	- For lab work: see `Kubernetes_lab_files`

	#### notes.md (learning log)
 ---
				
## Files in this Repo
- `notes.md` -> Daily learning log
- `*.sh` -> Bash scripts
- permission.txt

---

*Last updated: April 16, 2026*

