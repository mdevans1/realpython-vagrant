export VE_DIR=/home/vagrant/.envs/django
export CODE_DIR=/vagrant

#install dependencies
apt-get update
apt-get install -y build-essential git
apt-get install -y libpq-dev
apt-get install -y postgresql postgresql-contrib

#Install python packages
apt-get install -y python python-dev python-setuptools
easy_install pip
#pip install setuptools --no-use-wheel --upgrade
pip install virtualenv

#Create postgres user / database
# sudo -u postgres psql -c "CREATE USER admin WITH NOCREATEDB NOCREATEUSER ENCRYPTED PASSWORD 'admin'"
# sudo -u postgres psql -c "CREATE DATABASE django WITH OWNER admin"

#Create virtualenv
virtualenv --no-site-packages $VE_DIR
$VE_DIR/bin/pip install -r $CODE_DIR/requirements.txt
chown -R vagrant $VE_DIR
chgrp -R vagrant $VE_DIR

