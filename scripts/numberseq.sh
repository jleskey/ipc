#!/bin/bash
# Tanenbaum, chapter 2, Q57
# Produce a file of sequential numbers by reading the last number in the file,
# adding 1 to it, and then appending it to the file.

# Note how bash script syntax has several differences from C syntax.
# Arithmetic expressions may be placed inside double parentheses to use
# a more familiar and flexible syntax than in the simple sh shell.

# ensure consistent working directory
cd $(dirname "$0")/..

# if numbers file does not exist, create it and write 0
if [ ! -f numbers ]; then echo 0 >numbers; fi

count=0
while ((count != 200))
do
    # We could theoretically include the count in the critical region,
    # but the instructions indicate that it should be focused on file
    # access, so focused on file access it will be.
    ((count = count + 1))
    if ln numbers numbers.lock 2>/dev/null; then
        n=`tail -1 numbers`     # retrieve last line of file
        ((n = n + 1))
        echo $n >>numbers       # append n at end of file
        rm numbers.lock
    fi
done
