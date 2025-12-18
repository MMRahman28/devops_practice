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
		| cut -d, -f1                                  # -> " 0.15"
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
		the root of the process tree. On modern Linux, it is /usr/lib/systemd/systemd.

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
		- Probes NVMe SSD, creates `/dev/nvme0n1`, `dev/nvme0n1p1`, initramfs runs it
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

---

### November 10, 2025
#### Task Completed

- **Unix and Linux System Administration Handbook Chapter 3**
	- Reading:sudo, access control, PAM, Capabilities, AppArmor etc
	- Understanding - not clear yet, requires additional reading and test.

---

### November 11, 2025
#### Task Completed

- **Unix and Linux System Administration Handbook Chapter 3 test**
	
	- Q1. Why is it dangerous to log in directly as root? What's the safer alternative?

		- Root login leaves no record of what operations were performed. The safer alternative would be sudo.
	      sudo logs original user + command

	- Q2. What does sudo stand for? What is the main config file?
		- It stands for substitute user do. The main config file: `/etc/sudoers`.
		- `sudo -l` shows your rights.
	
	- Q3. Write a one-line sudoers entry that lets user alice run any command as bob without a password.
		- `alice ALL=(bob) NOPASSWD: ALL`

		- aside: `%wheel ALL=(ALL:ALL) NOPASSWD: ALL` (risky)
		- `%wheel`: every user who is in the group wheel
		- `ALL=` : On any computer (host) in the network.
		- `(ALL:ALL)` : First ALL before colon run as any user (bob, root, etc)
		- second ALL after colon means run the command as anyone as any group
		- `NOPASSWD:` no password is asked.
		- last `ALL` : any command can be run.

		- e.g. I can write `noah ALL=(oliver : wheel) NOPASSWD /bin/bash`
		 - `sudo -u oliver -g wheel /bin/bash`
		 - Inside the new shell: `whoami` -> oliver. noah becomes oliver only in that shell.
	
	- Q4. What is PAM? Name one common PAM module and what it does.
	
		- Pluggable Authentication Modules. PAM is a wrapper for variety of method specific authentication libraries. Users are not tied to use only encrypted hard coded password. Different ways of authentication like biometrics, two-factor, LDAP etc also possible. Program that requires authentication simply calls PAM and PAM calls relevant authentication library specified by the system admin.

		- one API -> many backends.
		- Apps call PAM -> PAM calls modules
		- Modules in /etc/pam.d/ or /etc/pam.conf
		- config - /etc/pam.d/service
		- common pam module: pam_unix.so
			- checks local password in /etc/shadow
			- uses encrypyted hash
			- Standard for su, login, sudo
		- e.g. `/etc/pam.d/login`
	```
	
			auth sufficient pam_fingerprint.so
			auth required pam_unix.so
	
	```
	- Q5. How does the system enforce password complexity (strength)? Which file controls expiration?
		- Enforced by PAM module: pam_pwquality.so(or pam_cracklib.so)
		- Config file: /etc/security/pwquallity.conf
	```
		minilen = 12
		dcredit = -1 # at least 1 digit
		ucredit = -1 # at least 1	
	```
		- password aging: file `/etc/shadow`.
		- `sudo nano /etc/shadow` - user:$6$...:18900:0:90:7:30::
		- 18900 = last change (days since jan1, 1970)
		- 90 = expiry after 90 days
		- 7 = warn 7 day s before
		- 30 = inactive after expiry
		- `sudo chage -M 90 alice` # expire in 90 days

	- Q6. What does a file with setuid bit do when executed? Give a real-world example from /usr/bin.

		- When a kernel runs an executable file that has its "setuid" or "setgid" permission bits set, it changes the effective UID or GID of the resulting process to the UID or GID of the file containing the program image rather than the UID and GID of the user that ran the command.

		- For example, to change password which is in protected /usr/bin (symlink of /bin), user need setuid passwd command. passwd command checks who is running the command and change accordingly.
			- run passwd as alice
			- Kernel sees setuid root
			- Process runs with eUID=0 (root)

		- Common setuid Binaries
			- /usr/bin/passwd
			- /usr/bin/sudo
			- /bin/su
			- /bin/mount
			- bin/umount
		- `ls -l /usr/bin/passwd`, output has s in place of x -rwsr-
		- s indicates setuid (-rwsr-xr-x) or setgid (-rwxr-sr-x)	
		
		- How to know which files have setuid or setgid?
			- `find /usr/bin -type f -perm -4000` 
			- or `find /usr/bin -type f -perm -u=s -ls`
		- /usr/bin is a symlink of /bin so passwd file does not show if we cd into /usr/bin

		- See symlink: `readlink -f /usr/bin/passwd` -> /bin/passwd
		- `readlink -f /bin` -> /usr/bin

	- Q7. /bin/passwd has setuid root. Is this a security risk? Why or why not?
		- No - /bin/passwd having setuid root is not a security risk unless the binary is compromised or has a bug.
		- The concerns: wee need to know how many files in the system has setuid. Anything outside common setuid need thorough investigation.
		- `find / -type f -perm -4000 2>/dev/null
		- Expected safe output: `/bin/su`, `/bin/mount`, `/bin/umount`, `/bin/passwd`, `/usr/bin/sudo`, `/usr/bin/passwd`.
		- Anything else -> investigate.
		- However, there can be more which is normal. Investigate which are in `/tmp` or user directories. `/usr/bin` or `/opt` are fine.
		- `pacman -Qkk` verify all package files. 

	- Q8. User backup runs sudo rsync .. and gets 'permission denied' on a root-owned file. What's most likely cause?
		- Most likely cause No: `backup ALL=(root) NOPASSWD: /usr/bin/rsync`
		- for remote backup
		- setup
			- local user:mashuk
			- remote user:oliver
			- remote host: oliver_host
			- Source: /data/ (local)
			- destination: /backup/ (on remote)
		
		- `rsync -avz /etc/hosts oliver@oliver_host:/backup/test-hosts.txt`
		- better: `rsync -avz /etc/hosts backup@oliver_host:/backup/test-hosts.txt`
			- not full user access of oliver, backup only owns /backup - least privilege.
			- On remote server run these commands to create dedicated backup user and folder:

				```
					sudo useradd -m backup
					sudo mkdir /backup
					sudo chown backup:backup/backup
				```
			- now we can run the better command.

		- `rsync -avz /etc/hosts oliver@192.168.1.50:/backup/test-hosts.txt`
		- Another from web: `rsync -a -e "ssh" --rsync-path="sudo rsync" source_directory/ user@remote_host:/destination_directory/`

	---

### November 12, 2025
#### Task Completed

- **Unix and Linux System Administration Handbook Chapter 4**
	- Reading:process, threads, signal
	- Understanding - Good.

---

### November 13, 2025
#### Task Completed

- **Unix and Linux System Administration Handbook Chapter 4 test**

	- Q1. What does the unshare command do? Give a one-line example that creates a new PID namespaces and provide isolation.

		- unshare runs a program in a namespace, isolating it from the host
		- unshare --fork --pid --mount-proc bash
		- Proof of isolation (inside the new shell):
		- `readlink /proc/self` # -> 1
		- `ps`                  # -> PID 1: bash, PID 2: ps (only namespace processes)
		-- --pid: for pid namespace
		- --fork : Required with pid to spawn child in new namespace
		- --mount-proc: Remounts /proc so new namespace sees clean PID tree (PID 1)
		- `readlink /proc/self`: shows current PID -> 1 in new namespace
		- ps: Confirms only processes in namespace visible

		 
	- Q2. What is the difference between a zombie and an orphan process? Give one line command to create each (conceptually).

		- When a child process completes, it calls exit, if parent dies before child, child becomes orphan, kernel reparents to init/systemd. Zombie = exit status not collected.
		- zombie : child exits, parent sleeps (no wait):
		- `(sleep 1; exit 42) & sleep 10` -> child exit, parent does not call wait
		- Orphan: parent dies, child keeps running:
		- `(sleep 10) & kill $! # parent shell dies -> orphan
	
	- Q3. What does the nice value mean? How do you start a process with lower priority (one-line command)?
		- nice = CPU priority. Range: -20 (High priority) -> +19(low)
		- Higher nice = lower priority
		- Default: 0
		- `nice -n 10 backup.sh` # lower priority
	
	- Q4. Name three process states and explain when a process enters the D (uninterruptible sleep).
		- R: Runnable, S: Sleeping(interruptible), T: Suspended (stopped)
		- D: uninterruptible sleep: when direct disk I/O(e.g. dd, fsync, sync)
		- Why: Kernel cannnot interupt hardware operation
		- Cannot KILL (even with SIGKILL)
		- Transient - resolves when I/O completes
		- Danger - Stuck D -> system may hang.
	
	- Q5. What is the difference between kill and kill -9? When should you never use -9?
		- kill can send any signal by default sends TERM which can be blocked, caught, or ignored. kill 9 cannot be caught or ignored or blocked and guarantees death.
		- Never use kill 9 on: 
			- D state, Database processes, Filesystem ops(fsck, mount, umount), anything holding lock

	- Q6. What happens when a process receives `SIGSTOP`? How do you resume it?
		- A process cannot block or catch a SIGSTOP. SIGSTOP suspends the process until it receives signal
		CONT to resume. CONT can be caught and ignored, but not blocked.

	- Q7. What is the difference between fork() and exec()? Give a one-line example of each in a shell context.
		- fork(): creates a child process, copy of parent, different PID.
			- `sleep 10 &` background a command (shell forks) 
		- exec(): Replace current process image, new program loaded, PID stays the same
			- `exec cat /etc/passwd` replace shell with new program
			- after exec shell is gone, cat runs in its place.
	
	- Q8. What is a zombie process? How do you find and clean one up (two commands)?
		- Already exited, still in process table, Holds PID + exit status
		- State: Z (zombie) or `<Exiting>` or `<defunct>`
		- Cleaned by parent calling wait()
		
		```bash
		ps aux | grep -E ' Z |defunct' # find
		kill <PPID> # kill parent -> init reaps

		```
		- Never kill zombie PID - already. kill PPID.
	
