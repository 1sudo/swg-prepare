#!/bin/bash

printf --  "\n####################\n\nWelcome to the SWG Server Preparation Script!\nThis script is designed primarily for Oracle/Alma/Rocky Linux 8.\nThis may not work on distros without those available packages.\n\n!!!This is the Single Server Installation and will install the Database and SWG Server on Oracle/Alma/Rocky Linux 8!!!\n\n\n####################\n"

#Que up initialization script
printf -- "\nQue Up Initialization Script\n"
~/swg-prepare/oinit.sh

#Que up Oracle Installers
printf -- "\nQue Up Oracle Installation Scripts\n"
~/swg-prepare/oracle_installer.sh

#Create Oracle Service
printf -- "\n\nCreate Oracle Service to start and stop the DB\n"
~/swg-prepare/oservice.sh

#Make a folder for dependencies
printf --  "\n\nMaking a folder for SWG dependencies\n"
mkdir ~/swg_dependencies
cd ~/swg_dependencies

#Que Oracle Utilities for download
printf --  "\n\nQueing Oracle Utilities for download\n"
~/swg-prepare/server_downloads.sh

#Que up SWG Inititalization
printf -- "\nQue Up SWG Initialization Script\n"
~/swg-prepare/swginit.sh

#source the profiles
printf -- "\nSourcing profiles from previous step\n"
source /etc/profile.d/oracle.sh
source /etc/profile.d/java.sh


printf -- "\n\nFetching Install files from Source\n"
#Fetch Install files from Source
git clone https://github.com/SWG-Source/swg-main.git ~/swg-main

#Install SWG
printf -- "\n\nInstalling SWG\n"
cd ~/swg-main
ant swg

#Copy servercommon.cfg

printf -- "\n\nCopy servercommon.cfg to insert new java locations.\n"
sudo cp ~/swg-prepare/servercommon.cfg ~/swg-main/exe/linux/servercommon.cfg
