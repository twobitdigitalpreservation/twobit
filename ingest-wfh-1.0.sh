#!/bin/sh


######################################

tput setaf 4; echo "Greetings Human. Please type your name into the Terminal:"
read agentName

tput setaf 4; echo "Please type the sender name into the Terminal"
read senderName

tput setaf 7; echo "Please drag and drop source media here:"
read sourceData

tput setaf 7; echo "Please drag and drop desired destination here:"
read desinationLocation

tput setaf 6; echo "Please enter the Project ID here"
read projectID

mkdir ~/Desktop/temp-logs
mkdir $sourceData/logs

#tput setaf 6; echo "Please enter the sender's name (no spaces). Ex: "Sakae_Ishikawa""
#read senderName

#####################################
###Create Ingest Log (date/time, agentName,)
date > ~/Desktop/temp-logs/$(date +"%Y-%m-%d_")"$projectID_$senderName"-wfh-xfr-log.txt

echo "\n"Transfer Agent Name: >> ~/Desktop/temp-logs/$(date +"%Y-%m-%d_")"$projectID_$senderName"-wfh-xfr-log.txt
printf "$agentName\n" >> ~/Desktop/temp-logs/$(date +"%Y-%m-%d_")"$projectID_$senderName"-wfh-xfr-log.txt

echo "\n"Sender Name: >> ~/Desktop/temp-logs/$(date +"%Y-%m-%d_")"$projectID_$senderName"-wfh-xfr-log.txt
printf "$senderName\n" >> ~/Desktop/temp-logs/$(date +"%Y-%m-%d_")"$projectID_$senderName"-wfh-xfr-log.txt

echo "\n"Source Location: >> ~/Desktop/temp-logs/$(date +"%Y-%m-%d_")"$projectID_$senderName"-wfh-xfr-log.txt
printf "$sourceData\n" >> ~/Desktop/temp-logs/$(date +"%Y-%m-%d_")"$projectID_$senderName"-wfh-xfr-log.txt

echo "\n"Destination Location: >> ~/Desktop/temp-logs/$(date +"%Y-%m-%d_")"$projectID_$senderName"-wfh-xfr-log.txt
printf "$desinationLocation\n" >> ~/Desktop/temp-logs/$(date +"%Y-%m-%d_")"$projectID_$senderName"-wfh-xfr-log.txt

echo "\n"Source Disk Usage: >> ~/Desktop/temp-logs/$(date +"%Y-%m-%d_")"$projectID_$senderName"-wfh-xfr-log.txt
du -sch $sourceData >> ~/Desktop/temp-logs/$(date +"%Y-%m-%d_")"$projectID_$senderName"-wfh-xfr-log.txt


#####################################
#sudo mkdir $destinationLocation/logs
echo "**** file transfer in progress ****"
rsync -va --progress $sourceData $desinationLocation > ~/Desktop/temp-logs/$(date +"%Y-%m-%d_")"$projectID_$senderName"-wfh-xfr-rsync.txt

tput setaf 7; echo "Please drag and drop desired log location here:"
read logLocation

rsync -va --progress ~/Desktop/temp-logs/ $logLocation
rm ~/Desktop/temp-logs/*
rmdir ~/Desktop/temp-logs

echo "\n"Destination Disk Usage: >> ~/Desktop/temp-logs/$(date +"%Y-%m-%d_")"$projectID_$senderName"-wfh-xfr-log.txt
du -sch $destinationLocation >> ~/Desktop/temp-logs/$(date +"%Y-%m-%d_")"$projectID_$senderName"-wfh-xfr-log.txt