---

### November 14, 2025
#### Task Completed

- **Unix and Linux System Administrator Handbook Chapter 5**
	- Reading: Filesystem, file type, permission, symbolic link etc.
	- Understanding: Good

---

### November 15, 2025
#### Task Completed

- **Unix and Linux System Administrator Handbook test**

	- Q1. What does the df command show? Give a one-line command to show disk usage in human-readable format for the root filesystem only.

		- df command shows file system space usage. 
		- `df -h / # for root only`
		- `df -h # all file system`

	- Q2. What does `du` command do? Give a one-line command to find the total size of `/var/log` in human-readable format.

		- du command estimates file space usage.
		- `sudo du -h /var/log   # full scan, total at the end`
		- `sudo du -sh /var/log  # summary only one line output`
		- Without sudo -> permission denied on private dirs.

	- Q3. What is the difference between a hard link and a soft link? Give a one-line command to create each for a file `data.txt`.

		- Hard link creates reference by directly using pointer.
		- Soft link is a reference by name, stores pathname.
		- When all hard links removed -> filesystem release the data content.
		- Hard link cannot cross FS
		- Soft link can cross, removing soft link or symbolic link has no impact on data content.
		- Hard link survive delete? Yes (if >= 1 link)
		- Soft link survive delete? No (becomes dangling)
		- file type same (hard), file type l (soft)
		- one line command for hard link: `ln data.txt data.hard`
		- one line command for soft link: `ln -s data.txt data.soft`
		- view `ls -li` -> same inode = hard link

	- Q4. What does fsck do? When should you run it? Give a one-line command to check /dev/sda1(non-destructive).

		- fsck = File system check
		- checks and repairs filesystem consistency
		- Must run on unmounted or read-only FS
		- Never run on mounted root (/) while live
		- When to run
			- After unclean shutdown
			- After X failed mounts (tune2fs counter)
			- Never to 'find boot' - that's blkid or lsblk
		- One line command: `sudo fsck -n /dev/sda1` , though risky.
		- Also, if the system boots normally after an unclean shutdown, we DO NOT need to run fsck manually
		- Auto fsck check and mount happens during booting
	    - check first with `df -h /dev/sda1` if it is already mounted or not to avoid the danger.

	- Q5. What is an inode? How do you view inode usage for a directory? One-line command.

		- inode = integer for file content + metadata
		- directory entry points to inode
		- hard links -> same inode
		- Usage: `df -i /var/log` inode count, not disk space this time with df
		- `rm` reference counting
		- `find . -inum 12345`
		- `debugfs` recovery
	
	- Q6. What is the difference between mount and df? When would you use each?
		- mount attaches a filesystem to the existing tree, maps mount point to root of of new FS
		- df reports space usage.
		- Use mount to access FS, df to monitor it.
		- Use mount: access new storage `sudo mount /dev/sdb1 /mnt/data`
		- Use df: monitor space: `df -h /mnt/data` 
		- kubernates mount volumes, LVM expands storage, Cloud block devices are attached
	
	- Q7. What is a bind mount? Give a one-line command to bind `/var/log` to `/home/user/logs`.

		- Bind mount: Re-exports part of the FS tree elsewhere
		- Source -> target
		- `sudo mount --bind /var/log /home/user/logs`
		- Use: Share dirs, chroot, containers
		- Same trick used in: chroot, Docker volumes, systemd-nspawn
	
	- Q8. What does umount -l do? When would you use it?

		- `umount -l` = lazy umount. Removes FS from tree when all references are closed. Does not guarantee immediate unmount. Use with caution - may cause issues on non-NFS, certain filesystems.
		- When to use - process stuck on NFS umount hangs -> -l detaches.
		- Log rotation - rsyslog holds /var/log -> lazy umount
		- Docker uses it to avoid hangs.
		- Emergency detach - you must free mount point.
		- `umount -l /mnt/data` 
	
	---

### November 16, 2025
#### Task Completed

- **Unix and Linux System Administrator Handbook, Chapter 6**

	- Reading: OS installation, kickstart, PXE, Cobbler etc.
	- Understanding OK

---

### November 17, 2025
#### Task Completed

