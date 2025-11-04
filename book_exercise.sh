#!/bin/bash

# 3 November 2025

# Chapter 2

# exercise 1
echo "Shell Scripting is fun!"
# exercise 2
MESSAGE="Shell Scripting is fun!"
echo "$MESSAGE"

# exercise 3
                                         
HOST=$(hostnamectl hostname)
echo "This script is running on ${HOST}"

# exercise 4

FILE="/etc/shadow"
if [ -e "$FILE" ]; then
echo "Shadow passwords are enabled."
fi

if [ -w "$FILE" ]; then
echo "You have permissions to edit /etc/shadow"
else
echo "You do NOT have permissions to edit /etc/shadow."
fi

# exercise 5

for animal in bear pig dog cat sheep 
do
echo "$animal"
done

# exercise 6

read -p "Name of the file or directory: " FILE
if [ -f  "$FILE" ]; then
echo "$FILE is a regular file"
elif [ -d "$FILE" ]; then
echo "$FILE is a directory"
else
echo "$FILE is another type of file. Not a regular file or directory"
fi
ls -l $FILE

# Exercise 7

FILE=$1

if [ -f  "$FILE" ]; then
echo "$FILE is a regular file"
elif [ -d "$FILE" ]; then
echo "$FILE is a directory"
else
echo "$FILE is another type of file. Not a regular file or directory"
fi
ls -l $FILE

# Exercise 8

FILES="$@"

for FILE in $FILES
do
if [ -f  "$FILE" ]; then
echo "$FILE is a regular file"
elif [ -d "$FILE" ]; then
echo "$FILE is a directory"
else
echo "$FILE is another type of file. Not a regular file or directory"
fi
ls -l $FILE
done

# Chapter 3 - Exit status and return code

# exercise 1

echo "This script will exit with a 0 exit status".
# exit 0 # commented out so that code below can be run

# exercise 2

if [ -f "$1" ]; then
echo "'$1' is a regular file"
# exit 0
elif [ -d "$1" ]; then
echo "'$1' is a directory"
 # exit 1
else
echo "Another type - not a regular file, or directory"
#exit 2
fi

# exercise 3

cat /etc/shadow
STATUS=$?

if [ $STATUS = 0 ]; then
echo "Command succeeded"
#exit 0
else
echo "Command failed"
#exit 1
fi



# Chapter 3 (4 November, 2025)

# exercise 1
# function file_count(){
	#local NUMBER_OF_FILES=$(ls | wc -l) 
	#echo "Number of files in the present working directory is: $NUMBER_OF_FILES"
# }
# file_count

# exercise 2

function file_count(){
	if [[ -d "$1" ]]; then
	local DIR=$1
    local NUMBER_OF_FILES=$(ls "$DIR"| wc -l) 
	echo "${DIR}:"
	echo "Number of files in the present working directory is: $NUMBER_OF_FILES"
	fi
}
file_count /home/mashuk/Documents/Journals/devops_learning




