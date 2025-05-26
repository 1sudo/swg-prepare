#!/bin/bash


#Install SWG Dependencies
printf --  "\nInstalling Dependencies for Compiling SWG\n"
sudo yum install ant clang bison flex cmake libaio.i686 libgcc.i686 glibc.i686 glibc-devel.i686 libstdc++-devel.i686 ncurses-devel.i686 libxml2-devel libxml2-devel.i686 pcre-devel pcre-devel.i686 libcurl.i686 libcurl-devel libcurl-devel.i686 boost boost.i686 boost-devel boost-devel.i686 sqlite-devel sqlite-devel.i686 libnsl.i686 -y
cd ~/swg_dependencies
sudo wget https://archives.boost.io/release/1.81.0/source/boost_1_81_0.tar.gz
sudo tar -zxvf boost_1_81_0.tar.gz
cd ~/swg_dependencies/boost_1_81_0/
sudo sh ~/swg_dependencies/boost_1_81_0/bootstrap.sh
sudo ./b2 install

#Install oracle instantclients
printf --  "\nInstalling Oracle Instant clients\n"
cd ~/swg_dependencies
sudo rpm -Uhv ~/swg_dependencies/oracle-instantclient18.3-basic-18.3.0.0.0-1.i386.rpm
sudo rpm -Uhv ~/swg_dependencies/oracle-instantclient18.3-devel-18.3.0.0.0-1.i386.rpm
sudo rpm -Uhv ~/swg_dependencies/oracle-instantclient18.3-sqlplus-18.3.0.0.0-1.i386.rpm

#Install SQLDeveloper
printf --  "\nInstalling SQLDeveloper\n"
cd ~/swg_dependencies
sudo rpm -Uhv ~/swg_dependencies/sqldeveloper-22.2.1.234.1810.noarch.rpm
#Set SQLDeveloper to use 64-bit java
printf --  "SetJavaHome  /usr/lib/jvm/zulu-11" | sudo tee -a /opt/sqldeveloper/sqldeveloper/bin/sqldeveloper.conf

#set env vars
printf --  "\nSetting Environment Variables\n"
sudo touch /etc/ld.so.conf.d/oracle.conf
sudo touch /etc/profile.d/oracle.sh
echo  "/usr/lib/oracle/18.3/client/lib" | sudo tee -a /etc/ld.so.conf.d/oracle.conf
echo  "export ORACLE_HOME=/usr/lib/oracle/18.3/client" | sudo tee -a /etc/profile.d/oracle.sh
echo  "export PATH=$PATH:/usr/lib/oracle/18.3/client/bin" | sudo tee -a /etc/profile.d/oracle.sh
echo  "export LD_LIBRARY_PATH=/usr/lib/oracle/18.3/client/lib:/usr/include/oracle/18.3/client" | sudo tee -a /etc/profile.d/oracle.sh
sudo ln -sf /usr/include/oracle/18.3/client $ORACLE_HOME/include
sudo ldconfig
sudo touch /etc/profile.d/java.sh
echo  "export JAVA_HOME=/usr/lib/jvm/zulu-11-x86" | sudo tee -a /etc/profile.d/java.sh
