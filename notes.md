# DevOps Learning notes

## Overview
- **Goal**: Junior DevOps Engineer (UK)
- **Started**: October 22, 2025
- **Focus Areas**: Linux -> Bash -> Git -> Docker
- **Portfolio**: Scripts and notes stored in this repo for job applications.

## Daily Progress

### October 22, 2025
#### Tasks Completed
- Created `~/devops_learning` + Git repo
- Linux permissions: `chmod 600 testfile.txt`, `chgrp dev`, `useradd -m -g dev jack`
- Verified: `getent group dev`,  `ls -l`

#### `permissions.txt` (key file)

---

### October 28, 2025
#### Tasks Completed
- **labex.io Bash Scripting**
	- Created/edited `.sh`files
	- Shell variables: `name="DevOps"`
	- Command substitution: `$(date)`, `$(whoami)`
	- Arithmetic: `$((2 + 3))`
	- Environment variables: `$HOME`, `$PATH`, `export MYVAR=123`
	- Make the script executable: `chmod +x bash_basics.sh`
	- Execute script: `./bash_basics.sh`
	- View script content: `cat bash_basics.sh`
	- Built: `bash_basics.sh` (see below)
- Ran out of VM quota -> continued locally on Arch Linux

#### `bash_basics.sh` (key script)

**Examples**
```bash
#!/bin/bash
name="MM Rahman"
time=$(date +%H:%M)
user=$(whoami)
hours_left=$((24 - $(date +%H)))
echo "Hello $name! Time: $time | User: $user"
echo "Hours left: $hours_left | Home: $HOME"
```
---

### October 29, 2025
#### Tasks Completed
- **labex.io Bash Scripting - Accept and Use of Command-line Arguments**
	- $0 represents the name of the script
	- $1, $2, etc. represents first, second and so on arguments.
	- $# special variable holds number of arguments.
	- Using `[ $# -eq 0 ]`, `[ $# -lt 2 ]`, `[ $# -gt 3 ]` are how we express conditions.
	- fi indicates finish or end of conditional statements.
	- $@ another special variables represents all command-line arguments.
	- done indicates the end of a loop
	- `{1..3}` or `{3..1}` indicates range going up or down in for loop
	- input validation with -z and -n
	- `[ -z "$1" ]` returns true if the variable is empty or unset, false otherwise.
	- -n opposite of -z, True if variable is NOT empty
	- `${1:-Guest}` -> use $1 or default "Guest" if unset or empty
	- `${1-Guest}` -> if $1 is unset only (not empty string) use default "Guest"
	- `${1:+Hello}` -> Use Hello only if $1 exists
	- Real world use: `PORT=${1:-8080}`, `CONFIG=${2:-./config}`, `USER=${3:-$(whoami)}`
	
#### `bash_basics.sh` (key script)
---

### October 30, 2025
#### Tasks Completed
- **Build a Log Monitor Script**
	- `${1:-default}` -> safe config
	- `grep -c what_pattern where` -> count matches
	- `tail -5` -> show recent errors
	- `exit 1` -> fail fast
	- Alerts on ERRORs in logs
	- cat > /tmp/sample.log << EOF, here EOF is a delimiter
	- cat  << EOF is Here Document, any delimiter (STOP, END etc.) would work in place of EOF

#### `log_monitor.sh` (key script)

- **labex.io Bash Scripting - Arrays**
	- () initialise an empty array
	- += to append elements
	- `[@]`. @ symbol inside the bracket represents all elements
	- `#`symbol tells to count number of elements.
	- `${#NAMES[@]}` will be used to count number of elements.	

#### `bash_basics.sh` (key script)
---

### October 31, 2025
#### Tasks Completed
- **Improved Previous Log Monitor With Email Alert**
	- Email via 'msmtp` + Gmail SMTP
	- install s-nail and msmtp with pacman
#### **Configuration**
```ini
# nano ~/.msmtprc
account gmail
host smtp.gmail.com
port 587
auth on
user your-email@gmail.com
password abcdefghijklmnop # <- 16 chars, no space (App password not Gmail password, create one from Google)
from your-email@gmail.com
account default: gmail
```
- Debugging: VPN block port 587 so disconnect VPN
- Testing: `echo "Test mail" | msmtp -a gmail mashuk.pro@gmail.com`

