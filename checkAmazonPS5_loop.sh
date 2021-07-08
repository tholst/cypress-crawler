#!/bin/bash

SLEEPTIME="5"

if [ $# -gt 0 ]; then
    SLEEPTIME=$1
fi

OUTPUTFILE="./amazonCrawl.txt"

if [ $# -gt 1 ]; then
    OUTPUTFILE=$2
fi

REQUESTS=0
SUCCESS=0
FAILED=0

echo "Checking PS5 availability on https://www.amazon.de/s?i=videogames&bbn=20904942031&rh=n%3A20904942031%2Cp_89%3ASony+Interactive+Entertainment&dc&brr=1&qid=1625596777&rd=1&rnid=669059031&ref=sr_nr_p_89_1 every $SLEEPTIME seconds..." > $OUTPUTFILE;

while true
do
clear >$(tty);
echo "Checking amazon.de for PS5 availability";
echo "Requests: $REQUESTS   PS5 unavailable: $SUCCESS    available?!: $FAILED"

now=$(date +"%T")

if npm run run &> /dev/null ; then
    echo "$now: no PS5 available"
    echo "$now: no PS5 available" >> $OUTPUTFILE
    let SUCCESS=$SUCCESS+1;
else
    echo "$now: PS5 might be available?!"
    echo "$now: PS5 might be available?!" >> $OUTPUTFILE
    osascript -e 'display notification "PS5 might be available?!" with title "Check Amazon PS5"'
    let FAILED=$FAILED+1;
fi

let REQUESTS=$REQUESTS+1;

echo
sleep $SLEEPTIME;
done
