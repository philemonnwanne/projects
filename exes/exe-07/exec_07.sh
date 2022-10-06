#!/usr/bin/bash

# Declaring variables
config_s="/etc/ssmtp/ssmtp.conf"
config_r="/etc/ssmtp/revaliases"
admin_mail=$swap_mail

# Update package index and install dependencies for running this script
sudo apt update &&
sudo apt install -y ssmtp &&
sudo apt install -y mutt &&
sudo apt install -y nano
# sudo apt install -y cron &&

# Overwrite the ssmtp/conf file
# echo "" | sudo tee ${config_s} -- For test
# START BLOCK {SET ROOT EMAIL ADDRESS}
set_root() {
# Set the search string
seek=$(sudo grep "^root\w*" $config_s)

# Set the swap string
while true; do
read -p "Enter Email: " swap_mail
if [[ "$swap_mail" =~ [a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4} ]]
then
    break;
else
    echo "Please enter a valid email address"
fi
done

if [[ $seek != "" && $swap_mail != "" ]]; then
  (sudo sed -i "s/$seek/root=$swap_mail/" $config_s)
fi

}

set_root
# END BLOCK {SET ROOT EMAIL ADDRESS}


# START BLOCK {CHOOSE SMTP PORT}
# Modifies the ssmtp.conf file with TLS/STARTTLS config
# PORT-ONE
_port_one() {
# Mod ssmtp/conf file for gmail TLS/STARTTLS configuration
# Set the search string for mailhub
swap_mailhub(){
seek=$(sudo grep "^mailhub\w*" $config_s)
swap="smtp.gmail.com:587"
# Set the swap string
if [[ $seek != "" && $swap != "" ]]; then
  (sudo sed -i "s/$seek/mailhub=$swap/" $config_s)
else
   echo "mailhub=smtp.gmail.com:587" | sudo tee -a ${config_s}
fi
}
# Set the search string for useTLS
swap_tls(){
seek=$(sudo grep "^UseTLS\w*" $config_s)
swap="YES"
# Set the swap string
if [[ $seek != "" && $swap != "" ]]; then
  (sudo sed -i "s/$seek/UseTLS=$swap/" $config_s)
else
  echo "UseTLS=YES" | sudo tee -a ${config_s}
fi
}
# Set the search string for useSTARTTLS
swap_start_tls(){
seek=$(sudo grep "^UseSTARTTLS\w*" $config_s)
swap="YES"
# Set the swap string
if [[ $seek != "" && $swap != "" ]]; then
  (sudo sed -i "s/$seek/UseSTARTTLS=$swap/" $config_s)
else
  echo "UseSTARTTLS=YES" | sudo tee -a ${config_s}
fi
}
# Set the search string for FromLineOverride
swap_from_line_override(){
seek=$(sudo grep "^FromLineOverride\w*" $config_s)
swap="YES"
# Set the swap string
if [[ $seek != "" && $swap != "" ]]; then
  (sudo sed -i "s/$seek/FromLineOverride=$swap/" $config_s)
else
  echo "FromLineOverride=YES" | sudo tee -a ${config_s}
fi
}
# Mod ssmtp/revaliases file for gmail TLS/STARTTLS configuration
# Create aliases for local usernames (optional)
# Set the search string for useTLS
swap_rev_root(){
seek=$(sudo grep "^root\w*" $config_r)
swap="$swap_mail:smtp.gmail.com:587"
# Set the swap string
if [[ $seek != "" && $swap != "" ]]; then
  (sudo sed -i "s/$seek/root:$swap/" $config_r)
else
  echo "root:$swap_mail:smtp.gmail.com:587" | sudo tee -a ${config_r}
fi
}

# Calling all functions in this section
swap_mailhub
swap_tls
swap_start_tls 
swap_from_line_override
swap_rev_root
}


