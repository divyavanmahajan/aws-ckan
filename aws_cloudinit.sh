#!/bin/bash
echo 'got user data' > /tmp/user_data.log
sudo git clone https://github.com/divyavanmahajan/aws-ckan.git /vagrant
cd /vagrant
sudo bash bootstrap.sh