- **Unix and Linux System Administrator Handbook Chapter 6 test**

	- Q1. What is the difference between the offical repositories and the AUR? Give a one-line command to install neofetch from the official repos and yay from the AUR.

		- Official repos -> pre-built, signed maintained by Arch team, auto dependencies
		- AUR -> PKGBUILDs only, user-maintained, manual build, manual deps
		- One line command: sudo pacman -S neofetch 
		- AUR(yay): download -> makepkg -> sudo pacman -U *.zst
		- Online for AUR instead of my answer:
		- git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
		- CI/CD favourite: after clone and cd to yay makepkg --noconfirm -si

	- Q2. What does `pacman -Rs` do? Give a one-line command to remove `vim` and all its configuration files.

		- `pacman -Rs` removes a package and its unnecessary dependencies
		- `-R`= remove package, `-s` = recursive (unused deps)
		- Command to remove vim and all config files: `pacman -Rns vim` 
		- `-n` remove comfigurations file
	
	- Q3. What does `pacman -Qe` list? Give a one-line command to show only the package names (no version).

		- `pacman -Qe` lists explicitly installed packages
		- One-line to show only names (no versions): `pacman -Qe --quite` or `pacman -Qeq`
		- `-Qd` dep only
	
	- Q4. What is the safest way to upgrade an entire Arch system? Give the exact one-line command you personaly use.

		- `sudo pacman -Syu`
		- S= sync, y = refresh, u = upgrade.
	
	- Q5. What does `pacman -Dk` do? When would you use it (real-world scenario)?

		- Checks whether all files owned by packages are still present on the filesystem (i.e. nothing was accidentally deleted or corrupted - file integrity check)
		- equivalent: `pacman -Qkk`
		- Real world scenario: After a forced shutdown/ fsck
		- After manually deleting files in /usr
		- Before reporting a bug - prove it's not missing files
		- After rsync - delete or bad backup restore - quick sanity check
		- What to do if there's error:
			- `pacman -Qkq >missing.txt #list broken packages`
			- `xargs sudo pacman -S < missing.txt  # fix them`
			- Or, one liner: `pacman Qkq | xargs sudo pacman -S --`
	
	- Q6. What is the difference between `pacman -Rsc` and `pacman-Rns`? Give a real-life example when you would choose one over the other.

		- `-Rsc` remove package + everything that depends on it (cascade)
		- Real life: Critical security vulnerability (Remove any vulnerable package and its all dependencies)
		- `sudo pacman -Rsc openssl-old`
		- `-Rns` remove package + config files + unused deps (clean unistall of vim, leave sytem intact)
		- `sudo pacman -Rns vim # clean uninstall + orphan cleanup`

	- Q7. What is the purpose of the package cache? Give the one-line command to clean it safely while keeping the currently installed versions.

		- package cache -> stores downloaded package files so you can reinstall without internet
		- One-line command: `pacman -Sc` removes all cached packages except the currently installed versions
		- Keeps installed versions (safe)
		- In contrast, `pacman -Scc` Removes everything and does not keep installed versions.

	- Q8.  Name one situation where you would delebarately keep old package files in the cache (real-life example).

		- Rollback, and for compatibility: if a package depends on the older version but the newer one breaks it
		- Bug in the new version (rollback):
		- `sudo pacman -U /var/cache/pacman/pkg/firefox-130.0-1-x86_64.pkg.tar.zst`

---

### November 18, 2025
#### Task Completed

- **Review previous days**
	- Revise code, notes, checkpoint
---

### November 19, 2025
#### Task Completed

- **Unix and Linux System Administrator Handbook - Chapter 7**
	- Reading: Scripting and the shell
	- Bash, Python, Ruby for scripting
	- Important commands, tips and cautions

---

### November 20, 2025
#### Task Completed

- **Labwork 1 - installing ubuntu in pi**
	- Installing ubuntu in Raspberry Pi using a microSD- automated
	- Isert card
	- Do not mount the card, ignore the mount and open notification
	- Find out the device name with `lsblk`
	- In this case it was: mmcblk0. So the card is: /dev/mmcblk0
	- curl -LO https://cdimage.ubuntu.com/ubuntu/releases/24.04.3/release/ubuntu-24.04.3-preinstalled-server-arm64+raspi.img.xz
	- curl -LO https://cdimage.ubuntu.com/ubuntu/releases/24.04.3/release/SHA256SUMS
	- xz -d ubuntu-24.04.3-preinstalled-server-arm64+raspi.img.xz
	- dd if=ubuntu-24.04.3-preinstalled-server-arm64+raspi.img of=/dev/mmcblk0 bs=4M conv=fsync status=progress
	- flash done. 
	- dd -> the Unix tool that copies raw bytes. dd means disk duplicator
	- if=filename -> input file = ubuntu image just extracted
	- of=/dev/mmcblk0 -> output file = microSD.
	- bs=4M -> block size 4 megabytes = faster than default 512bytes
	- conv=fsync -> force the kernel finish writing before dd says done
	- status=progress -> live progress
	- Now the card is ready for Raspberry Pi, just insert and power on.
	- From another pc find the ip of the Raspberry pi using `arp -a | grep -i b8:27:eb`
	- ssh to it: ssh ubuntu@that-ip
	- Sometimes Pi does not show up, troubleshoot.
---

### November 21, 2025
#### Task Completed

- **Labwork 2 - installing ubuntu in Pi and ssh to it**
	- Making the ubuntu installation in Raspberry Pi and enable ssh
	- Without mounting the card dd the right image.
	- Raspberry Pi 3 uses different image than Raspberry 4
	- Find the right image
	- extract and dd as labwork 1.
	- Now, remove the card and put back again and do not mount
	- We will mount the card with the following code just to create ssh file
	- `sudo mkdir -p /mnt/boot`
	- `sudo mount /dev/mmcblk0p1   /mnt/boot`
	- `touch /mnt/boot/ssh` just ssh not ssh.txt
	- This blank ssh file will trigger ssh
	- `sudo umount /mnt/boot`
	- Now, insert the card in Pi, ether plugged and power in it might take few minutes
	- In the main pc `arp -a  | grep -i b8:27:eb`, this should reveal ip if not:
	- we can try `ssh ubuntu` which might reveal its ip.
	- ssh `ubuntu@192.168.1.xxx` password ubuntu
	- Once inside: try `sudo apt update && apt upgrade -y`
	- if runs OK, it will install all the packages etc.
	- `sudo reboot.` will reboot the pi and log you out
	- log back in to see if installed correctly or one more time update.
	- Sometimes the remote might not let ssh for a new ssh key change.If so:
	- ssh-keygen -R 192.168.1.xxx or rm ~/.ssh/known_hosts (faster)
	- Try again ssh ubuntu@192.168.1.xxx, should let you in.

- **learned**
	- Firewall impact on ssh/ARP, always check the settings
	- Sometimes if connecting to a remote system already ubuntu installed (laptop not pi), might not ssh service enabled
	- enable the ssh there
	- `sudo apt update && sudo apt install openssh-server -y`
	- `sudo systemctl enable ssh`
	- `sudo systemctl start ssh`
	- now ssh to that system: `ssh user@ip`

---

### November 22, 2025
#### Task Completed

- **Unix and Linux Administrator Handbook - Chapter 7**
	- Reading: more on scripting

- **while command**
	- One liner:
	``` find . -type f -name '*.log' | while read fname;
	do echo mv $fname `echo $fname | sed s/.log/.LOG/`; done | sh -x
	```
	- `fc` command to capture the previous command.

---

### November 23, 2025
#### Task Completed

- **Unix and Linux Administrator Handbook - Chapter 7**

	- Read: Regular expression, Python for scripting
	- dot (.) matches any character
	- `[chars]` matches any char in the set
	- `[chars]` matches any char not in the set
	-  ^ beginning, $ end.
	- `\w` word chars same as `[A-Za-z0-9_]`
	- `\s` whitespace same as `[\f,\t,\r,\n]`
	- `\d` matches any digit same as `[0-9]`
	-  `(expr)` limit scope, the ? will treat anything in () as unit
	- `?` zero or one match of the preceding char
	- `*` zero, one or more match of the preceding char
	- `+` one or more matches
	- {n} matches n instances of prededing element
	- {min,} matches at least min instances of preceding element
	- {min,max} matches any number of instances from min to max

---

### November 24, 2025
#### Task Completed

