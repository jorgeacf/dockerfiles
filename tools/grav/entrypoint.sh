#!/bin/bash

set -euo pipefail
[ -n "${DEBUG:-}" ] && set -x


#SKELETON_VERSION=1.4.2
#wget https://getgrav.org/download/skeletons/clean-blog-site/${SKELETON_VERSION}/grav-skeleton-clean-blog-v${SKELETON_VERSION}.zip -O /tmp/grav-skeleton.zip
#unzip /tmp/grav-skeleton.zip -d /tmp
#rm -r -f /var/www/html/user
#cp -r /tmp/grav-skeleton-*/user/. /var/www/html/user

#bin/gpm selfupgrade -f -y
#bin/gpm update -f -y
#bin/gpm install admin -y
#bin/gpm install git-sync -y

#echo "Modifing user..."
#chown -R www-data:www-data "$PWD"
#echo "Done."

if ! [ -e index.php ] && [ -e bin/grav ]; then
  	echo "Required files not found in $PWD - Copying from ${SOURCE}..."
#  	cp -r "$SOURCE"/. $PWD

fi

if [[ "$1" = 'grav' ]]; then
	
	rm -r user/
	ln -s /home/dev/sites/blog/ user
	/etc/init.d/php7.3-fpm start
	php -S 0.0.0.0:80 system/router.php

else
    exec "$@"
fi

exit 0;
