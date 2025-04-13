#! /bin/bash
#
# stop if anything goes wrong
#
set -e
#
#
#
echo "This script prepares the local machine to run the mongonode project."
echo "Local machine is a clean and fresh Ubuntul 24.04 LTS."
#
# refresh lists
#
sudo apt-get update
#
# Install curl
#
echo "Installing curl"
sudo apt-get install -y curl
#
# Install gpg
#
echo "Installing curl"
sudo apt-get install -y gnupg 
#
# Install node.js
#
echo "Installing Node.js"
sudo apt-get install -y nodejs
#
# Installing npm
#
echo "Installing npm"
sudo apt-get install -y -y npm
#
# Install mongodb
#
echo "Installing MongoDB"
#
# First import public key
#
echo "Importing public key"
curl -fsSL https://www.mongodb.org/static/pgp/server-8.0.asc | \
   sudo gpg --yes -o /usr/share/keyrings/mongodb-server-8.0.gpg \
   --dearmor
#
# Create list file
#
echo "Creating list file"
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-8.0.gpg ] https://repo.mongodb.org/apt/ubuntu noble/mongodb-org/8.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-8.0.list
#
# Reload package database
#
echo "Reloading package database"
sudo apt-get update
#
# Installing mongod + mongosh
#
echo "Installing mongod and mongosh"
sudo apt-get install -y mongodb-org
#
# start mongo
#
sudo systemctl start mongod
sudo systemctl enable mongod
sudo systemctl status mongod
#
# clone locally the mongonode project from github
#
sudo git clone http://github.com/jolegrand10/mongonode mongonode
#
#
#
cd mongonode
sudo npm install

echo "Installation completed"