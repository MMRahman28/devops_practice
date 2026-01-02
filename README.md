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


## Today's Progress (2 January, 2026)

- **Network File Transfer and Sharing**

    - `python -m SimpleHTTPServer` for quick copy
	- http://device_address_on_the_network:8000 access from any other machine on the network

	- rsync: `rsync file1 file2 ... host:` or `rsynce file1 file2 ... user@host:` (if different username)
	- rsync to copy directory: `rsync -a dir host:dest_dir`
	- `rsync -nva dir host:dest_dir` -n tells rsync to do a dry run without copying.
	- To make an exact replica: `rsync -a --delete dir host:dest_dir`
	- To exclude: `rsync -a --exclude=.git src host:` --exclude takes a pattern
	- use --exclude=/src/.git like this for a specific item.
	- rsync check uses a combination of file size and the last-modified date. 
	
	#### notes.md (learning log)
 ---

## Files in this Repo
- `notes.md` -> Daily learning log
- `*.sh` -> Bash scripts
- permission.txt

---

*Last updated: 2 January, 2026*

