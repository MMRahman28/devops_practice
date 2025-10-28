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