- **Unix and Linux Administrator Handbook - Chapter 7**
	- Python regex random two lines:
	- `pattern = re.compile("(%s)" %sys.argv[1])`
	- `pattern.sub(r"_\1_", colour)`
	- Here `\1` is the reference to the first capture group with regex, sub is substitute.
	- the r suppresses the normal substitution of escape sequence - we are using `\1`, to distinguish it from escape sequence. r stands for raw.

---
### November 25, 2025
#### Task Completed

- **Unix and Linux Administrator Handbook - Chapter 8**
	- User nothing but a number, unsigned 32-bit integer or a UID.
	- getpwuid() accepts an UID, getpwnam() accepts a login name as argument
	- These calls get info from `/etc/passwd`
	- UNIX and Linux moved the password to a separate file for security reasons.
	- `/etc/master.passwd` on FreeBSD and `/etc/shadow` on Linux keeps encrypted password not readable by everyone.
	- `/etc/passwd` puts an x in the former location of encrypted password.

---

### November 26, 2025
#### Task Completed

- **Unix and Linux Administrator Handbook - Chapter 8**
	- Do not recycle UID or GID
	- useradd maintain both passwd and shadow file
	- useradd or adduser put user to his or her own group by default
	- To share files create separate groups other than the default.
	- Instead of entering each admin to the sudoers file,configure sudo for auto sudo privilege.
	- password algorithm can be set in `/etc/login.defs` for Linux. For FreeBSD, `/etc/login.conf`
	- `sudo authconfig --passalgo=sha512 --update`
	- MD5 is not recommended algorithm.
---

### November 27, 2025
#### Task Completed

- **Unix and Linux Administrator Handbook - Chapter 8 Complete**
	- startup file located in `/etc/skel`
	- `usr/local/etc/skel` is a reasonable place to put modified copy.
	- `useradd` get its config parameter from `login.defs` and `etc/default/useradd`
	- `sudo useradd -D -s /bin/bash` sets bash as the default
	- `sudo useradd hilbert` this creates entry in `/etc/passwd` and `/etc/shadow`
	- `sudo useradd -c "David Hilbert" -d /home/math/hilbert -g hilbert -G faculty -m -s /bin/bash hilbert`
	- `/etc/group` gets an entry too
	- higher level wrapper: `adduser` and `deluser`. The configuration in `/etc/adduser.conf`
	- similar wrapper: addgroup, delgroup.
	- `rmuser` is for FreeBSD.
	- newusers command creates multiple accounts but batch adduser script or a wrapper of useradd is preferable.
	- A command to find the paths of orphan files:
	- `sudo find filesystem -xdev -nouser` use `-xdev` so that find does not escape into network servers.
	- Debian and ubuntu uses a perl script for `deluser` command
	- it runs `/usr/local/sbin//deluser.local` if exists, configuration in:/etc/delusers.conf

---

### November 28, 2025
#### Task Completed

- **Unix and Linux Administrator handbook - Chapter 9 (Cloud Computing)**
	- Reading Cloud Computing: Nothing new
	- Require practical knowledge, lab work.

---

### November 29, 2025
#### Task Completed

- **Labwork 3- text manipulation - linuxjourney.com**

	- `cut -c 5 sample.txt` output the 5th char from each line
	- `cut -f 2 sample.txt` outpput the second field, default delimiter TAB
	- `cut -f 1 -d ";" sample.txt` specifying delimiter
	- `paste -s sample2.txt` merges lines together in a file, same default delimiter TAB
	- `paste -d ' ' -s sample2.txt` specifying delimiter
	- `expand sample.txt` converts tabs to 8 space chars
	- To save the conversion redirect: `expand sample.txt > result.txt`
	- `unexpand sample.txt` does the reverse - 8 spaces into TAB
	- By default unexpand converts leading spaces.
	- To convert al use -a: `unexpand -a sample.txt`
	- `join file1.txt file2.txt` - join files
	- By default combines two sorted files based on identical first field
	- `join -1 2 -2 1 file1.txt file2.txt` specifying first file second field to join with second file first field.
	- `split somefile` split once a 1000 line limit is reached.
	- out put files - xaa,xab and so on.
	- `sort`, reverse sort: `sort -r` , numerical value sort: `sort -n`
	- `tr` to translate and delete.
	- lower to upper: `echo "Hello World"  | tr a-z A-Z`
	- delete: `echo "My address: 123 " | tr -d '0-9'`
	- squeezing repeat: `echo "Hello     World" | tr -s ' '`
	- `uniq` to remove repeating lines. But first sort or will not show the right result.
	- `uniq readinglist.txt` or `uniq -c readinglist.txt` c to count the repeats.
	- wc for word count `wc -l` line count, `wc -w` word count, `wc -c` byte count
	- `wc /etc/passwd` -> 96 (l) 25 (w) 5925(byte) all together.
	- `nl file1.txt` adds line number.
	- `grep -e "-v" /path/to/somefile.conf` -e ensures pattern are interpreted correctly.
	- without -e "-v" would be like a flag for invert match.
	- `grep -f patternfile.txt sample.txt` use a list of pattern from a file (patternfile.txt)

---

### November 30, 2025
#### Task Completed

- **Labwork - text manipulation with Vim**
- Read vim tutorial: just type `vimtutor` in cmd
- Navigation - h(left),j (down),k (up),l (right)
- x to delete character under the cursor
- `i` to insert before cursor, `a` to insert after, `A` to append at the end of a current line, and `I` at the start of a current line
- `:q` no change made and quit, `:wq` for saving the changes, `:q!` for quiting without saving the change.
- ZZ is shortcut for :wq
- ESC for normal mode.
- o for newline below current line, O for above.
- operator + motion : both can be numbered: 3dd, d3w etc.
- dw/cw/yw deletes/changes/copies from cursor to the beginning of the next word
- ce changes until th end of a word
- d$/c$ deletes/changes from cursor to the end of the current line
- dd/cc/yy deletes/changes/copies the current line.
- `d}` deletes next paragraph
- p/P pastes the copied or yanked text after/before the cursor or the line below/above
- r replaces single char under the cursor
- R enters replace mode allow continuous overwrite, ESC to go back normal mode.
- J joins the current line to the next
- . repeat the last change made.
- u undo last action, U undo the whole line.
- CTRL+R redo the last action. So, may require multiple redo to redo a line.

---
### December 1, 2025
#### Task Completed

- **Labwork - search and substitute text, parentheses with Vim**
	- `/` - forward search and `?` - backword search
	- n next, and N in the opposite direction of n.
	- place cursor on top of a parentheses and press % to find the matching pair.
	- `:s/old/new/g` to substitute new for old globally and without `/g` to change only the 1st occurence
	- Very useful: `s/old/new/gc` will prompt or ask.
	- Execute external command: `:!` followed by the command.
	- To save: `:w FILENAME` can be deleted with `:!rm FILENAME`
	- Visual mode: press v. Select a portion of text by moving the cursor.
	- To insert content from a file: `:r FILENAME`.
	- `set ic` to set ignore case for search, and substitute.`set noic` to disable it
	- `set hlsearch` or `set nohlsearch` for highlight/nohighlight. Or, `set hls is`
	- is or incsearch for partial match
	- Ignore case for one search: `/searchterm\c`
	- type the start of a command and press CTRL+D to get all possible command, TAB to auto-complete

---

### December 2, 2025
#### Task Completed

- **Miscellaneous**

	- Reading chapter 8, linuxjourney.com
	- setuid add 4, setguid 2, sticky bit 1
	- real UID tracks, effective UID grants access
	- sticky bit add t in the permission and applied on a directory
	- `chmod 1755 my_shared_directory`
