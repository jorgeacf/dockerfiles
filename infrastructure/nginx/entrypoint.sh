#! /bin/bash -e

nginx -t;

nginx #-g "daemon off;";

tail -f /var/log/nginx/access.log