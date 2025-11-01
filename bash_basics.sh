#!/bin/bash

# Shell variables (28 October, 2025)

PRICE_PER_APPLE=5
MyFirstLetters=ABC
greeting='Hello        world!'

echo "Price per apple: $PRICE_PER_APPLE"
echo "My first letters: $MyFirstLetters"
echo "Greeting: $greeting"

# Escaping special characters
echo "The price of an Apple today is: \$HK $PRICE_PER_APPLE"

# Avoiding ambiguity
echo "The first 10 letters in the alphabet are: ${MyFirstLetters}DEFGHIJ"

# Preserving whitespace
echo $greeting
echo "$greeting"

# Command substitution
CURRENT_DATE=$(date +"%Y-%m-%d")
echo "Today's date is: $CURRENT_DATE"

FILES_IN_DIR=$(ls)
echo "Files in the current directory:"
echo "$FILES_IN_DIR"

UPTIME=$(uptime -p)
echo "System uptime: $UPTIME"

# Arithmetic Operations

X=10
Y=5

# Addition
SUM=$((X + Y))
echo "Sum of $X and $Y is: $SUM"

# Subtraction
DIFF=$((X - Y))
echo "Difference between $X and $Y is: $DIFF"

# Multiplication
PRODUCT=$((X * Y))
echo "Product of $X and $Y is: $PRODUCT"

# Division
QUOTIENT=$((X / Y))
echo "Quotient of $X divided by $Y is: $QUOTIENT"

# Modulus (remainder)
REMAINDER=$((X % Y))
echo "Remainder of $X divided by $Y is: $REMAINDER"

# Increment
X=$((X + 1))
echo "After incrementing, X is now: $X"

# Decrement
Y=$((Y - 1))
echo "After decrementing, Y is now: $Y"

# Environmental Variables

# Displaying some common environment variables
echo "Home directory: $HOME"
echo "Current user: $LOGNAME"
echo "Shell being used: $SHELL"
echo "Current PATH: $PATH"

# Creating a new environment variable
export MY_VARIABLE="Hello from my variable"

# Displaying the new variable
echo "My new variable: $MY_VARIABLE"

# Creating a child process to demonstrate variable scope
bash -c 'echo "MY_VARIABLE in child process: $MY_VARIABLE"'

# Removing the environment variable
unset MY_VARIABLE

# Verifying the variable is unset
echo "MY_VARIABLE after unsetting: $MY_VARIABLE"



# Argument passing (29 October, 2025)

if [ $# -eq 0 ]; then
  echo "No arguments provided."
elif [ $# -eq 1 ]; then
  echo "One argument provided: $1"
elif [ $# -eq 2 ]; then
  echo "Two arguments provided: $1 and $2"
else
  echo "More than two arguments provided:"
  echo "First argument: $1"
  echo "Second argument: $2"
  echo "Third argument: $3"
  echo "Total number of arguments: $#"
fi

# loop through all arguments
echo "Total number of arguments: $#"
echo "All arguments:"

count=1
for arg in "$@"; do
    echo "Argument $count: $arg"
    count=$((count + 1))
done

# Input validation with -z
name="${1:-Guest}"

if [ -z "$1" ]; then
	echo "No name given - using default: Guest"
else
	echo "Name received: $1"
fi

# Input validation with -z and -n

if [ -z "$1" ]; then
	echo "Missing!"
elif [ -n "$2" ]; then
	echo "Got second arg too!"
fi

# Another example
if [ -z "$1" ]; then
	echo "Usage: $0 <Your-name>"
	echo "Example: $0 Alice"
	# exit 1
fi

# loop demo
echo "Counting down"
for i in {3..1}; do
	echo "Tick: $i"
done

echo "Done!"

# Arrays (30 October, 2025)

# Initialize empty arrays
NUMBERS=()
STRINGS=()
NAMES=()

# Add elements to NUMBERS array
NUMBERS+=(1)
NUMBERS+=(2)
NUMBERS+=(3)

#Add elements to STRINGS array
STRINGS+=("hello")
STRINGS+=("world")

#Add elements to NAMES array
NAMES+=("John")
NAMES+=("Eric")
NAMES+=("Jessica")

# Get the number of elements in the NAMES array
NumberOfNames=${#NAMES[@]}

# Access the second name in the NAMES array
second_name=${NAMES[1]}

# Print the arrays and variables
echo "NUMBERS array: ${NUMBERS[@]}"
echo "STRINGS array: ${STRINGS[@]}"
echo "The number of names listed in the NAMES array: $NumberOfNames"
echo "The second name on the NAMES list is: $second_name"

# Array challenge (1 November, 2025)

# Define arrays for each cargo bay's inventory
forward_bay=()
forward_bay+=("Space Suits")
forward_bay+=("Oxygen Tanks")
forward_bay+=("Repair Kits")
midship_bay=()
midship_bay+=("Food Supplies")
midship_bay+=("Water Containers")
midship_bay+=("Medical Equipment")
aft_bay=()
aft_bay+=("Spare Parts")
aft_bay+=("Fuel Cells")
aft_bay+=("Scientific Instruments")
# Check if an argument is provided
if [ $# -eq 0 ]; then
    # Your code here
    echo "Please specify a cargo bay: forward, midship, or aft"
    exit 1
fi

# Display inventory based on the argument
if [ "$1" = "forward" ]; then
    # Your code here
    echo "Forward Bay Inventory:"
    count=1
    for arg in "${forward_bay[@]}"; do
        echo "$count. $arg"
        count=$((count + 1))
    done

elif [ "$1" = "midship" ]; then
    # Your code here
    echo "Midship Bay Inventory:"
    count=1
    for arg in "${midship_bay[@]}"; do
        echo "$count. $arg"
        count=$((count + 1))
    done
elif [ "$1" = "aft" ]; then
    # Your code here
    echo "Aft Bay Inventory:"
    count=1
    for arg in "${aft_bay[@]}"; do
        echo "$count. $arg"
        count=$((count + 1))
    done
else
    # Your code here
    echo "Invalid cargo bay. Choose forward, midship, or aft."
    exit 1
fi

