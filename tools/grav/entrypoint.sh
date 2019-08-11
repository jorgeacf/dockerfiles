#!/bin/bash

set -euo pipefail
[ -n "${DEBUG:-}" ] && set -x


#SKELETON_VERSION=1.4.2
#wget https://getgrav.org/download/skeletons/clean-blog-site/${SKELETON_VERSION}/grav-skeleton-clean-blog-v${SKELETON_VERSION}.zip -O /tmp/grav-skeleton.zip
#unzip /tmp/grav-skeleton.zip -d /tmp

#SKELETON_NAME=deliver-site
#SKELETON_VERSION=1.2.0

#wget https://getgrav.org/download/skeletons/${SKELETON_NAME}/${SKELETON_VERSION}/ -O /tmp/grav-skeleton.zip
#unzip /tmp/grav-skeleton.zip -d /tmp

#cd /tmp/grav-skeleton-deliver-site/
#bin/gpm selfupgrade -f -y
#bin/gpm update -f -y
#bin/gpm install admin -y
#bin/gpm install git-sync -y
#cd -

#rm -r user/
#cp -r /tmp/grav-skeleton-deliver-site/user/ user

#echo "Modifing user..."
#chown -R www-data:www-data "$PWD"
#echo "Done."

#if ! [ -e index.php ] && [ -e bin/grav ]; then
#  	echo "Required files not found in $PWD - Copying from ${SOURCE}..."
#  	cp -r "$SOURCE"/. $PWD
#
#fi

#echo "Args: @[$@], Arg #0[$0], Arg #1[$1]"

if [[ "$1" = 'grav' ]]; then
	
	#rm -r user/
	#ln -s /"${HOME}"/dev/sites/blog/ user
	php -S 0.0.0.0:80 system/router.php

else
    exec "$@"
fi

exit 0;
