#!/bin/bash

#Download Oracle 19.3.0 Database
echo 'Downloading Oracle Database Utilities'
pip3 install gdown --user

if [ $? -ne 0 ]; then
  sleep 1000
fi

#Oracle 19c Preinstall Pack
cd ~/ora_dependencies
gdown https://drive.google.com/uc?id=1Z-iOThbbSenPdZF1ohr-TCe17qNgVEPe

#Oracle 19c
cd ~/ora_dependencies
gdown https://drive.google.com/uc?id=10jaeSCM4lZt6ZikmabiI7JjNFVSPz4jv
