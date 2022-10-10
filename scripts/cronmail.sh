#!/usr/bin/bash

# Usage: A sample shell script to save system memory (RAM) usage at every hour, and forward cumulative hourly memory usage to sys_admin at 00:00 hours

# Author: Mr Root

# Declare sys_admin variable
sys_admin="Mr Root"
admin_mail="root@gmail.com"

# Source and destination files
SCRIPT_SRC='/home/vagrant/script.sh'
LOG_FILE='/home/vagrant/logs/log_file.log'
LOG_DIR='/home/vagrant/logs'

# Create a logs directory in "/home/vagrant" but if exits skip
if [ "$PWD" == "$LOG_DIR" ]; 
then  
    echo "Directory Already Exits!"
else
    mkdir $LOG_DIR
fi

# Switch to the "/home/vagrant/logs" directory
cd /home/vagrant/logs

# To create an empty log file
touch log_file.log

# Date & Time header
echo "CURRENT DATE/TIME" >> ${LOG_FILE}

# Just a demarcation
echo "------------------------------------" >> ${LOG_FILE}

# Display the current date and time in UTC format
date >> ${LOG_FILE}

# Insert an empty line
echo "" >> ${LOG_FILE}

# Memory usage header
echo "CURRENT MEMORY USAGE" >> ${LOG_FILE}

# Just another demarcation
echo "-----------------------------------------------------------------------------------------------" >> ${LOG_FILE}

# Display the memory usage statistics
free >> ${LOG_FILE}

# Insert an empty line
echo "" >> ${LOG_FILE}

# Log maintainer header
echo "LOG MAINTAINER" >> ${LOG_FILE}

# Just another demarcation
echo "-------------------------------------------------------" >> ${LOG_FILE}

# This command displays the systems administrator
echo "This log file is being maintained by $sys_admin" >> ${LOG_FILE}

# Insert double empty lines
echo "" >> ${LOG_FILE}; echo "" >> ${LOG_FILE}

echo "                              🐦 NEW LOG ENTRY 🐦             " >> ${LOG_FILE}

echo "" >> ${LOG_FILE}; echo "" >> ${LOG_FILE}

# This clears my terminal before running the command thereby keeping it less messy
# clear -- For test purposes only

# Display contents of the log file 
# cat ${LOG_FILE} -- For test purposes only

# Send a copy of log file to the current users home directory
# currentUsersHome=$HOME  -- For test purposes only
# cp ${LOG_FILE} $HOME  -- For test purposes only

# Send email to sys_admin at 12am
currentTime=$(date +%H:%M)

if [ ${currentTime} = 00:00 ];
    then mail ${admin_mail} < ${LOG_FILE} &&
    # Sleep for 10 minutes and delete the previous log file
    sleep 10m &&
    rm -f ${LOG_FILE}
else
    :
fi

