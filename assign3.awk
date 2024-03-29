# This script is written in AWK, a programming language designed for text processing.

# The BEGIN block is executed once before the processing of the input file begins.
BEGIN {
    FS = ",\"|\",|,";
}

# This block is executed for each line of the input file.
{
    # Increment the total number of calls.
    totalCalls++;

    # Increment the count of the problem type, which is the third field in the line.
    problemType[$3]++;
    
    # Increment the count of the division, which is the fifth field in the line.
    division[$5]++;

    # Extract the date from the timestamp, which is the second field in the line.
    split($2, dateTime, " ");
    date = dateTime[1];


# If there's no first call for the date or the current call is earlier, update the first call and its time.
    if (!firstCall[date] || $2 < firstCallTime[date]) {
        firstCall[date] = $0;
        firstCallTime[date] = $2;
    }

    # If there's no last call for the date or the current call is later, update the last call and its time.
    if (!lastCall[date] || $2 > lastCallTime[date]) {
        lastCall[date] = $0;
        lastCallTime[date] = $2;
    }
}


# The END block is executed once after the processing of the input file is completed.
END {
    # Print the total number of calls.
    print "\nTotal calls = " totalCalls;


    # For each date, print the first and last call.
    for (date in firstCall) {
        print "\nDate: " date;
        print "        First call: " firstCall[date];
        print "        Last call: " lastCall[date];
    }


    # Print the total number of each problem type.
    print "\nPer-problem totals:";
    for (type in problemType) {
        printf "        %s: %s\n", type, problemType[type];
    }


    # Print the total number of each division.
    print "\nPer-division totals:";
    for (div in division) {
        printf "        %s: %s\n", div, division[div];
    }
}
