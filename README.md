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


## Today's Progress (April 14, 2026)

- **Docker Concepts - Part 5**
	**Docker Architecture and Best Practices**

	- Briefly explain the Docker architecture: What is the role of the Docker daemon, the clent, and the registry (like Docker Hub)?

	- Docker architecture follows client server model.
	- Docker client -> the command-line interface.The client sends commands as requests to the Docker daemon. The client can be on the same machine as the daemon or on a remote machine.
	- Docker daemon (dockerd) -> long-running background process responsible for managing containers, building images, managing volumes, network and storage, pulling and pushing images from/to registries.
	- Registry (e.g., Docker hub): A remote repository for storing and distributing images.

	- What are some best practices when creating Docker images for production?

	- Minimise image size: Use small base images instead of full os images.
	- Optimise layer caching -> stable steps at the top (FROM, RUN, apt-get install) and frequently changing steps (COPY . .) near the bottom.
	- Security: never bake secrets into the image. Scan images for vulnerability (use Docker Scout).
	- Reproducibility and Maintainability: Pin exact versions of base images and packages (e.g., node:20.12-alpine instead of node:alpine).
	- Other: use .dockerignore to exclude unnecessary files from the buld context.
		
	#### notes.md (learning log)
 ---
				
## Files in this Repo
- `notes.md` -> Daily learning log
- `*.sh` -> Bash scripts
- permission.txt

---

*Last updated: April 14, 2026*

