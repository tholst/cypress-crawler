#!/bin/bash

SLEEPTIME="5"

if [ $# -gt 0 ]; then
    SLEEPTIME=$1
fi

OUTPUTFILE="./amazonCrawl.txt"

if [ $# -gt 1 ]; then
    OUTPUTFILE=$2
fi

# REQUESTS=0
# SUCCESS=0
# FAILED=0

echo "Sending token requests to https://auth.lottify.dev/keycloak/realms/lottify/protocol/openid-connect/token every $SLEEPTIME seconds..." > $OUTPUTFILE;

while true
do
# clear >$(tty);
# echo "Sending token requests to https://auth.lottify.dev/keycloak/realms/lottify/protocol/openid-connect/token every $SLEEPTIME seconds...";
# echo "Requests: $REQUESTS   Successful: $SUCCESS    Failed: $FAILED"

if npm run run &> /dev/null; then
    echo "no PS5 available"
else
    echo "crawl check failed!!"
    osascript -e 'display notification "crawl check failed!!" with title "Check Amazon PS5"'
fi

# http_response=`curl -v -w "\nHTTP_CODE:%{http_code}" 'https://auth.lottify.dev/keycloak/realms/lottify/protocol/openid-connect/token' --data-raw 'password=root1234&username=thomas.holst%2Bowner2%40dreamit.de&grant_type=password&client_id=lfy-frontend' 2>> $OUTPUTFILE` ;
# let REQUESTS=$REQUESTS+1;
# http_code=`echo $http_response | tail -c 4`;

# echo "Request: $Request" >> $OUTPUTFILE;
# echo "$http_response" >> $OUTPUTFILE;

# echo
# echo "http_response: $http_response" | head -c 100 ;
# echo "...";
# echo "http_code: $http_code";
# echo

# if [ $http_code != "200" ]; then
#     let FAILED=$FAILED+1;
#     echo "Request failed!" >> $OUTPUTFILE;
#     echo "--> failed!";
# else
#     let SUCCESS=$SUCCESS+1;
#     echo "Request successful." >> $OUTPUTFILE;  
#     echo "--> successful";
# fi

echo
sleep $SLEEPTIME;
done
