#!/bin/bash


echo -e  '$nrconf{restart} = 'a';' | sudo tee -a /etc/needrestart/needrestart.conf > /dev/null



sudo apt-get update -yq
sudo apt-get upgrade -yq

sudo apt-get install net-tools -yq
sudo mkdir -p /home/ubuntu/Desktop/sharedfolder
sudo chown ubuntu:ubuntu Desktop -R
sudo apt-get install gcc openmpi-bin openmpi-common libopenmpi-dev libgtk2.0-dev vim -yq
sudo wget https://www.open-mpi.org/software/ompi/v4.1/downloads/openmpi-4.1.1.tar.gz
sudo tar -xvzf openmpi-4.1.1.tar.gz
cd openmpi-4.1.1
sudo ./configure --prefix="/home/ubuntu/.openmpi"
sudo make
sudo make install


export PATH=”$PATH:/home/ubuntu/.openmpi/bin”
export LD_LIBRARY_PATH=”$LD_LIBRARY_PATH:/home/ubuntu/.openmpi/lib”



