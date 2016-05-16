#!/bin/bash
echo 'got user data' > /tmp/user_data.log
git clone https://github.com/divyavanmahajan/aws-ckan.git /vagrant
cd /vagrant
bash bootstrap.sh
# The bootstrap must be done by logging into the system.
# sudo bash bootstrap.sh
