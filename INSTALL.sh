#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    echo "ERROR: Must be run with root privileges."
    exit 1
fi

echo "Please enter user account to install on: "
#echo "Default: $(whoami)"
read USER

HOME=/home/$USER

apt-get update
./python setup.py install
apt-get install libmysqlclient-dev
apt-get install python-pip
apt-get install python-dev
apt-get install libpng12-0 libpng12-dev 
apt-get install libpq-dev
apt-get install python-numpy
apt-get install python-scipy
apt-get install python-matplotlib
apt-get install libfreetype6
pip install virtualenv

mkdir $HOME/software-d-and-d

cd $HOME/software-d-and-d

echo "Created directory software-d-and-d in the home directory"

echo "Creating virtual environment"

virtualenv $HOME/software-d-and-d/venv --distribute

echo "Entering vm..."
source $HOME/software-d-and-d/venv/bin/activate

pip install django-toolbelt

echo "Pulling code and installing packages..."
git clone https://github.com/mtarsel/dream-girlz.git
cd $HOME/software-d-and-d/dream-girlz

chown -R $USER.$USER $HOME/software-d-and-d/

pwd

pip install -r requirements.txt
#chmod -R +rwx $HOME/software-d-and-d

exit 1

echo "#######################################"
echo "#######################################"
echo "##     IMPORTANT INFORMATION     ##"
echo "##		   ##"
echo "##    To activate virtualenv:        ##"
echo "##		   ##"
echo "##    source venv/bin/activate	   ##"
echo "##		   ##"
echo "##		   ##"
echo "##     You are now in	   ##"
echo "##		   ##"
echo "##    ~/software-d-and-d	       ##"
echo "##		   ##"
echo "##		   ##"
echo "#######################################"
echo "#######################################"
