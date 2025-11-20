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
		is the root of the process tree. On modern Linux, it is /usr/lib/systemd/systemd.

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

- **Labwork 1**
	- Installing ubuntu in Raspberry Pi using a microSD- automated
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
	- status=progress -> live percentage and speed
	- Now the card is ready for Raspberry Pi, just insert and power on.
	- From another pc find the ip of the Raspberry pi using `arp -a | grep -i b8:27:eb`
	- ssh to it: ssh ubuntu@that-ip
	- Sometimes Pi does not show up, troubleshoot.
---
		







