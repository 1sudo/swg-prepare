#!/bin/bash

printf -- "\nQue Up Initialization Script\n"
~/swg-prepare/oinit.sh

printf -- "\nQue Up Oracle Installation Scripts\n"
~/swg-prepare/oracle_installer.sh

printf -- "\n\nCreate Oracle Service to start and stop the DB\n"
~/swg-prepare/oservice.sh

printf --  "\n\nMaking a folder for SWG dependencies\n"
mkdir ~/swg_dependencies
cd ~/swg_dependencies

printf --  "\n\nQueing Oracle Utilities for download\n"
~/swg-prepare/server_downloads.sh

printf -- "\nQue Up SWG Initialization Script\n"
~/swg-prepare/swginit.sh

printf -- "\nSourcing profiles from previous step\n"
source /etc/profile.d/oracle.sh
source /etc/profile.d/java.sh

printf -- "\n\nFetching Install files from Source\n"
git clone https://github.com/SWG-Source/swg-main.git ~/swg-main

printf -- "\n\nInstalling SWG\n"
cd ~/swg-main
ant swg

printf -- "\n\nCopy servercommon.cfg to insert new java locations.\n"
sudo cp ~/swg-prepare/servercommon.cfg ~/swg-main/exe/linux/servercommon.cfg
