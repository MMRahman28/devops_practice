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


## Today's Progress (31 December, 2025)

- **Network Applications and Services**

    - To login to remote host: `ssh remote_username@remote_host`
	- To copy a directory to anoter host: `tar zcvf - dir | ssh remote_host tar zxvf -`
	- From remote host to the current directory: `scp user@host:file .`
	- From local machine to a remote host: `scp file usr@host:dir`
	- From one remote to anoter: `scp user1@host1:file user2@host2:dir`
	- `lsof -i:port` or full syntax: `lsof -iprotocol@host:port` shows the process using the port
	- `lsof -iTCP -sTCP:LISTEN` , processes listening on TCP ports
	- `tcpdump`, its GUI alternative is WireShark
	- `netcat` can connect to a remote TCP/UDP port, specify a local port, scan ports, listen on ports, redirect standard I/O
	- Open a TCP connection: `netcat host port`
	- To listen a port: `netcat -l port_number`
	- port scanning: `nmap host` or `nmap 10.1.2.2`
	- master process listen with a socket -> if connection comes accept and fork. The child process handles the connection.
	- The original listening socket keep listening.
	- Unix domain socket is not a network socket, but very similar. Writing code for these sockets are similar. The process connects to a unix domain socket behaves almost same when it connects to a network socket.

	#### notes.md (learning log)
 ---

## Files in this Repo
- `notes.md` -> Daily learning log
- `*.sh` -> Bash scripts
- permission.txt

---

*Last updated: 31 December, 2025*

