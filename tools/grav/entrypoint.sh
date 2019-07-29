#!/bin/bash

if ! [ -e index.php -a -e bin/grav ]; then
  echo "Required files not found in $PWD - Copying from ${SOURCE}..."
  cp -r "$SOURCE"/. $PWD
  chown -R www-data:www-data $PWD
  echo "Done."
fi

exec "$@"