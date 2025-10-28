# Devops Learning notes

## Overview
- **Goal**: Build Linux and Bash skills for entry-level Devops roles.
- **Started**: October 22, 2025
- **Focus Areas**: Linux commands, user/group management, permissions, Bash scripting
- **Portfolio**: Scripts and notes stored in this repo for job applications.

## Daily Progress

### October 22, 2025
#### Tasks Completed
- **Setup**: Created `~/devops_learning` directory and initialised Git repo.
- **Permissions(linuxjourney.com)**:
	- Created a file testfile.txt: `touch testfile.txt`
	- Confirmed it exists: `ls -l` inside /devops_learning.
	- -rw------- : starts with d or -. d for directory, - for files.first 3 letters for user/owner, next 3 for group, and the last 3 for others.
	- read = 4, write = 2, execute = 1.
	- Set owner-only Read/Write permission: `chmod 600 test file.txt`. 6 is for owner (4 + 2 + 0), group 0, others 0. Equivalent command is `chmod u=rw,go= testfile.txt`
	- Verify the permission: Same command as to verify the file exists. `ls -l testfile.txt`

- **Add new users and group**:
	- Username of the current user: `whoami`
	- Create new user: `sudo adduser jack` (adduser is not built-in which uses useradd in its implementation)
		- creates new user, group (primary) called jack, home directory /home/jack.
	- Verifying home directory: `ls /home` (jack should show up)
	- Verifying primary group: `id jack` (shows UID, GID and secondary groups) 
	- View all groups in the system: `cat /etc/group`
	- View or verify a specific group: `cat /etc/group | grep -E "group_name"` or, `getent group group_name`
	- Create a new group: `sudo groupadd group_name`
	- Add user to this group: `sudo usermod -aG group_name jack` (secondary group. -a stands for append)
	- Add user to a primary group: `sudo usermod -g primary_group_name jack`
	- One line code to adduser and select a primary group for the user: `sudo adduser --group group_name user_name` (prerequisite: group_name exists)
	- All the groups a user in: `sudo groups jack`

-  **Bash Scripting**:
### October 28, 2025
	- Create a bash script: same as any other file creation: `touch hello.sh`.
	- Edit the shell script: Start with shebang line #!/bin/bash to inform the system which interpreter to use in this case bash shell.
	- Make the script executable: chmod +x hello.sh
	- Execute the script: ./hello.sh
	- View the script content: cat hello.sh 

	- Create shell variables (no gap between = sign): 
		#!/bin/bash
		PRICE_PER_APPLE=5 (integer variable)
		MyFirstLetters=ABC (string variable)
		greeting='Hello    World' (A string variable with multiple space)

	- Escaping special character 
`echo "The price of an apple is: \$HK $PRICE_PER_APPLE"` (The dollar sign is escaped using \ to print literally)
	- Avoiding ambiguity
`echo "The first 10 letters of the alphabet are: ${MyFirstLetters}DEFGHIJ"` (The curly brackets are used to clearly define the variable name)
	- Preserving whitespace
`echo $greeting` (No double quotes so whitespace will not be preserved only the first space - prints Hello World)
`echo "$greeting"` (double quotes so whitespace will be preserved so all the spaces are intact - prints Hello    World)

	- Command substitution (done by enclosing the command with $() or backticks ``)
`CURRENT_DATE=$(date +"%Y-%m-%d)`
`echo "Today is: $CURRENT_DATE"`
`FILE_IN_DIR=$(ls)`
`echo "Files in the current directory:"`
`echo "$FILE_IN_DIR"`
`UPTIME=$(uptime -p)`
`echo "System uptime: $UPTIME"`

	- Arithmetic Operations (bash provides $((expression)) to work with arithmetic)
`X=10`
`Y=5`

	# Addition
`SUM=$((X + Y))`
`echo "Sum of $X and $Y is: $SUM"`
	# Subtraction
`DIFF=$((X - Y))`
`echo "Difference between $X and $Y is: $DIFF"`
	# Multiplication
`PRODUCT=$((X * Y))`
`echo "Product of $X and $Y is: $PRODUCT"`
	# Division
`QUOTIENT=$((X/Y))`
`echo "Quotient of $X divided by $Y is: $QUOTIENT"`
	# Modulus (remainder)
`REMAINDER=$((X % Y))`
`echo"Remainder of $X divided by $Y is: $REMAINDER"`
	# Increment
`X=$((X + 1))`
`echo "After increment X is now: $X"`
	# Decrement
`Y=$((Y - 1))`
`echo "After decrement Y is now: $Y"`

	- Environment variable
		displaying common environment variables
`echo "Home directory: $HOME"`
`echo "Current user: $LOGNAME"`
`echo "Shell being used: $SHELL"`
`echo "Current Path: $PATH"`

	- Creating new environmental variable
`export MY_VARIABLE="Hello from my variable"`
`echo "my new variable: $MY_VARIABLE"`
	- Creating a child process to demonstrate variable scope
`bash -c 'echo "My variable in child process: $MY_VARIABLE"'`
	- Removing the new environmental variable
`unset MY_VARIABLE`
	- VErifying the variable is unset
`echo "My variable after unsetting: $MY_Variable"`
should print: My variable after unsetting: (empty)



    