---

### December 3, 2025
#### Task Completed

- **Cloud computing - chapter 9 complted - AWS, Google Cloud and Digital Ocean**

	- Amazon web services - cli `amd` which relies on Python Boto Library
	- `pip install awscli`
	- `aws configure` - prompts to setup credentials and region, provides access id and key
	- settings saved to ~/.aws/config
	- useful manpages - `aws help`, `aws ec2 help`, `ec2 describe-instances help`
	- To create and launch instances: `aws ec2 run-instances`
	- Example complete command: 
	```aws ec2 run-instances --image-id ami-d440a6e7 --instance-type
	 t2.nano --associate-public-ip-address --key-name admin-key

	 ```
	 - for multiple instances use `--count`
	 - EC2 instances in VPC subnets do not have public ip
	 - that's why associate ip address to reach them
	 - `aws ec2 describe-instances` to see assigned ip
	 - adjust security group(firewall) of the instance to ssh from your IP address
	 -`aws ec2 describe-instances --instance-id` to see details of a particular instance.
	 - Viewing the console log: `aws ec2 get-console-output --instance-id i-c4f60303`
	 - Helpful output with using sed: 
	 - `aws ec2 get-console-output --instance-id i-c4f60303 | sed 's/\\r\\n/\\n/g'` 
	 - To stop: `aws ec2 stop-instances --instance-id i-c4f60303`
	 - stop can retain the instance, but terminate cannot


	 - Google cloud services:
	 - `gcloud` cli tool
	 - set up envirounment - `gcloud init`
	 - settings saved in - ~/.config/gcloud/
	 - Help: gcloud help or gcloud -h
	 - Manpage: `gcloud help compute`
	 - To create an instance get the image:
	 - `gcloud compute images list --regexp 'debian.*'`
     - `gcloud compute instances create mashuk --image debian-8` here debian-8 (alias) comes from previous output
	 - gcloud initialises the instance with a public and private ip.
	 - public ip can be ssh
	 - but there's helpful wrapper to simplify ssh:
	 - `gcloud compute ssh mashuk`

	 - Digital Ocean
	 - create an account, install tugboat, instances are called droplets
	 - To install tugboat: ruby and gem are needed.
	 - Create cryptographic key to access droplet.
	 - `ssh-keygen -t rsa -b 2048 -f ~/.ssh/id_rsa_do`
	 - Copy the key to the web console (settings -> security)
	 - Connect tugboat to DO API entering the access token from previous step
	 - `tugboat authorize`
	 - `tugboat images | grep -i ubuntu`
	 - `tugboat keys` key is needed (1587367)
	 - `tugboat create -i ubuntu-16-04--x64 -k 1587367 mashuk-ubuntu`
	 - `tugboat ssh mashuk-ubuntu`
	 - Keep a snapshot to use it as a source image `tugboat snapshot droplet-name snapshot-name`
	 - Destroy: `tugboat destroy droplet-name`
	
---
### December 4, 2025
#### Task Completed

- **Unix and Linux System Administrator Handbook Chapter 10 - Logging**
	- Log location - /var/log
	- File wtmp or wtmpx got login/logout, shutdown/reboot record.
	- File lastlog is similar but only last login
	- `journalctl -u ssh` to see specific service unit
	- `journalctl -f` to see live logging
	- Journal collects and index messages from:/dev/log socket, /dev/kmsg kernel, /run/systemd/journal/stdout
	- and /run/systemd/journal/socket
	- Audit messages from the kernel auditd
	- default config file: /etc/systemd/journald.conf not intended to be edited. it has every possible options.
	- add config here:/etc/systemd/journald.conf.d directory.
	- storage options: volatile, persistent, auto (default), none
	- volatile in memory, persistent in the disk creating a directory if doesn't exist
	- auto saves same as persistent but does not create the directory.Does not save journal between reboots.
	- none discards data.
	- Modifying default behaviour: create the directory or
	- update to persistent:

	```
	# mkdir /etc/systemd/journald.conf.d/
	# cat << END > /etc/systemd/journald.conf.d/storage.conf
	[Journal]
	Storage=persistent
	END
	# systemctl restart systemd-journald

	```
    - FSS(Forward Secured Sealing) to increase integrity of log message
	- To genereate the key-pair: `journalctl --setup-keys`
	- Refer manpage: journald.conf and journalctl to know more about key-pair.
	- More useful filtering options with journalctl:
	- `journalctl --disk-usage`
	- `journalctl --list-boots`
	- To restrict to a particular boot session: `journalctl -b 0 -u ssh`
	- `journalctl --since=yesterday --until=now`
	- `journalctl -n 100 /usr/sbin/sshd`

---

### December 5, 2025
#### Task Completed

- **linuxjourney.com - processes and packages**

	- TTY: teletype, pts - pseudo terminals
	- `?` in `ps` command output shows the process is not tied to a terminal.e.g.startup daemons.
	- kernel acts as a schedular
	- Signal - primary method for inter-process communication
	- process can ignore, catch, default action, block a signal
	- SIGHUP 1, SIGTERM 15 (Default), SIGKILL 9, SIGINT 2
	- `kill 123245` (PID) will send this process a SIGTERM (default)
	- `kill -9 12345` explicitly telling SIGKILL to send
	- Check process's existence - `kill -0 12345` does not send signal but check if the PID exists or permission to signal.
	- Each process is allocated a small amount of CPU time called a time slice.
	- With the nice value of a process we can influence kernel's scheduling (cpu time) for it.
	- Process states: R (Running or Runable) -> executing or in the run queue.
	- S (Interruptible Sleep) - can be waken by signal, e.g. waiting for user input or network packet
	- D (Uninterruptible Sleep) - typically, during I/O operations
	- Z (Zombie) - waiting for parent process to read its exit status.
	- T (Stopped) - paused by pressing CTRL+Z or by a debugger, can be resumed by SIGCONT.
	- zombie vs orphan: orphan is active but parent is dead, zombie is dead, but parent has not read exit status and there's an entry in the process table.Cannot be killed with signal as they are not running.
	- `ls /proc`
	- `cat /proc/12345/status` is useful to know specific info about a process.
	- `sleep 1000 &` append an ampersand to run in the background.
	- `jobs` to see all background jobs
	- `sleep 1003` ^Z to suspend, then `bg` - fg job to bg
	- `fg %1` bringing the job 1 from bg to fg.
	- `kill %2` to kill a bg job.

	**Packages**
	- Configure repo source: `/etc/apt/sources.list` file (debian)
	- Also common: `/etc/apt/sources.list.d/` directory (debian)
	- Newer version Ubuntu keeps `.sources` files.It keeps 3rd party sources separate from system's default.
	- Install - `dpkg -i` for debians `rpm -i` for Red Hat.
	- Remove- `dpkg -r` for debians `rpm -e` for Red Hat.
	- List installed packages - `dpkg -l` for deb and `rpm -qa` for rpm
	- apt and yum package management systems for deb and rpm respectively.
	- `apt install package_name` or `yum install package_name`
	- `apt remove package_name` or `yum erase package_name`
	- `apt update`; `apt upgrade` or `yum update`
	- `apt show package_name`, `yum info package_name`
	- `sudo apt install build-essentials` - install necessary tool to compile a source code
	- if build- essentials installed, extract the content of the source code, read README
	- Build process: run `./configure` -> checks dependencies
	- next run `make` - reads Makefile
	- Finally, `sudo make install`. To uninstall pkg installed with make: `sudo make uninstall`
	- Better way to install:`sudo checkinstall`integrates the compiled software with the package manager.

---

