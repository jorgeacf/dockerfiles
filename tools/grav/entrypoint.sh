#!/bin/bash

set -euo pipefail
[ -n "${DEBUG:-}" ] && set -x

if ! [ -e index.php -a -e bin/grav ]; then
  echo "Required files not found in $PWD - Copying from ${SOURCE}..."
  cp -r "$SOURCE"/. $PWD
  echo "Modifing user..."
  chown -R www-data:www-data $PWD
  echo "Done."
fi

#pwd;

#wget https://getgrav.org/download/skeletons/clean-blog-site/1.4.2/grav-skeleton-clean-blog-v1.4.3.zip
#unzip grav-skeleton-clean-blog-v1.4.3.zip
#cp -r grav-skeleton-clean-blog/. /var/www/html
#chown -R www-data:www-data /var/www/html

#bin/gpm selfupgrade -f
#bin/gpm update -f -y

#bin/gpm install admin -y
#bin/gpm install git-sync -y


if [[ "$1" = 'grav' ]]; then

	wget https://getgrav.org/download/skeletons/clean-blog-site/1.4.2/grav-skeleton-clean-blog-v1.4.3.zip
	unzip grav-skeleton-clean-blog-v1.4.3.zip
	ls -al /var/www/html/
	rm -r /var/www/html/*
	ls -al /var/www/html/
	ls -al .
	cp -r grav-skeleton-clean-blog/. /var/www/html
	
	bin/gpm selfupgrade -f
	bin/gpm update -f -y

	bin/gpm install admin -y
	bin/gpm install git-sync -y

	chown -R www-data:www-data /var/www/html
	rm -f /etc/nginx/sites-available/defalt
	rm -f /etc/nginx/sites-enabled/default

	/etc/init.d/nginx start
	/etc/init.d/php7.3-fpm start
	echo "Running..."
	tail -f /dev/null
else
    exec "$@"
fi

exit 0;
