#!/bin/bash

sudo cp ~/swg-prepare/includes/odb/odb.service /etc/systemd/system/
sudo cp ~/swg-prepare/includes/odb/odb-start.sh /etc/
sudo cp ~/swg-prepare/includes/odb/odb-stop.sh /etc/
sudo mv /u01/app/oracle/product/19.3.0/dbhome_1/dbs/init.ora /u01/app/oracle/product/19.3.0/dbhome_1/dbs/initswg.ora
sudo systemctl enable odb.service
sudo systemctl start odb.service
