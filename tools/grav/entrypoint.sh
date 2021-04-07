#!/bin/bash

set -euo pipefail
[ -n "${DEBUG:-}" ] && set -x

CMD=$1

case "$CMD" in
  "grav" )
    	SITE_PATH=${2:-$SOURCE/user/}
    	echo "SITE_PATH: $SITE_PATH"

    	#rm -r user/
    	#ln -s $SITE_PATH user
    	php -S 0.0.0.0:80 ${SOURCE}/system/router.php
    ;;

  "download-skeleton" )

		SKELETON_NAME=$2 #open-publishing-space-site
		SKELETON_VERSION=$3 #1.5.6
		SKELETON_URL=https://getgrav.org/download/skeletons/${SKELETON_NAME}/${SKELETON_VERSION}/

		wget ${SKELETON_URL} -O /tmp/grav-skeleton.zip
		unzip /tmp/grav-skeleton.zip -d /tmp

		cd /tmp/grav-*/

		# Fix
		curl https://raw.githubusercontent.com/getgrav/grav/c8af0d8a385a4dce7d5c5ef54a50c23b5946167f/system/src/Grav/Console/Gpm/SelfupgradeCommand.php -o system/src/Grav/Console/Gpm/SelfupgradeCommand.php

		bin/gpm selfupgrade -f -y
		bin/gpm update -f -y
		bin/gpm install admin -y
		bin/gpm install git-sync -y
		cd -
		rm -r user/
		cp -r /tmp/grav-skeleton*/user/ user

		bash
    ;;

   * )
    exec $CMD ${@:2}
    ;;
esac
