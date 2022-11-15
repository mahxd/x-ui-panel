#!/bin/bash
#Progress Bar
read -p "Enter your mail:" email
read -p "Enter your doman:" domain
read -p "Enter your Timezone": timezone_value
#Server Configure

echo "Updating apt and changing timezone"

sudo apt-get update -y
echo "Update Finished"
sudo apt-get upgrade -y
echo "Upgrade finished"
sudo timedatectl set-timezone ${timezone_value}
echo "Timezone Changed"

echo "Installing Requirements"
#Requirement Installation
sudo apt install software-properties-common -y
#sudo add-apt-repository ppa:certbot/certbot -y
sudo apt install curl -y
sudo apt-get install certbot -y
echo "Start Install v2ray"
#Install v2ray UI script
bash <(curl -Ls https://raw.githubusercontent.com/mahxd/x-ui/main/install.sh)
#Get SSL Certificate
if [ -v "$email" ]; then
	echo "Generate Cerbot"
fi
sudo certbot certonly --standalone --preferred-challenges http --agree-tos --email ${email} -d ${domain}
