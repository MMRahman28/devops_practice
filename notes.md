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
