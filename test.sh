#!/bin/bash

#[[-d "/home/mashuk/not"]] || echo "Error" && exit 1
#echo "This line runs only if No exit"

[ -d "/home/mashuk" ] || {echo "Error" && exit 1}
echo "This line NEVER runs"