# PORT-TWO
_port_two() {
# Mod ssmtp/conf file for gmail TLS/STARTTLS configuration
# Set the search string for mailhub
swap_mailhub(){
seek=$(sudo grep "^mailhub\w*" $config_s)
swap="smtp.gmail.com:465"
# Set the swap string
if [[ $seek != "" && $swap != "" ]]; then
  (sudo sed -i "s/$seek/mailhub=$swap/" $config_s)
else
  echo "mailhub=smtp.gmail.com:465" | sudo tee -a ${config_s}
fi
}
# Set the search string for useTLS
swap_tls(){
seek=$(sudo grep "^UseTLS\w*" $config_s)
swap="YES"
# Set the swap string
if [[ $seek != "" && $swap != "" ]]; then
  (sudo sed -i "s/$seek/UseTLS=$swap/" $config_s)
else
  echo "UseTLS=YES" | sudo tee -a ${config_s}
fi
}
# Set the search string for useSTARTTLS
swap_start_tls(){
seek=$(sudo grep "^UseSTARTTLS\w*" $config_s)
swap="NO"
# Set the swap string
if [[ $seek != "" && $swap != "" ]]; then
  (sudo sed -i "s/$seek/UseSTARTTLS=$swap/" $config_s)
else
  echo "UseSTARTTLS=NO" | sudo tee -a ${config_s}
fi
}
# Set the search string for FromLineOverride
swap_from_line_override(){
seek=$(sudo grep "^FromLineOverride\w*" $config_s)
swap="YES"
# Set the swap string
if [[ $seek != "" && $swap != "" ]]; then
  (sudo sed -i "s/$seek/FromLineOverride=$swap/" $config_s)
else
  echo "FromLineOverride=YES" | sudo tee -a ${config_s}
fi
}
# Mod ssmtp/revaliases file for gmail TLS/STARTTLS configuration
# Create aliases for local usernames (optional)
# Set the search string for useTLS
swap_rev_root(){
seek=$(sudo grep "^root\w*" $config_r)
swap="$swap_mail:smtp.gmail.com:465"
# Set the swap string
if [[ $seek != "" && $swap != "" ]]; then
  (sudo sed -i "s/$seek/root:$swap/" $config_r)
else
  echo "root:$swap_mail:smtp.gmail.com:465" | sudo tee -a ${config_r}
fi
}

# Calling all functions in this section
swap_mailhub
swap_tls
swap_start_tls
swap_from_line_override
swap_rev_root
}

# Depends on the return value of the set_root function
# Set Gmail SMTP port based on user preference
set_port() {
# validate user selection
while true; do
read -p "Choose a Port: " port
if [[ $port == 587 && $port != "" ]]
then
    _port_one;
    break;
elif [[ $port == 465 && $port != "" ]]
then
    _port_two;
    break;
else
    echo "Please enter a valid port number"
fi
done

}

set_port
# END BLOCK {CHOOSE SMTP PORT}


# START BLOCK {SET GMAIL APP PASSWORD}
auth_pass() {
# Set the search string for auth_pass
seek=$(sudo grep "^AuthPass\w*" $config_s)

# Set the swap string
while true; do
read -p "Enter App Password: " auth_password
if [[ "$auth_password" =~ [a-zA-Z]{16} ]]
then
    break;
else
    echo "Please enter a valid app password"
    echo "Note: App password should be 16 characters long"
fi
done

if [[ $seek != "" && $auth_password != "" ]]; then
  (sudo sed -i "s/$seek/AuthPass=$auth_password/" $config_s)
else
  echo "AuthPass=$auth_password" | sudo tee -a ${config_s}
fi

}
auth_pass

# END BLOCK {SET GMAIL APP PASSWORD}


# START BLOCK {SET AUTHORISED EMAIL ADDRESS}
auth_user() {
# Set the search string for auth_user
seek=$(sudo grep "^AuthUser\w*" $config_s)

# Set the swap string
while true; do
read -p "Enter Authorised Email: " auth_email
if [[ "$auth_email" =~ [a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4} ]]
then
    break;
else
    echo "Please enter an authorised email address"
fi
done

if [[ $seek != "" && $auth_email != "" ]]; then
  (sudo sed -i "s/$seek/AuthUser=$auth_email/" $config_s)
else
  echo "AuthUser=$auth_email" | sudo tee -a ${config_s}
fi

}
auth_user

# END BLOCK {SET AUTHORISED EMAIL ADDRESS}


# TEST MAIL FUNCTIONALITY
# #switch to the vagrant's home directory
# cd /home/vagrant && touch metro && echo "I am now inside vagrant's home directory"

# D="/home/vagrant/metro"

# # Mod metro file
# echo "this is a ... file" > /home/vagrant/metro

# # Send a notification to the server admin_mail (run in the terminal to test)
# mutt -s "127.0.0.1 is whwere I belong" -- your_email@gmail.com < metro
# mutt -s "First mail injected as a file" -- $admin_mail < metro

# #For mail with an attachment:
# echo "127.0.0.1 is whwere I belong" | mutt -s 'Mail with an attachment' your_email@gmail.com -a metro
# echo "Second mail sent as an attachment" | mutt -s 'Mail with an attachment' $admin_mail -a metro