#### `log_monitor.sh` (key script)
---

### November 1, 2025
#### Task Completed
- **A challenge Using Array Knowledge - labex.io**
	- `for arg in "${midship_bay[@]}";` carefully observe the double quote around. 
	- `"${midship_bay[@]}"` represents all the array elements of the array midship_bay.

#### `bash_basics.sh`(key script)

- **Cron Syntax & Logging**
```cron
*/5 * * * *
|   | | | |
|   | | | |____ Day of the week(0-7, Sunday = 0 or 7)
|   | | |______ Month of the year (1-12)
|   | |________ Day of the month (1 - 31)
|   |__________ Hour (0-23)
|______________ Minute (0-59)

```
- Command: log_monitor.sh with Arguments `/home/mashuk/Documents/Journals/devops_learning/ log_monitor.sh /var/log/syslog ERROR`
- Output Redirection with `>>` and `2>&1`: `>> /home/mashuk/Documents/Journals/devops_learning/cron_alert.log 2>&1`
- `>>` appends stdout, `>` overwrites which we do not want here, 2> represents stderr, &1 for stdout
- 2>&1 sends errors to same place as output
- we use `crontab -e` which opens crontab with nano. With command and output redirection, we write the full cronline.
- Full cronline: `/home/mashuk/Documents/Journals/devops_learning/ log_monitor.sh /var/log/syslog ERROR >> /home/mashuk/Documents/Journals/devops_learning/cron_alert.log 2>&1`

- **Troubleshooting**
	- `crontab -e` did not open nano file. The following fix was used.
	 `echo 'export EDITOR=nano' >> ~/.bashrc`
	 `source ~/.bashrc`
	- Recommended: `EDITOR=nano crontab -e`
	- cron was not running.To fix it, cronie was installed from Arch Linux package. `sudo pacman -S cronie`.

- **Some Useful Info**
	- ~/.bashrc = Bash run Commands file
	- export = available to child processes
	- source or . = reload in current shell

#### `log_moitor.sh` (key script)
---

### November 2, 2025
#### Task Completed
- **Menu Script**
	-`case` for input
	- `read -p "prompt" var` -> prompt + store in `var`
	- Skip `var` -> input goes to `$REPLY`, always use variable for clarity.
	- `df -h`, `free -h`, `uptime`
	- each case ends with ;;

#### `menu.sh` (key script)
---

### November 3, 2025
#### Task Completed 
- **Reading and Book Exercise - Exit status**
	- `$?` contains the return code of the previously executed command.
	- All commands return an exit status.
	- Valid exit status 0 to 255. 0 successful execution of command. Non-zero - error condition.
	- With the above exit status of command in mind, we can use AND(&&) and OR (||) effectively:
		- Command following a `&&` will only execute if the previous command succeeded i.e. had non-zero exit status.
		- Command following a `||` will only execute if the previous command failed i.e. had zero exit status.

#### `book_exercise.sh` (key script)

- **Backup Script with tar, timestamps and safety**
	- `tar -czf` = create gzipped archive
	- `$(date +%Y%m%d_%H%M%S)` = timestamp
	- `[[ -d "$PATH" ]]` = safe dir check
	- `mkdir -p` = create if missing
	- `$?` = exit status

	- [[ ]] vs [ ]
		-  `[[ ]]` = Bash-only, safer, modern
		- No word splitting -> No quoting needed for [[ ]]
		- Supports `=~` regex, `&&` and `||` logical operator inside [[ ]]
		- `[[ $file == *.sh ]] && echo "Bash script"` # pattern matching

		- `["$file" != "" -a -f "$file"]` # fails if $file has spaces
		- AND (-a) and OR (-o) are logical operators inside [ ] - not very readable
		- `[[ -n "$file" && -f "$file" ]]` # works with spaces

	- Use `[[ ]]` in all Bash scripts.

	- `tar` sometimes shows warning which are harmless
	- to avoid those warnings we send the stderr to `/dev/null`
	- `2>/dev/null`
	- Clean output = professional

