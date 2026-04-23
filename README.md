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


## Today's Progress (April 23, 2026)

- **Kubernetes Concept - part 7**

	**Deployment Lab work**
	- Scaling up -> Same Replicaset, just more Pods.
	- Updating image -> create new Replicaset.
	- Naming relationship:
		- Deployment name: nginx-deployment
		- Replicaset name: nginx-deployment-xxxxx
		- Pod name: nginx-deployment-xxxxx-yyyyy
	- Why deployments are better than bare Pods?
		-Offers self-healing, scaling, updates, rollback, replica management, and production readiness.
	- Scaling: `kubectl scale deployment nginx-deployment --replicas=5`
	- Changing image: `kubectl set image deployment/nginx-deployment nginx=nginx:latest`
	- Rollout status: `kubectl rollout status deployment/nginx-deployment`
	- Rollout history: `kubectl rollout history deployment/nginx-deployment`
	- Rollback to previous version: `kubectl rollout undo deployment/nginx-deployment`
	- Cleanup: `kubectl delete deployment nginx-deployment`

	- Check and Verify commands: `kubectl get deployments`, `kubectl get pods -o wide --watch`, `kubectl get deployment nginx-deployment`, `kubectl get replicaset`, history command, `kubectl get pods` etc.
	
	**Key files**
	- `Kubernetes_lab_files/nginx-deployment.yaml`

	#### notes.md (learning log)
 ---
				
## Files in this Repo
- `notes.md` -> Daily learning log
- `*.sh` -> Bash scripts
- `Kubernetes_lab_files/*.yaml`
- permission.txt

---

*Last updated: April 23, 2026*

