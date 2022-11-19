#!/bin/bash

sudo echo "$nrconf{restart} = 'a';" >> /etc/needrestart/needrestart.conf

sudo apt-get update -y
sudo apt-get upgrade -y

sudo echo "$nrconf{restart} = 'a';" >> /etc/needrestart/needrestart.conf

sudo apt-get install net-tools -yq
sudo mkdir -p /home/ubuntu/Desktop/sharedfolder
sudo apt-get install gcc openmpi-bin openmpi-common libopenmpi-dev libgtk2.0-dev -yq
sudo wget https://www.open-mpi.org/software/ompi/v4.1/downloads/openmpi-4.1.1.tar.gz
sudo tar -xvzf openmpi-4.1.1.tar.gz
cd openmpi-4.1.1
sudo ./configure --prefix="/home/ubuntu/.openmpi"
sudo make
sudo make install


export PATH=”$PATH:/home/ubuntu/.openmpi/bin”
export LD_LIBRARY_PATH=”$LD_LIBRARY_PATH:/home/ubuntu/.openmpi/lib”



