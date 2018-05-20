#!/usr/bin/env bash

set -euo pipefail
[ -n "${DEBUG:-}" ] && set -x

DATABASE_NAME=my_database
USER=jorgeacf
PASS=jorgeacf

echo "Create database..."
mysql -u root --verbose -e "CREATE DATABASE ${DATABASE_NAME};"

echo "Create user..."
mysql -u root --verbose -e "CREATE USER '${USER}'@'%' IDENTIFIED BY '${PASS}';"
mysql -u root --verbose -e "CREATE USER '${USER}'@'localhost' IDENTIFIED BY '${PASS}';"

echo "Grant privileges..."
mysql -u root --verbose -e "GRANT USAGE ON *.* TO '${USER}'@'%';"
mysql -u root --verbose -e "GRANT USAGE ON *.* TO '${USER}'@'localhost';"

echo "Grant privileges..."
mysql -u root --verbose -e "GRANT ALL privileges ON $DATABASE_NAME.* TO '${USER}'@'%';"
mysql -u root --verbose -e "GRANT ALL privileges ON $DATABASE_NAME.* TO '${USER}'@'localhost';"

echo "Apply privileges..."
mysql -u root --verbose -e "FLUSH PRIVILEGES;"

mysql -u root -e "SHOW GRANTS FOR '${USER}'@'%';"
mysql -u root -e "SHOW GRANTS FOR '${USER}'@'localhost';"

#DROP USER myuser@localhost;
#DROP DATABASE mydb;