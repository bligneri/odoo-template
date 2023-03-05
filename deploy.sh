#!/usr/bin/env bash

# Copy the add_ons in their new home
# Clean the addons directory and copy from the source
rm -rf  odoo/addons && cp -r odoo-src/odoo/addons odoo/

# Recover the plaftorm.sh variables required to install odoo 
DB_HOST=`echo $PLATFORM_RELATIONSHIPS | base64 --decode | jq -r ".database[0].host"`
DB_USER=`echo $PLATFORM_RELATIONSHIPS | base64 --decode | jq -r ".database[0].username"`
DB_PASSWORD=`echo $PLATFORM_RELATIONSHIPS | base64 --decode | jq -r ".database[0].password"`
DB_NAME=`echo $PLATFORM_RELATIONSHIPS | base64 --decode | jq -r ".database[0].path"`

# Initialize the server and stop
# We want to use WSGI to access it
odoo --init --addons-path=/app/odoo/addons --db_host=$DB_HOST --db_user=$DB_USER --db_password="$DB_PASSWORD" -d $DB_NAME --stop-after-init
