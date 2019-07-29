#!/bin/bash

if ! [ -e index.php -a -e bin/grav ]; then
  echo "Required files not found in $PWD - Copying from ${SOURCE}..."
  cp -r "$SOURCE"/. $PWD
  chown -R www-data:www-data $PWD
  echo "Done."
fi

#pwd;

wget https://getgrav.org/download/skeletons/clean-blog-site/1.4.2/grav-skeleton-clean-blog-v1.4.3.zip
unzip grav-skeleton-clean-blog-v1.4.3.zip
cp -r grav-skeleton-clean-blog/. /var/www/html
chown -R www-data:www-data /var/www/html

bin/gpm selfupgrade -f
bin/gpm update -f -y

bin/gpm install admin -y
bin/gpm install git-sync -y

exec "$@"