#### `backup.sh` (key script)
---

### November 4, 2025
#### Task Completed
- **Reading and Book Exercise - Function**
	- By default, all variables are global
	- local keyword to define local variables inside a function
	- arguments passing same as command-line. Call function and then arguments next to it.
	- function call does not require ().
	- side note `ls | - wc -l` counts number of entries (files and folders)
	- the `-l` option counts number of newline characters

#### `book_exercise.sh` (key script)
- **System Health Check**
	- `df /`, `free`, `uptime` -> metrics
	- `awk`, `bc` -> math
	-`msmtp` -> email on threshold
	- Cron every 15 min
	- uptime + load average
	```
		uptime | awk -F 'load average:' '{print $2}' # -> " 0.15, 0.20, 0.25"
		| bcut -d, -f1                                  # -> " 0.15"
		| xargs                                      # -> "0.15"
	```
	- `cut -d, -f1` , here -f1 = first field, -d, = comma delimiter
	- xargs = trim all whitespace
- **awk Commands**
	- blank separates input fields
	- The output of `df /` got blank separated fields. `tr -d '%'` translate: here delete %
	- Pattern match '/Mem/' and code block in {}
	- `awk -F`, here -F specify the separator which is 'load average'.
- **bc -l**
	- `bc` = basic calculator
	- `-l` = load **math library** -> **decimals**
	- `echo "2.5 > 2" | bc -l` -> gives 1.
	-  returns 1 (true) or 0 (false) for comparisons

- **Fixed and Learnt**
	- race condition - two date command/call inside the function and outside can create racing
	- `crontab -e` can be run from any directory
	- Breakdown of email to body, subject etc.
	```
	  {
		BODY="ALERT!\n$1\n$host\n$timestamp"
		echo "From: $EMAIL"
		echo "To: $EMAIL"
		echo "Subject: [ALERT] $msg"
		echo "Content-Type: text/plain; charset=UTF-8"
		#echo "ALERT: $msg"
		echo -e "$BODY"
	} | MSMTP_CONFIG="$MSMTPRC" "$MSMTP" -a gmail "$EMAIL"

	```
	- without -e echo will not print newline (\n)
	- `sed -i` = edit file in place
	- sed = stream editor
	- sed 's/old/new' file
	- Example: sed -i 's/threshold_disk=90/threshold_disk=10/' health_check.sh

#### `health_check.sh` (key script)

---

### November 5, 2025
#### Task Completed
- **Wildcards**
	- `*` asterisk: matches zero or more characters
	- `*.txt`, `a*.txt`
	- ? question mark: matches exactly one character
	- `?.txt`: one character name file, `a?.txt`: two character name file
	- Ranges: `[a-g]`, `[3-6]`
	- Named Character Classes: `[:alpha:]`, `[:alnum:]`, `[:digit:]`, `[:lower:]`, `[:upper:]`, `[:space:]`
	- `[:space:]` matches whitespace. Spaces, tabs, newline.
	- match wildcards- use escape character: *\?

- **Case Statements**
	```case
	case "$VAR" in
	pattern_1)
		# commands go here.
		;;
	pattern_N)
		# commands go here
		;;
	esac
	```
	- See `menu.sh` (script) example
- **Learnt**
	- `trap` command - `trap [commands] [signals]`
	- run the command upon receiving the specified signals.
	- e.g. `trap "rm $PID_FILE; exit" SIGHUP SIGINT SIGTERM`
	- & vs argument
		- ` command &` -> start process in the background -> PID in `$!`
		- `command 123` -> argument `$1`

	- `$$` = script's own PID
	- `$!` = last background PID
	- `&` = spawn, `$!` = track, `$$` = self.
	- `echo "[$$] Backup started at $(date)" >> /var/log/backup.log`

#### `book_exercise.sh` (key script)


