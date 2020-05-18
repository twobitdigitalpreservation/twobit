#!/bin/sh

#Receive user input for source, destination, and folder and log naming
tput setaf 6; echo "Please drag and drop HRW project here"
read projectLocation
tput setaf 7; echo "Please drag and drop the ingested folder here"
read agentName

#Feedback to the user
echo "    "
tput setaf 7; echo "   Label printing..."
echo "    "

#Print Labels
printf "\n$(basename "$projectLocation")" > ~/Desktop/tmp-label.txt
printf "\n$(basename "$agentName")" >> ~/Desktop/tmp-label.txt
lpr -P Brother_QL_820NWB___neptune -o PageSize=DK-2214 -o landscape ~/Desktop/tmp-label.txt

sleep 30

rm ~/Desktop/tmp-label.txt
