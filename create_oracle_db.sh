#!/bin/bash

printf -- '\n\nStart the Listener\n'
# Start the listener.
lsnrctl start

#Create DB
printf -- '\n\nCreate Datatbase in silent mode\n\n\n!!!SAFE TO IGNORE WARNINGS ABOUT PASSWORD!!!\n\nThis step will take awhile.\n\n\n'

# Silent mode.
dbca -silent -createDatabase -responseFile /home/oracle/swg-prepare/db_create.rsp                                                  
