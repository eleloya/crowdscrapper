#!/bin/bash

if [ $# -ne 2 ]; then
	echo "Usage: ./crowdscrapper_multiple_urls.sh FILE.TXT SLEEPSECONDS"
	echo "Example: ./crowdscrapper_multiple_urls.sh sample_fondeadora.txt 5"
	exit 1
fi

echo "URL|TITLE|CURRENCY|AMOUNT ASKED|AMOUNT RECEIVED|BACKERS|AVG AMOUNT|DAYS LEFT|LOCATION|CATEGORY|NUMBER OF WORDS|NUMBER OF PICS|NUMBER OF VIDEOS|NUMBER OF COMMENTS|NUMBER OF UPDATES|NUMBER OF REWARDS|AMOUNT OF REWARDS|NUMBER OF WORDS OF REWARDS"

file=$1
sleeptime=$2

for i in $(cat ${file}) 
do
	csv_line=`./crowdscrapper.rb "${i}" --csv`
	sleep $sleeptime
	echo $csv_line
done