#!/usr/bin/bash

sudo apt update && echo "Local package index update complete!" "Proceeding to install packages [nano,net-tools,apache2,ufw,iputils-ping,mailutils]" 
    # Install nano without prompts
    sudo apt install nano -y && echo "NANO installed succesfully"
    # Install net-tools without prompts
    sudo apt install net-tools -y && echo "NET-TOOLS installed succesfully"
    # Install apache2 without prompts  
    sudo apt install apache2 -y && echo "APACHE2 installed succesfully"
    # Install ufw without prompts
    sudo apt install ufw -y && echo "UFW installed succesfully"
    # Install cron without prompts
    sudo apt install cron && echo "CRON installed succesfully"
    # Install ping without prompts 
    sudo apt install iputils-ping -y && echo "PING installed succesfully"
    # Install ssmtp without prompts 
    sudo apt install ssmtp -y && echo "SSMTP installed succesfully"
    # Install mutt without prompts 
    sudo apt install mutt -y && echo "MUTT installed succesfully"

# OR for a short version of above command run
    # sudo apt update && sudo apt install nano net-tools # apache2 ufw iputils-ping ssmtp bsd-mailx -y

# Fix for default: debconf: delaying package configuration, since apt-utils is not installed cron
# RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
    # sudo apt install iproute2 -y
