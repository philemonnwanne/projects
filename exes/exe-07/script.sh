#!/usr/bin/bash

# Usage: A sample shell script to save system memory (RAM) usage at every hour, and forward cummulative hourly memory usage to sys_admin at 00:00 hours

# Author: Mr Root

# Declare sys_admin variable
sys_admin="Mr Root"
admin_mail="root@gmail.com"

# Source and destination files
S='/vagrant/script.sh'
D='/vagrant/logs/logfile.log'
DIR='/vagrant/logs'

# Create a logs directory in "/vagrant" but if exits skip
if [ "$PWD" == "$DIR" ]; 
then  
    echo "Directory Already Exits!"
else
    mkdir -p $DIR
fi

# Switch to the "/vagrant/logs" directory
cd /vagrant/logs

# To create an empty log file
touch logfile.log

# Date & Time header
echo "CURRENT DATE/TIME" >> ${D}

# Just a demarcation
echo "------------------------------------" >> ${D}

# Display the curent date and time in UTC format
date >> ${D}

# Insert an empty line
echo "" >> ${D}

# Memory usage header
echo "CURRENT MEMORY USAGE" >> ${D}

# Just another demarcation
echo "-----------------------------------------------------------------------------------------------" >> ${D}

# Display the memory usage statistics
free >> ${D}

# Insert an empty line
echo "" >> ${D}

# Log maintainer header
echo "LOG MAINTAINER" >> ${D}

# Just another demarcation
echo "-------------------------------------------------------" >> ${D}

# This command displays the systems administrator
echo "This log file is being maintained by $sys_admin" >> ${D}

# Insert double empty lines
echo "" >> ${D}; echo "" >> ${D}

echo "                              🐦 NEW LOG ENTRY 🐦             " >> ${D}

echo "" >> ${D}; echo "" >> ${D}

# This clears my terminal before running the command thereby keeping it less messy
# clear -- For test purposes only

# Display contents of the log file 
# cat ${D} -- For test purposes only

# Send a copy of log file to the current users home directory
# currentUsersHome=$HOME  -- For test purposes only
# cp ${D} $HOME  -- For test purposes only

# Send email to sys_admin at 12am
currentTime=$(date +%H:%M)

if [ ${currentTime} = 00:00 ];
    then mail ${admin_mail} < ${D} &&
    # Sleep for 10m minutes and delete the previous log file
    sleep 10m &&
    rm -f ${D}
else
    :
fi