- **Log Rotation**
	- Why log rotation? - Prevent disk full
	- Keep only recent data
	- 7 days = standard

    - `find command`
	```bash
	find /path -type f -name "*.tar.gz" -mtime +7 -print0
	```
	`type f` = files only, name = pattern, mtime = modified time, +7 = older than 7
	`-print0` = null separatior -> safe
	- xargs -0
		- handles spaces, newlines
		- `xargs` -> split by **whitespaces** -> **Broken with spaces**
		- `xargs -0` -> split by **null terminator \0** -> **safe**
		- Always use with `find -print0`
    
	```
	touch "my backup file.tar.gz"
	find . -name "*.tar.gz" | xargs rm -f
	# -> tries to delete "my" "backup" "file.tar.gz" -> ERROR
	find . -name "*.tar.gz" -print0 | xargs -0 rm -f
	# -> Deletes entire file
	```
- **Learnt**
	- `0 3 * * *` -> 3 AM daily
	- `0 */3 * * *` -> 00:00, 03:00, 06:00....
	- `*/n` = every n units
	- Fixed number = only at that time
	- */5 * * * * -> Every 5 minutes -> 0,5,10, 15 ...(12 times/hour)
	- wait for next multiple of time, if script runs at 6:17, it starts at 6:20 and then 6:25 ...
	- 5 * * * * -> Once per hour, at minute 5 -> 00:05, 01:05,...23:05 (1 time/hour)

	

#### `rotate_logs.sh` (key script)
---

### November 6, 2025
#### Task Completed
- **Logging**
	- syslog uses facilities and severities/priorities to categorise messages
	- See the table in the book
	 - System logger can route the log to a different log file
	- logger uitility options:
		- `-t` -> tag, 
		- `-p` -> facility and priority, 
		- `-i` -> pid, 
		- `-s` -> display on screen
	- `logger -i -t myscript -p local0.info "Message"`
	- local0 to local7 -> custom logs.
	- if not saved in /var/log/syslog:
		- `journalctl | grep "Message" | tail -n 5` can be used

#### `book_exercise.sh` (key script)

- **Monitor service**
	- `/tmp/sleep-walking-server &` (run in the background)
	- `pkill -f sleep-walking-server` (stop)
	- `pgrep -x` = exact process name
	- `pgrep -x $SERVICE` - matches service name and list
	- try the multiple service with CONFIG
	- IFS:= Internal Field Separator = colon :
	- `read -r` - raw mode don't interpret backslashes
	- `<` redirect file as input

#### `monitor_service.sh` (key script)
---

### November 7, 2025
#### Task Completed
- **Debugging**
	- `-x` option prints commands and their arguments (variable value is displayed)
	- For entire Shell script use: #!/bin/bash -x
	- For lines -> run `set -x`. to stop `set +x`
	- Starting `+`s show executed command.

	- `-e` exits immediately if command exits with a non-zero status
    - `-e` and `-x` together is useful
	- For entire shell script use: #!bin/bash -xe
	- `-v` causes every line of the script to be displayed on the screen
	- `help set | less` to see these options
	- PS1, PS4 variables. PS4 is useful for debugging
	- PS4 is expanded and displayed before each command during an execution trace.
	- Bash built-in can be used to set PS4
	- `+$BASH_SOURCE:$LINENO:`

	```
	#!/bin/bash -x
	PS4='+ $BASH_SOURCE: $LINENO:'
	TEST_VAR="test"
	echo "$TEST_VAR"
	
	```
Output:

	```
	+PS4='$BASH_SOURCE: $LINENO:'
	+./test.sh:3: TEST_VAR=test
	+./test.sh:4:echo test
	test

	```
	- Linux -> line feed, Windows -> line feed + carriage return
	- In Linux carriage return turns into ^M
	- use dos2unix and unix2dos utility
	- check carriage returns and line feeds: `file script.sh`

#### `book_exercise.sh` (key script)

