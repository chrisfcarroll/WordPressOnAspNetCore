# /usr/bin/env sh

echo "NB this script written for CentOs"

# Reset lost mysql password with 
if [[ -z $1 ]] ; then
  systemctl stop mariadb
  read -p "Waiting for mariadb to stop ..." -t 5
  mysqld_safe --skip-grant-tables --skip-networking & 
  read -p "Waiting for mariadb to start..." -t 5
fi

mysql --execute="update mysql.user set password=null where user='root' ; " 
pkill mysqld 
rm .my.cnf 
read -p "Waiting for mariadb to stop ..." -t 5
systemctl start mariadb

