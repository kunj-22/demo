#!/bin/bash

sudo apt-get update && sudo apt-get upgrade

#install a specific version of PHP
sudo apt install software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update

#Install PHP 7.4.

echo "Which PHP version do you want to install?"
echo "1. PHP 7.2"
echo "2. PHP 7.4"
echo "3. PHP 8.0"
echo "4. PHP 8.1"
echo "5. PHP 8.2"

read -p "select a version number (1-5): " version_choice

if [ "$version_choice" -eq 1 ]; then
  selected_version="7.2"
elif [ "$version_choice" -eq 2 ]; then
  selected_version="7.4"
elif [ "$version_choice" -eq 3 ]; then
  selected_version="8.0"
elif [ "$version_choice" -eq 4 ]; then
  selected_version="8.1"
elif [ "$version_choice" -eq 5 ]; then
  selected_version="8.2"
else
  echo "Invalid selection"
  exit 1
fi

sudo apt-get update
sudo apt-get install -y php${selected_version}-curl

echo "PHP ${selected_version} and curl extension have been successfully installed."

# sudo apt-get install php7.2-curl
# sudo apt-get install php7.4-curl
# sudo apt-get install php8.0-curl
# sudo apt-get install php8.1-curl
# sudo apt-get install php8.2-curl