- **Parsing**
	- `declare -A` = associative array
	- `IFS='='` + with `read -r` get key value
	- `xargs` trim whitespace
	- `IFS=','` `read -ra` split list and put them in an array
	- With regex skip comment (#) and empty lines
	 - the `=~` in regex means does this match this regex.
	 - returns true if matched.
	 - Use glob for file pattern matching: loop over files, glob in array
	 - Use regex for text pattern matching: validate input, parse


---

### November 8, 2025
- **Unix and Linux System Administration Handbook Chapter 2**
	- Reading BIOS, UEFI, bootloader, systemd, systemctl

- **All-In-One Monitor (sytemd-powered)**
	- `systemctl is-active --quiet`
	- `systemctl restart`
	- `journaltl -u service` - not yet applied
	- Replace `pgrep` + `&` with real daemon control (systemctl)


#### `monitor_all.sh` (key script)

---

### November 9, 2025
- **Chapter 2 Complete and test questions**
	- BIOS, UEFI, bootloader, systemd, systemctl

	- Q1. List the 6 layers from power-on to shell
		- Boot layers
		- 1. UEFI/BIOS -> POST (Power ON Self Test)
		- 2. GRUB -> grub.cfg
		- 3. Kernel -> vmlixuz
		- 4. initramfs -> /init
		- 5. Real Root -> Switch root
		- 6. systemd -> PID 1
		- 7. Display manager -> Login

	- Q2.  What is PID 1?

		- PID 1 is the first process started by the kernel.It adopts all orphaned processes and is
		is the root of the process tree.On modern Linux, it is /usr/lib/systemd/systemd.

	- Q3. Name 3 unit types. Give one example each.

		- 1. Type: .service e.g. cron.service
		- 2. Type: .target e.g. factory-reset.target
		- 3. Type: .mount e.g. Mount FS
		Use `systemctl list-unit-files` to see different types.
	
	- Q4. What runs multi-user.target vs graphical.target?
		- Desktop or GUI-based system runs graphical.target
		- Server without GUI runs multi-user.target
		- Can be changed as appropriate
		- `systemctl get-default`
		- `systemctl set-default graphical.target` 
	
	- Q5. What does modprobe -v nvme do during boot?
		- Probes NVMe SSD, crates `/dev/nvme0n1`, `dev/nvme0n1p1`, initramfs runs it
		- v verbose option is for debug.
		- Boot: `modprobe nvme` -> silent, fast
		- Never use `-v`in production initramfs

	- Q6. Command to see only sshd logs from this boot?
		- `journalctl -u sshd -b` 
		- journalctl showing the unit name sshd.
		- `-b` showing the current boot
		- `-b -1` to show previous boot. (info only not Q6 answer)

	- Q7. Why can't the kernel mount root without initramfs on LUKS?
		- Kernel boots -> sees encrypted root (LUKS)
		- No LUKS driver -> cannot open /dev/sda3_crypt
		- No root -> cannot load modules from /lib/modules
		- stuck
	    initramfs fixed it:
		```
		cryptsetup luksOpen /dev/sda3 root
		mount /dev/mapper/root /sysroot
		switch_root ...

		```
		- Chicken and egg:
		- Kernel needs LUKS driver -> need root -> need LUKS driver
		- initramfs = mini userspace in RAM
		- Runs cryptsetup, unlocks disk, mount real root

	- Q8. Where are system unit files? Where are your custom ones?

		- 1. `/etc/systemd/system/` <- Your custom units (highest priority)
		- 2. `/run/systemd/system/ <- runtime(tmpfs)
		- 3. `/usr/lib/systemd/system` <- (Arch, Fedora etc.)
		- 4. `/lib/systemd/system` <- Legacy symlink on some systems.
	
	- Q9. You can run `systemctl status sleep-walking-server.service` -> 'inactive(dead)'. What next?

		- Check logs first: `journalctl -u sleep-walking-server.service -n 50 --no-pager`
		- Start it if inactive: `systemctl start sleep-walking-server.service`
		- Verify by running status again.
		- starting a dead service without checking log first = masking a crash.

	- Q10. Write a 3-line `.service` file for `/tmp/sleep-walking-server`. 

		```ini
		[Unit]
		Description=Sleep-Walking Server

		[Service]
		ExecStart=/tmp/sleep-walking-server

		[Install]
		WantBy=multi-user.target

		```
		- Must have one line per section
		- place in /etc/systemd/system/ as it is a custom .service.
		- Reload the systemctl daemon
		- `systemctl restart`

	
		 





