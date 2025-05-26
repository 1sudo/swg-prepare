#!/bin/bash

#Que up DB Install
printf -- "\nLog into Oracle User and Que Database Installation\n"
sudo -i -u oracle -H sh -c "sh /home/oracle/swg-prepare/install_oracle_db.sh"

#Run 1st root script
printf -- "\n\nRun 1st Oracle Root Script\n"
sudo -i -u root -H sh -c "/u01/app/oraInventory/orainstRoot.sh"

#Run 2nd root script
printf -- "\n\nRun 2nd Oracle Root Script\n"
sudo -i -u root -H sh -c "/u01/app/oracle/product/19.3.0/dbhome_1/root.sh"

#Create database
printf -- "\n\nProcess Database Creation\n"
sudo -i -u oracle -H sh -c "sh /home/oracle/swg-prepare/create_oracle_db.sh"

#Run swgusr.sql to create swg user in the db
printf -- "\n\nCreate swg user in the DB\n"
echo "@/home/oracle/swg-prepare/swgusr.sql" | sudo -i -u oracle sqlplus system/swg
