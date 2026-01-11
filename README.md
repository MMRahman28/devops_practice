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


## Today's Progress (11 January, 2026)

- **Unix and Linux System Admmin Handbook Chapter 12 - Printing**

    - CUPS servers are webservers. So, uses POST an GET with a slight difference.
	- lpr command transmit copies of the files -> CUPS sever -> put them in print queue
	- CUPS compares document and the printer's PPD to find out what needs to be done.
	- CUPS passes the job through series of filters.
	- The final of the print pipeline is the backend which identifies the protocol to transmit the job (after necessary filter applied) to the printer.
	- A CUPS server offers a web interface on port 631.
	- Problem: Broadcast packets do not cross subnet boundaries.
	- Solution: Designate a slave (use the term helper maybe? sounds awful) server on each subnet to poll and relay.
	- `lpinfo -v` , `lpstat -t` , `lpr file1.txt file2.txt` are useful commands.
	- To see more commands and details use notes.

	
	#### notes.md (learning log)
 ---

## Files in this Repo
- `notes.md` -> Daily learning log
- `*.sh` -> Bash scripts
- permission.txt

---

*Last updated: 11 January, 2026*

