 #!/bin/bash

#Check for available updates
printf --  "\nInitializing Server and Checking for updates\n"
sudo yum check-update

#Make a folder for dependencies
printf --  "\nMaking a folder for dependencies\n"
mkdir ~/ora_dependencies
cd ~/ora_dependencies

#Set SELinux to Permissive
printf --  "\nSetting SELinux to permissive\n"
sudo setenforce Permissive
sudo systemctl stop firewalld
sudo systemctl disable firewalld

#Download and install java (be sure to check Azul for the latest 32-bit Java 11 for SWG and 64-bit for sqldeveloper)
printf --  "\nDownloading and installing Azul Java 11\n"
wget https://cdn.azul.com/zulu/bin/zulu11.62.17-ca-jdk11.0.18-linux.i686.rpm
sudo yum install ./zulu11.62.17-ca-jdk11.0.18-linux.i686.rpm -y
wget https://cdn.azul.com/zulu/bin/zulu11.62.17-ca-jdk11.0.18-linux.x86_64.rpm
sudo yum install ./zulu11.62.17-ca-jdk11.0.18-linux.x86_64.rpm -y

printf --  "\nInstalling additional dependencies for 32bit\n"
sudo yum install libXext.i686 libXrender.i686 libXtst.i686 -y

printf --  "\nInstalling Python and Pip\n"
#Install Python (This command could vary by distro)
sudo yum install python39 -y
sudo yum install python39-pip -y
sudo yum install python39-ply -y

#Download Oracle 19.3.0 Database and Preinstall pack
printf --  "\nQueing Oracle Database for download\n"
~/swg-prepare/oracle_downloads.sh

#Make directories and extract
printf --  "\nQue Oracle DB Extract\n"
~/swg-prepare/oracle_extract.sh

echo "Setting password for Oracle user"
#set Oracle User Password
printf -- "oracle:oracle" | sudo chpasswd
