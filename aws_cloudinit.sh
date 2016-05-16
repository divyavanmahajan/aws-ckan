#!/bin/bash
echo 'got user data' > /tmp/user_data.log
git clone https://github.com/divyavanmahajan/aws-ckan.git /vagrant
cd /vagrant
# bash bootstrap.sh
# During CloudInit, the postgres database does not come up. So it seems that the bootstrap
# must be done interactively?
# The bootstrap is run logging into the system.
# cd /vagrant
# sudo bash bootstrap.sh