### December 6, 2025
#### Task Completed

- **Reading Unix and Linux System Administrator Handbook - Chapter 10**

	- journal miss many features that syslog can provide
	- new systemd-journal-remote try to compensate
	- Admin find it convenient log file in plain text than journal's binary format.
	- systemd journal can forward message to another socket which syslog daemon can read.
	- another socket: `run/systemd/journal/syslog`
	- basic message parameters are fowarded but systemd-specific metadata is lost.
	- ubuntu/debian use this way.
	- Alternative way for Red Hat and CentOS:
	- syslog consume message directly from journal API, no metadata loss.
	- Check: `/etc/systemd/journald.conf` ForwardToSyslog option - yes?

	**Syslog**
	- Let us sort message by source (facility) and importance (severity)
	- can be routed to file, terminal or other machines.
	- can collect from wide variety of sources, can examine the attributes of the messages, can modify.
	- It can centralise logging for a network - most valuable feature.
	- There's a newer implementation rsyslogd. It's available for FreeBSD too.
	- `cat var/log/syslog` shows timestamp, hostname, process name and it's `[PID]`, message payload
	- rsyslog configuration: `/etc/rsyslog.conf`, modifying this file requires restart
	- rsyslogd writes its process id to `/var/run/syslog.d/pid, easy to send signal
	- `sudo kill -HUP bin/cat /var/run/syslog.d/pid`
	- send HUP before rotate the log file to avoid unpredictable result
	- Most distribution use $IncludeConfig legacy directive to include additional file in
	`/etc/rsyslog.d/*.conf`
	- rsyslogd interpotes these in `/etc/rsyslog.conf`

---
### December 7, 2025
#### Task Completed

- **Common Errors in Linux**
	- No such file or directory
	- File exists
	- Not a directory, Is a directory
	- No space left on device
	- Permission denied
	- Operation not permitted
	- Segmentation fault, Bus error
---

### December 8, 2025
#### Task Completed

- **Reading User space and kernel space**
- On Linux systems kernel is a binary file /vmlinuz or /boot/vmlinuz.
- A boot loader loads the file into memory and sets in motion when the system boots.
- Once the boot loader starts the kernel, the main kernel file is no longer used by the running system.
- Kernel loads and unloads on demand many modules
- Loadable kernel modules, are located /lib/modules.

---

### December 9, 2025
#### Task Completed

- **Linux Devices**
	
	- Kernel presents many of the device I/O interfaces to user processes as files.
	- During character device interaction, the kernel cannot back up and reexamine the data stream
	after it has passed data to a device or process.
	- Kernel assigns devices in the order in which they are found - may show
	different device names between reboots
	- block, character, pipe and socket devices
	- sockets can communicate between multiple processes even across a network.
	- sd or SCSI(Small Computer System Interface) disk
	- letter (a, b, or c) represents drive
	- number represents partition, e.g /dev/sdb1, second disk first partition
	- Pseudo devices:
	- `/dev/zero` accepts and discards all input. When read,continuous stream of NULL bytes (zero value)
	-`/dev/null` - accepts and discards all input.Produces no output.
	- `dev/random` - produces stream of random numbers from environmental noise.

	- `/sys` vs `/dev`
	- `/dev` provides device nodes (files) allow programs or process access
	- `sys` to see info and manage devices. Exposes underlying device model.
	- `udev` dynamically adds and removes devices.
	- udevd daemon listen messages from kernel for devices. Parse info and matches data with the rules
	specified in /etc/udev/rules.d.
	- useful udev command: `udevadm info --query=all --name=/dev/sda`
	- Listing usb devices: `lsusb` or tree like `lsusb -t`
	- Listing pci devices: `lspci`
	- Non-volatile memory express devices `/dev/nvme*`, Device mapper: `/dev/dm-*`, `/dev/mapper/*`
	- CD and DVD: `/dev/sr*`, PATA Hard disks: `/dev/hd*`
	- Terminals: `/dev/tty*`, `/dev/pts/*`, and `/dev/tty`

---
### December 10, 2025
#### Task Completed

- **Linux Devices - part 2**
	- Old way: `mknod /dev/sda1 b 8 1` b block device, major 8 , minor 1
	- udev must start early, during boot -> rest of the system does not keep waiting
	- devtmpfs is newer simpler version of devfs.
	- udev does not creat device files, it initialise, set permission and notify other processes
	- udev also creates symbolic links in /dev/disk/by-id for attached disks.
	- Kernel sends uevent which udevd receives.
	- udev learns the device name, sysfs device path, oter attributes
	- udev then start processing rules in: `/lib/udev/rules.d` and `/etc/udev/rules.d`
	- There are directive to skip usually placed at the top of the rules. Other directives can
	import variables,
	- Conditionals are denoted by == or !=, directives by =, (+=), (:=)
	- To monitor uevents: `udevadm monitor`
	- Filter by subsystem: `udevadm monitor --kernel --subsystem-match=scsi`
	- Traditional SCSI hardward -> host adapter + SCSI bus + chain of devices
	- SCSI subsystem: top layer - device class, mid - moderates and routes, bottom - handles hardware-specific actions.
	- Top and bottom layers contain many different drivers
	- Kernel uses one top and one bottom driver nearly always
	USB subsystem almost same - top device-class drivers, mid bus management, bottom host controller drivers
	- Generic SCSI devices - most user processes never need to know anything about SCSI devices or their commands
	- user processes communicate through the block device layer.
	- To bypass device class drivers user processes can give SCSI protocol commands directly through generic devices.
	- 
	Why use generic device? To avoid kernel code complexity in kernel.
	- Reading optical disc is simple op, and there's specialised kernel driver for it
	- Writing complicated, so user-space bypass kernel space and talks to generic SCSI device (subsystem), such as /dev/sg1
	- To see generic devices: `lsscsi -g`

---

### December 11, 2025
#### Task Completed

- **Disks and Filesystems**

	- The partition table defines simple boundaries on the disk
	- Filesystem is much more involved data system - supplies structure to transform block device into hierarchy of files and subdirectories.
	- parted to display partition table: `parted -l`
	- fdisk create and alter partition table
	- fdisk makes changes only when exit the program.
	- fdisk issues a single system call to tell the kernel
	- The debugging output from kernel can be seen with `journalctl -k`
	- forcing a partition table reload: `blockdev --rereadpt /dev/sda`
	- parted partitions are created, modified, and removed on issuing commands.
	- Both fdisk and parted modify the partitions in user space
	- SSD: read data in chunks called pages (not virtual mem. pages though) e.g. 4096 bytes
	- the read must begin at a multiple of that size: if partition and its data do not lie on boundary
	may need several reads.
	- Partitioning tools currently do not make any calculations they just align partitions on 1MB boundaries.
	- If we want to know: `cat /sys/block/sda/sda2/start` output: 1953126 offset from the start in units of 512 bytes
	- Confusingly called sector.
	- If SSD has 4096 byte pages, there are 8 sectors. If we cannot evenly didvide the partition offset by 8 it would not attain optimal performance.
	
  **Creating a partition table**
	- `fdisk /dev/sda`
	- Command prompt: `command (m for help):`
	- p to print current partition table
	- d to deleted, n to create a new -> Follow the instruction that appears
	- First default: 2048, Last sector:  type +200M
	- See the new partition again with p
	- q to quit without writing changs.
	- if satisfied w to write
 
 ---

### December 12, 2025
#### Task Completed

- **The Filesystem - linuxjourney.com**

	- Filesystem structure: boot block, super block, inode table, data block
	- fdisk does not support GPT, parted supports both MBR and GPT
	- gdisk supports GPT only similar like fdisk
	- List partition: `sudo parted -l`
	- Launch interactive mode: `sudo parted`
	- Selecting a device: `select /dev/sda`
	- view: `print`, create: `mkpart` or full `mkpart primary ext4 1 MB 5000MB` 
	- Resize: `resizepart 1 8000MB` only changes partition size, filesystem resize needs resize2fs tool
	- Create filesystem: `sudo mkfs -t ext4 /dev/sdb2` only create in a newly created partition (destructive)
	- How to mount: create a mount point i.e. a directory `sudo mkdir /mydrive`
	- Now mount: `sudo mount -t ext4 /dev/sdb2 /mydrive`
	- Unmount: `sudo umount /mydrive` or `sudo umount /dev/sdb2` both works.
	- Using UUID for stable mounting: `sudo blkid` should show UUID
	- Mount with UUID: `sudo mount UUID=130b882f-ao90 /mydrive`
	- Auto mount filesystem with /etc/fstab configuration during boot.
	- `cat /etc/fstab` 
	- Carefully edit/add new entry to /etc/fstab
	- `sudo mount -a` mounts all filesystem listed in /etc/fstab
	- Swap is what we allocate for our virtual memory for the sytem.
	- Using a partition for swap, initialise: `mkswap /dev/sdb2` make sure nothing is in this partition
	- Allocate 2 * RAM, modern systems have enough RAM
	- Enable: `swapon /dev/sdb2`
	- An entry for swap can be added to /etc/fstab. sw is the filesystem type
	- To remove: `swapoff /dev/sdb2`
	- use df to check how much disk space is free
	- use du to check the disk usage of specific files and directories.
	- It is possible to run out of inode, so check with: `df -i`
	- Filesystem repair: `sudo fsck /dev/sda` run auto during boot before the mount of the filesystem
	- Do fsck only when in a rescue disk or filesystem is not mounted
	- Filesystem is comprised of all the files and the database that manages them. 
	- This database is inode table. Every file and directory has its own inode.
	- `ls -li` shows inode. Also `stat ~/Desktop/`
	- inode points to the actual data blocks of your file.
	- Each inode got 15 pointers. 12 points directly to data blocks.
	- 13 points to a block that contains more pointers.
	- 14 and 15 points to further nested blocks of pointers.

---

### December 13, 2025
#### Task Completed

- **Logical Volume Manager**
	- physical volume -> Volume group -> logical volume
	- Working with LVM: `vgs` to list volume groups
	- `vgdisplay` shows volume group's prorerties
	- PE stands for physical extent a piece of physical volume much like a block but larger.
	- `lvs` list logical volumes and `lvsdisplay` shows their properties
	- `lvdisplay /dev/volgroup0/lv_root` more specific to a particular lv.
	- `ls -l /dev/volgroup0/lv_root` will show a symlink to /dev/dm-0.
	-  Additional symlinks in : /dev/mapper
	- `pvs`, `pvdisplay` for physical volume similar to lv.
	- Creating physical volumes and a volume group: `vgcreate myvg /dev/sdb1`
	- both physical volume and volume group myvg created.
	- It is possible to create PV first with `pvcreate` but vgcreate does this on a partition if nothing is present currently.
	- Verify with `vgs`
	- If no volume group run `pvscan`.
	- Add another PV at /dev/sdc1: `vgextend myvg /dev/sdc1` and verify with `vgs`
	- Creating logical volume: `lvcreate --size 10g --type linear -n mylv1 myvg`
	- type linear is optional (default), we can create another.
	- So, we add physical volume to a volume group. Then we crave out logical volume from it.
	- `vgdisplay myvg`
	- Using the new logical volume for filesystem `mkfs -t ext4 /dev/mapper/myvg-mylv1`
	- Mounting: `mount /dev/mapper/myvg-mylv1 /mnt` and check: `df /mnt`
	- Removing: `lvremove myvg/mylv2` When manipulating lv with this command, refer the volume with slash (/)
	- Resizing LV: `lvresize -l +2602 myvg/mylv1` (by adding all the free PE, find PE with vgdisplay)
	- Then resizing the filesystem: `fsadm -v resize /dev/mapper/myvg-mylv1` (filesystem with '-' not slash)
	- A shortcut resizing: `lvresize -r -l + 100%FREE myvg/mylv1`

	- Inside a traditional filesystem, what kernel does: root inode number is 2. Find the given name of a directory in inode 2's directory data and find the given directory's inode (say 12). Look up 12 in inode table and verify it is a directory inode.Follow 12's data link to its directory info and so on and so forth.

---

### December 14, 2025
#### Task Completed

- **How the Linux Kernel Boots**

	- BIOS -> Bootloader -> Kernel ->Init
	- Location where BIOS/firmware searches depends on disk partition scheme. Two partition scheme: Master Boot Record (MBR) and GUID partition table (GPT) 
	- Alternative to BIOS is UEFI (Unified Extensible Firmwire Interface)
	- Kernel initialises in this general order: CPU inspection, memory, device bus discovery, device, auxiliary subsystem setup (networking), root filesystem mount, userspace start
	- Kernel parameters: `cat /proc/cmdline` quiet, splash, ro etc
	- If any parameter not understood, it is saved and passed to init e.g. -s fto indicate single-user mode.
	- Kernel and its parameters are usually somewhere in the root filesystem.
	- Bootloader does need a driver but not the same one that the kernel uses to access the disk
	- Logical Block Addressing (LBA) is a simple way to access data from any disk but its performance is poor (not an issue for few times). Bootloader often the only program uses this method.
	- Most common boot loaders can read partition tables and support read-only access to filesystems.
	- Bootloader tasks: select from multiple kernels, switch between sets of kernel parameters, allow manual override and edit kernel image names and parameters, support booting other OS.

- **GRUB**
	- The GRUB 'root' is the filesystem where GRUB searches for kernel and RAM filesystem image files.
	- root also means a kernel parameter in a GRUB configuration.
	- GRUB has its own device-addressing scheme.
	- GRUB prompt `grub> ls` (hd0) (hd0, msdos1) , one main disk hd0, and a single MBR partition table
	- `grub > set` shows all GRUB set variables most impotant is the $prefix where GRUB expects to find its configuration and auxiliary support.
	- grub configuration directory: /boot/grub or /boot/grub2. It contains grub.cfg
	- use grub-mkconfig or grub2-mkconfig to modify
	- `grub-mkconfig -o /boot/grub/grub.cfg`

---

### December 15, 2025
#### Task Completed

- **Kernel short summary - linuxjourney.com**
	- The bridge between kernel mode and user mode is system call.
	- The number of available system calls is fixed.
	- Each system maintains a syscall table where each system call is registered with a unique ID.
	- To observe system calls: `strace ls` for ls command.
	- Kernel is stored in `/boot`
	- Pieces of code can be loaded into or unloaded from kernel on demand are called kernel modules.
	- To see list of kernel modules: lsmod
	- Load a kernel module, e.g. `sudo modprobe bluetooth`
	- To unload or remove, e.g. `sudo modprobe -r bluetooth`
	- Modules loaded with modprobe are temporary and will be gone after a reboot.
	- To auto load a module during boot (permanent) create configuration files in /etc/modprope.d/
	- lets create a .conf file: `/etc/modprobe.d/peanutbutter.conf`
	options peanut_butter type=peanut
	- To pervent module load at the boot: `blacklist peanut_butter` in that .conf file

---

### December 16, 2025
#### Task Completed

- **How user space starts + linuxjourney.com -init**

	- Two old init varieties - System V and Upstart
	- Modern - systemd
   	- system V you have`/etc/inittab` directory, upstart you have `/usr/share/upstart` directory
	- systemd you have `/usr/lib/systemd`
	- system V - `service --status-all` `sudo service networking start`
	- Upstart - `initctl list` `initctl status networking` `sudo initctl restart networking`
	- systemd- `systemctl list-units` `systemctl status networking.service` `systemctl stop networking.service`

	**System V**
	- In system V machine states are defined as runlevels (0 - 6) 
	- 0 shutdown, 1 single user mode, 2 multiuser mode without networking, 3 multiuser mode with networking,
	- 4 unused, 5 multiuser mode with networking and GUI, 6 reboot
	- During system boot, system V checks configured runlevels and corresponding scripts
	- Scripts: `etc/rc.d/rc[runlevel].d` or `etc/init.d`
	- Scripts starts with S runs during startup and K during shutdown
	- The numbers following S or K dictate execution order.
	- E.g. `mashuk@mashuk232: /etc/rc.d/rc0.d$ ls`
	- if shows `K10updates` then switching runlevel 0 will run the script to kill the update service
	
	**Upstart**
	- In upstart events trigger jobs, jobs are actions that upstart performs
	- `/etc/init` got jobs as .conf file. This conf file use runlevels to as system V.
	- start on runlevel `[235]` inside a networking.conf will start the networking on runlevel 2, 3 and 5
	- So, upstart loads job configuration from `/etc/init`, once a start up event occurs it runs the corresponding jobs which triggers more events, these events triggers more jobs etc.
    
	**Systemd**
	- systemd uses the concept goals to bring the system to a functional state.
	- It identifies a primary goal called a target and satisfies the dependencies.
	- Configuration: `/etc/systemd/system` and `/usr/lib/systemd/system`
	- Targets in systemd are equivalent to runlevels in older init like System V or upstart
	- Common targets: poweroff.target, rescue.target, multi-user.target, graphical.target, reboot.target
	- default.target is a symbolic link often to graphical.target
	- Fundamental objects systemd manages are units. Each unit type is identified by it's file extension
	- .service, .mount, .target
	- A systemd unit file is a plain text file that describes a service.
	- Service file is divided into sections: `[unit]`, `[service]`, `[install]` etc.
	- Unit section: dependency, description, directives e.g. `After=network.target`
	- Service section: ExecStart, ExecStop, ExecReload e.g. ExecStart=/usr/bin/foobar
	- See manual page systemctl.service(5) and systemd.exec(5).
	- Install section: defines behaviour when it is enabled or disabled. e.g. WantedBy=multi-user.agent
	- WantedBy directive says start this service as a part of a specific target
	- unit with an `[Install]` section need to be enabled before start.
	- unit dependencies are not tree like but graph.So, we will handle dependency graph.
	- systemd configuration search path:`systemctl -p UnitPath show`
	- Use @ specifier to create multiple copies of a unit from a single unit file.
	- E.g. getty controls login prompts getty@.service allows dynamic creation of units: getty@tty1, getty@tty2.
	- anything after @ called an instance.
	- For flexibility and fault tolerance, systemd offers serveral dependency types and styles:
	- Requires: try to activate the dependency unit if fails it deactivates the dependent unit.
	- Wants: Upon activating a unit, it activates the wants dependencies, if fails those wants dependencies it does not care
	- Requisite: Units that must already be active.
	- Conflicts: When activating a unit with conflict dependency, it deactivates the opposing dependency if it's active.
	- If a service unit file has the same prefix as a .socket file, systemd knows to activate that service unit when there's activity on the socket unit.
	- Explicit activation: use Socket=bar.socket inside foo.service to have bar.socket hand its socket to foo.service. Here, we are not depending on the same prefix.

	---
### December 17, 2025
#### Task Completed

- **System Configuration: Logging, System Time, BAtch jobs and users - Part 1**

	- journald and syslog
	- `/var/log/journal` is where journald stores its logfiles.
	-journalctl can display log messages using a pager starting with the oldest as they would appear in a logfile.
	- `journalctl -r` reverse it
	- `journalctl _PID=8792` search messages from process ID 8792.
	- Useful: `journalctl -S -4h` -S means since.
	- We can use -U until less useful though.
	- Filer by system unit: `journalctl -u cron.service`, unit type can be omitted.
	- To list all units: `journalctl -F _SYSTEMD_UNIT` 
	- List all available fields: `journalctl -N`
	- Classic grep over all the messages.
	- message from just one boot, current boot: `journalctl -b`
	- `journalctl -b -1` from previous boot offset of -1.
	- Display kernel messages: `journalctl -k`
	- `journalctl --list-boots`
	- Traditional way monitoring logs: `tail -f` or `less +F` on a logfile
	- With journald: `journalctl -f` will do the same: printing logs as they arrive.
	- Log rotation: log maintained by logrotate is divided into many chunks.
	- A logfile auth.log in /var/log can have auth.log1, auth.log2, and auth.log3 with progressively older data.
	- Removing method: remove the oldest, rename the immediately next oldest file, so auth.log.3 get deleted, auth.log.2 becomes auth.log.3, until auth.log becomes auth.log.1
	- names and details may vary across distributions.
	- In Linux once a file is open, the I/O system has no way to know it was renamed.
	- So, during log writing a rename would not cause any issue and the log message would be written successfully.
	- journald decides to delete message based on how much space is left on the journal's filesystem, how much space the journal should take as a percentage of the filesystem,and what maximum journal size is set to.
	- syslogd can listen to network socket, too. usual listening unix domain socket /dev/log.
	- Client machines can send messages over a network.
	- syslog sends messages of various tyoes from different services, so, a way to classify messages is necessary.
	- facility what sent the message, and severity -the urgency, are used to classify. Eight levels.
	- In contrast, journald emphasizes collecting and organizing the log output of a single machine into a single format.
	- systemd can collect the output of server units and can send them to journald. So, more log data possible than syslog.
	- Challeges: Are the logs trustworhty? No modification? Logs are not encrypted, snooping possible. Original syslog had no authentication. More challenging: when we consider individual application's log how can we always ensure authenticity!
	
	**getty and login**
	- `ps ao args | grep getty`
	- Most users log in with graphical interface gdm or remotely with ssh, so getty or login are rare.
	- Just to know - after your login name, getty replaces itself with the login program which asks for password, if correct login replaces itself with your shell. Otherwise, login incorrect message.

---
### December 18, 2025
#### Task Completed

- **System Configuration: Logging, System Time, BAtch jobs and users - Part 2**

	- A process can run a setuid executable as long as it has adequate file permissions.
	- A process running as root (user ID 0) can use setuid() to become any user.
	- The real user ID(read UID, ruid) indicate who initiated a process.
	- When you run a setuid program, Linux sets the euid to the program's owner during execution, but original user ID in the ruid.
	- Think of euid as the actor and ruid as the owner.
	- If user A starts a new process that runs as user B, user A still owns the process and can kill it.
	- `ps -eo pid, euser, ruser, comm`
	- There is a setuid(2) manual page
	- The kernel does not know anything about authentication. Anything related to authentication happens in user space.

	**PAM (Pluggable Authentication Modules)**
	- `auth requisite pam_shells.so`
	- auth: function, requisite: control argument, pam_shells.so: module
	- pam.conf(5) manual page
	- For any configuration line, the module and function together determine the action.
	- pam_unix.so module + auth function -> checks password
	- pam_unix.so module + password function -> sets password
	- Same module (pam_unix.so) but for different function does different action. (Mind the distinction between function and action)

---












		







