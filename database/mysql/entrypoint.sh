#!/usr/bin/env bash

set -euo pipefail
[ -n "${DEBUG:-}" ] && set -x

if [ "$1" = 'mysql' ]; then

	ROOT_PASSWORD='password'

	#./bin/mysqladmin -u root password ${ROOT_PASSWORD}
	#./bin/mysqladmin -u root -h 9b093507faec password ${ROOT_PASSWORD}

	#mysql -e "UPDATE mysql.user SET Password=PASSWORD('${ROOT_PASSWORD}') WHERE User='root';"
	#mysql -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"
	#mysql -e "DELETE FROM mysql.user WHERE User='';"
	#mysql -e "DROP DATABASE test;"
	#mysql -e "FLUSH PRIVILEGES;"

    ./bin/mysqld_safe --user=mysql
fi

exec "$@"