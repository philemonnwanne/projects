#!/usr/bin/bash

# Declaring variables
configS="/etc/ssmtp/ssmtp.conf"
configR="/etc/ssmtp/revaliases"
admin_mail="philemonnwanne@gmail.com"

# Update package index and install dependencies for running this script
# sudo apt update &&
# # sudo apt install -y iputils-ping &&
# sudo apt install -y nano &&
# # sudo apt install -y iproute2 &&
# sudo apt install -y ssmtp &&
# sudo apt install -y bsd-mailx && sleep 10
# apt install -y cron &&

# Assume root ownership for running this script
# sudo su && sleep 3 && pwd &&

# Change to the ssmtp config directory
# cd /etc/ssmtp/ && pwd &&

# Overwrite the ssmtp/conf file
# echo "" | sudo tee ${configS} &&
echo "root=nwanne63@gmail.com" | sudo tee -a ${configS} &&
echo "mailhub=smtp.gmail.com:465" | sudo tee -a ${configS} &&
# echo "hostname=ubuntu" | sudo tee -a ${configS} &&
echo "AuthUser=nwanne63@gmail.com" | sudo tee -a ${configS} &&
echo "AuthPass=sbkgouvlahkfomkw" | sudo tee -a ${configS} &&
echo "UseTLS=YES" | sudo tee -a ${configS} &&
echo "UseSTARTTLS=NO" | sudo tee -a ${configS} &&
echo "FromLineOverride=YES" | sudo tee -a ${configS} && sleep 3 &&

# Mod the ssmtp/revaliases file
echo "root:nwanne63@gmail.com:smtp.gmail.com:465" | sudo tee -a ${configR} && sleep 3 &&

# Change to the /vagrant directory
cd /vagrant && touch metro && echo "I am now in the vagrant folder"

D="/vagrant/metro"

# Mod metro file
echo "this is a metro boomer file" > /vagrant/metro

# Send a notification to the server admin_mail 
mail ${admin_mail} < ${D} && sleep 3 && echo "MailSent"


