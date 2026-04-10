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


## Today's Progress (April 10, 2026)

- **Docker Concepts**
	- What is the main problem that Docker solves? Why is it better than just running apps directly on a server or using virtual machine?

	- "It works on my machine" problem solved.
	- Application depends on specific OS libraries, configurations, and runtime environments that differ between development, testing and production machines. Docker solves this problem.
	- Containers are lightweight.
	- Packaging the application and all its dependencies into a single portable unit.

    - Explain the difference between Docker image and Docker container.

	- An image is a read-only template (or snapshot) that contains application code, runtime, libraries, dependencies and filesystem.
	- A container is an instance of an image.
	- Image -> like a Class, container -> like an object of that class.
	- When a container is started, Docker takes the image, adds a writable layer on top, and uses kernel isolation features(namespaces for filesystem, network, processes, etc. and cgroups for resource limits) to create isolated environment.
	
	#### notes.md (learning log)
 ---
				
## Files in this Repo
- `notes.md` -> Daily learning log
- `*.sh` -> Bash scripts
- permission.txt

---

*Last updated: April 10, 2026*

