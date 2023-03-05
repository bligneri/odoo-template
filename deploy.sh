#!/usr/bin/env bash

DB_HOST=`echo $PLATFORM_RELATIONSHIPS | base64 --decode | jq -r ".database[0].host"`
DB_USER=`echo $PLATFORM_RELATIONSHIPS | base64 --decode | jq -r ".database[0].username"`
DB_PASSWORD=`echo $PLATFORM_RELATIONSHIPS | base64 --decode | jq -r ".database[0].password"`
DB_NAME=`echo $PLATFORM_RELATIONSHIPS | base64 --decode | jq -r ".database[0].path"`

# Initialize the server and stop
# We want to use WSGI to access it
odoo --init --addons-path=odoo/addons --db_host=$DB_HOST --db_user=$DB_USER --db_password="$DB_PASSWORD" -d $DB_NAME --stop-after-init
