# Devops Learning notes

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
- **labex.io Bash Scripting - accept and use of command-line arguments**
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
- **Build a log monitor script**
	- `${1:-default}` -> safe config
	- `grep -c what_pattern where` -> count matches
	- `tail -5` -> show recent errors
	- `exit 1` -> fail fast
	- Alerts on ERRORs in logs
	- cat > /tmp/sample.log << EOF, here EOF is a delimiter
	- cat  << EOF is Here Document, any delimiter (STOP, END etc.) would work in place of EOF

#### `log_monitor.sh` (key script)

- **labex.io Bash scripting - Arrays**
	- () initialise an empty array
	- += to append elements
	- `[@]`. @ symbol inside the bracket represents all elements
	- `#`symbol tells to count number of elements.
	- `${#NAMES[@]}` will be used to count number of elements.	

#### `bash_basics.sh` (key script)
---

### October 31, 2025
#### Tasks Completed
- **Improved previous log monitor with email alert**
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
- **A challenge using array knowledge - labex.io**
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
- Output Redirection: `>>` and `2>&1`
	`>> /home/mashuk/Documents/Journals/devops_learning/cron_alert.log 2>&1`
- `>>` append stdout, `>` overwrite which we do not want here, 2> represents stderr, &1 for stdout
- together 2>&1 instructs send errors to same place as output
- we use `crontab -e` which opens crontab with nano. With command and output redirection together we write the full cronline.
- Full cronline: `/home/mashuk/Documents/Journals/devops_learning/ log_monitor.sh /var/log/syslog ERROR >> /home/mashuk/Documents/Journals/devops_learning/cron_alert.log 2>&1`

- **Troubleshooting**
	- `crontab -e` did not open nano file. The following fix was used.
	 `echo 'export EDITOR=nano' >> ~/.bashrc`
	 `source ~/.bashrc`
	- cron was not running. To fix it, cronie was installed from Arch Linux package. `sudo pacman -S cronie`.

#### `log_moitor.sh` (key script)
---