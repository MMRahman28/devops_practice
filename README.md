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


## Today's Progress (May 4, 2026)

- **Kubernetes Concept - part 15**

	**Namespaces**
	- Namespaces are like virtual clusters inside one physical cluster.
	- Features: separate environment, team isolation, resource quotas per team/environment, default namespace is default
	- Create a namespace:
	- `kubectl create namespace dev`
	- See all namespaces:
	- `kubectl get namespaces`
	- Run a pod inside a specific namespace:
	- `kubectl run nginx-dev --image=nginx:alpine -n dev`
	- Check resources per namespace:
	- `kubectl get pods -n dev`
	- Set a default namespace:
	- `kubectl config set-context --current --namespace=dev`
	- Now will show only dev namespace 
	- `kubectl get pods`

	#### notes.md (learning log)
 ---
				
## Files in this Repo
- `notes.md` -> Daily learning log
- `*.sh` -> Bash scripts
- `Kubernetes_lab_files/*.yaml`
- permission.txt

---

*Last updated: May 4, 2026*

