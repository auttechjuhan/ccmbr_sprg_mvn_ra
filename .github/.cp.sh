#!/bin/bash

# Check if the number of arguments is correct
if [ $# -ne 2 ]; then
  echo "Usage: $0 <file_to_clone> <number_of_copies>"
  exit 1
fi

# Get the file to clone and the number of copies from the arguments
file_to_clone=$1
num_copies=$2

# Check if the file exists
if [ ! -f "$file_to_clone" ]; then
  echo "Error: File '$file_to_clone' does not exist"
  exit 1
fi

# Clone the file the specified number of times
for i in $(seq 1 $num_copies); do
  cp "$file_to_clone" "${file_to_clone}_$i"
done
