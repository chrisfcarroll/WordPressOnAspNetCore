# /usr/bin/env sh

if [[ -z $1 || -z $2 || -z $3 ]] ; then
	echo "usage: wordpress-create-database <databasename> <wordpressusername> <password>"
	exit 1
fi

databasename=$1
wordpressusername=$2
password=$3

echo "Creating Wordpress DB ..."
echo "
CREATE DATABASE $databasename;
" | mysql && echo "... Done."

echo "Creating WordpressUser ..."
echo "
CREATE USER $wordpressusername@localhost IDENTIFIED BY '$password';
" | mysql && echo "... Done."

echo "Setting Wordpress User Password ..."
echo "
ALTER USER $wordpressusername@localhost IDENTIFIED BY '$password';
" | mysql && echo "... Done."

echo "Setting Wordpress User DB privileges ..."
echo "
GRANT ALL PRIVILEGES ON $databasename.* TO $wordpressusername@localhost ;
FLUSH PRIVILEGES;
" | mysql && echo "... Done."
