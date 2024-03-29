#!/bin/bash

# This script is written in Bash and uses AWK for text processing.
# The first AWK command reads lines from the input files.
awk '{
    currentLine[i++] = $0
}
END{
    for (j = i - 1; j >= 0; j--) {
        print currentLine[j]
    }
}' "$@" | # The "$@" is a special variable that holds all command-line arguments.
# The output of the first AWK command is piped into a second AWK command.
# The -f option tells AWK to read the script from the file assign3.awk.
awk -f assign3.awk


# The script exits with a status of 0, indicating success.
exit 0